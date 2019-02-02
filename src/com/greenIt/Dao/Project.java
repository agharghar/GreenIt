package com.greenIt.Dao;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.greenIt.Model.Employe;

public class Project {
	
	private static Session session =  LoginDao.getHibernateSession() ;
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public static com.greenIt.Model.Project getProjectById(String id) {
		
		return (com.greenIt.Model.Project) session.get(com.greenIt.Model.Project.class, id);
		
	}
	
	public static void delete(com.greenIt.Model.Project project , HttpSession sess) {

		session.beginTransaction() ;


		session.delete(project);
		session.getTransaction().commit();
		session.refresh(((Employe)sess.getAttribute("employe")));
	
	}

	public boolean create(com.greenIt.Model.Project project) {
		
		try {
			session.beginTransaction() ; 
			session.save(project) ; 
			session.getTransaction().commit();
			session.refresh(project);

			return true ; 
		} catch (Exception e) {
			e.getStackTrace() ; 
			return false ; 
		}
		
		

	}

	public static void update(com.greenIt.Model.Project project) {
		session.getTransaction().begin();
		
		session.update(project) ; 
		session.getTransaction().commit();
		session.refresh(project);
		
	}




	
	
}
