<%@page import="java.util.HashSet"%>
<%@page import="com.greenIt.Dao.Equipe"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.greenIt.Model.Employe"%>
<%@page import="com.greenIt.Model.Tache"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DashBoard</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>

<%	
	Employe employe = ((Employe) session.getAttribute("employe")) ; 

	Set<Tache> taches  = new HashSet(); 
	if(employe.getRole_empl().equals("employe")){
		taches.addAll( employe.getTaches() );
		
	}else {
		taches.addAll( Equipe.getTaches(employe.getEquipe().getId()) ) ; 
		
	}

	DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd") ; 
%>
<c:set var="simpleDateFormat" value= "<%= simpleDateFormat %>" />

<div class="row">
<a href="${pageContext.request.contextPath}/dashBoard/logOut" >Déconnection</a> | 
<a href="${pageContext.request.contextPath}/dashBoard/profile" >Profile</a> | 
<%if(((Employe) session.getAttribute("employe")).getRole_empl().equals("chef_de_projet")){ %>
	<a href="${pageContext.request.contextPath}/dashBoard/tache/createTache">Créer Tache</a>|
	<a href="${pageContext.request.contextPath}/dashBoard/projet">Projet</a>|
<%} %>
</div>

	you are logged in MR/Madam <%= ((Employe) session.getAttribute("employe")).getNom_empl() %> 
	<%= ((Employe) session.getAttribute("employe")).getPrenom_empl() %>
	
	<div>
	

		<table class="table table-hover text-capitalize">
	  <thead>
	    <tr>
	      <th scope="col">id</th>
	      <%
	      	String affecter  = employe.getRole_empl().equals("chef_de_projet") ? "<th scope='col' >Affecter à</th>" : "" ;
	      		      
	      %>
	       <%=affecter %>
	      <th scope="col">description</th>
	      <th scope="col">charge</th>
	      <th scope="col">priorité</th>
	      <th scope="col">Date Debut</th>
	      <th scope="col">Date Fin</th>
	      <th scope="col">statut</th>
	      <th scope="col">projet</th>
	      <th scope="col">&nbsp;</th>
	      <%if(((Employe) session.getAttribute("employe")).getRole_empl().equals("chef_de_projet")){ %>
			<th scope="col">&nbsp;</th>
		<%} %>
	    </tr>
	  </thead>
	  <tbody>

	  <c:forEach items="<%=taches %>" var="tache">
	  	<tr>
	      <th scope="row">${tache.getId() }</th>
	      
		  
		<%  if( employe.getRole_empl().equals("chef_de_projet") ){ %>
			 <td> ${tache.getEmploye().getNom_empl()}</td>
		 <%} %>
		  
		  
	      <td>${tache.getDescription_tache() }</td>
	      <td>${tache.getCharge_horaire_tache() }</td>
	      <td>${tache.getPriorite_tache() }</td>
	      <td>
	      	${
	      		tache.getDate_debut_tache() == null ? "---" : simpleDateFormat.format(tache.getDate_debut_tache() )
	      	
	      	
	      		}
	      </td>
	       <td>
	      	${
	      		tache.getDate_fin_tache() == null ? "---" : simpleDateFormat.format(tache.getDate_fin_tache() )
	      		}
	      
	      </td>
	      <td>
	      	${
	      		tache.getStatut_tache().equals("ter") ? "Terminer" : tache.getStatut_tache().equals("cours") ? "En Cours" : "A Faire"
	      		}
	      
	      </td>
	      <td>
	      
		      <c:choose>
				  <c:when test="${tache.getProject() == null}">
				    --
				  </c:when>
				  <c:otherwise>
				    ${tache.getProject().getCode_pro()}
				  </c:otherwise>
				</c:choose>
		   </td>
	      <td>
	      	<a class="btn btn-info" href="${pageContext.request.contextPath}/dashBoard/editTache?tacheId=${tache.getId()}">Edit</a>
		  </td>
		<%if(((Employe) session.getAttribute("employe")).getRole_empl().equals("chef_de_projet")){ %>
		  <td>
	      	<a class="btn btn-danger" href="${pageContext.request.contextPath}/dashBoard/deleteTache?tacheId=${tache.getId()}">Delete</a>
		  </td>
		<%} %>
	    </tr>
	  
	  
	  </c:forEach>

	  </tbody>
	</table>
	
	</div>

</body>
</html>