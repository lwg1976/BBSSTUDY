package bbsModel1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBClose
{
	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs)
	{
		close(rs);
		close(pstmt);
		close(conn);
	}
	
	public static void close(Connection conn, PreparedStatement pstmt)
	{
		close(pstmt);
		close(conn);
	}
	
	public static void close(Connection conn, Statement stmt)
	{
		close(stmt);
		close(conn);
	}
	
	public static void close(PreparedStatement pstmt, ResultSet rs)
	{
		close(pstmt);
		close(rs);
	}
	
	public static void close(Connection conn)
	{
		try
		{
			if(conn != null) { conn.close(); conn = null; }
		} catch( Exception e ) {
			System.out.println(e.toString());
		}
	}
	
	public static void close(PreparedStatement pstmt)
	{
		try
		{
			if(pstmt != null) { pstmt.close(); pstmt = null; }
		} catch( Exception e ) {
			System.out.println(e.toString());
		}
	}
	
	public static void close(Statement stmt)
	{
		try
		{
			if(stmt != null) { stmt.close(); stmt = null; }
		} catch( Exception e ) {
			System.out.println(e.toString());
		}
	}
	
	public static void close(ResultSet rs)
	{
		try
		{
			if(rs != null) { rs.close(); rs = null; }
		} catch( Exception e ) {
			System.out.println(e.toString());
		}
	}
}
