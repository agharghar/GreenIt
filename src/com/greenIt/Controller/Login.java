package com.greenIt.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greenIt.Service.CheckLogin;

/**
 * Servlet implementation class Login
 */
@WebServlet(value = "/login" , name="login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CheckLogin checkLogin = new CheckLogin(request, request.getParameter("email"), request.getParameter("password")) ; 	
		if(checkLogin.isLoggedIn() ) {

			response.sendRedirect(request.getContextPath()+"/dashBoard");
		}else {
			response.sendRedirect(request.getContextPath());
		}
			
		
	}

}
