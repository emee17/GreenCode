<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/png" href="images/icon/favicon.ico"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css">
<link rel="stylesheet" type="text/css" href="css/admin_css/util.css">
	<link rel="stylesheet" type="text/css" href="css/admin_css/main.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form class="login100-form validate-form flex-sb flex-w" action="Session_handler">
					<!-- <span class="login100-form-title p-b-53">
						Sign In With
					</span>

					<a href="#" class="btn-face m-b-20">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>

					<a href="#" class="btn-google m-b-20">
						<img src="images/icon/icon-google.png" alt="GOOGLE">
						Google
					</a> -->
					
					<div class="p-t-31 p-b-9">
						<span class="txt1">
							Username
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" name="admin" id="admin" autocomplete="off">
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Password
						</span>

						<a href="#" class="txt2 bo1 m-l-5">
							Forgot?
						</a>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" id="password">
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="submit">
							Sign In
						</button>
					</div>

					<div class="w-full text-center p-t-55">
						<span class="txt2">
							Not a member?
						</span>

						<a href="#register" class="txt2 bo1">
							Sign up now
						</a>
					</div>
				</form>
			</div>
			
		</div>
		</div>
		
		
			
	

	<div id="dropDownSelect1"></div>


 <script>

 function validation()
{
	var admin = document.getElementById("admin").value;
	var password = document.getElementById("admin").value;
	
	if((admin=="")||(password==""))
		{
			alert('Enter credentials');
			
			
		} 
	
	if((admin=="admin")&&(password=="password"))
		{
		alert("hello");
		window.location.href="mains.jsp";
		return false;
		}
	}

</script>  





</body>
</html>