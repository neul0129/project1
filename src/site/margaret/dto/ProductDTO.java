package site.margaret.dto;

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

public class ProductDTO {
	private int productNo;
	private String productName;
	private String category;
	private String productSize;
	private String mainImage;
	private String productDetail;
	private int stock;
	private int productPrice;
	private String addDate;
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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