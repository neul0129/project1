package site.margaret.dto;

/*
�̸�					��?			����
------------	----------	-----------
ORDER_NO		NOT NULL	NUMBER(4) 	  - �ֹ���ȣ(PK)
ID							VARCHAR2(20)  - ȸ�����̵�
PRODUCT_NO					NUMBER(4)     - ��ǰ��ȣ 
ORDER_SEQ					VARCHAR2(20)  - �ֹ����� (���ϻ�ǰ �����ֹ� �� ����)
ORDER_DATE					DATE 		  - �ֹ���¥
ORDER_PRICE					NUMBER(8) 	  - �ֹ��ݾ�
ORDER_STATUS				NUMBER(7)	  - �ֹ����� (1: �Ա��� 2:�Ա���(����غ���) 3:����� 4:��� 5:��ȯ 6:��ǰ 7:ȯ�� 8:��ۿϷ�
PAY_NO						NUMBER(4) 	  - ������ȣ
PAY_DATE					DATE		  - ������¥
RECIPIENT					VARCHAR2(20)  - ������
DE_ZIPCODE					VARCHAR2(20)  - ����� �����ȣ
DE_ADDRESS1					VARCHAR2(200) - ����� �⺻�ּ�
DE_MESSAGE					VARCHAR2(200) - ����� ���ּ�
RE_PHONE					VARCHAR2(20)  - ������ ��ȭ��ȣ
*/
/*
�̸�					��?			����
------------	----------	-----------
PRODUCT_NO		NOT NULL	NUMBER(4) 	  - ��ǰ��ȣ(PK)
PRODUCT_NAME				VARCHAR2(50)  - ��ǰ��
CATEGORY					VARCHAR2(50)  - ī�װ�
PRODUCT_SIZE				VARCHAR2(20)  - ������ 
MAIN_IMAGE					VARCHAR2(300)  - �����̹���(���ϸ�) 
PRODUCT_DETAIL				VARCHAR2(300) - ������
STOCK						NUMBER(8) 	  - ���
PRODUCT_PRICE				NUMBER(8) 	  - ��ǰ����
ADD_DATE					DATE		  - ��ϳ�¥
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
