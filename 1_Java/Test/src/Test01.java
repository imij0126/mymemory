import java.util.Scanner;

public class Test01 {
	
	 public static void main(String[] args) {
		 Scanner sc = new Scanner(System.in);
	        // Print the URL in the console
		 System.out.print("노래 제목을 입력하세요 : ");
		 String title = sc.nextLine();
	        
	        // Manually open the URL in the default browser (not from Eclipse console)
	        try {
	            java.awt.Desktop.getDesktop().browse(new java.net.URI("https://www.youtube.com/results?search_query=" + title));
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
