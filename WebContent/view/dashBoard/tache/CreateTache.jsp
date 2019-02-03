<%@page import="com.greenIt.Dao.Equipe"%>
<%@page import="com.greenIt.Model.Employe"%>
<%@page import="com.greenIt.Model.Tache"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Create Tache</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/dashBoard/tache/createTache" method="post">



	<div id=" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${pageContext.request.contextPath}/dashBoard/editTache" method="post">
						<div class="modal-header">						
							<h4 class="modal-title">Ajouter Tache</h4>
						</div>
						<div class="modal-body">

						<div class="form-group">
							<label for="charge_horaire_tache">Charge Horaire Tache</label>
							<input type="number" id="charge_horaire_tache" name="charge_horaire_tache" min="0" required="required"/>
						</div>
						<div class="form-group">
							<label for="date_debut_tache">Date debut</label>
							<input type="date" id="date_debut_tache" name="date_debut_tache" required="required"/>
						</div>
						<div class="form-group">
							<label for="date_fin_tache">Date Fin</label>
							<input type="date" id="date_fin_tache " name="date_fin_tache" required="required"/>
						</div>
						<div class="form-group">
							<label for="description_tache">Description Tache</label>
							<textarea rows="10" cols="5" name="description_tache" maxlength="45" required="required"></textarea>
						</div>
						<div class="form-group">
							<label for="priorite_tache">Priorite Tache</label>
							<input type="number" id="priorite_tache" name="priorite_tache" min="0" required="required"/>
						</div>
						<div class="form-group">
							<label for="statut_tache">Statut Tache</label>
							<select name="statut_tache" id="statut_tache" required="required">	
								<option value="faire">A faire</option>
								<option value="cours">En Cours</option>
								<option value="ter">Terminer</option>
							</select>
						</div>
						
						<!-- ID Employe => team -->
						<div class="form-group">
						<%
						Employe employe = ((Employe) session.getAttribute("employe")) ; 
						List equipeEmploye = Equipe.getEmployes(employe.getEquipe().getId()) ; 
						
						%>
							<label for="id_empl">Employe</label>
							<select name="id_empl" id="id_empl" required="required">	
								<c:forEach items="<%=equipeEmploye %>" var="emp">
									<option value="${emp.getId() }">${emp.getNom_empl()}</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="form-group">
							<label for="code_pro">Code Projet</label>
							<select name="code_pro" id="code_pro" required="required">	
								<c:forEach items='<%=employe.getProjects() %>' var="project">
									<option value="${project.getCode_pro()}">${project.getCode_pro()}</option>
								</c:forEach>
							</select>
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