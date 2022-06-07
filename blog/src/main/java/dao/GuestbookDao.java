package dao;
import java.sql.*;
import java.util.ArrayList;
import vo.Guestbook;
public class GuestbookDao {
	public GuestbookDao() {} //생성자 메소드
	//프로세스 구현
	//입력
	//GuestbookDao guestbookDao = new GuestbookDao();
	//Guestbook guestbook = new Guestbook();
	//guestbookDap,insertGuestbook(guestbook);호출
	public void insertGuestbook(Guestbook guestbook) throws Exception {
		Class.forName("org.mariadb.jdbc.Driver"); //드라이버 로딩
		Connection conn = null;
		PreparedStatement stmt = null;
		
		//db접속
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		//쿼리문 저장
		String sql ="INSERT INTO guestbook(guestbook_content, writer, guestbook_pw, create_date, update_date) VALUES(?,?,?,NOW(),NOW())";
		stmt = conn.prepareStatement(sql);//쿼리문 실행 저장
		//?에 값 저장
		stmt.setString(1, guestbook.getGuestbookContent());
		stmt.setString(2, guestbook.getWriter());
		stmt.setString(3, guestbook.getGuestbookPw());
		int row = stmt.executeUpdate(); //입력된 행의 수
		if(row ==1) {
			System.out.println("입력성공");
		}else {
			System.out.println("입력실패");
		}
		
		stmt.close();
		conn.close();
	}
	//updateGuestbookForm.jsp호출
	//수정(guestbookOne, updateGuestbook)
	public Guestbook selectGuestbookOne(int guestbookNo) throws Exception{ 
		Guestbook guestbook = null;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		
		String sql="SELECT guestbook_no guestbookNo, guestbook_content guestbookContent FROM guestbook WHERE guestbook_no = ?";
		stmt= conn.prepareStatement(sql);
		stmt.setInt(1, guestbookNo);
		System.out.println("stmt(guestbookOne) : " +stmt);
		rs = stmt.executeQuery();
		if(rs.next()) {
			guestbook = new Guestbook(); //생성자메서드 
			guestbook.setGuestbookNo(rs.getInt("guestbookNo"));
			guestbook.setGuestbookContent(rs.getString("guestbookContent"));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return guestbook;
	}
	//updateGuestbookAction.jsp호출
	//이름(updateGuestbook),
	//반환타입(수정한 행의 수 반환) - >0:수정실패, 1:수정성공 ->int
	//입력매개변수(guestbookNo, guestbookContent,guestbookPw) ->하나의  타입매개변수로 받기 ->Guestbook타입 사용
	public int updateGuestbook(Guestbook guestbook) throws Exception{
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		
		String sql="UPDATE guestbook SET guestbook_content =? WHERE guestbook_no=? AND guestbook_pw";
		stmt= conn.prepareStatement(sql);
		stmt.setString(1, guestbook.getGuestbookContent());
		stmt.setInt(2, guestbook.getGuestbookNo());
		stmt.setString(3, guestbook.getGuestbookPw());
		System.out.println("stmt(update) : " +stmt);
		int row = stmt.executeUpdate();
		if(row == 1) {
			System.out.println("수정성공");
		}else {
			System.out.println("수정실패");
		}
		
		stmt.close();
		conn.close();
		
		return row;
	}
	
	//삭제(deleteguestbook)
	//이름:deleteGuestbook
	//반환값: int, row행 결과수
	//입력매개값:gusetbookNo,guestbook_pw ->2개로 받기 ->int,String(Guestbook타입 사용해도 됨.)
	public int deleteGuestbook(int guestbookNo, String guestbookPw) throws Exception{
		int row = 0;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		
		String sql="DELETE FROM guestbook WHERE guestbook_no =? AND guestbook_pw=?";
		stmt= conn.prepareStatement(sql);
		stmt.setInt(1, guestbookNo);
		stmt.setString(2, guestbookPw);
		System.out.println("delete Stmt:" + stmt);
		row=stmt.executeUpdate();
		
		stmt.close();
		conn.close();
		
		return row;
	}
	//guestbook 전체행의 수를 반환 메소드
	public int selectGuestbookTotalRow() throws Exception{
		int row = 0;
		Class.forName("org.mariadb.jdbc.Driver");
		//데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		
		String sql ="SELECT COUNT(*) cnt FROM guestbook";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		if(rs.next()) {
			row = rs.getInt("cnt");
		}
		return row;
	}
	
	//guestbook 10행씩 반환하는 메서드
	public ArrayList<Guestbook> selectGuestbookListByPage(int beginRow, int rowPerPage) throws Exception{
		ArrayList<Guestbook> list = new ArrayList<Guestbook>();
		//guestbook 10행이 반환되도록 구현
		//db연결
		//드라이버 로딩
		Class.forName("org.mariadb.jdbc.Driver");
		
		//데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		
		String sql = "SELECT guestbook_no guestbookNo, guestbook_content guestbookContent, writer,guestbook_pw guestbookPw, create_date createDate FROM guestbook ORDER BY create_date DESC LIMIT ?, ?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		// 데이터베이스 로직 끝
		
		// 데이터 변환(가공)
		while(rs.next()) {
			Guestbook g = new Guestbook();
			g.setGuestbookNo(rs.getInt("guestbookNo"));
			g.setGuestbookContent(rs.getString("guestbookContent"));
			g.setWriter(rs.getString("writer"));
			g.setCreateDate(rs.getString("createDate"));
			list.add(g);
		}
		
		// 데이터베이스 자원들 반환
		rs.close();
		stmt.close();
		conn.close();
	
		return list;
	
	}
}	
