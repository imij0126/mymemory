
public class test {
	public static void main(String[] args) {
		
	
	class Cake {
		public void yummy() {...}
		}
		class CheeseCake extends Cake {
		public void yummy() {...} // Cake의 yummy를 오버라이딩
		}
		Class StrawberryCheeseCake extends CheeseCake {
		public void yummy() {...} // 그리고 CheeseCake의 yummy를 오버라이딩
		}
		public static void main(String[] args) {
		Cake c1 = new StrawberryCheeseCake();
		CheeseCake c2 = new StrawberryCheeseCake();
		StrawberryCheeseCake c3 = new StrawberryCheeseCake();
		c1.yummy();
		c2.yummy();
		}

	}
	
}
