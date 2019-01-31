package com.greenIt.Dao;

import org.hibernate.Session;

public class Project {
	
	private static Session session =  LoginDao.getHibernateSession() ;
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean create(com.greenIt.Model.Project project) {
		session.beginTransaction() ; 
		try {
			session.save(project) ; 
			session.getTransaction().commit();
			return true ; 
		} catch (Exception e) {
			return false ; 
		}
		
		

	}
	
	
}
