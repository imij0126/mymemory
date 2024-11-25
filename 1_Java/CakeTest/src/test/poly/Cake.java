package test.poly;

public class Cake {
	public int size = 1;
	public void yummy() {
		System.out.println("Yummy Cake");	// 1
	}
	
	public class CheeseCake extends Cake {
		public int size = 5;
		public void yummy() {
			System.out.println("Yummy Cheese Cake");	// 2
		}
	}
	
	public class CakeRun {
		
		Cake c1 = new CheeseCake();
		CheeseCake c2 = new CheeseCake();
		
		c1.yummy();		// 동적바인딩
		c2.yummy();		// 2?
	
		system.out.println(c1.size);
		
	}
	
}
