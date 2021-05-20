package site.margaret.dto;
/*
	 �̸�            ��?       ����             
	------------- -------- -------------- 
	BOARD_NO      NOT NULL NUMBER         //�Խñ� ��ȣ (PK)
	ID                     VARCHAR2(20)   //�ۼ��� ���̵�(FK-MEMBER(ID))
	SECTION                NUMBER	      //�Խñ� ���� (0: Q&A /1: ����)
	TITLE                  VARCHAR2(50)   //�Խñ� �̸�
	BOARD_CONTENT          VARCHAR2(2000) //�Խñ� ����
	BOARD_DATE             DATE           //�Խñ� �ۼ���
	REVIEW_GRADE           VARCHAR2(20)   //���� ���� 
	PRODUCT_NO             NUMBER(4)      //���� ��ǰ ��ȣ (FK-PRODUCT(PRODUCT_NO))
	WHETHER_REPLY          NUMBER(1)      //REPLY ���� (0: �亯x 1: �亯o)
	BOARD_STATUS           NUMBER(1)	  //�Խñ� ���� (0:�Ϲݱ� 1:��б� 9: ������)
	BOARD_FILE			   VARCHAR2(100)  //÷������ �̸� (�����ϱ�)
	Q_no				   NUMBER		  //������ ���� ��ȣ
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