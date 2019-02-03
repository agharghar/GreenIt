<%@page import="com.greenIt.Dao.Equipe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Employe</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</head>
<body>




	<div id=" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${pageContext.request.contextPath}/dashBoard/employe/createEmploye" method="post">
						<div class="modal-header">						
							<h4 class="modal-title">Ajouter Employe</h4>
						</div>
						<div class="modal-body">

							<div class="form-group"  >
								<label for="nom_empl">Nom</label>
								<input type="text" id="nom_empl" name="nom_empl" required="required" />
							</div>
							<div class="form-group"  >
								<label for="prenom_empl">Prenom</label>
								<input type="text" id="prenom_empl" name="prenom_empl"/>
							</div>
							<div class="form-group"  >
								<label for="mot_passe_empl">Password</label>
								<input type="password" id="mot_passe_empl" name="mot_passe_empl" required="required"/>
							</div>
							<div class="form-group"  >
								<label for="email_empl">Email</label>
								<input type="email" id="email_empl" name="email_empl" required="required"/>
							</div>
							<div class="form-group"  >
								<label for="date_naissance_empl">Date naissance </label>
								<input type="date" required="required" id="date_naissance_empl" name="date_naissance_empl" />
							</div>
							<div class="form-group"  >
								<label for="role_empl">Role</label>
								<select name="role_empl" id="role_empl" required="required">
									<option value="employe">employe</option>
									<option value="chef_de_projet">Chef De Projet</option>
									<option value="administrateur">Administrateur</option>
								</select>
							</div>
							<div class="form-group"  >
								<label for="code_equipe">Code Equipe</label>
								<select name="code_equipe" id="code_equipe">
									<c:forEach items="<%=Equipe.getAllEquipes()  %>" var="equipe">
										<option value="${equipe.getId() }">${equipe.getNom_equipe() }</option>
									</c:forEach>
								</select>
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