package com.greenIt.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import com.greenIt.Model.Employe;

public class Project {

	private com.greenIt.Model.Project project ; 
	
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	static public com.greenIt.Model.Project getProjectById(String id , HttpSession session){
		com.greenIt.Model.Project project = null ;
		
		project = com.greenIt.Dao.Project.getProjectById(id) ; 
		session.setAttribute("project",project);
		return project  ; 
		
	}
	
	public static boolean delete(String id ,HttpSession session) {
		 com.greenIt.Model.Project project = getProjectById(id,session) ; 
		
		 if(project == null) {
			 return false ;
		 }else {
		
			 com.greenIt.Dao.Project.delete(project,session) ; 
			 
			 return true; 
		 }
		
	}

	public boolean create(com.greenIt.Model.Project project ,HttpSession session) {
		project.setEmploye(((Employe)session.getAttribute("employe")));
		if(new com.greenIt.Dao.Project().create(project)) {
			
			
			return true ;
		}
		return false;
	}

	public void update(String code_pro , Integer charge_horaire_pro, String description_pro, String nom_pro, HttpSession session) {
		this.project = com.greenIt.Dao.Project.getProjectById(code_pro) ;
		

		try {
			project.setCharge_horaire_pro(charge_horaire_pro);
			project.setDescription_pro(description_pro);
			project.setNom_pro(nom_pro);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		com.greenIt.Dao.Project.update(this.project) ; 
	
		
		
	}





}
