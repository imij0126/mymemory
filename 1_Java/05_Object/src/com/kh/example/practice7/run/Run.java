package com.kh.example.practice7.run;

import com.kh.example.practice7.model.vo.Employee;

public class Run {

	public static void main(String[] args) {

		Employee e1 = new Employee();
		
		e1.setEmpNo(100);
		e1.setEmpName("홍길동");
		e1.setDept("영업부");
		e1.setJob("과장");
		e1.setAge(25);
		e1.setGender('남');
		e1.setSalary(2500000);
		e1.setBonusPoint(0.05);
		e1.setPhone("010-1234-5678");
		e1.setAddress("서울시 강남구");
		
		
		System.out.printf("[%d] %s | %s | %s | %d\n"
							,e1.getEmpNo()
							, e1.getEmpName()
							, e1.getDept()
							, e1.getJob()
							, e1.getAge());
		
		
		
	}

}
