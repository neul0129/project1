package site.margaret.dto;

/*
이름					널?			유형
------------	----------	-----------
ORDER_NO		NOT NULL	NUMBER(4) 	  - 주문번호(PK)
ID							VARCHAR2(20)  - 회원아이디
PRODUCT_NO					NUMBER(4)     - 상품번호 
ORDER_SEQ					VARCHAR2(20)  - 주문순번 (동일상품 동시주문 시 순번)
ORDER_DATE					DATE 		  - 주문날짜
ORDER_STATUS				NUMBER(7)	  - 주문상태 ( 1: 입금전 2:입금후(배송준비중) 3:배송중 4:취소 5:교환 6:반품 7:환불 8:배송완료 9:구매확정(리뷰작성o) 10:구매확정(리뷰작성x))
PAY_NO						NUMBER(4) 	  - 결제번호
PAY_DATE					DATE		  - 결제날짜
RECIPIENT					VARCHAR2(20)  - 수령인
DE_ZIPCODE					VARCHAR2(20)  - 배송지 우편번호
DE_ADDRESS1					VARCHAR2(200) - 배송지 기본주소
DE_MESSAGE					VARCHAR2(200) - 배송지 상세주소
RE_PHONE					VARCHAR2(20)  - 수령인 전화번호
*/

public class ShopOrderDTO {
	private int orderNo;
	private String Id;
	private int productNo;
	private String orderSeq;
	private String orderdate;
	private int orderStatus;
	private int payNo;
	private String payDate;
	private String recipient;
	private String deZipcode;
	private String deAddress1;
	private String deAddress2;
	private String deMessage;
	private String rePhone;

	
	public ShopOrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getOrderSeq() {
		return orderSeq;
	}

	public void setOrderSeq(String orderSeq) {
		this.orderSeq = orderSeq;
	}

	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}


	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getDeZipcode() {
		return deZipcode;
	}

	public void setDeZipcode(String deZipcode) {
		this.deZipcode = deZipcode;
	}

	public String getDeAddress1() {
		return deAddress1;
	}

	public void setDeAddress1(String deAddress1) {
		this.deAddress1 = deAddress1;
	}

	public String getDeAddress2() {
		return deAddress2;
	}

	public void setDeAddress2(String deAddress2) {
		this.deAddress2 = deAddress2;
	}

	public String getDeMessage() {
		return deMessage;
	}

	public void setDeMessage(String deMessage) {
		this.deMessage = deMessage;
	}

	public String getRePhone() {
		return rePhone;
	}

	public void setRePhone(String rePhone) {
		this.rePhone = rePhone;
	}

}
