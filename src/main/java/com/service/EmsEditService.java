package com.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.model.DepartmentModel;
import com.model.EmsEditModel;
import com.model.SkillsModel;

import DBconnection.DatabaseConnectivity;

public class EmsEditService {
	public EmsEditModel getEmp(){
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
			dc.closeConnection();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return empEdit;
	} 
}
