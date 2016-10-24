package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB
{
  public static Connection getConn()
  {
    Connection conn = null;
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/orcl", "xzfy1", "xzfy");
    }
    catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return conn;
  }
  public static Statement getStmt(Connection conn) {
    Statement stmt = null;
    try {
      stmt = conn.createStatement();
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return stmt;
  }
  public static ResultSet executeQuery(Statement stmt, String sql) {
    ResultSet rs = null;
    try {
      rs = stmt.executeQuery(sql);
    }
    catch (SQLException e) {
      e.printStackTrace();
    }
    return rs;
  }
  public static void close(Connection conn) {
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
      conn = null;
    }
  }

  public static void close(Statement stmt) {
    if (stmt != null) {
      try {
        stmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
      stmt = null;
    }
  }

  public static void close(ResultSet rs) {
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
      rs = null;
    }
  }
}