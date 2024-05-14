<%@page import="java.util.Arrays"%>
<%@page import="com.model.EmsEditModel"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="com.model.SkillsModel"%>
<%@page import="com.model.DepartmentModel"%>
<%@ include file="header.jsp"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.Calendar" %>

<%
title = "Edit";
EmsEditModel eem = (EmsEditModel) request.getAttribute("empEditModel");
%>

<%
    LocalDate currentDate = LocalDate.now();
    LocalDate dateMinus18Years = currentDate.minusYears(18);
    LocalDateTime now = LocalDateTime.now();
    LocalDateTime oneMonthLater = now.plusMonths(1);
    String formattedDate = oneMonthLater.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
%>
<div class="container clearfix my-5">
	<h1 class="float-start">Update EMP</h1>
	<a href="emslist" class="btn btn-danger mt-auto float-end">Back</a>
</div>
<form method="post" action="emsedit" class="row g-3 needs-validation" novalidate>
	<input type="hidden" name="id" value="<%=eem.getEmpId()%>">
	<div class="col-md-6">
		<label for="EMPName" class="form-label">EMP Name</label> <input
			type="text" name="empname" class="form-control"
			placeholder="John Due" id="EMPName" value="<%=eem.getEmpName()%>" required>
	</div>
	<div class="col-md-6">
		<label for="Salary" class="form-label">Salary</label> <input
			value="<%=eem.getEmpSalary()%>" type="number" name="empsalary" class="form-control"
			placeholder="20000" id="Salary" required>
	</div>
	<div class="col-12">
		<label for="Address" class="form-label">Address</label>
		<textarea maxlength="500" class="form-control" name="empaddress" id="Address"
			placeholder="1234 Main St" required><%=eem.getEmpAddress()%></textarea>
		<span class="label" id="count_message"></span>
	</div>
	<div class="col-md-6">
		<label for="DOB" class="form-label">Date Of Birth</label> <input
			type="date" min="1960-01-01" max="<%= dateMinus18Years %>" value="<%=eem.getEmpDob()%>" name="empdob" class="form-control" id="DOB" required>
	</div>
	<div class="col-md-2">
		<label for="Gender" class="form-label">Gender</label> <select
			id="Gender" name="empgender" class="form-select" required>
			<option disabled value="">---Select---</option>
			<option <%=eem.getEmpGender().trim().equals("Male")?"selected='selected'":""%> >Male</option>
			<option <%=eem.getEmpGender().trim().equals("Female")?"selected='selected'":""%> >Female</option>
			<option <%=eem.getEmpGender().trim().equals("Other")?"selected='selected'":""%> >Other</option>
		</select>
	</div>
	<div class="col-md-4">
		<label for="EMPPhoneNO" class="form-label">EMP PhoneNO</label> <input
			type="text" maxlength="10" pattern="^\d{10}$" value="<%=eem.getEmpPhoneNumber()%>" name="empphonenumber" class="form-control" required
			id="EMPPhoneNO">
	</div>
	<div class="col-md-6">
		<label for="JDate" class="form-label">Joining Date</label> <input
			type="datetime-local" min="2000-01-01 00:00:00" value="<%=eem.getEmpJoinDate()%>" max="<%= formattedDate %>" name="empjoindate" class="form-control"
			required id="JDate">
	</div>
	<div class="col-md-2">
		<label for="WH" class="form-label">Working Hours</label> <input
			type="number" min="4" max="12" class="form-control" value="<%=eem.getEmpHours()%>" name="emphours" required id="WH">
	</div>
	<div class="col-md-4">
		<label for="Depid" class="form-label">Department</label> <select
		id="Depid" name="empdepid" required class="form-select">
			<option disabled selected="selected" value="">---Select---</option>
			<%
			for (DepartmentModel e : eem.getDepartments()) {
			%>
			<option <%=e.getDepId()==eem.getDepId()?"selected='selected'":"" %> value="<%=e.getDepId()%>"><%=e.getDepName()%></option>
			<%
			}
			%>
		</select>
	</div>
	<div class="d-md-flex justify-content-between">
		<div class="col-md-4 mb-5">
			<label for="skillsid" class="form-label">Skills</label>
			<div class="dropdown">
				<button class="form-select" type="button" id="skillsid"
					data-bs-toggle="dropdown" aria-expanded="false">---Select---</button>
				<ul class="dropdown-menu w-100" aria-labelledby="skillsid">
					<%
					for (SkillsModel s : eem.getSkills()) {
					%>
					<li class="ps-2"><label for="<%=s.getSkillName()%>"><input
							<%=Arrays.stream(eem.getSkillId()).anyMatch(id -> id == s.getSkillId())?"checked":""%>
							name="skillsid" id="<%=s.getSkillName()%>" type="checkbox"
							value="<%=s.getSkillId()%>"> <%=s.getSkillName()%></label></li>
							
					<%
					}
					%>
				</ul>
			</div>
		</div>
		<div
			class="col-md-6 mb-5 d-md-flex align-self-end justify-content-end">
			<button type="submit" class="btn btn-primary w-25">Update</button>
		</div>
	</div>
</form>
<script> 
        const dropdownButton = 
              document.getElementById('skillsid'); 
        const dropdownMenu =  
              document.querySelector('.dropdown-menu'); 
        let mySelectedItems = []; 
  
        function handleCB(event) { 
            const checkbox = event.target; 
            if (checkbox.checked) { 
                mySelectedItems.push(checkbox.id); 
            } else { 
                mySelectedItems =  
                  mySelectedItems.filter((item) => item !== checkbox.id); 
            } 
  			if(mySelectedItems.length > 0)
  			{
  				dropdownButton.innerText = mySelectedItems.join(', ');
  				dropdownButton.classList.remove("is-invalid");
  				dropdownButton.classList.add("is-valid");
  			}
  			else
  			{
  				dropdownButton.innerText = '---Select---';
  				dropdownButton.classList.add("is-invalid");
  			}
        } 
        function handleCBNew(checkbox) { 
            if (checkbox.checked) { 
                mySelectedItems.push(checkbox.id); 
            } else { 
                mySelectedItems =  
                  mySelectedItems.filter((item) => item !== checkbox.id); 
            } 
  			if(mySelectedItems.length > 0)
  			{
  				dropdownButton.innerText = mySelectedItems.join(', ');
  			}
  			else
  			{
  				dropdownButton.innerText = '---Select---';
  			}
        } 
  
        dropdownMenu.addEventListener('change', handleCB); 
        
        
        if (document.readyState === 'complete') {
        	  const checkboxes = document.querySelectorAll('.dropdown input[type="checkbox"]');
        	  for (const checkbox of checkboxes) {
        	    handleCBNew(checkbox); 
        	  }
        	} else {
        	  document.addEventListener('DOMContentLoaded', function() {
        	    const checkboxes = document.querySelectorAll('.dropdown input[type="checkbox"]');
        	    for (const checkbox of checkboxes) {
        	      handleCBNew(checkbox);
        	    }
        	  });
        	}
</script>
<script> 
//Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict';

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation');

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms).forEach((form) => {
    form.addEventListener('submit', (event) => {
    	if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
    	if(dropdownButton.innerText=="---Select---")
    	{
    		dropdownButton.classList.add("is-invalid");
    	}
      form.classList.add('was-validated');
    }, false);
  });
})();
</script>
<%@ include file="footer.jsp"%>