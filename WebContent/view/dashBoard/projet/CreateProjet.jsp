<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Projet</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</head>
<body>



	<div id=" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${pageContext.request.contextPath}/dashBoard/projet/createProjet" method="post">
						<div class="modal-header">						
							<h4 class="modal-title">Ajouter Projet</h4>
						</div>
						<div class="modal-body">

							<div class="form-group" >
								<label for="code_pro">Code Projet</label>
								<input type="text" id="code_pro" name="code_pro" required="required" />
							</div>
							<div class="form-group" >
								<label for="nom_pro">Nom Projet</label>
								<input type="text" id="nom_pro" name="nom_pro"/>
							</div>
							<div class="form-group" >
								<label for="description_pro">Description Projet</label>
								<textarea rows="10" cols="5" name="description_pro" maxlength="45"></textarea>
							</div>
							<div class="form-group" >
								<label for="charge_horaire_pro">Charge Horaire </label>
								<input type="number" value="0" min="0" id="charge_horaire_pro" name="charge_horaire_pro" />
							</div>
						</div>
						<div class="modal-footer">
							<input type="submit"  class="btn btn-success" value="Submit">
						</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>