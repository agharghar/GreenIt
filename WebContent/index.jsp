<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<title>GreenIt</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<link href="/styles/css/login.css" rel="stylesheet" type="text/css"/>
	
		<style type="text/css">

body{
	background:url("https://wallpaperhd.guru/wp-content/uploads/2017/05/Desktop-Water-Wallpaper-HD-1920x1080.jpg?fbclid=IwAR20cXaj39V3bD6O8nkCqzukKWrVazGQ8MoIwIc1OOF-Xk1un67EgOE5IRo") no-repeat;
	overflow-y:scroll;
	
	}

#log{
		 
		 padding:60px 40px;
		 margin-top:80px;
		 -webkit-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
		-moz-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
		box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
		}
		img{ width:150px;
			margin:auto;
		}
		h2{
		display: block;
		color:white;
		text-align:center;
		font-weight:bolder;
		margin-top:-20px;
		  background: -webkit-linear-gradient(#5cb85c, #008cdd);
		  -webkit-background-clip: text;
		  -webkit-text-fill-color: transparent;
		}
		label{
		    font-size:20px; color:white;
		    background: -webkit-linear-gradient(#fff, #008cdd);
		   -webkit-background-clip: text;
		   -webkit-text-fill-color: transparent;
		    }
		button{

		-webkit-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
		-moz-box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
		box-shadow: -5px 2px 62px 8px rgba(0,0,0,0.75);
		}


</style>
	
	</head>
	<body>
	<div class="container-fluid bg">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<form action="${pageContext.request.contextPath}/login" method="post" id="log">
				<h2> Bienvenue à <span> GreenIt</span></h2>
					<div class="form-group">
						<label>Email</label>
						<input type="email" class="form-control" maxlength="100" required="required" name="email" placeholder="email">
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" class="form-control" maxlength="10" required="required" name="password" placeholder="password">
					</div>
					<button type="submit" class="btn btn-success btn-block ">Login</button>
				</form>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
		</div>
	</div>
	</body>
</html>