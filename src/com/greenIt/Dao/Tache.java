package com.greenIt.Dao;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Manager;
import org.hibernate.Query;
import org.hibernate.Session;

import com.greenIt.Model.Employe;

import javassist.tools.rmi.ObjectNotFoundException;

public class Tache {

	private static Session session =  LoginDao.getHibernateSession() ;
	

	
	public Tache() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static com.greenIt.Model.Tache getTacheById(int id) {

		return (com.greenIt.Model.Tache) session.get(com.greenIt.Model.Tache.class, id);

		
	}

	public static void update(com.greenIt.Model.Tache tache) {
		session.getTransaction().begin();
		
		session.update(tache) ; 
		session.getTransaction().commit();
		session.refresh(tache);
	}

	public static void delete(com.greenIt.Model.Tache tache, HttpSession sess) {
		session.beginTransaction() ;


		session.delete(tache);
		session.getTransaction().commit();
		session.refresh( ((Employe)sess.getAttribute("employe")) );
		
	}

	public boolean create(com.greenIt.Model.Tache tache , HttpSession sess) {
		try {
			session.beginTransaction() ; 
			session.save(tache) ; 
			session.getTransaction().commit();
			session.refresh( ((Employe)sess.getAttribute("employe")) );

			return true ; 
		} catch (Exception e) {
			e.getStackTrace() ; 
			return false ; 
		}
		
	}



	
	
}
