package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.EmsCreateModel;
import com.service.EmsCreateService;
import com.validator.EmsCreateValidator;

@WebServlet("/EmsCreate")
public class EmsCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmsCreateService ecs = new EmsCreateService();
		EmsCreateModel ecm =  ecs.getDepartmentsAndSkills();
		request.setAttribute("empCreateModel", ecm);
		RequestDispatcher rd = request.getRequestDispatcher("emsDashBoard/addNew.jsp");
	    rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmsCreateValidator ecv = new EmsCreateValidator();
		EmsCreateModel ecm = ecv.createFillData(request);
		EmsCreateService ecs = new EmsCreateService();
		if(ecs.createData(ecm))
		{
			response.sendRedirect("emslist?message=Emp Created Successfully.&type=success");
		}
		else
		{
			response.sendRedirect("emslist?message=Something went wrong.&type=error");
		}
	}
}
