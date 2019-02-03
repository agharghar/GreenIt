<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.greenIt.Model.Employe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employes</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

</head>
<body>

<a href="${pageContext.request.contextPath}/dashBoard/employe/createEmploye"  >Create Employe</a>|
<a href="${pageContext.request.contextPath}/dashBoard/employe/equipe">Equipe</a>

<table class="table table-hover text-capitalize">
	  <thead>
	    <tr>

	      <th scope="col">Nom</th>
	      <th scope="col">Prenom</th>
	      <th scope="col">Email</th>
	      <th scope="col">Date Naissance</th>
	      <th scope="col">Role</th>
	      <th scope="col">Nom Equipe</th>
		  <th scope="col">&nbsp;</th>
	      <th scope="col">&nbsp;</th>

	    </tr>
	  </thead>
	  <tbody>
	  
	  <%
		
	 	DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd") ; 
	  	List<Employe> allEmployes = ((List<Employe>) request.getAttribute("allEmployes") ) ; 
	  	int myId = ((Employe) session.getAttribute("employe")).getId() ; 
	  	boolean test ;
	  %>
<c:set var="simpleDateFormat" value= "<%= simpleDateFormat %>" />
		<c:forEach items="${allEmployes}" var="employe">
			
		    <c:if test="${employe.getId().equals(myId)}">  	
				<tr>	     
				    <td>${employe.getNom_empl() }</td>
				    <td>${employe.getPrenom_empl()  }</td>
				    <td>${employe.getEmail_empl() }</td>
				    <td>
				    	${
				    		employe.getDate_naissance_empl() == null ? "---" : simpleDateFormat.format(employe.getDate_naissance_empl() )
				    			    	
				    		}
				    </td>
				    <td>${employe.getRole_empl()  }</td>
				    <td>${employe.getEquipe() == null ? "---" : employe.getEquipe().getNom_equipe() }</td>
				    <td>
				    	<a class="btn btn-info" href="${pageContext.request.contextPath}/dashBoard/employe/editEmploye?id_empl=${employe.getId()}">Edit</a>
				    </td>
				    <td>
				    	<a class="btn btn-danger" href="${pageContext.request.contextPath}/dashBoard/employe/deleteEmploye?id_empl=${employe.getId()}">Delete</a>
				    </td>
				</tr>  	
	 		</c:if>
		</c:forEach>

	  </tbody>
	</table>


</body>
</html>