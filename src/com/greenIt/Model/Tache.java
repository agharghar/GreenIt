package com.greenIt.Model;

import java.util.Date;

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
@Table(name="taches")
public class Tache {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_tache" , unique=true ,nullable=false)
	private int id ; 
	
	@Column(name="description_tache",length=45,nullable=false)
	private String description_tache ; 
	
	@Column(name="charge_horaire_tache",nullable=false)
	private int charge_horaire_tache ; 
	
	@Column(name="priorite_tache",nullable=false)
	private int priorite_tache ; 
	
	@Column(name="statut_tache",length=10,nullable=false)
	private String statut_tache ; 
	
	@Column(name="date_debut_tache" , nullable=true)
	private Date date_debut_tache ; 
	
	@Column(name="date_fin_tache" , nullable=true)
	private Date date_fin_tache ; 	
	
	@ManyToOne(cascade=
		{CascadeType.DETACH  ,CascadeType.MERGE ,CascadeType.PERSIST ,CascadeType.REFRESH})
	@JoinColumn(name="id_empl")
	private Employe employe ; 
	
	
	@ManyToOne(cascade=
		{CascadeType.DETACH  ,CascadeType.MERGE ,CascadeType.PERSIST ,CascadeType.REFRESH})
	@JoinColumn(name="code_pro")
	private Project project  ;


	public Tache() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Tache(int id, String description_tache, int charge_horaire_tache, int priorite_tache, String statut_tache) {
		super();
		this.id = id;
		this.description_tache = description_tache;
		this.charge_horaire_tache = charge_horaire_tache;
		this.priorite_tache = priorite_tache;
		this.statut_tache = statut_tache;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getDescription_tache() {
		return description_tache;
	}


	public void setDescription_tache(String description_tache) {
		this.description_tache = description_tache;
	}


	public int getCharge_horaire_tache() {
		return charge_horaire_tache;
	}


	public void setCharge_horaire_tache(int charge_horaire_tache) {
		this.charge_horaire_tache = charge_horaire_tache;
	}


	public int getPriorite_tache() {
		return priorite_tache;
	}


	public void setPriorite_tache(int priorite_tache) {
		this.priorite_tache = priorite_tache;
	}


	public String getStatut_tache() {
		return statut_tache;
	}


	public void setStatut_tache(String statut_tache) {
		this.statut_tache = statut_tache;
	}
	
	
	public Date getDate_debut_tache() {
		return date_debut_tache;
	}


	public void setDate_debut_tache(Date date_debut_tache) {
		this.date_debut_tache = date_debut_tache;
	}


	public Date getDate_fin_tache() {
		return date_fin_tache;
	}


	public void setDate_fin_tache(Date date_fin_tache) {
		this.date_fin_tache = date_fin_tache;
	}


	public Employe getEmploye() {
		return employe;
	}


	public void setEmploye(Employe employe) {
		this.employe = employe;
	}


	public Project getProject() {
		return project;
	}


	public void setProject(Project project) {
		this.project = project;
	}


	@Override
	public String toString() {
		return "Tache [id=" + id + ", description_tache=" + description_tache + ", charge_horaire_tache="
				+ charge_horaire_tache + ", priorite_tache=" + priorite_tache + ", statut_tache=" + statut_tache + "]";
	}


	
	
	
	
	
	
	
	
	
	
	
	

}
