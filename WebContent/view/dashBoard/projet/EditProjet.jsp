<%@page import="com.greenIt.Model.Project"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edition</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/dashBoard/projet/projetEdit" method="post">

<div>
	<label for="charge">charge Horaire projet </label>
	<input type="number" id="charge" name="charge_horaire_pro" 
	value=' <%= ((Project) session.getAttribute("project")) == null ? 
			"--" : ((Project) session.getAttribute("project")).getCharge_horaire_pro() %> '
	 />
</div>
<div>
	<label for="desc">Description projet </label>
	<textarea type="text" id="desc" name="description_pro" ><%= ((Project) session.getAttribute("project")) == null ? 
			"--" : ((Project) session.getAttribute("project")).getDescription_pro() %></textarea>
</div>
<div>
	<label for="nom">Nom Projet </label>
	<input type="text" id="nom" name="nom_pro" 
	value=' <%= ((Project) session.getAttribute("project")) == null ? 
			"--" : ((Project) session.getAttribute("project")).getNom_pro() %> '
	 />
</div>


<input type="submit" value="submit">
</form>


</body>
</html>