// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   GeneratorPopulator.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.exception.GenerateException;
import com.taiji.core.generator.plugingen.javax.Sql2Java;
import java.sql.*;
import java.util.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			Util, TableElement, Generator, DbTable, 
//			CrossrefElement, Column, ColumnMap, DbNameConverter, 
//			Relation, Database, Many2ManyElement, DbColumn, 
//			RelationshipRole, Table

public class GeneratorPopulator
{
	private static class ColumnComparator
		implements Comparator
	{

		private String _orderBy;

		public int compare(Object o1, Object o2)
		{
			Column c1 = (Column)o1;
			Column c2 = (Column)o2;
			if (c1.equals(c2))
				return 0;
			int priority1 = getColumnPriority(c1);
			int priority2 = getColumnPriority(c2);
			if (priority1 < priority2)
				return -1;
			if (priority1 > priority2)
				return 1;
			else
				return c1.getSqlName().compareTo(c2.getSqlName());
		}

		private int getColumnPriority(Column column)
		{
			int priority = _orderBy.length();
			int pos = -1;
			if (column.isPk())
			{
				pos = _orderBy.indexOf("pk");
				if (pos >= 0 && pos < priority)
					priority = pos;
			}
			if (column.isFk())
			{
				pos = _orderBy.indexOf("fk");
				if (pos >= 0 && pos < priority)
					priority = pos;
			}
			if (column.isNullable())
			{
				pos = _orderBy.indexOf("nullable");
				if (pos >= 0 && pos < priority)
					priority = pos;
			}
			if (!column.isNullable())
			{
				pos = _orderBy.indexOf("mandatory");
				if (pos >= 0 && pos < priority)
					priority = pos;
			}
			if (column.isIndexed())
			{
				pos = _orderBy.indexOf("indexed");
				if (pos >= 0 && pos < priority)
					priority = pos;
			}
			if (column.isUnique())
			{
				pos = _orderBy.indexOf("unique");
				if (pos >= 0 && pos < priority)
					priority = pos;
			}
			return priority;
		}

		public ColumnComparator(String orderBy)
		{
			_orderBy = orderBy;
		}
	}


	private Database _database;
	private DatabaseMetaData _metaData;
	private Generator _gen;
	private String _schema;
	private String _catalog;
	private String _types[];
	private final Map _many2many;
	private final Map _tablePrimaryKey;
	private Connection _connection;
	private String _sortColumns;
	private final Collection EMPTY_COLLECTION = new ArrayList(0);
	private final String CHECK_TABLE = "t_checktable";
	private final String CHECK_POST = "iscpcheck";
	private static final Log _log = LogFactory.getLog(com/taiji/core/generator/plugingen/GeneratorPopulator);

	public GeneratorPopulator(Generator gen, Database database, String schema, String catalog, Map many2many, Map tablePrimaryKey, String sortColumns)
		throws GenerateException
	{
		_types = null;
		_gen = gen;
		_database = database;
		_schema = Util.ensureNotNull(schema);
		_catalog = catalog;
		_many2many = many2many;
		_sortColumns = sortColumns != null ? sortColumns.toLowerCase() : null;
		_tablePrimaryKey = tablePrimaryKey;
		try
		{
			tune(getConnection().getMetaData());
		}
		catch (SQLException e)
		{
			throw new GenerateException((new StringBuilder("Couldn't tune database:")).append(e.getMessage()).toString());
		}
	}

	public void closeConnection()
	{
		try
		{
			if (_connection != null)
				_connection.close();
		}
		catch (SQLException sqlexception) { }
	}

