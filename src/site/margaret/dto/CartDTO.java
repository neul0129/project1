package site.margaret.dto;

/*
 이름            널?       유형           
------------- -------- ------------ 
CART_NO       NOT NULL NUMBER       //장바구니 번호 (PK)
PRODUCT_NO              NUMBER     //상품 번호 (FK-PRODUCT(PRODUCT_NO))
ID                     VARCHAR2(20) //아이디 (FK-MEMBER(ID))
CART_QUANTITY          NUMBER 		//장바구니 수량
 */
public class CartDTO {
	private int cartNo, productNo;
	private String id;
	private int cartQuantity;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
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
