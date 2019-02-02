package com.greenIt.Controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.greenIt.Dao.Employe;
import com.greenIt.Service.Project;

/**
 * Servlet implementation class CreateTache
 */
@WebServlet(value = "/dashBoard/tache/createTache" , name="dashBoard/tache/createTache")

public class CreateTache extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTache() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/view/dashBoard/tache/CreateTache.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		com.greenIt.Model.Tache tache = new com.greenIt.Model.Tache() ; 
		System.out.println(Integer.valueOf( request.getParameter("id_empl").trim() ) );
		com.greenIt.Model.Employe employe = Employe.getEmployeById(Integer.valueOf( request.getParameter("id_empl").trim() ) ) ; 
		com.greenIt.Model.Project project = Project.getProjectById(request.getParameter("code_pro").trim(), null) ; 
		String debut = request.getParameter("date_debut_tache") ; 
		String fin = request.getParameter("date_fin_tache") ; 
		
		tache.setCharge_horaire_tache( Integer.valueOf( request.getParameter("charge_horaire_tache").trim() ) );
		tache.setDescription_tache(request.getParameter("description_tache").trim());
		tache.setPriorite_tache(Integer.valueOf( request.getParameter("priorite_tache").trim()) ) ;
		tache.setStatut_tache(request.getParameter("statut_tache").trim());
		tache.setEmploye(employe);
		tache.setProject(project);


		
		try {
			tache.setDate_debut_tache(new SimpleDateFormat("yyyy-mm-dd").parse(debut));
			tache.setDate_fin_tache(new SimpleDateFormat("yyyy-mm-dd").parse(fin));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if( new com.greenIt.Service.Tache().create(tache , request.getSession() ) ) {
			request.getRequestDispatcher("/dashBoard").forward(request, response);
		}else {
			doGet(request, response);
		}
	}

}
