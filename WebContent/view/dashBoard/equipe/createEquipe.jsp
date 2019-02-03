<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create equipe</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/dashBoard/employe/equipe/create" method="post">
		
		<div>
			<label for="nom_equipe">Nom</label>
			<input type="text" id="nom_equipe" name="nom_equipe" required="required" />
		</div>
		<div>
			<label for="description_equipe">Description</label>
			<textarea name="description_equipe" id="description_equipe" cols=""></textarea>

		</div>





		<div>
			<input type="submit" value="Submit">
		</div>
	</form>

</body>
</html>