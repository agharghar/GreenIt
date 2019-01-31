package com.greenIt.Dao;



import javax.persistence.NoResultException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.greenIt.Model.Employe;

public class LoginDao {
	
	private String email ; 
	private String password ;
	private static SessionFactory sessionFactory ; 
	private static Session session ; 
	
	
	static {
		sessionFactory = new Configuration().configure().buildSessionFactory() ; 
		 session = sessionFactory.openSession() ; 
	}
	
	public static Session getHibernateSession() {
		return session ; 
	}

	
	public LoginDao(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	} 
	
	
	public Employe LoggedIn() {
		
		Query query = session.createQuery("from Employe where email_empl=:email AND mot_passe_empl=:password") ; 
		query.setString("email",this.email) ; 
		query.setString("password",this.password) ; 
		
		try {
			
			return (Employe) query.getSingleResult() ; 
			
			
		} catch (NoResultException  e) {
			return null ; 
		}
		
		
	}
	
	

}
