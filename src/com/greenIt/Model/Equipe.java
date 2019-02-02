package com.greenIt.Model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="equipe")
public class Equipe {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="code_equipe",nullable=false)
	private int id ; 
	
	@Column(name="nom_equipe",length=45,nullable=true)
	private String nom_equipe ; 
	
	@Column(name="description_equipe",length=255,nullable=true)
	private String description_equipe ; 
	
	@OneToMany(mappedBy="equipe" ,
			cascade= {CascadeType.DETACH , CascadeType.MERGE ,CascadeType.PERSIST  ,CascadeType.REFRESH})
	private Set<Employe> employes ;

	public Equipe() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public int getId() {
		return id;
	}

	
	public Equipe(String nom_equipe, String description_equipe) {
		super();
		this.nom_equipe = nom_equipe;
		this.description_equipe = description_equipe;
	}

	public String getNom_equipe() {
		return nom_equipe;
	}

	public void setNom_equipe(String nom_equipe) {
		this.nom_equipe = nom_equipe;
	}

	public String getDescription_equipe() {
		return description_equipe;
	}

	public void setDescription_equipe(String description_equipe) {
		this.description_equipe = description_equipe;
	}

	public Set<Employe> getEmployes() {
		return this.employes;
	}

	public void setEmployes(Set<Employe> employes) {
		
		if(this.employes.isEmpty())
			this.employes = new HashSet<Employe>() ; 
		this.employes.addAll(employes);
	} 

	public void addEquipes(Employe employe) {
		
		if(this.employes.isEmpty())
			this.employes = new HashSet<Employe>() ; 
		this.employes.add(employe);
		
	}

	@Override
	public String toString() {
		return "Equipe [id=" + id + ", nom_equipe=" + nom_equipe + ", description_equipe=" + description_equipe + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
