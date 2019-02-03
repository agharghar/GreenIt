
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Equipe</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

</head>
<body>
<a href="${pageContext.request.contextPath}/dashBoard/employe/equipe/create"  >Create Equipe</a>|

	<table class="table table-hover text-capitalize">
	  <thead>
	    <tr>

	      <th scope="col">Code Equipe</th>
	      <th scope="col">Nom Equipe</th>
	      <th scope="col">Description</th>
		  <th scope="col">&nbsp;</th>
	      <th scope="col">&nbsp;</th>

	    </tr>
	  </thead>
	  <tbody>
	  <%
	  	List <com.greenIt.Model.Equipe> equipes = com.greenIt.Dao.Equipe.getAllEquipes() ; 
	  
	  %>
	  

		<c:forEach items="<%=equipes %>" var="equipe">	
				<tr>	     
				    <td>${equipe.getId() }</td>
				    <td>	${
				    		
				    		equipe.getNom_equipe() == null ? "---" : equipe.getNom_equipe()	    	
				    		}
				    </td>
				    <td>
				    	${
				    		equipe.getDescription_equipe() == null ? "---" : equipe.getDescription_equipe()
				    			    	
				    		}
				    </td>
					<td>
				    	<a class="btn btn-info" href="${pageContext.request.contextPath}/dashBoard/employe/editEquipe?code_equipe=${equipe.getId()}">Edit</a>
				    </td>
				    <td>
				    	<a class="btn btn-danger" href="${pageContext.request.contextPath}/dashBoard/employe/deleteEquipe?code_equipe=${equipe.getId()}">Delete</a>
				    </td>
				</tr>  	

		</c:forEach>

	  </tbody>
	</table>

</body>
</html>