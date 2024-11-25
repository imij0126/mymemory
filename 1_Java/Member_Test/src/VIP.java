
public class VIP extends Member {

	public VIP() {}	
	
	public VIP(String grade, double discountRate, String name, String phone, String address) {
		super(grade, discountRate, name, phone, address);
	}
	
	public String toString() {
		return super.toString();
	}
}
