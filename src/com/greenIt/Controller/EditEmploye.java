package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.greenIt.Model.Employe;
import com.greenIt.Model.Project;

/**
 * Servlet implementation class EditEmploye
 */

@WebServlet(value = "/dashBoard/employe/editEmploye" , name="dashBoard/employe/editEmploye")
public class EditEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEmploye() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.greenIt.Model.Employe employe = com.greenIt.Service.Employe.getEmployeById(Integer.valueOf( request.getParameter("id_empl") ) , request.getSession(false) ) ;
		request.setAttribute("editEmploye", employe);
		request.getRequestDispatcher("/view/dashBoard/employe/EditEmploye.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.greenIt.Service.Employe employe = new com.greenIt.Service.Employe() ;
				
		employe.update(
				Integer.valueOf( request.getParameter("id_empl").trim() )
				,request.getParameter("date_naissance_empl").trim()
				, request.getParameter("email_empl").trim()
				, request.getParameter("nom_empl").trim()
				, request.getParameter("prenom_empl").trim()
				, request.getParameter("role_empl").trim()
				,Integer.valueOf( request.getParameter("code_equipe").trim() )
				, request.getSession()

				) ; 
		request.getRequestDispatcher("/dashBoard/employe").forward(request, response);
	}

}
