package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greenIt.Model.Employe;
import com.greenIt.Service.Tache;

/**
 * Servlet implementation class DeleteEmploye
 */

@WebServlet(value = "/dashBoard/employe/deleteEmploye" , name="dashBoard/employe/deleteEmploye")
public class DeleteEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmploye() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		com.greenIt.Service.Employe.delete(Integer.valueOf( request.getParameter("id_empl") ) , request.getSession() ) ;
		 response.sendRedirect(request.getContextPath()+"/dashBoard/employe");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
