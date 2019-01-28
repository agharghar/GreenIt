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

/** 
 * 	Filter who redirect if alredy logged-in
 */
@WebFilter( filterName="connected"  )
public class Connected implements Filter {

    /**
     * Default constructor. 
     */
    public Connected() {
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
		
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

		
		
        boolean loggedIn = session != null && session.getAttribute("employe") != null;
        boolean loginRequest = req.getServletPath().equals("/index.jsp");


        
        if(!loggedIn && req.getServletPath().equals("/login")){
        	
        	chain.doFilter(request, response);
        	
        }else  {
        	
        	req.getRequestDispatcher("/").forward(request, response);

        }
		 
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
