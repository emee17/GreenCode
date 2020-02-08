    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.medical.beans.UserRegistrationBeans" import="java.util.*" import="src.com.medical.serviceImpl.MedicalServicesImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

 <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>


</head>
<body style="padding-top:0px;">
<div class="container">
<div style="float: right; margin-top: 60px"><a href="Logout" class="btn btn-info btn-lg">
<span class="glyphicon glyphicon-log-out" ></span> Log out</a></div>
<div class="navbar navbar-inverse navbar-fixed-top"></div></div>
 

<%
MedicalServicesImpl mediservice = new MedicalServicesImpl();
List<UserRegistrationBeans> mssglist = mediservice.getAllRegistrationList();
%>

 <%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("admin.jsp");
}

%> 



<div class="container">
<div class="navbar navbar-inverse navbar-fixed-top">

<ul class="nav navbar-nav">
<li class="active"><a href="mains.jsp">Medicine details</a></li>
<!-- <li><a href="#"></a></li> -->
<!-- <li><a href="medicinestock">Medicine Stock</a></li> -->
<li class="active"><a href="inboxs.jsp">GuestMessageInbox</a></li>
<li class="active"><a href="registerlist.jsp">RegistrationDetail</a></li>
<li class="active"><a href="permanentquerylist.jsp">PermanentusermessageInbox</a></li>
<li><a href="#"></a></li>
<!-- <li><a href="">Medicine Stock</a></li> -->


<!-- <li class="navbar-right"><span class="glyphicon glyphicon-login"></span><a href="Logout">logout</a> -->
</ul>
</div>
<center><h3 style="color:blUE;">REGISTRATION USERS DETAILS</h3></center>

<div class="jumbotron">

<div class="message_table">





<!--  <tr class="success">

<div class="page-header pull-right">
	<form action=""></form>
	<input type="text" name="search" id="myInput" class="form-control"> &nbsp;<button class=" btn btn-success glyphicon glyphicon-search"></button> -->

<table class="table table-bordered table-striped display" "   id="myTable">	
<thead>

<tr class="success">
</div>
<td>user id</td>	
<td>user name</td>
<td>password </td>
<td>address</td>
<td> mobile number </td>
<td>Dob </td>
<td>email id</td>
<td>delete</td></tr>
</thead>
<tbody>

<% 
for(UserRegistrationBeans mmb: mssglist)
{
%>
<tr id="main_content">
<td><%=mmb.getUser_id() %></td>
<td><%=mmb.getUsername()%></td>
<td><%=mmb.getPassword()%></td>
<td><%=mmb.getAddress() %></td>
<td><%=mmb.getMobile_number() %></td>
<td><%=mmb.getDob() %></td>
<td><%=mmb.getEmailid() %></td>


<td><a href="#" onclick="deleteRow('<%=mmb.getUser_id()%>')" id="user_id" name="user_id">Delete</a></td></tr>




<!-- <td><a href='DeleteInbox?id="+mmb.getMessage_id()+"'>delete</a></td> -->

<%} %>
</tbody>
</table>






<script type="text/javascript">

function deleteRow(mid)
{
	if(!confirm("Are you sure to delete the Record")){
		return false;
	}
	var req = new XMLHttpRequest();
	req.open("GET","DeleteRegistration?user_id="+mid,true);
	req.send();
	req.onreadystatechange = function()
	
	{

	if((req.readyState == 4)&&(req.status==200))
		{
			window.location.href="registerlist.jsp";
		}
	}
	
}


/* function deleteRow(id){
	if(!confirm("Are you sure for delete data")){
	return false;
	
}
	 $('#user_id').val(id);
	$('#btnClicked').val(Delete);
	document.medi_control.submit(); 
} */
 

$(document).ready(function() {
	//alert(1234);
	
    $('#myTable').DataTable({
    	"order":[[0,"desc"]]
    });
    
});


</script>


</div></div>



	
	


</body>
</html>