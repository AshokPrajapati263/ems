<%@page import="com.model.EmsDashBoardModel"%>
<%@ include file="header.jsp"%>
<%
	title = "Home";
	EmsDashBoardModel edm = (EmsDashBoardModel) request.getAttribute("empListModel");
%>
	
	<div class="container clearfix my-5">
		  <h1 class="float-start">EMP LIST</h1>
		  <a href="emscreate" class="btn btn-primary float-end">ADD NEW</a>
	</div>
<table id="example" class="table table-striped display" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Gender</th>
		<th>DOB</th>
		<th>Department</th>
		<th>Salary</th>
		<th>Skills</th>
		<th>Hours</th>
		<th>JoinDate</th>
		<th>PhoneNumber</th>
		<th>Address</th>
		<th>Action</th>
	</tr>
	</thead>
	<tbody>
	<%
	for (EmsDashBoardModel employee : edm.getEmpList()) {
	%>
	<tr>
		<td><%=employee.getEmpId()%></td>
		<td><%=employee.getEmpName()%></td>
		<td><%=employee.getEmpGender()%></td>
		<td><%=employee.getEmpDob()%></td>
		<td><%=employee.getEmpDepName()%></td>
		<td><%=employee.getEmpSalary()%></td>
		<td><%=employee.getSkills()%></td>
		<td><%=employee.getEmpHours()%></td>
		<td><%=employee.getEmpJoinDate()%></td>
		<td><%=employee.getEmpPhoneNumber()%></td>
		<td><%=employee.getEmpAddress()%></td>
		<td width="12%"><a class="btn btn-warning me-2" href="emsedit?id=<%=employee.getEmpId()%>">Edit</a><button class="btn btn-danger" onclick="deleteCall(<%=employee.getEmpId()%>)">Delete</button></td>
	</tr>
	<%
	}
	%>
	</tbody>
</table>
<%@ include file="footer.jsp"%>