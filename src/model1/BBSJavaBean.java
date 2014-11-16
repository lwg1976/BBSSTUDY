package model1;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;

public class BBSJavaBean
{
	private int num;			// 순번
	private String userName;	// 이름
	private String password;	// 비밀번호
	private String title;		// 제목
	private String memo;		// 내용
	private Date date;			// 저장일자
	private Time time;			// 저장시각
	private int hit;			// 읽은 횟수
	private int ref;
	private int indent;
	private int step;
	private int step2;
	
	public BBSJavaBean() {}
	
	public void setNum(int num) { this.num = num; }
	public int getNum() { return num; }
	public void setUserName(String userName) { this.userName = userName; }
	public String getUserName() { return userName; }
	public void setPassword(String password) { this.password = password; }
	public String getPassword() { return password; }
	public void setTitle(String title) { this.title = title; }
	public String getTitle() { return title; }
	public void setMemo(String memo) { this.memo = memo; }
	public String getMemo() { return memo; }
	public void setDate(Date date) { this.date = date; }
	public Date getDate() { return date; }
	public void setTime(Time time) { this.time = time; }
	public Time getTime() { return time; }
	public void setHit(int hit) { this.hit = hit; }
	public int getHit() { return hit; }
	public void setRef(int ref) { this.ref = ref; }
	public int getRef() { return ref; }
	public void setIndent(int indent) { this.indent = indent; }
	public int getIndent() { return indent; }
	public void setStep(int step) { this.step = step; }
	public int getStep() { return step; }
	public void setStep2(int step2) { this.step2 = step2; }
	public int getStep2() { return step2; }
	
//	private String toUnicode(String str)
//	{
//		if(str == null)
//		{
//			return null;
//		}
//		
//		try{
//			byte[] b = str.getBytes("ISO-8859-1");
//			return new String(b);
//		} catch ( java.io.UnsupportedEncodingException uee) {
//			System.out.println(uee.getMessage());
//			return null;
//		}
//	}
	
	public void BBSDB(int pg) throws ServletException
	{
		final int ROWSIZE = 10;
		final int BLOCK = 5;
				
		int start = (pg*ROWSIZE) - (ROWSIZE-1);
		int end = (pg*ROWSIZE);
		
		int allPage = 0;
		
		int startPage = ((pg-1)/BLOCK*BLOCK)+1;
		int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
		int total = 0;
		
		Connection conn = null;
		Statement stmt = null, stmt1 = null;
		
		try
		{
			Class.forName("org.apache.commons.dbcp.PoolingDriver");
			conn = DriverManager.getConnection
					("jdbc:apache:commons:dbcp:/wdbpool");
			
			if(conn==null)
			{
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			}
			
			stmt = conn.createStatement();
			stmt1 = conn.createStatement();
			
			String sql = "";
			String sqlCount = "SELECT COUNT(*) FROM board";
			ResultSet rs = stmt.executeQuery(sqlCount);
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
			int sort = 1;
			String sqlSort = "SELECT NUM FROM board ORDER BY REF DESC, STEP ASC";
			rs = stmt.executeQuery(sqlSort);
			
			while(rs.next())
			{
				int stepNum = rs.getInt(1);
				sql = "UPDATE board SET STEP2=" + sort + " WHERE NUM=" + stepNum;
				stmt1.executeUpdate(sql);
				sort++;
			}
			
			allPage = (int)Math.ceil(total/(double)ROWSIZE);
			
			if(endPage > allPage)
			{
				endPage = allPage;
			}
			
			String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT FROM board"
					+ " WHERE STEP2 >=" + start + " AND STEP2 <=" + end + " ORDER BY STEP2 ASC";
			rs = stmt.executeQuery(sqlList);
			
			if(total==0) {
				
			} else {
				while(rs.next())
				{
					int idx = rs.getInt(1);
					userName = rs.getString(2);
					title = rs.getString(3);
					date = rs.getDate(4); 
					time = rs.getTime(4);
					hit = rs.getInt(5);
					indent = rs.getInt(6);
					
					Calendar nowDate = Calendar.getInstance();
					SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
					String year = (String)simpleDate.format(nowDate);
				}
			}			
		} catch ( Exception e ) {
			System.out.println(e.toString());
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
				e.printStackTrace();
			}
			
		}
	}
}
