package site.margaret.dto;

/*
 �̸�            ��?       ����           
------------- -------- ------------ 
CART_NO       NOT NULL NUMBER       //��ٱ��� ��ȣ (PK)
PRODUCT_NO              NUMBER     //��ǰ ��ȣ (FK-PRODUCT(PRODUCT_NO))
ID                     VARCHAR2(20) //���̵� (FK-MEMBER(ID))
CART_QUANTITY          NUMBER 		//��ٱ��� ����
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
