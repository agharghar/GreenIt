package com.greenIt.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.greenIt.Model.Employe;

/**
 * Servlet Filter implementation class Chef_de_projet
 */
@WebFilter(urlPatterns=
	{"/dashBoard/projet/*" , "/dashBoard/deleteTache" ,"/dashBoard/tache/*"} ,
	filterName = "chef_de_projet"  )

public class Chef_de_projet implements Filter {

    /**
     * Default constructor. 
     */
    public Chef_de_projet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request ; 
		Employe employe = ((Employe) req.getSession(false).getAttribute("employe")) ; 
		if(employe != null && employe.getRole_empl().equals("chef_de_projet")) {
			request.setAttribute("chef", "true");
		}
		
		chain.doFilter(request, response) ; 
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
