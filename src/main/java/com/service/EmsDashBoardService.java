package com.service;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.model.EmsDashBoardModel;

import DBconnection.DatabaseConnectivity;

public class EmsDashBoardService {
	public EmsDashBoardModel getEmpList(){
		DatabaseConnectivity dc = DatabaseConnectivity.getInstance();
		EmsDashBoardModel empListObj = new EmsDashBoardModel();
		List<EmsDashBoardModel> empList = new LinkedList<EmsDashBoardModel>();
		try {
			CallableStatement cstmt = dc.openCallConnection("{CALL GetAllEmployeesWithSkills()}");
			ResultSet rs = dc.fatchCallData(cstmt);
			while (rs.next()) {
				EmsDashBoardModel eTemp = new EmsDashBoardModel(); 
				eTemp.setEmpId(rs.getInt("empid"));
				eTemp.setEmpName(rs.getString("empname"));
				eTemp.setEmpDob(rs.getString("empdob"));
				eTemp.setEmpGender(rs.getString("empgender").charAt(0));
				eTemp.setEmpAddress(rs.getString("empaddress"));
				eTemp.setEmpPhoneNumber(rs.getLong("empphonenumber"));
				eTemp.setEmpSalary(rs.getDouble("empsalary"));
				eTemp.setEmpJoinDate(rs.getString("empjoindate"));
				eTemp.setEmpHours(rs.getInt("emphours"));
				eTemp.setEmpDepName(rs.getString("empdepname"));  
				eTemp.setSkills(rs.getString("skills"));
				empList.add(eTemp);
            }
			empListObj.setEmpList(empList);
			dc.closeConnection();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return empListObj;
	} 
}
