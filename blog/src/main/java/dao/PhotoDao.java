package dao;
import vo.Photo;
import java.sql.*;
import java.util.ArrayList;
public class PhotoDao {
	//수정 : 삭제 후 새로 입력
	//1.사진 입력
	public void insertPhoto(Photo photo) throws Exception{
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		String sql="INSERT INTO photo(photo_name,photo_original_name, photo_type,photo_pw,writer,create_date, update_date) VALUES(?,?,?,?,?,NOW(),NOW())";
		
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, photo.getPhotoName());
		stmt.setString(2, photo.getPhotoOriginalName());
		stmt.setString(3, photo.getPhotoType());
		stmt.setString(4, photo.getPhotoPw());
		stmt.setString(5, photo.getWriter());
		
		int row = stmt.executeUpdate();
		if(row ==1) {
			System.out.println("입력성공");
		}else {
			System.out.println("입력실패");
		}
		stmt.close();
		conn.close();
		}
	//2.사진 삭제
	public int deletePhoto(int photoNo, String photoPw) throws Exception {
		int delRow = 0;
		
		//드라이버 로딩
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		
		//db접속
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		System.out.println("conn 접속 성공"+conn);
		
		//쿼리문 저장
		String sql="DELETE FROM photo WHERE photo_no=? and photo_pw =?";
		stmt= conn.prepareStatement(sql);
		stmt.setInt(1, photoNo);
		stmt.setString(2, photoPw);
		
		System.out.println("delete Stmt:" + stmt);
		delRow=stmt.executeUpdate();
		
		stmt.close();
		conn.close();
		return delRow;
	}
	//3.전체행의 수
		public int selectPhotoTotalRow() throws Exception {
			int total = 0;
			
			Class.forName("org.mariadb.jdbc.Driver");//드라이버 로딩
			
			//데이터베이스 자원 준비
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
			System.out.println("conn 접속 성공"+conn);
			//쿼리문 저장 및 실행
			String sql="SELECT COUNT(*) cnt FROM photo";
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
	//4.사진 목록
	public ArrayList<Photo> selectPhotoListByPage(int beginRow, int rowPerPage) throws Exception{
		ArrayList<Photo> list = new ArrayList<Photo>();
		
		Class.forName("org.mariadb.jdbc.Driver");//드라이버 로딩
		
		//데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		System.out.println("conn 접속 성공"+conn);
		
		//쿼리문 저장
		String sql = "SELECT photo_no photoNo, photo_name photoName FROM photo ORDER BY create_date DESC LIMIT ?,?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		rs = stmt.executeQuery();
		
		// 데이터 변환(가공)
		while(rs.next()) {
			Photo p = new Photo();
			p.setPhotoNo(rs.getInt("photoNo")); //번호 가져오기
			p.setPhotoName(rs.getString("photoName"));
			list.add(p);
			}
		
		// 데이터베이스 자원들 반환
		rs.close();
		stmt.close();
		conn.close();

		return list;
	}
	//5.사진 상세보기
	public Photo selectPhotoOne(int photoNo) throws Exception{
		Photo photo = null;
		
		Class.forName("org.mariadb.jdbc.Driver"); //드라이버 로딩
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		//db접속
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		System.out.println("conn 접속 성공"+conn);
		
		//쿼리문 저장
		String sql="SELECT photo_no photoNo, photo_name photoName,photo_original_name photoOriginalName,photo_type photoType, photo_pw photoPw  , writer, create_date createDate, update_date updateDate FROM photo WHERE photo_no=?";
		stmt= conn.prepareStatement(sql);
		stmt.setInt(1, photoNo);
		rs = stmt.executeQuery();
		
		if(rs.next()){ //다음줄에 있으면 true
			photo = new Photo(); //board객체 생성
			//객체에 값가져와서 저장?
			photo.setPhotoNo(photoNo);; //번호 가져오기
			photo.setPhotoName(rs.getString("photoName"));
			photo.setPhotoOriginalName(rs.getString("photoOriginalName")); //사진이름
			photo.setPhotoType(rs.getString("photoType")); //타입
			photo.setPhotoPw(rs.getString("photoPw")); //비밀번호
			photo.setWriter(rs.getString("writer")); //작성자
			photo.setCreateDate(rs.getString("createDate")); // 최초생성날짜
			photo.setUpdateDate(rs.getString("updateDate"));//수정날짜
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return photo;
	}
	//6.이미지 이름 반환
	public String selectPhotoName(int photoNo) throws Exception {
		
		Class.forName("org.mariadb.jdbc.Driver"); //드라이버 로딩
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs =null;
		
		//db접속
		conn = DriverManager.getConnection("jdbc:mariadb://3.36.57.93:3306/blog","root","mariadb1234");
		System.out.println("conn 접속 성공"+conn);
		String PhotoName = "SELECT photo_name WHERE photo_no=?";
		stmt= conn.prepareStatement(PhotoName);
		stmt.setInt(1, photoNo);
		
		return PhotoName;
		
	}
	
}
