package com.greenIt.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.greenIt.Model.Employe;

public class Tache {
	
	private com.greenIt.Model.Tache tache ;
	
	
	static public com.greenIt.Model.Tache getTacheById(int id,HttpSession session){
		com.greenIt.Model.Tache tache = null ;
		
		tache = com.greenIt.Dao.Tache.getTacheById(id) ; 
		session.setAttribute("tacheToEdit", tache);
		return tache  ; 
		
	}

	public Tache(com.greenIt.Model.Tache tache) {
		super();
		this.tache = tache;
	}

	public Tache() {
		// TODO Auto-generated constructor stub
	}

	public void update(int id, String debut, String fin, String statut,HttpSession session) {
		this.tache = com.greenIt.Dao.Tache.getTacheById(id) ;
		

		try {
			tache.setDate_debut_tache(new SimpleDateFormat("yyyy-mm-dd").parse(debut));
			tache.setDate_fin_tache(new SimpleDateFormat("yyyy-mm-dd").parse(fin));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		tache.setStatut_tache(statut);
		com.greenIt.Dao.Tache.update(this.tache) ; 
	
		
	}

	public static void delete(Integer id, HttpSession session) {
		 com.greenIt.Model.Tache tache = getTacheById(id,session) ; 
			
		 if(tache == null) {
			 return ;
		 }else {
		
			 com.greenIt.Dao.Tache.delete(tache,session) ; 	 

		 }
		
	}

	public boolean create(com.greenIt.Model.Tache tache , HttpSession session ) {

		if(new com.greenIt.Dao.Tache().create(tache , session )) {
			
			return true ;
		}
		return false;
	} 

	
	
	
	
	

}
