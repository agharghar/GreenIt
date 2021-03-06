package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greenIt.Service.Tache;

/**
 * Servlet implementation class EditeTache
 */

@WebServlet(value = "/dashBoard/editTache" , name="dashBoard/editTache")
public class EditTache extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTache() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Tache.getTacheById( Integer.parseInt( request.getParameter("tacheId") ) , request.getSession(false)) ; 
		request.getRequestDispatcher("/view/dashBoard/tache/EditTache.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Tache tacheUpdate = new Tache() ;
		tacheUpdate.update(
				
				Integer.valueOf(request.getParameter("tacheId").trim())
				, request.getParameter("debut").trim()
				, request.getParameter("fin").trim()
				, request.getParameter("statut").trim()
				,request.getSession()
				) ; 
		request.getRequestDispatcher("/dashBoard").forward(request, response);
	}

}
