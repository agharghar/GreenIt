package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateEquipe
 */

@WebServlet(value = "/dashBoard/employe/equipe/create" , name="/dashBoard/employe/equipe/create")
public class CreateEquipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateEquipe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/view/dashBoard/equipe/createEquipe.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.greenIt.Model.Equipe equipe = new com.greenIt.Model.Equipe(
				request.getParameter("nom_equipe").trim() ,
				request.getParameter("description_equipe").trim() 
				
				
				) ;
		if( new com.greenIt.Service.Equipe().create(equipe,request.getSession()) ) {
			request.getRequestDispatcher("/dashBoard/employe/equipe").forward(request, response);
		}else {
			doGet(request, response);
		}
	}

}
