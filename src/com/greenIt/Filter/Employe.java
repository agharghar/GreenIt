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

/**
 * Servlet Filter implementation class Employe
 */


@WebFilter(urlPatterns= "/dashBoard/employe/*" , filterName = "employe"  )
public class Employe implements Filter {

    /**
     * Default constructor. 
     */
    public Employe() {
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
		com.greenIt.Model.Employe employe = ((com.greenIt.Model.Employe) req.getSession(false).getAttribute("employe")) ; 
		if(employe != null && employe.getRole_empl().equals("administrateur")) {
			request.setAttribute("administrateur", "true");
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
