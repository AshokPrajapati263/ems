package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.EmsDashBoardModel;
import com.service.EmsDashBoardService;

@WebServlet("/EmsDashBoard")
public class EmsDashBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public EmsDashBoard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmsDashBoardService eds = new EmsDashBoardService();
		EmsDashBoardModel edm =  eds.getEmpList();
		request.setAttribute("empListModel", edm);
		RequestDispatcher rd = request.getRequestDispatcher("emsDashBoard/emsList.jsp?message=Employee+list+fetched+successfully");
	    rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
