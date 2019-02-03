package com.greenIt.Controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greenIt.Model.Equipe;

/**
 * Servlet implementation class CreateEmploye
 */

@WebServlet(value = "/dashBoard/employe/createEmploye" , name="dashBoard/employe/createEmploye")
public class CreateEmploye extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateEmploye() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/view/dashBoard/employe/createEmploye.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-mm-dd").parse( request.getParameter("date_naissance_empl").trim() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		com.greenIt.Model.Employe employe = new com.greenIt.Model.Employe(
				request.getParameter("nom_empl").trim() ,
				request.getParameter("prenom_empl").trim() ,
				request.getParameter("role_empl").trim() ,
				request.getParameter("mot_passe_empl").trim() ,
				request.getParameter("email_empl").trim() ,
				date 

				) ;
		Equipe equipe = com.greenIt.Dao.Equipe.getEquipeById( Integer.valueOf( request.getParameter("code_equipe").trim() ) ) ; 
		
		employe.setEquipe(equipe);
		if( new com.greenIt.Service.Employe().create(employe,request.getSession()) ) {
			request.getRequestDispatcher("/dashBoard/employe").forward(request, response);
		}else {
			doGet(request, response);
		}
	}

}
