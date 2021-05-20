package site.margaret.dto;

/*
이름					널?			유형
------------	----------	-----------
ORDER_NO		NOT NULL	NUMBER(4) 	  - 주문번호(PK)
ID							VARCHAR2(20)  - 회원아이디
PRODUCT_NO					NUMBER(4)     - 제품번호 
ORDER_SEQ					VARCHAR2(20)  - 주문순번 (동일상품 동시주문 시 순번)
ORDER_DATE					DATE 		  - 주문날짜
ORDER_PRICE					NUMBER(8) 	  - 주문금액
ORDER_STATUS				NUMBER(7)	  - 주문상태 (1: 입금전 2:입금후(배송준비중) 3:배송중 4:취소 5:교환 6:반품 7:환불 8:배송완료
PAY_NO						NUMBER(4) 	  - 결제번호
PAY_DATE					DATE		  - 결제날짜
RECIPIENT					VARCHAR2(20)  - 수령인
DE_ZIPCODE					VARCHAR2(20)  - 배송지 우편번호
DE_ADDRESS1					VARCHAR2(200) - 배송지 기본주소
DE_MESSAGE					VARCHAR2(200) - 배송지 상세주소
RE_PHONE					VARCHAR2(20)  - 수령인 전화번호
*/
/*
이름					널?			유형
------------	----------	-----------
PRODUCT_NO		NOT NULL	NUMBER(4) 	  - 제품번호(PK)
PRODUCT_NAME				VARCHAR2(50)  - 제품명
CATEGORY					VARCHAR2(50)  - 카테고리
PRODUCT_SIZE				VARCHAR2(20)  - 사이즈 
MAIN_IMAGE					VARCHAR2(300)  - 메인이미지(파일명) 
PRODUCT_DETAIL				VARCHAR2(300) - 상세정보
STOCK						NUMBER(8) 	  - 재고
PRODUCT_PRICE				NUMBER(8) 	  - 제품가격
ADD_DATE					DATE		  - 등록날짜
*/

public class shopOrderJoinDTO {
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
	private String productName;
	private String category;
	private String productSize;
	private String mainImage;
	private String productDetail;
	private int stock;
	private int productPrice;
	private String addDate;
	
	public shopOrderJoinDTO() {
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

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}
	
	
}
