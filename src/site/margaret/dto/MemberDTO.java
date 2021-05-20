package site.margaret.dto;

/*
이름         널?       유형            
---------- -------- ------------- 

ID         NOT NULL VARCHAR2(20)  
PASSWD              VARCHAR2(200) 
NAME                VARCHAR2(20)  
EMAIL               VARCHAR2(30)  
ZIPCODE             VARCHAR2(10)  
ADDRESS1            VARCHAR2(200) 
ADDRESS2            VARCHAR2(200) 
PHONE               VARCHAR2(20)  
JOIN_DATE           DATE          
LAST_LOGIN          DATE          
STATUS              NUMBER(1) 회원상태 : 1(일반회원), 9(관리자), 4(휴먼계정,탈퇴)

*/


public class MemberDTO {
	private String id;
	private String passwd;
	private String name;
	private String email;
	private String zipcode;
	private String address1;
	private String address2;
	private String phone;
	private String joindate;
	private String lastLogin;
	private int status;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String join_date) {
		this.joindate = join_date;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	
		
	}
	
}