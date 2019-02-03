<%@page import="com.greenIt.Model.Equipe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Edition</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/dashBoard/employe/editEquipe" method="post">

	<div id=" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${pageContext.request.contextPath}/dashBoard/editTache" method="post">
						<div class="modal-header">						
							<h4 class="modal-title">Edit Equipe</h4>
							</div>
							<div class="modal-body">

								<div class="form-group" >
									<input value="<%= ( (Equipe)request.getAttribute("editEquipe") ).getId() %>" type="hidden" name="code_equipe">
								</div>
							<div class="form-group" >	
								<label for="nom_equipe">Nom Equipe</label>
								<input type="text" id="nom_equipe" name="nom_equipe"
								 value="<%= ( (Equipe)request.getAttribute("editEquipe") ).getNom_equipe() %>" required="required" />
							</div>
							<div class="form-group" >
								<label for="description_equipe">Description Equipe</label>
								<textarea name="description_equipe" rows="" cols="" ><%= ( (Equipe)request.getAttribute("editEquipe") ).getDescription_equipe().trim() %>
								</textarea>

							</div>
	                        
						</div>
						<div class="modal-footer">
							<input type="submit" class="btn btn-success" >
						</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>