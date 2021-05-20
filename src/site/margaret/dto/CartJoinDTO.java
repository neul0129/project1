package site.margaret.dto;
/*
이름            널?       유형           
------------- -------- ------------ 
CART_NO       NOT NULL NUMBER       //장바구니 번호 (PK)
PRODUCT_NO              NUMBER     //상품 번호 (FK-PRODUCT(PRODUCT_NO))
ID                     VARCHAR2(20) //아이디 (FK-MEMBER(ID))
CART_QUANTITY          NUMBER 		//장바구니 수량
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
public class CartJoinDTO {
	private int productNo;
	private String productName;
	private String category;
	private String productSize;
	private String mainImage;
	private String productDetail;
	private int stock;
	private int productPrice;
	private String addDate;
	private int cartNo;
	private String id;
	private int cartQuantity;
	
	public CartJoinDTO() {
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

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	
	
}
