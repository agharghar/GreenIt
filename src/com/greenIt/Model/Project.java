package com.greenIt.Model;

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
@Table(name="project")
public class Project {
	
	@Id
	@Column(name="code_pro",length=6,unique=true,nullable=false)
	private String code_pro ; 
	
	@Column(name="nom_pro",length=45,nullable=true)
	private String nom_pro ; 
	
	@Column(name="description_pro",length=255,nullable=true) 
	private String description_pro ;
	
	@Column(name="charge_horaire_pro",nullable=true)
	private int charge_horaire_pro ; 
	
	@ManyToOne(cascade= 
		{CascadeType.DETACH ,  CascadeType.MERGE ,CascadeType.PERSIST ,CascadeType.REFRESH})
	@JoinColumn(name="id_chef_project")
	private Employe employe_project ; 
	
	@OneToMany(mappedBy="project",cascade=CascadeType.ALL)
	private Set<Tache> taches ;

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(String code_pro, String nom_pro, String description_pro, int charge_horaire_pro) {
		super();
		this.code_pro = code_pro;
		this.nom_pro = nom_pro;
		this.description_pro = description_pro;
		this.charge_horaire_pro = charge_horaire_pro;
	}

	public String getCode_pro() {
		return code_pro;
	}

	public void setCode_pro(String code_pro) {
		this.code_pro = code_pro;
	}

	public String getNom_pro() {
		return nom_pro;
	}

	public void setNom_pro(String nom_pro) {
		this.nom_pro = nom_pro;
	}

	public String getDescription_pro() {
		return description_pro;
	}

	public void setDescription_pro(String description_pro) {
		this.description_pro = description_pro;
	}

	public int getCharge_horaire_pro() {
		return charge_horaire_pro;
	}

	public void setCharge_horaire_pro(int charge_horaire_pro) {
		this.charge_horaire_pro = charge_horaire_pro;
	}

	public Employe getEmploye() {
		return employe_project;
	}

	public void setEmploye(Employe employe) {
		this.employe_project = employe;
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
		this.taches.add(tache);
		
	}

	@Override
	public String toString() {
		return "Project [code_pro=" + code_pro + ", nom_pro=" + nom_pro + ", description_pro=" + description_pro
				+ ", charge_horaire_pro=" + charge_horaire_pro + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
