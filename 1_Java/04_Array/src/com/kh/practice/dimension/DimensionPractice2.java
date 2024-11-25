package com.kh.practice.dimension;

public class DimensionPractice2 {

	public void practice1() {
		
		String[][] arr = new String[3][3];
		
		for (int i=0; i<arr.length; i++) {
			for (int j=0; j<arr[i].length; j++) {
				arr[i][j] = "(" + i + ", " + j + ")";
			}
		}
		
		for (int i=0; i<arr.length; i++) {
			for (int j=0; j<arr[i].length; j++) {
				System.out.print(arr[i][j] + " ");
			}
			System.out.println();
		}
		
	}
//	======================================
	public void practice2() {
		
		int[][] arr = new int[4][4];
		
		// 1~16까지 값을 대입
		int value = 1;
		for (int i=0; i<arr.length; i++) {
			for (int j=0; j<arr[i].length; j++) {
				arr[i][j] = value++;
			}
		}
		
		for (int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				System.out.printf("%-3d", arr[i][j]);
			}
			System.out.println();
		}
		
	}
	
}
