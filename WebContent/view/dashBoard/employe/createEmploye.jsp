<%@page import="com.greenIt.Dao.Equipe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/dashBoard/employe/createEmploye" method="post">
		
		<div>
			<label for="nom_empl">Nom</label>
			<input type="text" id="nom_empl" name="nom_empl" required="required" />
		</div>
		<div>
			<label for="prenom_empl">Prenom</label>
			<input type="text" id="prenom_empl" name="prenom_empl"/>
		</div>
		<div>
			<label for="mot_passe_empl">Password</label>
			<input type="password" id="mot_passe_empl" name="mot_passe_empl" required="required"/>
		</div>
		<div>
			<label for="email_empl">Email</label>
			<input type="email" id="email_empl" name="email_empl" required="required"/>
		</div>
		<div>
			<label for="date_naissance_empl">Date naissance </label>
			<input type="date" required="required" id="date_naissance_empl" name="date_naissance_empl" />
		</div>
		<div>
			<label for="charge_horaire_pro">Role</label>
			<select name="role_empl" id="role_empl" required="required">
				<option value="cours">En Cours</option>
				<option value="faire">A Faire</option>
				<option value="ter">Terminer</option>
			</select>
		</div>
		<div>
			<label for="code_equipe">Code Equipe</label>
			<select name="code_equipe" id="code_equipe">
				<c:forEach items="<%=Equipe.getAllEquipes()  %>" var="equipe">
					<option value="${equipe.getId() }">${equipe.getNom_equipe() }</option>
				</c:forEach>
			</select>
		</div>

		<div>
			<input type="submit" value="Submit">
		</div>
	</form>

</body>
</html>