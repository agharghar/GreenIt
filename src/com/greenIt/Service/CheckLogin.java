package com.greenIt.Service;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.greenIt.Dao.LoginDao;
import com.greenIt.Model.Employe;

public class CheckLogin {
	
	private Boolean loggedIn = false ; 
	private String email , password ;
	private Employe employe =null ;
	private HttpSession session ;
	private HttpServletRequest request ; 
 
	
	public CheckLogin(HttpServletRequest request, String email, String password) {
		super();
		this.request = request;
		this.email = email;
		this.password = password;
	}

	
	

	public Boolean isLoggedIn() {
		
		this.employe = new LoginDao(this.email, this.password).LoggedIn() ;
		
		if(this.employe == null ) {
			this.loggedIn = false ; 
		}else {
			this.loggedIn = true; 
			this.session = this.request.getSession(true);
			session.setAttribute("employe", this.employe);
			session.setMaxInactiveInterval(60*60);
		}
		
		return loggedIn;
	}




	@Override
	public String toString() {
		return "CheckLogin [loggedIn=" + loggedIn + ", email=" + email + ", password=" + password + "]";
	} 

	
	
	


 

}
