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
 * Servlet Filter implementation class Login
 */
@WebFilter(urlPatterns="/*" , filterName = "Login"  )
public class Login implements Filter {

    /**
     * Default constructor. 
     */
    public Login() {
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
        String loginURI = req.getContextPath();
		
        
        boolean loggedIn = session != null && session.getAttribute("employe") != null;
        boolean loginRequest = req.getServletPath().equals("/index.jsp");


        
        if( !loggedIn ) {
        	
        	
        	
        	Connected connected = new Connected() ; 
        	connected.doFilter(request, response, chain);
        	connected.destroy();
        	
        }else if(loggedIn && loginRequest ) {
        	
        	res.sendRedirect(loginURI+"/dashBoard");
        	
        	
        	
        }else if( loggedIn && !loginRequest   ) {

        	chain.doFilter(request, response);
        	
        	
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
