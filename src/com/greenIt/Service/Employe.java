package com.greenIt.Service;



import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;


import com.greenIt.Model.Equipe;

public class Employe {
	
	private com.greenIt.Model.Employe employe;

	public Employe() {
		super();
		
	} 
	
	
	static public com.greenIt.Model.Employe getEmployeById(int id , HttpSession session){
		com.greenIt.Model.Employe employe = null ;
		
		employe = com.greenIt.Dao.Employe.getEmployeById(id) ; 		
		return employe  ; 
		
	}
	
	public static boolean delete(int id ,HttpSession session) {
		 com.greenIt.Model.Employe employe = getEmployeById(id, session) ; 
		
		 if(employe == null) {
			 return false ;
		 }else {
		
			 com.greenIt.Dao.Employe.delete(employe,session) ; 
			 
			 return true; 
		 }
		
	}
	
	public boolean create(com.greenIt.Model.Employe employe ,HttpSession session) {
		
		if(new com.greenIt.Dao.Employe().create(employe)) {
			
			return true ;
		}
		return false;
	}
	
	
	public void update(int id, String date_naissance_empl , String email_empl ,String nom_empl , String prenom_empl , String role_empl , int code_equipe, HttpSession session) {
		
		this.employe = com.greenIt.Dao.Employe.getEmployeById(id) ;
		Equipe equipe = com.greenIt.Dao.Equipe.getEquipeById(code_equipe) ; 

		try {
			employe.setDate_naissance_empl(new SimpleDateFormat("yyyy-mm-dd").parse(date_naissance_empl));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		employe.setEmail_empl(email_empl);
		employe.setNom_empl(prenom_empl);
		employe.setPrenom_empl(prenom_empl);
		employe.setRole_empl(role_empl);
		employe.setEquipe(equipe);
		com.greenIt.Dao.Employe.update(this.employe) ; 
	
		
	}
	
	

}
