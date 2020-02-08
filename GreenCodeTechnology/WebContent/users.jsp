<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>




<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">






<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

 <link rel="icon" type="image/png" href="images/icon/favicon.ico"/>
  <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css"> 
<link rel="stylesheet" type="text/css" href="css/admin_css/util.css">
<link rel="stylesheet" type="text/css" href="css/admin_css/main.css"> 
 <script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 



<style type="text/css">

.form-control{
max-width:250px;
}

.form{

padding: 35px 120px 35px 120px;
}

.register_area{


}


</style>


<title>Insert title here</title>
</head>
<body>

<div class="limiter">
		<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
			<span></span>
				<form class="login100-form validate-form flex-sb flex-w" action="UserLogins" method="post">
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
							EmailId
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="email" name="emailid" required>
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Password
						</span>

						<a href="forgotpassword.jsp" class="txt2 bo1 m-l-5">
							Forgot?
						</a>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" required>
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
					
					
						<button class="login100-form-btn">
						sign
						
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
		<br><br>
		<div class="container">
		<div class="jumbotron" class="register_area" style="background-image: url('images/register_bg_img.jpg');">
		
	<center>	<span style="font-family: arabic typesetting; font-size:5em; font-weight: bold;">Sign up for free</span></center>
		
		<form id="register" class="form" action="RegistrationControllers">
					
					<div class="row">
					<div class="col-lg-6">
						<span class="txt1">
							username
						</span>
					
					<input type="text" name="username" id="username" class="form-control" width="10em" autocomplete="off" required >
					<span class="focus-input100"></span><h5 id="usercheck"></h5>
					</div>
					
					
					<div class="col-lg-6">
						<span class="txt1">
							Password
						</span>
					<input type="password" name="password"  id="password" class="form-control" required>
						<span class="focus-input100"></span><h5 id="passcheck"></h5>
					</div>
					
					</div>
					<br>
					<div class="row">
					<div class="col-lg-6">
						<span class="txt1">
							Address
						</span>
					
					<textarea rows="4" cols="4" class="form-control" name="address" id="address" ></textarea><h5 id="addcheck" required></h5>
					</div>
					
					<div class="col-lg-6">
						<span  class="txt1" >
							Mobile Number
						</span>
						
					<input type="number" name="mobilenumber" class="form-control" id="mobilenumber" ><h5 id="mobcheck" required></h5>
						
					</div>
					
					</div>
					<br>
					
				<div class="row">
					<div class="col-lg-6">
						<span class="txt1">
							Date of Birth
						</span>
					
					<input type="date" name="dob" class="form-control" id="dob" required >
					</div>
					
					<div class="col-lg-6">
						<span class="txt1">
							Email ID
						</span>
					<input type="email" name="emailid" class="form-control" id="emailid" required >
						
					</div>
					
					</div>
					<br><br>
					
						<div class="row">	
						<div class="col-lg-6 col-lg-offset-4">			
						<button class="btn btn-success" type="submit">
							Submit
						</button>
					
					
					
						<button class="btn btn-danger" type="reset">
							Cancel
						</button>
					</div>	
					</div>
					
				</form>
				
				
		</div>
		</div>

	<div id="dropDownSelect1"></div>

<script type="text/javascript">
  
  $(document).ready(function(){
	  $('usercheck').hide();
	  $('passcheck').hide();
	  $('addcheck').hide();
	  $('mobcheck').hide();
	  $('dobcheck').hide();
	  var user_err=true;
	  var user_pass=true;
	  var user_add=true;
	  var user_mob=true;
	  var user_dob=true;
	  
	  $('#username').keyup(function(){
		  check();
	  });
	  
	  function check(){
		  user_val=$('#username').val();
		 
		 if(user_val.length==''){
			 $('#usercheck').show();
			 $('#usercheck').html("**please fill the user name");
			 $('#usercheck').focus();
			 $('#usercheck').css("color","red");
			 user_err=false;
			 return false;
		 } 
		 else{
			 $('#usercheck').hide();
		 }
	  
		 
		 if((user_val.length<3)|| (user_val.length>10)){
			 $('#usercheck').show();
			 $('#usercheck').html("**username length must be between 3 and 10");
			 $('#usercheck').css("color","red");
			 user_err=false;
			 return false;
		 } 
		 else{
			 $('#usercheck').hide();
		 }
		  
	  }
	  
	  $('#password').keyup(function(){
		 checks();  
	  });
	  
	  function checks(){
		  var passstr=$('#password').val();
		  
		  if(passstr.length==''){
			  
			  $('#passcheck').show();
				 $('#passcheck').html("**please fill the password");
				 $('#passcheck').focus();
				 $('#passcheck').css("color","red");
				 user_pass=false;
				 return false;
			  
		  }
		  else{
			  $('#passcheck').hide();
		  }
		  
		  
		  
		  if((passstr.length<8)|| (passstr.length>10)){
				 $('#passcheck').show();
				 $('#passcheck').html("**password length must be between 6 and 10");
				 $('#passcheck').css("color","red");
				 user_pass=false;
				 return false;
			 } 
			 else{
				 $('#passcheck').hide();
			 }
	  }
	  
	  $('#address').keyup(function(){
			 checkadd();  
		  });
	  
	  function checkadd(){
		  var addstr=$('#address').val();
		  
		  if(addstr.length==''){
			  
			  $('#addcheck').show();
				 $('#addcheck').html("**please fill the address");
				 $('#addcheck').focus();
				 $('#addcheck').css("color","red");
				 user_add=false;
				 return false;
			  
		  }
		  else{
			  $('#useradd').hide();
		  }
	  }
	  
	  
	  $('#mobilenumber').keyup(function(){
			 checkmob();  
		  });
	  
	  function checkmob(){
		  var mobstr=$('#mobilenumber').val();
		  
		  if(mobstr.length==''){
			  
			  $('#mobcheck').show();
				 $('#mobcheck').html("**please fill the mobile number");
				 $('#mobcheck').focus();
				 $('#mobcheck').css("color","red");
				 user_mob=false;
				 return false;
			  
		  }
		  else{
			  $('#mobcheck').hide();
		  }
		  
		  
		  if((mobstr.length<10)|| (mobstr.length>10)){
				 $('#mobcheck').show();
				 $('#mobcheck').html("**please fill the 10 digit mobile number");
				 $('#mobcheck').css("color","red");
				 user_mob=false;
				 return false;
			 } 
			 else{
				 $('#mobcheck').hide();
			 }
	  }
	 
	  
	  
  });
  


</script>






</body>
</html>