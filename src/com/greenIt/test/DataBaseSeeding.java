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

		Employe employe = session.get(Employe.class, 2) ; 
		System.out.println(employe);
		System.out.println(employe.getEquipe());
		for (Tache tache : employe.getTaches()) {
			System.out.println(tache.getId()+"|"+tache.getProject().getCode_pro());
		}
 
		

		session.close(); 
		sessionFactory.close(); 
		
		
	
		

	}

}
