<%@page import="com.model.SkillsModel"%>
<%@page import="com.model.DepartmentModel"%>
<%@page import="com.model.EmsCreateModel"%>
<%@ include file="header.jsp"%>
<%
title = "Create";
EmsCreateModel ecm = (EmsCreateModel) request.getAttribute("empCreateModel");
%>
<div class="container clearfix my-5">
	<h1 class="float-start">Create New EMP</h1>
	<a href="emslist" class="btn btn-danger mt-auto float-end">Back</a>
</div>
<form method="post" action="emscreate" class="row g-3 needs-validation" novalidate>
	<div class="col-md-6">
		<label for="EMPName" class="form-label">EMP Name</label> <input
			type="text" name="empname" class="form-control"
			placeholder="John Due" id="EMPName" required>
	</div>
	<div class="col-md-6">
		<label for="Salary" class="form-label">Salary</label> <input
			type="number" name="empsalary" class="form-control"
			placeholder="20000" id="Salary" required>
	</div>
	<div class="col-12">
		<label for="Address" class="form-label">Address</label>
		<textarea class="form-control" name="empaddress" id="Address"
			placeholder="1234 Main St" required></textarea>
	</div>
	<div class="col-md-6">
		<label for="DOB" class="form-label">Date Of Birth</label> <input
			type="date" name="empdob" class="form-control" id="DOB" required>
	</div>
	<div class="col-md-2">
		<label for="Gender" class="form-label">Gender</label> <select
			id="Gender" name="empgender" class="form-select" required>
			<option disabled selected>---Select---</option>
			<option>Male</option>
			<option>Female</option>
			<option>Other</option>
		</select>
	</div>
	<div class="col-md-4">
		<label for="EMPPhoneNO" class="form-label">EMP PhoneNO</label> <input
			type="number" name="empphonenumber" class="form-control" required
			id="EMPPhoneNO">
	</div>
	<div class="col-md-6">
		<label for="JDate" class="form-label">Joining Date</label> <input
			type="datetime-local" name="empjoindate" class="form-control"
			required id="JDate">
	</div>
	<div class="col-md-2">
		<label for="WH" class="form-label">Working Hours</label> <input
			type="number" class="form-control" name="emphours" required id="WH">
	</div>
	<div class="col-md-4">
		<label for="Depid" class="form-label">Department</label> <select
		id="Depid" name="empdepid" required class="form-select">
			<option disabled selected>---Select---</option>
			<%
			for (DepartmentModel e : ecm.getDepartments()) {
			%>
			<option value="<%=e.getDepId()%>"><%=e.getDepName()%></option>
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
					for (SkillsModel s : ecm.getSkills()) {
					%>
					<li class="ps-2"><label for="<%=s.getSkillName()%>"><input
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
			<button type="submit" class="btn btn-primary w-25">Create</button>
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
  
            dropdownButton.innerText = mySelectedItems.length > 0 
                ? mySelectedItems.join(', ') : '---Select---'; 
        } 
  
        dropdownMenu.addEventListener('change', handleCB); 
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
      form.classList.add('was-validated');
    }, false);
  });
})();
</script>
<%@ include file="footer.jsp"%>