package com.greenIt.Service;

import javax.servlet.http.HttpSession;

public class LogOut {
	
	public static void logOut(HttpSession session ) {
		
		session.invalidate(); 

			
		
	}

}
