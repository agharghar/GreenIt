package com.greenIt.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

public class Equipe {

	private com.greenIt.Model.Equipe equipe ;
	
	public Equipe() {
		super();
		// TODO Auto-generated constructor stub
	}

	static public com.greenIt.Model.Equipe getEquipeById(int id , HttpSession session){
		com.greenIt.Model.Equipe equipe = null ;
		
		equipe = com.greenIt.Dao.Equipe.getEquipeById(id) ; 		
		return equipe  ; 
		
	}
	
	public static boolean delete(int id ,HttpSession session) {
		 com.greenIt.Model.Equipe equipe = com.greenIt.Dao.Equipe.getEquipeById(id) ; 
		
		 if(equipe == null) {
			 return false ;
		 }else {
		
			 com.greenIt.Dao.Equipe.delete(equipe,session) ; 
			 
			 return true; 
		 }
		
	}
	
	public boolean create(com.greenIt.Model.Equipe equipe ,HttpSession session) {
		
		if(new com.greenIt.Dao.Equipe().create(equipe)) {
			
			return true ;
		}
		return false;
	}
	
	
	public void update(int code_equipe, String description_equipe , String nom_equipe , HttpSession session) {
		
		this.equipe = com.greenIt.Dao.Equipe.getEquipeById(code_equipe) ;


		this.equipe.setDescription_equipe(description_equipe);
		this.equipe.setNom_equipe(nom_equipe);

		com.greenIt.Dao.Equipe.update(this.equipe) ; 
	
		
	}
	
}
