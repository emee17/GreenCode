<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<title>Insert title here</title>
</head>
<body>

<div class="container">
<div  class="jumbotron" style="background-image: none;">


<div class="row">

 <div id="messagebox" class="col-lg-8 col-lg-offset-8">
<form action="MedicalMessageControllers" method="post">

	<label>Medicine name :</label>
	<div class="input-group">
<div class="input-group">
<span class="input-group-addon" id="passicon"></span>
<input type="text" class="form-control" name="message_mname" id="message_mname" placeholder="Medicine name">
</div>
</div>


	<label>Quantity :</label>
	<div class="input-group">
<div class="input-group">
<span class="input-group-addon" id="passicon"></span>
<input type="text" class="form-control" name="message_mquantity" id="message_mquantity" placeholder="medicine quantity">
</div>
</div>

<label>Message :</label>
<div class="input-group">
<textarea rows="4" cols="26" placeholder="message" class="form-control" name="message_content" id="message_content"></textarea>
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
</div>

</body>
</html> --%>