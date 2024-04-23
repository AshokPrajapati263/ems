<%@page import="com.model.EmsDashBoardModel"%>
<%@ include file="header.jsp"%>
<%
	title = "Home";
	EmsDashBoardModel edm = (EmsDashBoardModel) request.getAttribute("empListModel");
	String message = request.getParameter("message");
	if (message != null) {
	%>
	<script type="text/javascript">
		successFun("<%=message%>");
	</script>
<%
	message=null;
	}%>
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
	</tr>
	<%
	}
	%>
	</tbody>
</table>
<%@ include file="footer.jsp"%>