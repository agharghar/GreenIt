package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.greenIt.Model.Employe;
import com.greenIt.Service.Tache;
import com.sun.xml.internal.org.jvnet.mimepull.DecodingException;

/**
 * Servlet implementation class Project
 */

@WebServlet(value = "/dashBoard/projet/createProjet" , name="dashBoard/projet/createProjet")
public class CreateProjet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProjet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/view/dashBoard/projet/CreateProjet.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		com.greenIt.Model.Project project = new com.greenIt.Model.Project(
				request.getParameter("code_pro").trim(),
				request.getParameter("nom_pro").trim() ,
				request.getParameter("description_pro").trim() ,
				Integer.valueOf(request.getParameter("charge_horaire_pro").trim())
				) ;
		if( new com.greenIt.Service.Project().create(project,request.getSession()) ) {
			request.getRequestDispatcher("/dashBoard").forward(request, response);
		}else {
			doGet(request, response);
		}
		
	}

}
