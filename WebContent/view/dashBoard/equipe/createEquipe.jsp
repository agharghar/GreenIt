<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create equipe</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</head>
<body>




	<div id=" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${pageContext.request.contextPath}/dashBoard/employe/equipe/create" method="post">
						<div class="modal-header">						
							<h4 class="modal-title">Ajouter Equipe</h4>
						</div>
						<div class="modal-body">

							<div class="form-group" >
								<label for="nom_equipe">Nom</label>
								<input type="text" id="nom_equipe" name="nom_equipe" required="required" />
							</div>
							<div class="form-group" >
								<label for="description_equipe">Description</label>
								<textarea name="description_equipe" id="description_equipe" cols=""></textarea>

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