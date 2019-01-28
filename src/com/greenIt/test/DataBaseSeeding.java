package com.greenIt.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.NoResultException;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.greenIt.Dao.LoginDao;
import com.greenIt.Model.Employe;
import com.greenIt.Model.Equipe;
import com.greenIt.Model.Project;
import com.greenIt.Model.Tache;

public class DataBaseSeeding {

	public static void main(String[] args) {
		
		SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory() ; 
		Session session = sessionFactory.openSession() ; 
		Query query = session.createQuery("from Employe where email_empl=:email AND mot_passe_empl=:password") ;

		try{
			 
			query.setString("email","admidn@admin.com") ; 
			query.setString("password","admin") ; 
			System.out.println(query.getSingleResult().getClass().equals(Employe.class)); 
			System.out.println(query.getSingleResult().equals(null));
			System.out.println(query.getSingleResult().toString());
			
		}catch (NoResultException nre){
			nre.getStackTrace() ; 
				System.out.println("lool");
			}

		
 
		

		session.close(); 
		sessionFactory.close(); 
		
		
	
		

	}

}
