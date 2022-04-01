package vo;
//필드생성
public class Guestbook {
	public Guestbook() {} //생성자
	private int guestbookNo; //방명록 번호
	private String guestbookContent; //내용
	private String  writer; //글쓴이
	private String guestbook_pw; //비밀번호
	private String createDate; //최초생성날짜
	private String updateDate; //수정날짜
	private String guestbookPw; //비밀번호
	
	public int getGuestbookNo() {
		return guestbookNo;
	}
	public void setGuestbookNo(int guestbookNo) {
		this.guestbookNo = guestbookNo;
	}
	public String getGuestbookContent() {
		return guestbookContent;
	}
	public void setGuestbookContent(String guestbookContent) {
		this.guestbookContent = guestbookContent;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getGuestbook_pw() {
		return guestbook_pw;
	}
	public void setGuestbook_pw(String guestbook_pw) {
		this.guestbook_pw = guestbook_pw;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getGuestbookPw() {
		return guestbookPw;
	}
	public void setGuestbookPw(String guestbookPw) {
		this.guestbookPw = guestbookPw;
	}
	
	
}
