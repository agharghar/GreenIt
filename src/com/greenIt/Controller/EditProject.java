package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greenIt.Model.Project;
import com.greenIt.Service.Tache;

/**
 * Servlet implementation class EditProject
 */

@WebServlet(value = "/dashBoard/projet/projetEdit" , name="dashBoard/projet/projetEdit")
public class EditProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.greenIt.Service.Project.getProjectById( request.getParameter("code_pro")  , request.getSession(false)) ;
		request.getRequestDispatcher("/view/dashBoard/projet/EditProjet.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		com.greenIt.Service.Project projectUpdate = new com.greenIt.Service.Project() ;
		projectUpdate.update(
				((Project)request.getSession().getAttribute("project")).getCode_pro() 
				,Integer.valueOf(request.getParameter("charge_horaire_pro").trim())
				,request.getParameter("description_pro").trim()
				, request.getParameter("nom_pro").trim()

				,request.getSession()
				) ; 
		request.getRequestDispatcher("/dashBoard").forward(request, response);
		
	}

}
