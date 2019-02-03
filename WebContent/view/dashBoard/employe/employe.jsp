<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.greenIt.Model.Employe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employes</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
    body {
        color: #566787;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
		font-size: 13px;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: 30px 0;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-title {        
		padding-bottom: 15px;
		background: #435d7d;
		color: #fff;
		padding: 16px 30px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		color: #fff;
		float: right;
		font-size: 13px;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 60px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
        margin: 0 5px;
    }
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
		outline: none !important;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}

  
	/* Custom checkbox */
	.custom-checkbox {
		position: relative;
	}
	.custom-checkbox input[type="checkbox"] {    
		opacity: 0;
		position: absolute;
		margin: 5px 0 0 3px;
		z-index: 9;
	}
	.custom-checkbox label:before{
		width: 18px;
		height: 18px;
	}
	.custom-checkbox label:before {
		content: '';
		margin-right: 10px;
		display: inline-block;
		vertical-align: text-top;
		background: white;
		border: 1px solid #bbb;
		border-radius: 2px;
		box-sizing: border-box;
		z-index: 2;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		content: '';
		position: absolute;
		left: 6px;
		top: 3px;
		width: 6px;
		height: 11px;
		border: solid #000;
		border-width: 0 3px 3px 0;
		transform: inherit;
		z-index: 3;
		transform: rotateZ(45deg);
	}
	.custom-checkbox input[type="checkbox"]:checked + label:before {
		border-color: #03A9F4;
		background: #03A9F4;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		border-color: #fff;
	}
	.custom-checkbox input[type="checkbox"]:disabled + label:before {
		color: #b8b8b8;
		cursor: auto;
		box-shadow: none;
		background: #ddd;
	}
	/* Modal styles */
	.modal .modal-dialog {
		max-width: 400px;
	}
	.modal .modal-header, .modal .modal-body, .modal .modal-footer {
		padding: 20px 30px;
	}
	.modal .modal-content {
		border-radius: 3px;
	}
	.modal .modal-footer {
		background: #ecf0f1;
		border-radius: 0 0 3px 3px;
	}
    .modal .modal-title {
        display: inline-block;
    }
	.modal .form-control {
		border-radius: 2px;
		box-shadow: none;
		border-color: #dddddd;
	}
	.modal textarea.form-control {
		resize: vertical;
	}
	.modal .btn {
		border-radius: 2px;
		min-width: 100px;
	}	
	.modal form label {
		font-weight: normal;
	}	
    
HTML  CSS Result
EDIT ON
 body {
  margin: 0;
  padding: 0;
  background: #ccc;
}
 
.nav ul {
  list-style: none;
  background-color: #444;
  text-align:right;
  padding: 0;
  margin: 0;
}
.nav li {
  font-family: 'Oswald', sans-serif;
  font-size: 1.2em;
  line-height: 40px;
  height: 40px;
  border-bottom: 1px solid #888;
}
 
.nav a {
  text-decoration: none;
  color: #fff;
  display: block;
  transition: .3s background-color;
}
 
.nav a:hover {
  background-color: #566787;
}
 
.nav a.active {
  background-color: #fff;
  color: #444;
  cursor: default;
}
 
@media screen and (min-width: 600px) {
  .nav li {
    width: 120px;
    border-bottom: none;
    height: 50px;
    line-height: 50px;
    font-size: 1.4em;
  }
 
  /* Option 1 - Display Inline */
  .nav li {
    display: inline-block;
    margin-right: -4px;
  }
 

}
Resources
</style>

</head>
<body>



    
    
    <header>
        <div class="nav">
              <ul>
              	
 
              	<li style="text-align: center"><a href="${pageContext.request.contextPath}/dashBoard">DashBoard</a></li>
              	<li style="text-align: center"><a href="${pageContext.request.contextPath}/dashBoard/employe/equipe">Equipe</a></li>
				<li style="text-align: center"><a href="${pageContext.request.contextPath}/dashBoard/logOut" >Déconnection</a> </li>
				</ul>
        </div>
  </header>
    
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Employe</h2>
					</div>
					<div class="col-sm-6">
						<a href="${pageContext.request.contextPath}/dashBoard/employe/createEmploye" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Create Employe</span></a>
					
					</div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
				    <tr>
						<th scope="col">Nom</th>
						<th scope="col">Prenom</th>
						<th scope="col">Email</th>
						<th scope="col">Date Naissance</th>
						<th scope="col">Role</th>
						<th scope="col">Nom Equipe</th>
						<th scope="col">&nbsp;</th>
						<th scope="col">&nbsp;</th>
				    </tr>
                </thead>
                <tbody>
					  <%
						
					 	DateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd") ; 
					  	List<Employe> allEmployes = ((List<Employe>) request.getAttribute("allEmployes") ) ; 
					  	int myId = ((Employe) session.getAttribute("employe")).getId() ; 

					  %>

					<%for(Employe employe :  allEmployes){ %>
						<%if(myId != employe.getId()){ %>
						<tr>
						    <td><%=employe.getNom_empl()  %></td>
						    <td>  <%= employe.getPrenom_empl() %></td>
						    <td><%= employe.getEmail_empl() %></td>
						    <td>
						    <%=  employe.getDate_naissance_empl() == null ? "---" : simpleDateFormat.format(employe.getDate_naissance_empl() ) %>

						    </td>
						    <td><%= employe.getRole_empl()  %></td>
						    <td><%= employe.getEquipe() == null ? "---" : employe.getEquipe().getNom_equipe() %></td>

							<td>
								<a href="${pageContext.request.contextPath}/dashBoard/employe/editEmploye?id_empl=<%= employe.getId()%>" class="edit"><i class="material-icons" title="Edit">&#xE254;</i></a>
							</td>

							<td>
								<a href="${pageContext.request.contextPath}/dashBoard/employe/deleteEmploye?id_empl=<%= employe.getId()%>" class="delete" ><i class="material-icons" title="Delete">&#xE872;</i></a>
							</td>
						</tr>
						
						<%} %>
					<%} %>
                    
                </tbody>
            </table>

        </div>
    </div>
	
	

</body>
</html>            