package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditEquipe
 */

@WebServlet(value = "/dashBoard/employe/editEquipe" , name="/dashBoard/employe/editEquipe")
public class EditEquipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEquipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.greenIt.Model.Equipe equipe = com.greenIt.Service.Equipe.getEquipeById(Integer.valueOf( request.getParameter("code_equipe") ) , request.getSession(false) ) ;
		request.setAttribute("editEquipe", equipe);
		request.getRequestDispatcher("/view/dashBoard/equipe/EditEquipe.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.greenIt.Service.Equipe equipe = new com.greenIt.Service.Equipe() ;
		
		equipe.update(
				Integer.valueOf( request.getParameter("code_equipe").trim() )
				,request.getParameter("description_equipe").trim()
				, request.getParameter("nom_equipe").trim()
				, request.getSession()

				) ; 
		request.getRequestDispatcher("/dashBoard/employe/equipe").forward(request, response);
	}

}
