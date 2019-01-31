package com.greenIt.Dao;

import org.hibernate.Session;

public class Employe {
	
	
	private static Session session =  LoginDao.getHibernateSession() ;
	
	public Employe() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static com.greenIt.Model.Employe getEmployeById(int id) {

		return (com.greenIt.Model.Employe) session.get(com.greenIt.Model.Employe.class, id);

		
	}

}
