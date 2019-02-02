package com.greenIt.Dao;

import javax.persistence.Query;

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

}
