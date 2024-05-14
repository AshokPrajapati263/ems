package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.EmsEditModel;
import com.service.EmsEditService;
import com.validator.EmsEditValidator;

@WebServlet("/EmsEdit")
public class EmsEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmsEditService ees = new EmsEditService();
		EmsEditModel eem =  ees.getEmp(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("empEditModel", eem);
		RequestDispatcher rd = request.getRequestDispatcher("emsDashBoard/edit.jsp");
	    rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmsEditValidator eev = new EmsEditValidator();
		EmsEditModel eem = eev.updateFillData(request);
		EmsEditService ees = new EmsEditService();
		if(ees.updateData(eem,Integer.parseInt(request.getParameter("id"))))
		{
			response.sendRedirect("emslist?message=Emp Updated Successfully.&type=success");
		}
		else
		{
			response.sendRedirect("emslist?message=Something went wrong.&type=error");
		}
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmsEditService ees = new EmsEditService();
		if(ees.deleteData(Integer.parseInt(request.getParameter("id"))))
		{
			String successUrl = "emslist?message=Emp Deleted Successfully.&type=success";
		    response.setContentType("text/plain");
		    response.getWriter().write(successUrl);
		}
		else
		{
			String errorUrl = "emslist?message=Something went wrong.&type=error";
		    response.setContentType("text/plain");
		    response.getWriter().write(errorUrl);
		}
	}
}
