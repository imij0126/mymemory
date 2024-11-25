package com.kh.practice;

class Parent<T>{
	T data;
}

class Child1 extends Parent {	// T --> Object
	// Object data;
}

class Child2 extends Parent<String> {	// T --> String
	// String data;
}

class Child3<K> extends Parent<K> {		// T --> K
	// K data;		// 상속받은 타입 파라미터를 Child3 객체가 생성될 때 결정!
}

class Child4<M, N> extends Parent<M> {
	N data2;		// T --> M
	// M data;
}

public class GenericInheritRun {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Chil3 클래스 객체를 생성하여 data 변수에 "안녕하세요"라는 값을 저장
		Child3<String> c3 = new Child3<>();
		c3.data = "안녕하세요";
		
		System.out.println(c3.data);
		
		// Child4 클래스 객체를 생성하여 "이름", 나이(정수) 두 가지 데이터를 저장
		Child4<String, Integer> c4 = new Child4<>();
		c4.data = "카리나";
		c4.data2 = 24;
		System.out.println(c4.data);
		System.out.println(c4.data2);
		
	}

}
