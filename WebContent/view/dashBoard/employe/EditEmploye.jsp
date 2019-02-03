<%@page import="com.greenIt.Dao.Equipe"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.greenIt.Model.Employe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Edition</title>
</head>
<body>
	<%
	
		Employe employe = ((Employe)request.getAttribute("editEmploye")) ; 
	%>


<form action="${pageContext.request.contextPath}/dashBoard/employe/editEmploye" method="post">

	<div id=" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="${pageContext.request.contextPath}/dashBoard/editTache" method="post">
						<div class="modal-header">						
							<h4 class="modal-title">Edit Employe</h4>
							</div>
							<div class="modal-body">

								<div class="form-group" >
									<input for="charge" value="<%=employe.getId() %>" name="id_empl" type="hidden"/>

								</div>
								<%
								
								DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd") ; 
								String date_naissance ; 
								if(employe.getDate_naissance_empl() != null){
									date_naissance = dateFormat.format(employe.getDate_naissance_empl()) ; 
									date_naissance = "<input type='date' id='date_naissance_empl' value='"+date_naissance+"' name='date_naissance_empl' >" ; 
								}else{
									date_naissance = "<input type='date' id='date_naissance_empl' name='date_naissance_empl' >"  ; 
									
								}

								
								
								%>
								
								<div class="form-group" >
									<label for="">date Naissance</label>
									<%= date_naissance%>

								
								</div>
								<div class="form-group" >
									<label for="email_empl">Nom Projet </label>
									<input type="email" id="email_empl" name="email_empl" 
									value=' <%= employe.getEmail_empl() == null ? 
											"--" : employe.getEmail_empl() %> '
									 />
								</div>
								<div class="form-group" >
									<label for="nom_empl">Nom</label>
									<input type="text" id="nom_empl" name="nom_empl" 
									value=' <%= employe.getNom_empl() == null ? 
											"--" : employe.getNom_empl() %> '
									 />
								</div>
								<div class="form-group"  >
									<label for="prenom_empl">Prenom</label>
									<input type="text" id="prenom_empl" name="prenom_empl" 
									value=' <%= employe.getPrenom_empl() == null ? 
											"--" : employe.getPrenom_empl() %> '
									 />
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
									<label for="code_equipe">Code equipe</label>
									<select name="code_equipe" id="code_equipe">
										<c:forEach items="<%= Equipe.getAllEquipes() %>" var="equipe">
											<option value="${equipe.getId()}">${equipe.getNom_equipe()}</option>
										</c:forEach>
									
									</select>
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