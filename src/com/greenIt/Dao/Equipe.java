package com.greenIt.Dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.greenIt.Model.Employe;

public class Equipe {
	private static Session session =  LoginDao.getHibernateSession() ;

	public Equipe() {
		super();
		
	}
	
	
	public static com.greenIt.Model.Equipe getEquipeById(int id) {
		
		return (com.greenIt.Model.Equipe) session.get(com.greenIt.Model.Equipe.class, id);
		
	}
	
	public static void delete(com.greenIt.Model.Equipe equipe , HttpSession sess) {

		session.beginTransaction() ;


		session.delete(equipe);
		session.getTransaction().commit();
		session.refresh(((Employe)sess.getAttribute("employe")));
	
	}

	public boolean create(com.greenIt.Model.Equipe equipe) {
		
		try {
			session.beginTransaction() ; 
			session.save(equipe) ; 
			session.getTransaction().commit();
			session.refresh(equipe);

			return true ; 
		} catch (Exception e) {
			e.getStackTrace() ; 
			return false ; 
		}
		
		

	}

	public static void update(com.greenIt.Model.Equipe equipe) {
		session.getTransaction().begin();
		
		session.update(equipe) ; 
		session.getTransaction().commit();
		session.refresh(equipe);
		
	}
	
	public static List getEmployes(int id_equipe ) {
		Query query = session.createQuery("from Employe where equipe.id =:id ");
		query.setParameter("id", id_equipe) ; 
		
		return query.getResultList() ; 
	}
	
	public static ArrayList<com.greenIt.Model.Tache> getTaches(int id ){
		ArrayList<com.greenIt.Model.Tache> taches ;
		ArrayList <Integer> idEmpl = new ArrayList<Integer>()  ; 

		Query query = session.createQuery("select ep.id from Employe as ep where equipe.id =:id ");
		query.setParameter("id", id) ; 
		idEmpl.addAll( query.getResultList()) ; 

		Query query2 = session.createQuery("from Tache where employe.id in (:idEmpl) ");
		query2.setParameter("idEmpl", idEmpl) ; 

		taches = (ArrayList<com.greenIt.Model.Tache>) query2.getResultList() ; 

		return taches ; 
		
	}
	
	
	public static List<com.greenIt.Model.Equipe> getAllEquipes(){
		List<com.greenIt.Model.Equipe> equipes = new ArrayList() ; 
		Query query = session.createQuery("from Equipe");
		equipes.addAll(query.getResultList()) ; 
		return equipes ; 
		
	}
	
	
	
	
	
	
	
}
