    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" import="src.com.medical.beans.AddMultipleColumnBeans" import="java.util.*" import="src.com.medical.serviceImpl.MedicalServicesImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootsrap.css">
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
<body style="padding-top:70px;">
 

<%
String from = request.getParameter("fromDate");
String to=request.getParameter("toDate");
MedicalServicesImpl mediservice = new MedicalServicesImpl();
List<AddMultipleColumnBeans> urb1 = null;
if(to!=null && from !=null && !from.equals("") )
{
urb1 = mediservice.getAllPermanentQueryListByDate1(from,to);
}
else
{
	  urb1 = mediservice.getAllPermanentQueryList(); 
}
%>


<div class="container">
<div style="float: right; margin-top: -8px"><a href="Logout" class="btn btn-info btn-lg">
<span class="glyphicon glyphicon-log-out" ></span> Log out</a></div>
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



</ul>

</div> 
<center><h3 style="color:blUE;">REGISTRATION USERS QUERY</h3></center>
 
  <%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("admin.jsp");
}

%> 
<form action="permanentquerylist.jsp" method="post">
<div class="jumbotron">


<div class="container">
<div class="message_table">
<!-- <table class="table table-bordered table-striped display" id="myTable"> -->

<div class="page header pull-left"> 
<!-- <div class="row"> -->
<div class="row" style="margin-top: -50px;">
<div class="col-lg-4">
 From<input type="date"  name="fromDate" id="fromDate"  class="form-control" > 
</div>
<div class="col-lg-4">
 To<input type="date"  name="toDate" id="toDate" class="form-control" ></div>
 <div class="col-lg-4"><br>
<input type="submit" value="submit" class="btn btn-primary"></div>
<!-- <input type="reset" value="reset" onclick="resetField()"></form> -->

</form>
</div>
<br>




<!--  <tr class="success">

<div class="page-header pull-right">
<form action=""></form>
	<input type="text" name="search" id="myInput" class="form-control" placeholder="search any data"> &nbsp;<button class=" btn btn-success glyphicon glyphicon-search"></button> 
	
</div> -->
<table class="table table-border table-striped display" id="myTable">
<thead>
 <tr class="success">


<td>User id</td>	
<td>Username</td>
<td>Address </td>
<td>Mobile number</td>
<td>Medicine name </td>
<td>Vat </td>
<td>Price</td>
<td>Quantity</td>

<td>Date and Time</td>
<td>Status</td>
<!-- <td>Reply</td> -->
<td>Delete</td></tr></thead>
<tbody>


<% 
for(AddMultipleColumnBeans urb:urb1)
{
%>
<tr id="main_content">
<%if(urb.getStatus().equals("seen")){ %>
<td><%=urb.getUserid() %></td>
<td><%=urb.getUsername()%></td>
<td><%=urb.getAddress() %></td>
<td><%=urb.getMobile_number() %></td>
<td><%=urb.getMedicinename() %></td>
<td><%=urb.getVat() %></td>
<td><%=urb.getQuantity() %></td>
<td><%=urb.getPrice() %></td>
<td><%=urb.getDate() %></td>
<td id="status" ><%=urb.getStatus() %></td>

<%}else{ %>

<td><b><%=urb.getUserid() %></b></td>
<td><b><%=urb.getUsername()%></b></td>
<td><b><%=urb.getAddress()%></b></td>
<td><b><%=urb.getMobile_number() %></b></td>
<td><b><%=urb.getMedicinename() %></b></td>
<td><b><%=urb.getVat() %></b></td>
<td><b><%=urb.getQuantity() %></b></td>
<td><b><%=urb.getPrice() %></b></td>
<td><b><%=urb.getDate() %></b></td>
<td id="status" ><b><a href="#" style="color:black;" onclick="tocheckmessage('<%=urb.getUserid() %>')" id="mid" name="mid"><%=urb.getStatus() %></a></b></td>
<%} %>


<%-- <td><a href="#" onclick="tocheckmessage('<%=urb.getUserid() %>')" id="mid" name="mid">Reply</a></td> --%>

<td><a href="#" onclick="deleteRow('<%=urb.getUserid()%>')" id="userid" name="userid">Delete</a></td></tr>



<!-- <td><a href='DeleteInbox?id="+mmb.getMessage_id()+"'>delete</a></td> -->

<%} %>
</tbody>
</table>



                             <script>
					
										$(document).ready(function() {
										//alert(123)
											
										    $('#myTable').DataTable({
										    	
										    	"order":[[0,"desc"]]
										    });
										});
				              </script> </div></div>


<!--  <script type="text/javascript">
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable,#main_content").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

</script> --> 

<!-- <script>
$(document).ready(function(){
	$.datepicker.setDefaults({
		dateFormat:'yy-mm-dd'
	});
	
	$(function(){
		
		$("#from_date").datepicker();
		$("#to_date").datepicker();
			
	});
	$('#submit').click(function(){
		
		
	var from_date=$('#fromm_date').val();
	var to_date=$('#to_date').val();
	if(from_date!='' && to_date!='')
		{
		$.ajax({
			
			url:"DateSearch"
		     method="GET"
		     Date:{from_date:from_date,to_date:to_date}
			 success:function(data)
			
		});
		
		
		
		
		
		}
	else
		{
		alert("please select date");
		}
	});
	
} -->














<script>
function tocheckmessage(mid)
{
	
	
	
	
	var req = new XMLHttpRequest();
	req.open("GET","CheckMessagePermanent?mid="+mid,true);
req.send();
	
	req.onreadystatechange = function()
	{
		if((req.readyState == 4)&&(req.status == 200))
			{
			window.location.href="permanentquerylist.jsp";
			//document.getElementById("status").innerHTML = 'seen';
			
			
			
			}
		
		
			}
	}
	
/* function resetField(mid)
{	
document.getElementById("fromDate").value ="";
document.getElementById("toDate").value ="";
	
} */
	
	</script>

<script type="text/javascript">

function deleteRow(mid)
{
	if(!confirm("Are you sure to delete the Record")){
		return false;
	}
	var req = new XMLHttpRequest();
	req.open("GET","DeletePermanent?userid="+mid,true);
	req.send();
	req.onreadystatechange = function()
	
	{

	if((req.readyState == 4)&&(req.status==200))
		{
			window.location.href="permanentquerylist.jsp";
		}
	}
	
}


</script>


</div>
</div>


	
	


</body>
</html>