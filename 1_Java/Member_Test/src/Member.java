
public class Member {
	
	private String grade;
	private double discountRate;
	private String name;
	private String phone;
	private String address;
	
	public Member() {
		
	}
	
	public Member(String grade, double discountRate, String name, String phone, String address) {
		this.grade = grade;
		this.discountRate = discountRate;
		this.name = name;
		this.phone = phone;
		this.address = address;
	}
	
	public String toString() {
		return "등급 : " + grade + ", 할인율 : " + discountRate + "이름 : " + name + ", 연락처 : " + phone + ", 주소 : " + address;
	}

}
