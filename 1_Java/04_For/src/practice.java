
public class practice {

	
	public static void main(String[] args) {
		
		int dan = 2;
		
		for(int i = 2; i <= 9; i++) {
			System.out.println(dan + "X" + i + " = " + dan*i);
				for(dan = 1; dan <=9; dan++) {
					System.out.println(dan + "X" + i + "=" + dan*i);
				}
		}
	}
}
