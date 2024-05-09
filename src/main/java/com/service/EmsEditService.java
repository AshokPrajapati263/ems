package com.service;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Stream;

import com.model.DepartmentModel;
import com.model.EmsDashBoardModel;
import com.model.EmsEditModel;
import com.model.SkillsModel;

import DBconnection.DatabaseConnectivity;

public class EmsEditService {
	public EmsEditModel getEmp(int id){
		DatabaseConnectivity dc = DatabaseConnectivity.getInstance();
		EmsEditModel empEdit = new EmsEditModel();
		List<DepartmentModel> empDep = new LinkedList<DepartmentModel>();
		List<SkillsModel> empSkills = new LinkedList<SkillsModel>();
		try {
			dc.openConnection();
			ResultSet rs = dc.fatchData("select * from dep");
			while (rs.next()) {
				DepartmentModel dTemp = new DepartmentModel(); 
				dTemp.setDepId(rs.getInt("depid"));
				dTemp.setDepName(rs.getString("depname"));
				empDep.add(dTemp);
            }
			empEdit.setDepartments(empDep);
			ResultSet rs2 = dc.fatchData("select * from skills");
			while (rs2.next()) {
				SkillsModel sTemp = new SkillsModel(); 
				sTemp.setSkillId(rs2.getInt("skillid"));
				sTemp.setSkillName(rs2.getString("skillname"));
				empSkills.add(sTemp);
            }
			empEdit.setSkills(empSkills);
			CallableStatement cstmt = dc.openCallConnection("{CALL GetEmployeeDetails("+id+")}");
			ResultSet rs3 = dc.fatchCallData(cstmt);
			while (rs3.next()) {
				empEdit.setEmpId(rs3.getInt("empid"));
				empEdit.setEmpName(rs3.getString("empname"));
				empEdit.setEmpDob(rs3.getString("empdob"));
				empEdit.setEmpGender(rs3.getString("empgender"));
				empEdit.setEmpAddress(rs3.getString("empaddress"));
				empEdit.setEmpPhoneNumber(rs3.getLong("empphonenumber"));
				empEdit.setEmpSalary(rs3.getDouble("empsalary"));
				empEdit.setEmpJoinDate(rs3.getString("empjoindate"));
				empEdit.setEmpHours(rs3.getInt("emphours"));
				empEdit.setDepId(rs3.getInt("empdepid"));  
				String[] strarray = rs3.getString("skills").split(",");
				int[] intSkills = Stream.of(strarray)
				  .map(s -> s.trim())
				  .filter(s -> {
				    try {
				      Integer.parseInt(s);
				      return true;
				    } catch (NumberFormatException e) {
				      return false;
				    }
				  })
				  .mapToInt(Integer::parseInt)
				  .toArray(); 
				empEdit.setSkillId(intSkills);
            }
			dc.closeConnection();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return empEdit;
	} 
}
