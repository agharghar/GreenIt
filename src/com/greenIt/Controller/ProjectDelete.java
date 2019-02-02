package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greenIt.Service.Project;

/**
 * Servlet implementation class ProjectDelete
 */

@WebServlet(value = "/dashBoard/projet/projetDelete" , name="dashBoard/projet/projetDelete")
public class ProjectDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if( Project.delete(request.getParameter("code_pro").trim() , request.getSession() ) ) {
			
			response.sendRedirect(request.getContextPath()+"/dashBoard/projet");
		}else {
			
			response.sendRedirect(request.getContextPath()+"/dashBoard");
			
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
