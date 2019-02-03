<%@page import="com.greenIt.Dao.Equipe"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.greenIt.Model.Employe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Employe</title>
</head>
<body>

	<%
	
	Employe employe = ((Employe)request.getAttribute("editEmploye")) ; 
	%>

	<form action="${pageContext.request.contextPath}/dashBoard/employe/editEmploye" method="post">
	
	<div>
		<input for="charge" value="<%=employe.getId() %>" name="id_empl" type="hidden"/>

	</div>
	<%
	
	DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd") ; 
	String date_naissance ; 
	if(employe.getDate_naissance_empl() != null){
		date_naissance = dateFormat.format(employe.getDate_naissance_empl()) ; 
		date_naissance = "<input type='date' id='date_naissance_empl' value='"+date_naissance+"' name='date_naissance_empl' >" ; 
	}else{
		date_naissance = "<input type='date' id='date_naissance_empl' name='date_naissance_empl' >"  ; 
		
	}

	
	
	%>
	
	<div>
		<label for="">date Naissance</label>
		<%= date_naissance%>

	
	</div>
	<div>
		<label for="email_empl">Nom Projet </label>
		<input type="email" id="email_empl" name="email_empl" 
		value=' <%= employe.getEmail_empl() == null ? 
				"--" : employe.getEmail_empl() %> '
		 />
	</div>
	<div>
		<label for="nom_empl">Nom</label>
		<input type="text" id="nom_empl" name="nom_empl" 
		value=' <%= employe.getNom_empl() == null ? 
				"--" : employe.getNom_empl() %> '
		 />
	</div>
	<div>
		<label for="prenom_empl">Prenom</label>
		<input type="text" id="prenom_empl" name="prenom_empl" 
		value=' <%= employe.getPrenom_empl() == null ? 
				"--" : employe.getPrenom_empl() %> '
		 />
	</div>
	<div>
		<label for="role_empl">Role</label>
		<select name="role_empl" id="role_empl" required="required">
			<option value="employe">employe</option>
			<option value="chef_de_projet">Chef De Projet</option>
			<option value="administrateur">Administrateur</option>
		</select>
	</div>
	<div>
		<label for="code_equipe">Code equipe</label>
		<select name="code_equipe" id="code_equipe">
			<c:forEach items="<%= Equipe.getAllEquipes() %>" var="equipe">
				<option value="${equipe.getId()}">${equipe.getNom_equipe()}</option>
			</c:forEach>
		
		</select>
	</div>

	
	
	<input type="submit" value="submit">
	</form>

</body>
</html>