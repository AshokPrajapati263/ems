
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
	String title = null;
%>

<title>EMS<%=title!=null?" - "+title:""%></title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.datatables.net/2.0.3/css/dataTables.bootstrap5.css">
<link href="https://cdn.datatables.net/responsive/3.0.1/css/responsive.bootstrap5.css">
<script>
	const successFun = (mess) => {
		Swal.fire({
			  title: "Success",
			  text: mess,
			  icon: "success"
		}).then(function() {
			var originalURL = document.location.href;
			var alteredURL = removeParam("message", originalURL);
			window.location.href = alteredURL;
		});
	}
	const errorFun = (mess) => {
		Swal.fire({
			  title: "Error",
			  text: mess,
			  icon: "error"
		}).then(function() {
			var originalURL = document.location.href;
			var alteredURL = removeParam("message", originalURL);
			window.location.href = alteredURL;
		});
	}
</script>
<style>
	textarea {
    	resize: none;
	}
</style>
</head>
<body>
<div class="container">