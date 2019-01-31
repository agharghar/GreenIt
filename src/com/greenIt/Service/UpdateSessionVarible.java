package com.greenIt.Service;



import javax.servlet.http.HttpSession;

import com.greenIt.Dao.LoginDao;
import com.greenIt.Model.Employe;

public class UpdateSessionVarible {
	

	

	public UpdateSessionVarible() {
		super();
		// TODO Auto-generated constructor stub
	}


	public static void updateEmploye(HttpSession session) {
		
		int id = ((Employe) session.getAttribute("employe")).getId(); 
		Employe employe = com.greenIt.Dao.Employe.getEmployeById(id)  ;
		session.setAttribute("employe", employe);
		
	}
	

	
}
