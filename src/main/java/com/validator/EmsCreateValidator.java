package com.validator;

import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import com.model.EmsCreateModel;

public class EmsCreateValidator {
	public EmsCreateModel createFillData(HttpServletRequest request) {
		EmsCreateModel ecm = new EmsCreateModel();
		ecm.setEmpName(request.getParameter("empname"));
		ecm.setEmpDob(request.getParameter("empdob"));
		ecm.setEmpGender(request.getParameter("empgender"));
		ecm.setEmpAddress(request.getParameter("empaddress"));
		ecm.setEmpPhoneNumber(Long.parseLong(request.getParameter("empphonenumber")));
		ecm.setEmpSalary(Double.parseDouble(request.getParameter("empsalary")));
		ecm.setEmpJoinDate(request.getParameter("empjoindate"));
		ecm.setEmpHours(Integer.parseInt(request.getParameter("emphours")));
		ecm.setDepId(Integer.parseInt(request.getParameter("empdepid")));
		String skills[] = request.getParameterValues("skillsid");
		int[] intSkills = Stream.of(skills)
                .mapToInt(Integer::parseInt).toArray(); 
		ecm.setSkillId(intSkills);
		return ecm;
	}
}
