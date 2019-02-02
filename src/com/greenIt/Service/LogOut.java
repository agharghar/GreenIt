package com.greenIt.Service;

import javax.servlet.http.HttpSession;

import com.greenIt.Dao.LoginDao;

public class LogOut {
	
	public static void logOut(HttpSession session ) {
		LoginDao.getHibernateSession().refresh(session.getAttribute("employe"));
		session.setMaxInactiveInterval(0);
		session.invalidate(); 
		
			
		
	}

}
