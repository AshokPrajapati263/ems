package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.model.DepartmentModel;
import com.model.EmsCreateModel;
import com.model.SkillsModel;

import DBconnection.DatabaseConnectivity;

public class EmsCreateService {
	
	public EmsCreateModel getDepartmentsAndSkills(){
		DatabaseConnectivity dc = DatabaseConnectivity.getInstance();
		EmsCreateModel empCreate = new EmsCreateModel();
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
			empCreate.setDepartments(empDep);
			ResultSet rs2 = dc.fatchData("select * from skills");
			while (rs2.next()) {
				SkillsModel sTemp = new SkillsModel(); 
				sTemp.setSkillId(rs2.getInt("skillid"));
				sTemp.setSkillName(rs2.getString("skillname"));
				empSkills.add(sTemp);
            }
			empCreate.setSkills(empSkills);
			dc.closeConnection();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return empCreate;
	} 
	public boolean createData(EmsCreateModel ecm)
	{
		DatabaseConnectivity dc = DatabaseConnectivity.getInstance();
		try {
			String str = "INSERT INTO emp (empname, empdob, empgender, empaddress, empphonenumber, empsalary, empjoindate, emphours, empdepid) VALUES "
					+ "('"+ecm.getEmpName()+"', '"+ecm.getEmpDob()+"', '"+ecm.getEmpGender()+"', '"+ecm.getEmpAddress()+"', "+ecm.getEmpPhoneNumber()+", "+ecm.getEmpSalary()+", '"+ecm.getEmpJoinDate()+"', "+ecm.getEmpHours()+", "+ecm.getDepId()+")";
			dc.openConnection();
			ecm.setEmpId(dc.excuteDataWithId(str));
			for (int sid : ecm.getSkillId()) {
				String str2 = "INSERT INTO empskills (empid,skillid) VALUES"+
							"("+ecm.getEmpId()+","+sid+")";
				dc.excuteData(str2);
			}

			dc.closeConnection();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
