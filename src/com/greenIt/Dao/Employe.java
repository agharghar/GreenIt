package com.greenIt.Dao;

import java.util.List;
import java.util.Set;

import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;



public class Employe {
	
	
	private static Session session =  LoginDao.getHibernateSession() ;
	
	public Employe() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static com.greenIt.Model.Employe getEmployeById(int id) {
		try {
			
			return (com.greenIt.Model.Employe) session.load(com.greenIt.Model.Employe.class, id);
			
		}catch(Exception exception) {
			exception.printStackTrace();
			return null ; 
		}
		

		
	}

	public static void delete(com.greenIt.Model.Employe employe, HttpSession sess) {
		session.beginTransaction() ;


		session.delete(employe);
		session.getTransaction().commit();

		
	}

	public boolean create(com.greenIt.Model.Employe employe) {
		try {
			session.beginTransaction() ; 
			session.save(employe) ; 
			session.getTransaction().commit();
			session.refresh(employe);

			return true ; 
		} catch (Exception e) {
			e.getStackTrace() ; 
			return false ; 
		}
		
	}

	public static void update(com.greenIt.Model.Employe employe) {
		
		session.getTransaction().begin();
		
		session.update(employe) ; 
		session.getTransaction().commit();
		session.refresh(employe);
		
	}

	public static List<com.greenIt.Model.Employe> getAllEmployes() {
		Query query = session.createQuery("from Employe ");
				
		return (List<com.greenIt.Model.Employe>) query.getResultList() ; 
		

	}
	
	

}
