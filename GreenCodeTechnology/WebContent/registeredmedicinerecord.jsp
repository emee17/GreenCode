<%--     <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.medical.beans.AddMultipleColumnBeans" import="java.util.*" import="src.com.medical.serviceImpl.MedicalServicesImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body style="padding-top:70px;">
 

<%
MedicalServicesImpl mediservice = new MedicalServicesImpl();
List<AddMultipleColumnBeans> urb1 = mediservice.getAllPermanentQueryList();
%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("Username")==null)
{
	response.sendRedirect("users.jsp");
}

%> 

<div class="container">
<div class="navbar navbar-inverse navbar-fixed-top">

<ul class="nav navbar-nav">
<li class="active"><a href=""></a></li>
<li><a href="#"></a></li>
<li><a href=""></a></li>


<li class="navbar-right"><span class="glyphicon glyphicon-login"></span><a href="Logout">logout</a>
</ul>
</div>

<div class="jumbotron">
<div class="message_table">
<table class="table table-bordered" id="myTable">
<!-- <div class="page header pull-left">
<div class="row">
<div class="col-lg-6">
Form<input type="date" name="from" id="from" class="form-control"></div>
<div class="col-lg-6">
To<input type="date" name="to" id="to" class="form-control"></div>

</div>
</div>
</div> -->





 <tr class="success">

<div class="page-header pull-right">
	<form action=""></form>
	<input type="text" name="search" id="myInput"> &nbsp;<button class=" btn btn-success glyphicon glyphicon-search"></button> 
	
</div>
<td>User id</td>	
<!-- <td>Username</td>
<td>Address </td>
<td>Mobile number</td> -->
<td>Medicine name </td>
<td>Vat </td>
<td>Quantity</td>
<td>Price</td>
<td>Date and Time</td>
<td>Status</td>
<!-- <td>Reply</td>
<td>Delete</td></tr> -->


<% 
for(AddMultipleColumnBeans urb:urb1)
{
%>
<tr id="main_content">
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


<td><a href="#" onclick="tocheckmessage('<%=urb.getUserid() %>')" id="mid" name="mid">Reply</a></td>

<td><a href="#" onclick="deleteRow('<%=urb.getUserid()%>')" id="userid" name="userid">Delete</a></td></tr>



<!-- <td><a href='DeleteInbox?id="+mmb.getMessage_id()+"'>delete</a></td> -->

<%} %>
</table>


<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable,#main_content").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

</script>








<!-- <script>
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
	</script> -->

<script type="text/javascript">

function deleteRow(mid)
{
	var req = new XMLHttpRequest();
	req.open("GET","DeletePermanentUser?userid="+mid,true);
	req.send();
	req.onreadystatechange = function()
	
	{

	if((req.readyState == 4)&&(req.status==200))
		{
			window.location.href="registeredmedicinerecord.jsp";
		}
	}
	
}


</script>


</div>
</div>


	
	


</body>
</html> --%>









Exception in thread main java.lang.ArithmeticException:/ by zero
public class Testtrycatch2{  
  public static void main(String args[]){  
   try{  
      int data=50/0;  
   }catch(ArithmeticException e){System.out.println(e);}  
   System.out.println("rest of the code...");
   
   this.val=20;  
}  
}


















