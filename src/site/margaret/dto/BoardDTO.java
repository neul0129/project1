package site.margaret.dto;
/*
	 이름            널?       유형             
	------------- -------- -------------- 
	BOARD_NO      NOT NULL NUMBER         //게시글 번호 (PK)
	ID                     VARCHAR2(20)   //작성자 아이디(FK-MEMBER(ID))
	SECTION                NUMBER	      //게시글 구분 (0: Q&A /1: 리뷰)
	TITLE                  VARCHAR2(50)   //게시글 이름
	BOARD_CONTENT          VARCHAR2(2000) //게시글 내용
	BOARD_DATE             DATE           //게시글 작성일
	REVIEW_GRADE           VARCHAR2(20)   //리뷰 평점 
	PRODUCT_NO             NUMBER(4)      //리뷰 제품 번호 (FK-PRODUCT(PRODUCT_NO))
	WHETHER_REPLY          NUMBER(1)      //REPLY 여부 (0: 답변x 1: 답변o)
	BOARD_STATUS           NUMBER(1)	  //게시글 상태 (0:일반글 1:비밀글 9: 삭제글)
	BOARD_FILE			   VARCHAR2(100)  //첨부파일 이름 (삭제하기)
	Q_no				   NUMBER		  //질문에 대한 번호
 */
public class BoardDTO {
	private int boardNo;
	private String id;
	private int section;
	private String title, boardContent, boardDate, reviewGrade;
	private int productNo, whetherReply, boardStatus, qNo;
	private String boardFile;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public String getReviewGrade() {
		return reviewGrade;
	}

	public void setReviewGrade(String reviewGrade) {
		this.reviewGrade = reviewGrade;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getWhetherReply() {
		return whetherReply;
	}

	public void setWhetherReply(int whetherReply) {
		this.whetherReply = whetherReply;
	}

	public int getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(int boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getBoardFile() {
		return boardFile;
	}

	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	
	
	
}