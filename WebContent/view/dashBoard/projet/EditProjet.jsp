<%@page import="com.greenIt.Model.Project"%>
<%@page import="java.text.SimpleDateFormat"%>
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


<form action="${pageContext.request.contextPath}/dashBoard/projet/projetEdit" method="post">


	<div id=" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${pageContext.request.contextPath}/dashBoard/editTache" method="post">
						<div class="modal-header">						
							<h4 class="modal-title">Edit Tache</h4>
							</div>
						<div class="modal-body">

							<div  class="form-group" >
								<label for="nom">Nom Projet </label>
								<input type="text" id="nom" name="nom_pro" 
								value=' <%= ((Project) session.getAttribute("project")) == null ? 
										"--" : ((Project) session.getAttribute("project")).getNom_pro() %> '
								 />
							</div>

							<div  class="form-group" >
								<label for="desc">Description projet </label>
								<textarea type="text" id="desc" name="description_pro" ><%= ((Project) session.getAttribute("project")) == null ? 
										"--" : ((Project) session.getAttribute("project")).getDescription_pro() %></textarea>
							</div>
							<div  class="form-group" >
								<label for="charge">charge Horaire projet </label>
								<input type="number" id="charge" name="charge_horaire_pro" 
								value='<%= ((Project) session.getAttribute("project")) == null ? 
										"" : ((Project) session.getAttribute("project")).getCharge_horaire_pro() %>'
								 />
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