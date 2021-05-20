package site.margaret.dto;
/*
�̸�                    ��?       ����         
--------------------- -------- ---------- 
SALES_DATE            NOT NULL DATE       - ��¥
ORDER_COUNT                    NUMBER(10) - �������ֹ���
ORDER_SALES_TOTAL              NUMBER(10) - �����ѻ�ǰ�ݾ�
DELIVERY_CHARGE_TOTAL          NUMBER(10) - �����ѹ�ۺ�
SALES_TOTAL                    NUMBER(10) - ���ϰ����հ�(��ǰ�ݾ�+��ۺ�)
REFUND_TOTAL                   NUMBER(10) - ����ȯ���հ�
NET_SALES_TOTAL                NUMBER(10) - ������(�����հ� - ȯ���հ�)
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
