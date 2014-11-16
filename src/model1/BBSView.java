package model1;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;

import javax.servlet.ServletException;

public class BBSView {
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
	private int pg;
	
	public BBSView() {}
	
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
	public void setPg(int pg) { this.pg = pg; }
	public int getPg() { return pg; }
	
	public void readDB() throws ServletException
	{
		System.out.println("idx : " + num);
		System.out.println("pg : " + pg);
		
		Connection conn = null;
		Statement stmt = null;
		
		try 
		{
			Class.forName("org.apache.commons.dbcp.PoolingDriver");
			conn = DriverManager.getConnection
					("jdbc:apache:commons:dbcp:/wdbpool");
			
			if(conn==null)
			{
				try {
					throw new Exception("데이터베이스에 연결할 수 없습니다.");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			stmt = conn.createStatement();
			
			String sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT FROM board WHERE NUM=" + num;
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next())
			{
				userName = rs.getString(1);
				title = rs.getString(2);
				memo = rs.getString(3);
				date = rs.getDate(4);
				hit = rs.getInt(5);
				hit++;
				
				sql = "UPDATE board SET HIT=" + hit + " WHERE NUM=" + num;
				stmt.executeUpdate(sql);		
			}
		} catch( SQLException e) {
			System.out.println(e.toString());
		} catch ( Exception e ) {
			System.out.println(e.toString());
		} finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println(e.toString());
			}
		}
	}
}
