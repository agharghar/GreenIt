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
		System.out.println(tache.toString());
		session.update(tache) ; 
		
		session.getTransaction().commit();
		
	}



	
	
}
