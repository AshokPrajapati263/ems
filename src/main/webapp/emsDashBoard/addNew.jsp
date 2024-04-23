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
	<a href="emslist" class="btn btn-danger float-end">Back</a>
</div>
<form class="row g-3">
	<div class="col-md-6">
		<label for="EMPName" class="form-label">EMP Name</label> <input
			type="text" class="form-control" placeholder="John Due" id="EMPName">
	</div>
	<div class="col-md-6">
		<label for="Salary" class="form-label">Salary</label> <input
			type="number" class="form-control" placeholder="20000" id="Salary">
	</div>
	<div class="col-12">
		<label for="Address" class="form-label">Address</label>
		<textarea class="form-control" id="Address" placeholder="1234 Main St"></textarea>
	</div>
	<div class="col-md-6">
		<label for="DOB" class="form-label">Date Of Birth</label> <input
			type="date" class="form-control" id="DOB">
	</div>
	<div class="col-md-2">
		<label for="Gender" class="form-label">Gender</label> <select
			id="Gender" class="form-select">
			<option selected>Choose...</option>
			<option>Male</option>
			<option>Female</option>
			<option>Other</option>
		</select>
	</div>
	<div class="col-md-4">
		<label for="EMPPhoneNO" class="form-label">EMP PhoneNO</label> <input
			type="number" class="form-control" id="EMPPhoneNO">
	</div>
	<div class="col-md-6">
		<label for="JDate" class="form-label">Joining Date</label> <input
			type="datetime-local" class="form-control" id="JDate">
	</div>
	<div class="col-md-2">
		<label for="WH" class="form-label">Working Hours</label> <input
			type="number" class="form-control" id="WH">
	</div>
	<div class="col-md-4">
		<label for="Depid" class="form-label">Department</label> <select
			name="depid" id="Depid" class="form-select">
			<option selected>---Select---</option>
			<%
			for (DepartmentModel e : ecm.getDepartments()) {
			%>
			<option value="<%=e.getDepId()%>"><%=e.getDepName()%></option>
			<%
			}
			%>
		</select>
	</div>
	<div class="col-md-4 mb-3">
		<label for="skillsid" class="form-label">Skills</label>
		<div class="dropdown">
			<button class="form-select" type="button" name="skillsid"
				id="skillsid" data-bs-toggle="dropdown" aria-expanded="false">---Select---</button>
			<ul class="dropdown-menu w-100" aria-labelledby="skillsid">
				<%
			for (SkillsModel s : ecm.getSkills()) {
			%>
				<li class="ps-2"><label><input type="checkbox" name="<%=s.getSkillName()%>" value="<%=s.getSkillId()%>"> <%=s.getSkillName()%></label></li>
			<%
			}
			%>
			</ul>
		</div>
	</div>
	<div class="col-12">
		<button type="submit" class="btn btn-primary w-25">Create</button>
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
                mySelectedItems.push(checkbox.name); 
            } else { 
                mySelectedItems =  
                  mySelectedItems.filter((item) => item !== checkbox.name); 
            } 
  
            dropdownButton.innerText = mySelectedItems.length > 0 
                ? mySelectedItems.join(', ') : '---Select---'; 
        } 
  
        dropdownMenu.addEventListener('change', handleCB); 
</script>
<%@ include file="footer.jsp"%>