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
<h1 class="text-center my-5">EMP LIST</h1>
<div class="table-responsive">
<table class="table table-bordered table-hover" >
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
</table>
</div>
<%@ include file="footer.jsp"%>