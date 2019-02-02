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
<meta charset="ISO-8859-1">
<title>Create Tache</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/dashBoard/tache/createTache" method="post">
		
		<div>
			<label for="charge_horaire_tache">Charge Horaire Tache</label>
			<input type="number" id="charge_horaire_tache" name="charge_horaire_tache" min="0" required="required"/>
		</div>
		<div>
			<label for="date_debut_tache">Date debut</label>
			<input type="date" id="date_debut_tache" name="date_debut_tache" required="required"/>
		</div>
		<div>
			<label for="date_fin_tache">Date Fin</label>
			<input type="date" id="date_fin_tache " name="date_fin_tache" required="required"/>
		</div>
		<div>
			<label for="description_tache">Description Tache</label>
			<textarea rows="10" cols="5" name="description_tache" maxlength="45" required="required"></textarea>
		</div>
		<div>
			<label for="priorite_tache">Priorite Tache</label>
			<input type="number" id="priorite_tache" name="priorite_tache" min="0" required="required"/>
		</div>
		<div>
			<label for="statut_tache">Statut Tache</label>
			<select name="statut_tache" id="statut_tache" required="required">	
				<option value="faire">A faire</option>
				<option value="cours">En Cours</option>
				<option value="ter">Terminer</option>
			</select>
		</div>
		
		<!-- ID Employe => team -->
		<div>
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
		
		<div>
			<label for="code_pro">Code Projet</label>
			<select name="code_pro" id="code_pro" required="required">	
				<c:forEach items='<%=employe.getProjects() %>' var="project">
					<option value="${project.getCode_pro()}">${project.getCode_pro()}</option>
				</c:forEach>
			</select>
		</div>

		<div>
			<input type="submit" value="Submit">
		</div>
	</form>

</body>
</html>