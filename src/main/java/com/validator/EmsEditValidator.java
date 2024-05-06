package com.validator;

import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import com.model.EmsEditModel;

public class EmsEditValidator {
	public EmsEditModel updateFillData(HttpServletRequest request) {
		EmsEditModel eem = new EmsEditModel();
		eem.setEmpName(request.getParameter("empname"));
		eem.setEmpDob(request.getParameter("empdob"));
		eem.setEmpGender(request.getParameter("empgender"));
		eem.setEmpAddress(request.getParameter("empaddress"));
		eem.setEmpPhoneNumber(Long.parseLong(request.getParameter("empphonenumber")));
		eem.setEmpSalary(Double.parseDouble(request.getParameter("empsalary")));
		eem.setEmpJoinDate(request.getParameter("empjoindate"));
		eem.setEmpHours(Integer.parseInt(request.getParameter("emphours")));
		eem.setDepId(Integer.parseInt(request.getParameter("empdepid")));
		String skills[] = request.getParameterValues("skillsid");
		int[] intSkills = Stream.of(skills)
                .mapToInt(Integer::parseInt).toArray(); 
		eem.setSkillId(intSkills);
		return eem;
	}
}
