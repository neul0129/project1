package site.margaret.dto;
/*
	 �̸�           ��?       ����            
	------------ -------- ------------- 
	REPLY_NO     NOT NULL NUMBER        //��� ��ȣ(PK)
	BOARD_NO              NUMBER        //�Խñ� ��ȣ(FK-BOARD(NO))
	ID                    VARCHAR2(50)  //��� �ۼ��� (������) (FK-BOARD(ID))
	REPLY_CONTENT         VARCHAR2(800) //��� ����
	REPLY_DATE            DATE          //��� �����
 */
public class ReplyDTO {
	private int replyNo, boardNo;
	private String id, replyContent, replyDate;
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}


}
