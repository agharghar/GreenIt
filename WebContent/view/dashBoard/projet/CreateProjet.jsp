<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Projet</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/dashBoard/projet/createProjet" method="post">
		
		<div>
			<label for="code_pro">Code Projet</label>
			<input type="text" id="code_pro" name="code_pro" required="required" />
		</div>
		<div>
			<label for="nom_pro">Nom Projet</label>
			<input type="text" id="nom_pro" name="nom_pro"/>
		</div>
		<div>
			<label for="description_pro">Description Projet</label>
			<textarea rows="10" cols="5" name="description_pro" maxlength="45"></textarea>
		</div>
		<div>
			<label for="charge_horaire_pro">Charge Horaire </label>
			<input type="number" value="0" min="0" id="charge_horaire_pro" name="charge_horaire_pro" />
		</div>

		<div>
			<input type="submit" value="Submit">
		</div>
	</form>

</body>
</html>