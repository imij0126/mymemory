package com.kh.practice;

import javax.swing.Box;

class DataClass03<L, R> {
	private L left;
	private R right;
	
	public L getLeft() {
		return left;
	}
	
	public void setLeft(L left) {
		this.left = left;
	}
	
	public R getRight() {
		return right;
	}
	
	public void setRight(R right) {
		this.right = right;
	}
}

public class MultiGenericRun {

	public static void main(String[] args) {
		DataClass03<String, Integer> d1 = new DataClass03<>();
		
		d1.setLeft("안녕!");
		d1.setRight(1000);
		String left = d1.getLeft();
		int right = d1.getRight();
		
		DataClass03<Double, Boolean> d2 = new DataClass03<>();
		d2.setLeft(111.22);
		d2.setRight(false);
		
}
}
