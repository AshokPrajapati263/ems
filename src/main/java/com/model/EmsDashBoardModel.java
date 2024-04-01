package com.model;

import java.util.List;

public class EmsDashBoardModel {
	private int empId; 
	private String empName; 
	private String empDob; 
	private char empGender; 
	private String empAddress; 
	private long empPhoneNumber; 
	private double empSalary; 
	private String empJoinDate; 
	private int empHours; 
	private String empDepName;
	private String Skills;
	private List<EmsDashBoardModel> empList;
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpDob() {
		return empDob;
	}
	public void setEmpDob(String empDob) {
		this.empDob = empDob;
	}
	public char getEmpGender() {
		return empGender;
	}
	public void setEmpGender(char empGender) {
		this.empGender = empGender;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	public long getEmpPhoneNumber() {
		return empPhoneNumber;
	}
	public void setEmpPhoneNumber(long empPhoneNumber) {
		this.empPhoneNumber = empPhoneNumber;
	}
	public double getEmpSalary() {
		return empSalary;
	}
	public void setEmpSalary(double empSalary) {
		this.empSalary = empSalary;
	}
	public String getEmpJoinDate() {
		return empJoinDate;
	}
	public void setEmpJoinDate(String empJoinDate) {
		this.empJoinDate = empJoinDate;
	}
	public int getEmpHours() {
		return empHours;
	}
	public void setEmpHours(int empHours) {
		this.empHours = empHours;
	}
	public String getEmpDepName() {
		return empDepName;
	}
	public void setEmpDepName(String empDepName) {
		this.empDepName = empDepName;
	}
	public String getSkills() {
		return Skills;
	}
	public void setSkills(String skills) {
		Skills = skills;
	}
	public List<EmsDashBoardModel> getEmpList() {
		return empList;
	}
	public void setEmpList(List<EmsDashBoardModel> empList) {
		this.empList = empList;
	}
}
