<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src=""></script> 
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="navbar navbar-inverse navbar-fixed-top">

<ul class="nav navbar-nav">
<li class="active"><a href="#">Home</a></li>
	<!-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">login<span class="caret"></span></a>

	
	<ul class="dropdown-menu">
	<li><a href="admin.jsp" id="admin" >Admin</a>
	<li><a href="users.jsp" id="user id">User</a>
</ul>
</li> -->

<li class="active"><a href="users.jsp">Login</a></li>
</ul>
</div>
<script>
	function validation(){
		alert("your medicine sent successfully")
	}
</script>

<div  class="jumbotron">
 <div class="row"> 
 <div id="messagebox" class="col-lg-8 col-lg-offset-8">
<form action="MedicalMessageControllers" method="post" onsubmit="return validation()">
<label>Medicine name :</label>
<div class="input-group">
<div class="input-group">
<span class="input-group-addon" id="passicon"></span>
<input type="text" class="form-control" name="message_mname" id="message_mname" placeholder="Medicine name" required>
</div>
</div>
<label>Quantity :</label>
<div class="input-group">
<div class="input-group">
<span class="input-group-addon" id="passicon"></span>
<input type="text" class="form-control" name="message_mquantity" id="message_mquantity" placeholder="medicine quantity" required>
 </div>
</div> 
	<!--  <label>Location :</label>
	<div class="input-group">
<div class="input-group">
<span class="input-group-addon" id="passicon"></span>
	<select name="location" id="css">
	<option >Select your Near Location</option>
	<option>Kalyan</option>
	<option>Thane</option>
	<option>Kurla</option>
	<option>Ghatcopar</option>
	<option>CST</option>
	</select></div>
</div> -->
	

<label>Message :</label>
<div class="input-group">
<textarea rows="4" cols="26" placeholder="message" class="form-control" name="message_content" id="message_content" required></textarea>
</div>
<br>

<div class="form-group">
<input type="submit" class="btn btn-success" value="send">
<input type="reset" class="btn btn-danger" value="cancel">

</div>
	
</form>
</div> 
</div>
</div> 
  

<!-- <div class="col-lg-6 col-lg-offset-4" id="loginpanel">


<div class="form-group">

<label id="credentials">Username :</label>
<div class="input-group">
<span class="input-group-addon" id="usericon"><i class="glyphicon glyphicon-user"></i></span>
<input type="text" class="form-control" name="admin" id="admin" placeholder="Admin name">
</div>
</div>


<div class="form-group">
<label id="credentials">Password :</label>
<div class="input-group">
<span class="input-group-addon" id="passicon"><i class="glyphicon glyphicon-lock"></i></span>
<input type="Password" class="form-control" name="password" id="password" placeholder="Admin password">
</div>
</div>

<br>
<div class="form-group">
<button class="btn btn-success" value="submit" onclick="validation()">submit</button>
<input type="reset" class="btn btn-danger" value="cancel">
</div>
</div>
</div>
 -->
<!-- <script type="text/javascript">

 function validation()
{
	var admin = document.getElementById("admin").value;
	var password = document.getElementById("password").value;
	
	if((admin=="")||(password==""))
		{
			alert('Enter credentials');
			return false;
			
		} 
	
	if((admin=="admin")&&(password=="admin"))
		{
		window.location.href="main.jsp";
		}
	}

</script>  -->
</body>
</html>