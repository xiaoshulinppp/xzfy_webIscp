// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   DbTable.java

package com.taiji.core.generator.plugingen;

import com.taiji.core.generator.plugingen.predicate.column.Mandatory;
import com.taiji.core.generator.plugingen.predicate.column.PrimaryKey;
import java.util.*;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package com.taiji.core.generator.plugingen:
//			PreferenceAware, Table, TableElement, Column, 
//			RelationshipRole

public class DbTable extends PreferenceAware
	implements Table
{

	private TableElement _tableElement;
	private final Collection _relationshipRoles;
	private final List _columns;
	private final String _schemaName;
	private final Map _columnSqlName2ColumnMap;
	private final Collection _uniqueTuples;
	private static final Log log = LogFactory.getLog(com/taiji/core/generator/plugingen/DbTable);

	public DbTable(TableElement tableElement, String schemaName)
	{
		_relationshipRoles = new ArrayList();
		_columns = new ArrayList();
		_columnSqlName2ColumnMap = new HashMap();
		_uniqueTuples = new ArrayList();
		_tableElement = tableElement;
		_schemaName = schemaName;
	}

	public DbTable(TableElement tableElement)
	{
		_relationshipRoles = new ArrayList();
		_columns = new ArrayList();
		_columnSqlName2ColumnMap = new HashMap();
		_uniqueTuples = new ArrayList();
		_tableElement = tableElement;
		_schemaName = "";
	}

	public Collection getColumns(Predicate predicate)
	{
		return CollectionUtils.select(getColumns(), predicate);
	}

	public TableElement getTableElement()
	{
		return _tableElement;
	}

	public String getSqlName(boolean withSchemaPrefix)
	{
		return withSchemaPrefix ? getSchemaPrefixedSqlName() : getSqlName();
	}

	public String getSchemaPrefixedSqlName()
	{
		boolean noschema = _schemaName == null || _schemaName.trim().equals("");
		String result;
		if (noschema)
			result = getSqlName();
		else
			result = (new StringBuilder(String.valueOf(_schemaName))).append(".").append(getSqlName()).toString();
		return result;
	}

	public String getSqlName()
	{
		return getTableElement().getPhysicalName();
	}

	public String getName()
	{
		return getTableElement().getName();
	}

	public Collection getRelationshipRoles()
	{
		return _relationshipRoles;
	}

	public Collection getColumns()
	{
		return Collections.unmodifiableCollection(_columns);
	}

	public final Collection getManadatoryColumns()
	{
		return getColumns(Mandatory.getInstance());
	}

	public final Collection getPrimaryKeyColumns()
	{
		return getColumns(PrimaryKey.getInstance());
	}

	public Collection getRelationshipRoles(Predicate predicate)
	{
		return CollectionUtils.select(getRelationshipRoles(), predicate);
	}

	public Column getPkColumn()
	{
		Column pkColumn = null;
		Iterator iter = getColumns().iterator();
		while (iter.hasNext()) 
		{
			Column column = (Column)iter.next();
			if (!column.isPk())
				continue;
			if (pkColumn != null)
			{
				pkColumn = null;
				break;
			}
			pkColumn = column;
		}
		return pkColumn;
	}

	public int getIndex(String columnSqlName)
	{
		return _columns.indexOf(getColumn(columnSqlName));
	}

	public Collection getUniqueTuples()
	{
		return _uniqueTuples;
	}

	public Column getColumn(String sqlName)
	{
		Column column = (Column)_columnSqlName2ColumnMap.get(sqlName);
		if (column == null)
			throw new IllegalArgumentException((new StringBuilder("There is no column named ")).append(sqlName).append(" in the table named ").append(getSqlName()).toString());
		else
			return column;
	}

	public void addRelationshipRole(RelationshipRole relationshipRole)
	{
		_relationshipRoles.add(relationshipRole);
	}

	public void removeRelationshipRole(RelationshipRole relationshipRole)
	{
		_relationshipRoles.remove(relationshipRole);
	}

	public void addColumn(Column column)
	{
		_columns.add(column);
		_columnSqlName2ColumnMap.put(column.getSqlName(), column);
	}

	public void addUniqueTuple(Collection uniqueTuple)
	{
		_uniqueTuples.add(uniqueTuple);
	}

	public void sortColumns(Comparator comparator)
	{
		Collections.sort(_columns, comparator);
	}

	public boolean equals(Object o)
	{
		if (o instanceof Table)
		{
			Table other = (Table)o;
			return getSqlName().equals(other.getSqlName());
		} else
		{
			return false;
		}
	}

	public int hashCode()
	{
		return getSqlName().hashCode();
	}

}
