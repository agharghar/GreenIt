<%@page import="com.greenIt.Model.Equipe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/dashBoard/employe/editEquipe" method="post">
		<input value="<%= ( (Equipe)request.getAttribute("editEquipe") ).getId() %>" type="hidden" name="code_equipe">
		<div>	
			<label for="nom_equipe">Nom Equipe</label>
			<input type="text" id="nom_equipe" name="nom_equipe"
			 value="<%= ( (Equipe)request.getAttribute("editEquipe") ).getNom_equipe() %>" required="required" />
		</div>
		<div>
			<label for="description_equipe">Description Equipe</label>
			<textarea name="description_equipe" rows="" cols="" ><%= ( (Equipe)request.getAttribute("editEquipe") ).getDescription_equipe().trim() %>
			</textarea>

		</div>

		<div>
			<input type="submit" value="Submit">
		</div>
	</form>

</body>
</html>