	public void genInfoGather(Map wantedTables)
	{
		_log.debug("-- tables --");
		Map tableSchemaMap = new HashMap();
		try
		{
			for (Iterator tableElementIterator = wantedTables.values().iterator(); tableElementIterator.hasNext();)
			{
				TableElement tableElement = (TableElement)tableElementIterator.next();
				String tableName = tableElement.getName();
				if (tableName.indexOf("iscpcheck") == -1)
				{
					Statement st = getConnection().createStatement();
					String genSql = (new StringBuilder("select *  into ")).append(tableName).append("iscpcheck").append(" from ").append("t_checktable").toString();
					st.execute(genSql);
					genSql = (new StringBuilder("select *  into ")).append(tableName).append("iscpcheck").append("_history from ").append("t_checktable").toString();
					st.execute(genSql);
					st.close();
				}
			}

		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public void populate(Map wantedTables)
		throws GenerateException
	{
		try
		{
			addTables(wantedTables);
			DbTable table;
			for (Iterator tableIterator = _gen.getTables().iterator(); tableIterator.hasNext(); addColumns(table))
				table = (DbTable)tableIterator.next();

			DbTable table;
			for (Iterator tableIterator = _gen.getTables().iterator(); tableIterator.hasNext(); addRelations(table, wantedTables))
				table = (DbTable)tableIterator.next();

			if (_gen.getRelations().size() == 0)
				_log.warn("WARNING: Middlegen couldn't find any relations between any tables. This may be intentional from the design of the database, but it may also be because you have incorrectly defined the relationships. It could also be because the JDBC driver you're using doesn't correctly implement DatabaseMetaData. See the samples (for an example on how to define relationships) and verify that your driver correctly implements DatabaseMetaData.");
			markFksToUnwantedTables();
			addMany2ManyRelations();
			warnUnidentifiedM2ms();
			getConnection().close();
			if (_sortColumns != null)
			{
				Comparator comparator = new ColumnComparator(_sortColumns);
				DbTable table;
				for (Iterator tableIterator = _gen.getTables().iterator(); tableIterator.hasNext(); table.sortColumns(comparator))
					table = (DbTable)tableIterator.next();

			}
		}
		catch (SQLException e)
		{
			_log.error(e.getMessage(), e);
			throw new GenerateException((new StringBuilder("Database problem:")).append(e.getMessage()).toString());
		}
	}

	protected void addRelations(DbTable pkTable, Map wantedTables)
		throws GenerateException, SQLException
	{
		Map fkTables = new HashMap();
		short bogusFkName = 0;
		for (Iterator crossrefs = pkTable.getTableElement().getCrossrefs().iterator(); crossrefs.hasNext();)
		{
			CrossrefElement crossref = (CrossrefElement)crossrefs.next();
			if (wantedTables.containsKey(crossref.getFkTable()))
			{
				String fkName = crossref.getName();
				if (fkName == null)
				{
					bogusFkName++;
					fkName = String.valueOf(bogusFkName);
				}
				String pkColumnName = crossref.getPkColumn();
				if (pkColumnName == null)
				{
					Column pkColumn = pkTable.getPkColumn();
					if (pkColumn != null)
						pkColumnName = pkColumn.getSqlName();
					else
						throw new GenerateException((new StringBuilder("In custom defined crossref, the table ")).append(pkTable.getSqlName()).append(" doesn't have a single-column primary key. You must therefore explicitly ").append("declare pkcolumn=\"something\" in the crossref element.").toString());
				}
				addCrossref(pkTable, pkColumnName, crossref.getFkTable(), crossref.getFkColumn(), fkName, fkTables, crossref.getUnique());
			} else
			{
				_log.info((new StringBuilder("The declared relation between ")).append(pkTable.getSqlName()).append(" and ").append(crossref.getFkTable()).append(" will be skipped since ").append(crossref.getFkTable()).append(" isn't among the specified tables.").toString());
			}
		}

		for (Iterator fkTableIterator = fkTables.keySet().iterator(); fkTableIterator.hasNext();)
		{
			DbTable fkTable = (DbTable)fkTableIterator.next();
			Map fkNameToColumnMapsMap = (Map)(Map)fkTables.get(fkTable);
			Relation relation;
			for (Iterator fkIterator = fkNameToColumnMapsMap.keySet().iterator(); fkIterator.hasNext(); _gen.addRelation(relation))
			{
				String fkName = (String)fkIterator.next();
				Collection columnMaps = (Collection)(Collection)fkNameToColumnMapsMap.get(fkName);
				if (columnMaps.size() < pkTable.getPrimaryKeyColumns().size())
					_log.warn((new StringBuilder("WARNING: There is a relation between ")).append(fkTable.getSqlName()).append(" and ").append(pkTable.getSqlName()).append(" that doesn't include all the ").append(" primary key columns. This may cause errors later on.").toString());
				ColumnMap columnMapArray[] = new ColumnMap[columnMaps.size()];
				columnMapArray = (ColumnMap[])columnMaps.toArray(columnMapArray);
				String relationSuffix = "";
				String fkRoleSuffix = "";
				if (fkNameToColumnMapsMap.size() > 1)
				{
					relationSuffix = "-";
					fkRoleSuffix = (new StringBuilder(String.valueOf(fkRoleSuffix))).append("_by_").toString();
					for (int i = 0; i < columnMapArray.length; i++)
					{
						if (i >= 1)
						{
							relationSuffix = (new StringBuilder(String.valueOf(relationSuffix))).append("-").toString();
							fkRoleSuffix = (new StringBuilder(String.valueOf(fkRoleSuffix))).append("_and_").toString();
						}
						relationSuffix = (new StringBuilder(String.valueOf(relationSuffix))).append(columnMapArray[i].getForeignKey().toLowerCase()).toString();
						fkRoleSuffix = (new StringBuilder(String.valueOf(fkRoleSuffix))).append(columnMapArray[i].getForeignKey()).toString();
					}

				}
				fkRoleSuffix = DbNameConverter.getInstance().columnNameToVariableName(fkRoleSuffix);
				_log.debug((new StringBuilder("relationSuffix:")).append(relationSuffix).append(" (").append(fkRoleSuffix).append(")").toString());
				relation = new Relation(pkTable, columnMapArray, fkTable, new ColumnMap[0], null, relationSuffix, fkRoleSuffix);
			}

		}

	}

	String getSchemaName()
	{
		return _schema;
	}

	private boolean isWantedTable(Map wantedTables, String tableName)
	{
		if (wantedTables.containsKey(tableName))
			return true;
		for (Iterator i = wantedTables.keySet().iterator(); i.hasNext();)
		{
			String wantedTableName = (String)i.next();
			if (wantedTableName.toLowerCase().equals(tableName.toLowerCase()))
				return true;
		}

		return false;
	}

	private String getDatabaseStructure()
		throws GenerateException
	{
		ResultSet schemaRs;
		ResultSet catalogRs;
		String nl;
		StringBuffer sb;
		schemaRs = null;
		catalogRs = null;
		nl = System.getProperty("line.separator");
		sb = new StringBuffer(nl);
		sb.append("Configured schema:");
		sb.append(_schema);
		sb.append(nl);
		sb.append("Configured catalog:");
		sb.append(_catalog);
		sb.append(nl);
		try
		{
			schemaRs = getMetaData().getSchemas();
			sb.append("Available schemas:");
			sb.append(nl);
			for (; schemaRs.next(); sb.append(nl))
			{
				sb.append("  ");
				sb.append(schemaRs.getString("TABLE_SCHEM"));
			}

		}
		catch (SQLException e2)
		{
			_log.warn("Couldn't get schemas", e2);
			sb.append("  ?? Couldn't get schemas ??");
			sb.append(nl);
			break MISSING_BLOCK_LABEL_209;
		}
		break MISSING_BLOCK_LABEL_195;
		Exception exception;
		exception;
		try
		{
			schemaRs.close();
		}
		catch (Exception exception1) { }
		throw exception;
		try
		{
			schemaRs.close();
		}
		catch (Exception exception2) { }
		break MISSING_BLOCK_LABEL_220;
		try
		{
			schemaRs.close();
		}
		catch (Exception exception3) { }
		try
		{
			catalogRs = getMetaData().getCatalogs();
			sb.append("Available catalogs:");
			sb.append(nl);
			for (; catalogRs.next(); sb.append(nl))
			{
				sb.append("  ");
				sb.append(catalogRs.getString("TABLE_CAT"));
			}

		}
		catch (SQLException e2)
		{
			_log.warn("Couldn't get catalogs", e2);
			sb.append("  ?? Couldn't get catalogs ??");
			sb.append(nl);
			break MISSING_BLOCK_LABEL_356;
		}
		break MISSING_BLOCK_LABEL_342;
		exception;
		try
		{
			catalogRs.close();
		}
		catch (Exception exception4) { }
		throw exception;
		try
		{
			catalogRs.close();
		}
		catch (Exception exception5) { }
		break MISSING_BLOCK_LABEL_367;
		try
		{
			catalogRs.close();
		}
		catch (Exception exception6) { }
		return sb.toString();
	}

	private String getDatabaseTables()
		throws GenerateException
	{
		String nl;
		StringBuffer sb;
		ResultSet tableRs;
		nl = System.getProperty("line.separator");
		sb = new StringBuffer(nl);
		sb.append("Found the following tables:");
		sb.append(nl);
		tableRs = null;
		try
		{
			for (tableRs = getMetaData().getTables(_catalog, _schema, null, _types); tableRs.next(); sb.append(" "))
			{
				String realTableName = tableRs.getString("TABLE_NAME");
				sb.append(realTableName);
			}

		}
		catch (SQLException e2)
		{
			_log.warn("Couldn't get schemas", e2);
			sb.append("  ?? Couldn't get schemas ??");
			sb.append(nl);
			break MISSING_BLOCK_LABEL_158;
		}
		break MISSING_BLOCK_LABEL_144;
		Exception exception;
		exception;
		try
		{
			tableRs.close();
		}
		catch (Exception exception1) { }
		throw exception;
		try
		{
			tableRs.close();
		}
		catch (Exception exception2) { }
		break MISSING_BLOCK_LABEL_169;
		try
		{
			tableRs.close();
		}
		catch (Exception exception3) { }
		sb.append(nl);
		sb.append("----");
		sb.append(nl);
		return sb.toString();
	}

	private Connection getConnection()
		throws GenerateException
	{
		if (_connection == null)
			_connection = _database.getConnection();
		return _connection;
	}

	private DatabaseMetaData getMetaData()
		throws GenerateException
	{
		if (_metaData == null)
			try
			{
				_metaData = getConnection().getMetaData();
			}
			catch (SQLException e)
			{
				throw new GenerateException("Couldn't load Metadata");
			}
		return _metaData;
	}

	private Collection getM2Ms(String table1, String table2)
	{
		if (table1.compareTo(table2) > 0)
		{
			String swap = table1;
			table1 = table2;
			table2 = swap;
		}
		String orderedNameWithoutJoinTable = (new StringBuilder(String.valueOf(table1))).append("--").append(table2).toString();
		Collection result = (Collection)(Collection)_many2many.get(orderedNameWithoutJoinTable);
		if (result == null)
			result = EMPTY_COLLECTION;
		return result;
	}

	private boolean isWanted(String table1, String jointable, String table2)
	{
		boolean result = false;
		Collection candidates = getM2Ms(table1, table2);
		for (Iterator i = candidates.iterator(); i.hasNext();)
		{
			Many2ManyElement eminem = (Many2ManyElement)i.next();
			if (eminem.matches(table1, jointable, table2))
			{
				result = true;
				break;
			}
		}

		return result;
	}

	private String getRelationSuffix(Relation a, Relation b)
	{
		String result;
		if (a.getRelationSuffix().equals("") || b.getRelationSuffix().equals(""))
			result = (new StringBuilder(String.valueOf(a.getRelationSuffix()))).append(b.getRelationSuffix()).toString();
		else
			result = (new StringBuilder(String.valueOf(a.getRelationSuffix()))).append("-").append(b.getRelationSuffix()).toString();
		if (!result.equals(""))
			result = (new StringBuilder("-by-")).append(result).toString();
		return result;
	}

	private String getFkRoleSuffix(Relation a, Relation b)
	{
		String result;
		if (a.getFkRoleSuffix().equals("") || b.getFkRoleSuffix().equals(""))
			result = (new StringBuilder(String.valueOf(a.getFkRoleSuffix()))).append(b.getFkRoleSuffix()).toString();
		else
			result = (new StringBuilder(String.valueOf(a.getFkRoleSuffix()))).append("-").append(b.getFkRoleSuffix()).toString();
		if (!result.equals(""))
			result = (new StringBuilder("_by_")).append(result).toString();
		return result;
	}

	private boolean isOracle()
	{
		boolean ret = false;
		try
		{
			ret = getMetaData().getDatabaseProductName().toLowerCase().indexOf("oracle") != -1;
		}
		catch (Exception exception) { }
		return ret;
	}

	private String getSynonymOwner(String synonymName)
		throws GenerateException
	{
		PreparedStatement ps;
		ResultSet rs;
		String ret;
		ps = null;
		rs = null;
		ret = null;
		try
		{
			ps = getConnection().prepareStatement("select table_owner from sys.all_synonyms where table_name=? and owner=?");
			ps.setString(1, synonymName);
			ps.setString(2, _schema);
			rs = ps.executeQuery();
			if (rs.next())
			{
				ret = rs.getString(1);
			} else
			{
				String databaseStructure = getDatabaseStructure();
				throw new GenerateException((new StringBuilder("Wow! Synonym ")).append(synonymName).append(" not found. How can it happen? ").append(databaseStructure).toString());
			}
		}
		catch (SQLException e)
		{
			String databaseStructure = getDatabaseStructure();
			_log.error(e.getMessage(), e);
			throw new GenerateException((new StringBuilder("Exception in getting synonym owner ")).append(databaseStructure).toString());
		}
		break MISSING_BLOCK_LABEL_196;
		Exception exception;
		exception;
		if (rs != null)
			try
			{
				rs.close();
			}
			catch (Exception exception1) { }
		if (ps != null)
			try
			{
				ps.close();
			}
			catch (Exception exception2) { }
		throw exception;
		if (rs != null)
			try
			{
				rs.close();
			}
			catch (Exception exception3) { }
		if (ps != null)
			try
			{
				ps.close();
			}
			catch (Exception exception4) { }
		return ret;
	}

	private void markFksToUnwantedTables()
		throws GenerateException
	{
		ResultSet tableRs = null;
		try
		{
			for (tableRs = getMetaData().getTables(_catalog, _schema, null, _types); tableRs.next();)
			{
				String tableName = tableRs.getString("TABLE_NAME");
				String tableType = tableRs.getString("TABLE_TYPE");
				if ("TABLE".equals(tableType) && !_gen.constainTable(tableName) || "SYNONYM".equals(tableType) && isOracle())
				{
					String ownerSinonimo = null;
					if ("SYNONYM".equals(tableType) && isOracle())
						ownerSinonimo = getSynonymOwner(tableName);
					ResultSet exportedKeyRs = null;
					if (ownerSinonimo != null)
						exportedKeyRs = getMetaData().getExportedKeys(_catalog, ownerSinonimo, tableName);
					else
						exportedKeyRs = getMetaData().getExportedKeys(_catalog, _schema, tableName);
					while (exportedKeyRs.next()) 
					{
						String fkTableName = exportedKeyRs.getString("FKTABLE_NAME");
						String fkColumnName = exportedKeyRs.getString("FKCOLUMN_NAME");
						if (_gen.constainTable(fkTableName))
						{
							DbTable fkTable = _gen.getTable(fkTableName);
							DbColumn fkColumn = (DbColumn)fkTable.getColumn(fkColumnName);
							fkColumn.setFk(true);
						}
					}
				}
			}

		}
		catch (SQLException e)
		{
			String databaseStructure = getDatabaseStructure();
			_log.error(e.getMessage(), e);
			throw new GenerateException((new StringBuilder("Couldn't get list of tables from database. Probably a JDBC driver problem.")).append(databaseStructure).toString());
		}
		break MISSING_BLOCK_LABEL_312;
		Exception exception;
		exception;
		try
		{
			tableRs.close();
		}
		catch (Exception exception1) { }
		throw exception;
		try
		{
			tableRs.close();
		}
		catch (Exception exception2) { }
		return;
	}

	private void addCrossref(DbTable pkTable, String pkColumnName, String fkTableName, String fkColumnName, String fkName, Map fkTables, boolean unique)
	{
		DbTable fkTable = _gen.getTable(fkTableName);
		DbColumn pkColumn = (DbColumn)pkTable.getColumn(pkColumnName);
		if (!pkColumn.isPk())
			_log.warn((new StringBuilder("WARNING: In the relation involving foreign key column ")).append(fkTableName).append("(").append(fkColumnName).append(") and primary key column ").append(pkTable.getSqlName()).append("(").append(pkColumnName).append(") the primary key column isn't ").append("declared as a primary key column in the database. This may cause errors later on.").toString());
		Map fkNameToColumnMapsMap = (Map)(Map)fkTables.get(fkTable);
		if (fkNameToColumnMapsMap == null)
		{
			fkNameToColumnMapsMap = new HashMap();
			fkTables.put(fkTable, fkNameToColumnMapsMap);
		}
		Collection columnMaps = (Collection)(Collection)fkNameToColumnMapsMap.get(fkName);
		if (columnMaps == null)
		{
			columnMaps = new ArrayList();
			fkNameToColumnMapsMap.put(fkName, columnMaps);
		}
		columnMaps.add(new ColumnMap(pkColumnName, fkColumnName, unique));
		DbColumn fkColumn = (DbColumn)fkTable.getColumn(fkColumnName);
		fkColumn.setFk(true);
	}

	private void addColumns(DbTable table)
		throws GenerateException, SQLException
	{
		List primaryKeys;
		List indices;
		Map uniqueIndices;
		Map uniqueColumns;
		ResultSet indexRs;
		_log.debug((new StringBuilder("-------setColumns(")).append(table.getSqlName()).append(")").toString());
		primaryKeys = new LinkedList();
		ResultSet primaryKeyRs = null;
		if (table.getTableElement().getOwnerSynonymName() != null)
			primaryKeyRs = getMetaData().getPrimaryKeys(_catalog, table.getTableElement().getOwnerSynonymName(), table.getSqlName());
		else
			primaryKeyRs = getMetaData().getPrimaryKeys(_catalog, _schema, table.getSqlName());
		String columnName;
		for (; primaryKeyRs.next(); primaryKeys.add(columnName))
		{
			columnName = primaryKeyRs.getString("COLUMN_NAME");
			_log.debug((new StringBuilder("primary key:")).append(columnName).toString());
		}

		primaryKeyRs.close();
		List customPrimaryKeyList = (List)(List)_tablePrimaryKey.get(table.getTableElement().getName());
		for (Iterator iter = customPrimaryKeyList.iterator(); iter.hasNext();)
		{
			String key = (String)iter.next();
			if (!primaryKeys.contains(key))
				primaryKeys.add(key);
		}

		indices = new LinkedList();
		uniqueIndices = new HashMap();
		uniqueColumns = new HashMap();
		indexRs = null;
		try
		{
			if (table.getTableElement().getOwnerSynonymName() != null)
				indexRs = getMetaData().getIndexInfo(_catalog, table.getTableElement().getOwnerSynonymName(), table.getSqlName(), false, true);
			else
				indexRs = getMetaData().getIndexInfo(_catalog, _schema, table.getSqlName(), false, true);
			while (indexRs.next()) 
			{
				String columnName = indexRs.getString("COLUMN_NAME");
				if (columnName != null)
				{
					_log.debug((new StringBuilder("index:")).append(columnName).toString());
					indices.add(columnName);
				}
				String indexName = indexRs.getString("INDEX_NAME");
				boolean nonUnique = indexRs.getBoolean("NON_UNIQUE");
				if (!nonUnique && columnName != null && indexName != null)
				{
					List l = (List)(List)uniqueColumns.get(indexName);
					if (l == null)
					{
						l = new ArrayList();
						uniqueColumns.put(indexName, l);
					}
					l.add(columnName);
					uniqueIndices.put(columnName, indexName);
					_log.debug((new StringBuilder("unique:")).append(columnName).append(" (").append(indexName).append(")").toString());
				}
			}
		}
		catch (Throwable throwable)
		{
			break MISSING_BLOCK_LABEL_598;
		}
		break MISSING_BLOCK_LABEL_583;
		Exception exception;
		exception;
		if (indexRs != null)
			indexRs.close();
		throw exception;
		if (indexRs != null)
			indexRs.close();
		break MISSING_BLOCK_LABEL_610;
		if (indexRs != null)
			indexRs.close();
		List columns = new LinkedList();
		ResultSet columnRs = null;
		if (table.getTableElement().getOwnerSynonymName() != null)
			columnRs = getMetaData().getColumns(_catalog, table.getTableElement().getOwnerSynonymName(), table.getSqlName(), null);
		else
			columnRs = getMetaData().getColumns(_catalog, _schema, table.getSqlName(), null);
		Column column;
		for (; columnRs.next(); columns.add(column))
		{
			int sqlType = columnRs.getInt("DATA_TYPE");
			String sqlTypeName = columnRs.getString("TYPE_NAME");
			String columnName = columnRs.getString("COLUMN_NAME");
			String columnDefaultValue = columnRs.getString("COLUMN_DEF");
			boolean isNullable = 1 == columnRs.getInt("NULLABLE");
			int size = columnRs.getInt("COLUMN_SIZE");
			int decimalDigits = columnRs.getInt("DECIMAL_DIGITS");
			boolean isPk = false;
			Collection pkColumnsOverride = table.getTableElement().getPkColumnsOverrideCollection();
			if (pkColumnsOverride.size() > 0)
				isPk = pkColumnsOverride.contains(columnName);
			else
				isPk = primaryKeys.contains(columnName);
			boolean isIndexed = indices.contains(columnName);
			String uniqueIndex = (String)uniqueIndices.get(columnName);
			List columnsInUniqueIndex = null;
			if (uniqueIndex != null)
				columnsInUniqueIndex = (List)(List)uniqueColumns.get(uniqueIndex);
			boolean isUnique = columnsInUniqueIndex != null && columnsInUniqueIndex.size() == 1;
			if (isUnique)
				_log.debug((new StringBuilder("unique column:")).append(columnName).toString());
			column = new DbColumn(table, sqlType, sqlTypeName, columnName, size, decimalDigits, isPk, isNullable, isIndexed, isUnique, columnDefaultValue);
		}

		columnRs.close();
		Column column;
		for (Iterator i = columns.iterator(); i.hasNext(); table.addColumn(column))
			column = (Column)i.next();

		List uniqueTuple;
		for (Iterator i = uniqueColumns.values().iterator(); i.hasNext(); table.addUniqueTuple(uniqueTuple))
		{
			List l = (List)(List)i.next();
			uniqueTuple = new ArrayList();
			Column column;
			for (Iterator j = l.iterator(); j.hasNext(); uniqueTuple.add(column))
			{
				String colName = (String)j.next();
				column = table.getColumn(colName);
			}

		}

		if (primaryKeys.size() == 0)
			_log.warn((new StringBuilder("WARNING: The JDBC driver didn't report any primary key columns in ")).append(table.getSqlName()).toString());
		return;
	}

	private void tune(DatabaseMetaData metaData)
		throws SQLException
	{
		String databaseProductName = metaData.getDatabaseProductName();
		String databaseProductVersion = metaData.getDatabaseProductVersion();
		String driverName = metaData.getDriverName();
		String driverVersion = metaData.getDriverVersion();
		_log.debug((new StringBuilder("databaseProductName=")).append(databaseProductName).toString());
		_log.debug((new StringBuilder("databaseProductVersion=")).append(databaseProductVersion).toString());
		_log.debug((new StringBuilder("driverName=")).append(driverName).toString());
		_log.debug((new StringBuilder("driverVersion=")).append(driverVersion).toString());
		_log.debug((new StringBuilder("schema=")).append(_schema).toString());
		_log.debug((new StringBuilder("catalog=")).append(_catalog).toString());
		if (isOracle())
		{
			if (_catalog != null)
				_catalog = _catalog.toUpperCase();
			if (_schema != null)
				_schema = _schema.toUpperCase();
			_types = (new String[] {
				"TABLE", "VIEW", "SYNONYM"
			});
		}
		if (databaseProductName.toLowerCase().indexOf("microsoft") != -1)
			Sql2Java.overridePreferredJavaTypeForSqlType(-2, "java.lang.String");
		databaseProductName.toLowerCase().indexOf("hsql");
	}

	private void addMany2ManyRelations()
	{
		List relations = _gen.getRelations();
		List deleteRelationList = new ArrayList();
		boolean m2mCtlFlag = false;
		int one2manyCount = relations.size();
		for (int i = 0; i < one2manyCount - 1; i++)
		{
			Relation firstRelation = (Relation)relations.get(i);
			RelationshipRole firstRole = firstRelation.getLeftRole();
			_log.debug((new StringBuilder("first:")).append(firstRole.getName()).toString());
			for (int j = i + 1; j < one2manyCount; j++)
			{
				Relation secondRelation = (Relation)relations.get(j);
				RelationshipRole secondRole = secondRelation.getLeftRole();
				_log.debug((new StringBuilder("second:")).append(secondRole.getName()).toString());
				if (firstRole.getTarget() == secondRole.getTarget() && firstRole.getTarget() != null && isWanted(firstRole.getOrigin().getSqlName(), firstRole.getTarget().getSqlName(), secondRole.getOrigin().getSqlName()))
				{
					Collection m2mElements = getM2Ms(firstRole.getOrigin().getSqlName(), secondRole.getOrigin().getSqlName());
					String relationSuffix = null;
					String fkRoleSuffix = null;
					if (m2mElements.size() > 1)
					{
						relationSuffix = (new StringBuilder("-via-")).append(firstRole.getTarget().getSqlName()).append(getRelationSuffix(firstRelation, secondRelation)).toString();
						fkRoleSuffix = (new StringBuilder("_via_")).append(firstRole.getTarget().getSqlName()).append(getRelationSuffix(firstRelation, secondRelation)).toString();
						fkRoleSuffix = DbNameConverter.getInstance().columnNameToVariableName(fkRoleSuffix);
					} else
					{
						relationSuffix = getRelationSuffix(firstRelation, secondRelation);
						fkRoleSuffix = getRelationSuffix(firstRelation, secondRelation);
						Iterator iter = m2mElements.iterator();
						Many2ManyElement m2mElement = (Many2ManyElement)iter.next();
						if (firstRole.getOrigin().getName().equalsIgnoreCase(m2mElement.getTablea().getName()))
							m2mCtlFlag = m2mElement.getControl();
						else
							m2mCtlFlag = !m2mElement.getControl();
					}
					Relation m2m = new Relation(firstRole.getOrigin(), firstRole.getColumnMaps(), secondRole.getOrigin(), secondRole.getColumnMaps(), firstRole.getTarget(), relationSuffix, fkRoleSuffix);
					m2m.setM2MControl(m2mCtlFlag);
					_gen.addRelation(m2m);
					deleteRelationList.add(firstRelation);
					deleteRelationList.add(secondRelation);
				}
			}

		}

		for (int i = 0; i < deleteRelationList.size(); i++)
		{
			Relation relation = (Relation)deleteRelationList.get(i);
			Table leftTable = relation.getLeftTable();
			leftTable.removeRelationshipRole(relation.getLeftRole());
			relation.getRightTable().removeRelationshipRole(relation.getRightRole());
			_gen.removeRelation(relation);
		}

	}

	private void warnUnidentifiedM2ms()
	{
		for (Iterator i = _many2many.values().iterator(); i.hasNext();)
		{
			Collection c = (Collection)(Collection)i.next();
			for (Iterator j = c.iterator(); j.hasNext();)
			{
				Many2ManyElement eminem = (Many2ManyElement)j.next();
				if (!eminem.isMatched())
					_log.warn((new StringBuilder("The many2many relation ")).append(eminem.toString()).append(" was declared, but not identified.").toString());
			}

		}

	}

	private void addTables(Map wantedTables)
		throws GenerateException, SQLException
	{
		Map tableSchemaMap;
		Iterator tableElementIterator;
		_log.debug("-- tables --");
		tableSchemaMap = new HashMap();
		tableElementIterator = wantedTables.values().iterator();
		  goto _L1
_L3:
		TableElement tableElement;
		String tableName;
		String schemaName;
		ResultSet tableRs;
		tableElement = (TableElement)tableElementIterator.next();
		tableName = tableElement.getName();
		schemaName = null;
		tableRs = null;
		tableRs = getMetaData().getTables(_catalog, _schema, tableName, _types);
		if (!tableRs.next())
		{
			tableRs = getMetaData().getTables(_catalog, _schema, tableName.toLowerCase(), _types);
			if (!tableRs.next())
			{
				tableRs = getMetaData().getTables(_catalog, _schema, tableName.toUpperCase(), _types);
				if (!tableRs.next())
					throw new GenerateException((new StringBuilder("The database doesn't have any table named ")).append(tableName).append(".  Please make sure the table exists. Also note that some databases are case sensitive.").append(getDatabaseTables()).toString());
			}
		}
		schemaName = Util.ensureNotNull(tableRs.getString("TABLE_SCHEM"));
		String realTableName = tableRs.getString("TABLE_NAME");
		String tableType = tableRs.getString("TABLE_TYPE");
		tableElement.setPhysicalName(realTableName);
		if ("SYNONYM".equals(tableType) && isOracle())
			tableElement.setOwnerSynonymName(getSynonymOwner(realTableName));
		String alreadySchema = (String)tableSchemaMap.get(realTableName);
		if (alreadySchema != null)
			throw new GenerateException((new StringBuilder("The table named ")).append(realTableName).append(" was found both in the schema ").append("named ").append(alreadySchema).append(" and in the schema named ").append(schemaName).append(". ").append("You have to specify schema=\"something\" in the middlegen task.").toString());
		tableSchemaMap.put(realTableName, schemaName);
		if (!"".equals(schemaName) && !"null".equals(schemaName) && !Util.equals(_schema, schemaName) && (!"SYNONYM".equals(tableType) || !isOracle()))
			_log.warn((new StringBuilder("The table named ")).append(realTableName).append(" was found in the schema ").append("named \"").append(schemaName).append("\". However, Middlegen was not configured ").append("to look for tables in a specific schema. You should consider specifying ").append("schema=\"").append(schemaName).append("\" instead of schema=\"").append(_schema).append("\" in the middlegen task.").toString());
		break MISSING_BLOCK_LABEL_539;
		Exception exception;
		exception;
		try
		{
			tableRs.close();
		}
		catch (SQLException sqlexception) { }
		catch (NullPointerException nullpointerexception) { }
		throw exception;
		try
		{
			tableRs.close();
		}
		catch (SQLException sqlexception1) { }
		catch (NullPointerException nullpointerexception1) { }
		DbTable table = new DbTable(tableElement, schemaName);
		table.init();
		_gen.addTable(table);
_L1:
		if (tableElementIterator.hasNext()) goto _L3; else goto _L2
_L2:
	}

}
