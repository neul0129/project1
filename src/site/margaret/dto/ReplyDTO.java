package site.margaret.dto;
/*
	 이름           널?       유형            
	------------ -------- ------------- 
	REPLY_NO     NOT NULL NUMBER        //댓글 번호(PK)
	BOARD_NO              NUMBER        //게시글 번호(FK-BOARD(NO))
	ID                    VARCHAR2(50)  //댓글 작성자 (관리자) (FK-BOARD(ID))
	REPLY_CONTENT         VARCHAR2(800) //댓글 내용
	REPLY_DATE            DATE          //댓글 등록일
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
