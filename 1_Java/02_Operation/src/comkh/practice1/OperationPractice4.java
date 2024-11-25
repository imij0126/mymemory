package comkh.practice1;

public class OperationPractice4 {
	public static void main(String[] args) {
		int iNum1 = 10;
		int iNum2 = 4;
	
		float fNum = 3.0f;
		
		double dNum = 2.5;
	
		char ch = 'A'; //65
		
		System.out.println( iNum1 / iNum2 ); //2 => 10 / 4
		System.out.println( (int)dNum ); // 2 -> 강제형변환, (int)2.5
		
		System.out.println( iNum2 * dNum ); // 10.0 => 4 * 2.5
											// 4.0 * 2.5 => 10.0
		System.out.println( (double)iNum1 ); // 10.0
		
		System.out.println( (double)iNum1 / iNum2 ); // 2.5
		System.out.println( dNum ); // 2.5
		
		System.out.println( (int)fNum ); // 3
		System.out.println( iNum1 / (int)fNum ); // 3 => 10 3.0f
//		System.out.println( (int)(iNum1 / fNum );
		
		System.out.println( iNum1 / fNum );// 3.3333333
		System.out.println((double)iNum1 / fNum); // 3.3333333333333335
		
		System.out.println(ch); // 'A'
		
		System.out.println((int)ch); // 65
		
		System.out.println((int)ch + iNum1); // 75
		
		System.out.println((char)(ch + iNum1)); // 'K'
		

	}
}
