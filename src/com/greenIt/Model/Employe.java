package com.greenIt.Model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="employe")
public class Employe {
	
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="id_empl",nullable=false)
	private int id ; 
	
	@Column(name = "nom_empl",length=45,nullable=true)
	private String nom_empl ; 
	
	@Column(name="prenom_empl",length=45,nullable=true)
	private String prenom_empl ; 
	
	@Column(name="role_empl",length=45,nullable=false)
	private String role_empl ; 
	
	@Column(name="mot_passe_empl",length=10,nullable=false)
	private String mot_passe_empl ; 
	
	@Column(name="email_empl",length=100,nullable=false)
	private String email_empl ; 
	
	@Column(name="date_naissance_empl",nullable=false)
	private Date date_naissance_empl ; 

	@ManyToOne(cascade=
		{CascadeType.DETACH ,CascadeType.MERGE, CascadeType.PERSIST , CascadeType.REFRESH})
	@JoinColumn(name="code_equipe")
	private Equipe equipe ; 
	
	@OneToMany(mappedBy="employe_project")
	Set<Project> projects ; 
	
	@OneToMany(mappedBy="employe")
	Set<Tache> taches ;

	public Employe() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employe(String nom_empl, String prenom_empl, String role_empl, String mot_passe_empl, String email_empl,
			Date date_naissance_empl) {
		super();
		this.nom_empl = nom_empl;
		this.prenom_empl = prenom_empl;
		this.role_empl = role_empl;
		this.mot_passe_empl = mot_passe_empl;
		this.email_empl = email_empl;
		this.date_naissance_empl = date_naissance_empl;
	}

	public String getNom_empl() {
		return nom_empl;
	}

	public void setNom_empl(String nom_empl) {
		this.nom_empl = nom_empl;
	}

	public String getPrenom_empl() {
		return prenom_empl;
	}

	public void setPrenom_empl(String prenom_empl) {
		this.prenom_empl = prenom_empl;
	}

	public String getRole_empl() {
		return role_empl;
	}

	public void setRole_empl(String role_empl) {
		this.role_empl = role_empl;
	}

	public String getMot_passe_empl() {
		return mot_passe_empl;
	}

	public void setMot_passe_empl(String mot_passe_empl) {
		this.mot_passe_empl = mot_passe_empl;
	}

	public String getEmail_empl() {
		return email_empl;
	}

	public void setEmail_empl(String email_empl) {
		this.email_empl = email_empl;
	}

	public Date getDate_naissance_empl() {
		return date_naissance_empl;
	}

	public void setDate_naissance_empl(Date date_naissance_empl) {
		this.date_naissance_empl = date_naissance_empl;
	}

	public Equipe getEquipe() {
		return equipe;
	}

	public void setEquipe(Equipe equipe) {
		this.equipe = equipe;
	}

	public Set<Project> getProjects() {
		return projects;
	}

	public void setProjects(Set<Project> projects) {
		
		if(this.projects.isEmpty())
			this.projects = new HashSet<Project>() ; 
		this.projects.addAll(projects);
	}

	public Set<Tache> getTaches() {
		return taches;
	}

	public void setTaches(Set<Tache> taches) {
		
		if(this.taches.isEmpty())
			this.taches = new HashSet<Tache>() ;
		this.taches.addAll(taches);
	} 
	
	public void addTache(Tache tache) {
		
		if(this.taches.isEmpty())
			this.taches = new HashSet<Tache>() ;
		this.taches.add(tache) ; 
		
	}
	
	public void addProject(Project project) {
		
		if(this.projects.isEmpty())
			this.projects = new HashSet<Project>() ;
		this.projects.add(project) ; 
		
	}

	@Override
	public String toString() {
		return "Employe [id=" + id + ", nom_empl=" + nom_empl + ", prenom_empl=" + prenom_empl + ", role_empl="
				+ role_empl + ", mot_passe_empl=" + mot_passe_empl + ", email_empl=" + email_empl
				+ ", date_naissance_empl=" + date_naissance_empl + ", equipe=" + equipe + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
