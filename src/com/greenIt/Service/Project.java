package com.greenIt.Service;

import javax.servlet.http.HttpSession;

import com.greenIt.Model.Employe;

public class Project {

	
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean create(com.greenIt.Model.Project project ,HttpSession session) {
		project.setEmploye(((Employe)session.getAttribute("employe")));
		if(new com.greenIt.Dao.Project().create(project)) {
			UpdateSessionVarible.updateEmploye(session) ; 
			return true ;
		}
		return false;
	}

}
