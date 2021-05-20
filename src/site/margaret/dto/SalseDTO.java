package site.margaret.dto;
/*
이름                    널?       유형         
--------------------- -------- ---------- 
SALES_DATE            NOT NULL DATE       - 날짜
ORDER_COUNT                    NUMBER(10) - 당일총주문수
ORDER_SALES_TOTAL              NUMBER(10) - 당일총상품금액
DELIVERY_CHARGE_TOTAL          NUMBER(10) - 당일총배송비
SALES_TOTAL                    NUMBER(10) - 당일결제합계(상품금액+배송비)
REFUND_TOTAL                   NUMBER(10) - 당일환불합계
NET_SALES_TOTAL                NUMBER(10) - 순매출(결제합계 - 환불합계)
 */
public class SalseDTO {
	private String salesDate;
	private int orderCount;
	private int orderSalesTotal;
	private int deliveryChargeTotal;
	private int salesTotal;
	private int refundTotal;
	private int netSalesTotal;
	
	public SalseDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getSalesDate() {
		return salesDate;
	}

	public void setSalesDate(String salesDate) {
		this.salesDate = salesDate;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getOrderSalesTotal() {
		return orderSalesTotal;
	}

	public void setOrderSalesTotal(int orderSalesTotal) {
		this.orderSalesTotal = orderSalesTotal;
	}

	public int getDeliveryChargeTotal() {
		return deliveryChargeTotal;
	}

	public void setDeliveryChargeTotal(int deliveryChargeTotal) {
		this.deliveryChargeTotal = deliveryChargeTotal;
	}

	public int getSalesTotal() {
		return salesTotal;
	}

	public void setSalesTotal(int salesTotal) {
		this.salesTotal = salesTotal;
	}

	public int getRefundTotal() {
		return refundTotal;
	}

	public void setRefundTotal(int refundTotal) {
		this.refundTotal = refundTotal;
	}

	public int getNetSalesTotal() {
		return netSalesTotal;
	}

	public void setNetSalesTotal(int netSalesTotal) {
		this.netSalesTotal = netSalesTotal;
	}
	
}
