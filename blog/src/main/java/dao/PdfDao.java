package dao;
import java.sql.*;
import java.util.*;
import vo.*;
public class PdfDao {
	
	//1.pdf 업로드(입력)
	public void uploadPdf(Pdf pdf) throws Exception{
		//드라이버 로딩
		Class.forName("org.mariadb.jdbc.Driver");
		//db접속 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		//db접속
		String dburl = "jdbc:mariadb://localhost:3306/blog"; //db주소
		String dbuser = "root"; //db계정
		String dbpw = "java1234"; //비밀번호
		//쿼리문 저장, 실행
		String sql="INSERT INTO pdf(pdf_name,pdf_original_name, pdf_type,pdf_pw,writer,create_date) VALUES(?,?,?,?,?,NOW())";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, pdf.getPdfName());
		stmt.setString(2, pdf.getPdfOriginalName());
		stmt.setString(3, pdf.getPdfType());
		stmt.setString(4, pdf.getPdfPw());
		stmt.setString(5, pdf.getWriter());
		
		int row = stmt.executeUpdate();
		if(row ==1) {
			System.out.println("입력성공");
		}else {
			System.out.println("입력실패");
		}
		stmt.close();
		conn.close();
	}
	
	//2.pdf삭제
	public int deletePdf(int pdfNo, String pdfPw) throws Exception{
		int delRow =0;
		
		//드라이버 로딩
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		//db접속
		String dburl = "jdbc:mariadb://localhost:3306/blog"; //db주소
		String dbuser = "root"; //db계정
		String dbpw = "java1234"; //비밀번호
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		System.out.println("pdf conn 접속 성공"+conn);
		
		//쿼리문 저장
		String sql="DELETE FROM pdf WHERE pdf_no=? and pdf_pw =?";
		stmt= conn.prepareStatement(sql);
		stmt.setInt(1, pdfNo);
		stmt.setString(2, pdfPw);
		
		System.out.println("pdf delete Stmt:" + stmt);
		delRow=stmt.executeUpdate();
		
		stmt.close();
		conn.close();
				
		return delRow;
	}
	
	//3.pdf이름 가져오기
	public String selectPdfName(int pdfNo) throws Exception{
		
		Class.forName("org.mariadb.jdbc.Driver"); //드라이버 로딩
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		//db접속
		String dburl = "jdbc:mariadb://localhost:3306/blog"; //db주소
		String dbuser = "root"; //db계정
		String dbpw = "java1234"; //비밀번호
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		System.out.println("conn 접속 성공"+conn);
		String sql = "SELECT pdf_name WHERE pdf_no=?";
		stmt= conn.prepareStatement(sql);
		stmt.setInt(1, pdfNo);
		
		return sql;
	}
	//4.pdf목록
	public ArrayList<Pdf> selectPdfList(int beginRow, int rowPerPage) throws Exception{
		ArrayList<Pdf> list = new ArrayList<Pdf>();
		
		Class.forName("org.mariadb.jdbc.Driver");//드라이버 로딩
		
		//데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://localhost:3306/blog"; //db주소
		String dbuser = "root"; //db계정
		String dbpw = "java1234"; //비밀번호
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 	
		System.out.println("pdf conn 접속 성공"+conn);
		
		//쿼리문 저장
		String sql = "SELECT pdf_no pdfNo, pdf_name pdfName FROM pdf ORDER BY create_date DESC LIMIT ?,?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		
		// 데이터 변환(가공)
		while(rs.next()) {
			Pdf p = new Pdf();
			p.setPdfNo(rs.getInt("pdfNo")); //번호 가져오기
			p.setPdfName(rs.getString("pdfName"));
			list.add(p);
		}
		
		// 데이터베이스 자원들 반환
		rs.close();
		stmt.close();
		conn.close();

		return list;
	}
	
	//5.전체 행 수
	public int selectPdfTotalRow() throws Exception {
		int total = 0;
		
		Class.forName("org.mariadb.jdbc.Driver");//드라이버 로딩
		
		//데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://localhost:3306/blog"; //db주소
		String dbuser = "root"; //db계정
		String dbpw = "java1234"; //비밀번호
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 	
		System.out.println("conn 접속 성공"+conn);
		//쿼리문 저장 및 실행
		String sql="SELECT COUNT(*) cnt FROM pdf";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		if(rs.next()) {
			total = rs.getInt("cnt");
		}
		
		rs.close();
		stmt.close();
		conn.close();//db종료
		return total;
	}
}
