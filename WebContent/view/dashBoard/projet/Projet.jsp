<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Set"%>
<%@page import="com.greenIt.Model.Project"%>
<%@page import="com.greenIt.Model.Employe"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Projet</title>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

</head>
<body>

<%
	Set<Project> projects = ((Employe) session.getAttribute("employe")).getProjects() ; 

%>




<table class="table table-hover text-capitalize">
	  <thead>
	    <tr>
	      <th scope="col">Code Projet</th>
	      <th scope="col">Nom</th>
	      <th scope="col">Description</th>
	      <th scope="col">Charge Horaire</th>
	      <th scope="col">&nbsp;</th>
	      <th scope="col">&nbsp;</th>
	    </tr>
	  </thead>
	  <tbody>

	  <c:forEach items="<%= projects %>" var="project" >
	  	<tr>
	      <th scope="row">${project.getCode_pro() }</th>
	      <td>${project.getNom_pro() == "" ? "--" : project.getNom_pro() }</td>
	      <td>${project.getDescription_pro() == "" ? "--" : project.getDescription_pro()}</td>
	      <td>${project.getCharge_horaire_pro() == "" ? "--" : project.getCharge_horaire_pro()}</td>
	      <td>

	      
	      </td>

	      <td>
	      	<a class="btn btn-info" href="${pageContext.request.contextPath}/dashBoard/projet/projetEdit?code_pro=${project.getCode_pro()}">Edit</a>
		</td>
		<td>
	      	<a class="btn btn-danger" href="${pageContext.request.contextPath}/dashBoard/projet/projetDelete?code_pro=${project.getCode_pro()}">Delete</a>
		</td>
	    </tr>
	  
	  
	  </c:forEach>
	  	  </tbody>
	</table>

</body>
</html>