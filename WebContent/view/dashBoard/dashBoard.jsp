<%@page import="java.util.Set"%>
<%@page import="com.greenIt.Model.Employe"%>
<%@page import="com.greenIt.Model.Tache"%>

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
	Set<Tache> taches = ((Employe) session.getAttribute("employe")).getTaches() ; 

%>


<div class="row">
<a href="${pageContext.request.contextPath}/dashBoard/logOut" >Déconnection</a>
<a href="${pageContext.request.contextPath}/dashBoard/profile" >Profile</a>
</div>

	you are logged in
	
	<div>
	
	List tache
		<table class="table table-hover text-capitalize">
	  <thead>
	    <tr>
	      <th scope="col">id</th>
	      <th scope="col">description</th>
	      <th scope="col">charge</th>
	      <th scope="col">priorité</th>
	      <th scope="col">statut</th>
	      <th scope="col">projet</th>
	      <th scope="col">&nbsp;</th>
	    </tr>
	  </thead>
	  <tbody>

	  <c:forEach items="<%=taches %>" var="tache">
	  	<tr>
	      <th scope="row">${tache.getId() }</th>
	      <td>${tache.getDescription_tache() }</td>
	      <td>${tache.getCharge_horaire_tache() }</td>
	      <td>${tache.getPriorite_tache() }</td>
	      <td>${tache.getStatut_tache() }</td>
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
	    </tr>
	  
	  
	  </c:forEach>

	  </tbody>
	</table>
	
	</div>

</body>
</html>