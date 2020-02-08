

 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.medical.beans.MedicalMessageBeans" import="java.util.*" import="src.com.medical.serviceImpl.MedicalServicesImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css">
 <!-- <link rel="stylesheet" href="css/management.css">  -->
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
<body style="padding-top:100px;">

 

<%
String from = request.getParameter("fromDate");
String to=request.getParameter("toDate");
/*  System.out.println("from " + from );
System.out.println("to  " + to );  */
MedicalServicesImpl mediservice = new MedicalServicesImpl();
List<MedicalMessageBeans> mssglist = null;
 if(to!=null && from !=null && !from.equals("") )
 {
 mssglist = mediservice.getAllMessageByDate(from,to);
 }
 else
 {
	 mssglist = mediservice.getAllMessage(); 
 }
%>
 <%-- <%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("Username")==null)
{
	response.sendRedirect("admin.jsp");
}

%> --%>




<div class="container">
<div style="float: right; margin-top: 5px"><a href="Logout" class="btn btn-info btn-lg">
<span class="glyphicon glyphicon-log-out" ></span> Log out</a></div>
<div class="navbar navbar-inverse navbar-fixed-top">

<ul class="nav navbar-nav">
<li class="active"><a href="mains.jsp">Medicine details</a></li>
<!-- <li><a href="#"></a></li> -->
<!-- <li><a href="medicinestock">Medicine Stock</a></li> -->
<li class="active"><a href="inboxs.jsp">GuestMessageInbox</a></li>
<li class="active"><a href="registerlist.jsp">RegistrationDetail</a></li>
<li class="active"><a href="permanentquerylist.jsp">PermanentusermessageInbox</a></li>>

<li><a href="#"></a></li>
<!-- <li><a href="medicinestock">Medicine Stock</a></li> -->
<!-- <li><a href="inboxs.jsp">Message Inbox</a></li> -->


</ul>
</div>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("admin.jsp");
}
%>
<center><b><h3 style="color:BLUE;">WITHOUT LOGIN USERS QUERY</h3></b></center>

<form action="inboxs.jsp" method="post">
<div class="jumbotron" style="height: 760px;">

<div class="message_table">

<!-- <table class="table table-bordered table-striped  display"   id="myTable">  -->
 
<div class="page header pull-left">
<div class="row" style="margin-top: -50px;">

<div class="col-lg-4">
From<input type="date" name="fromDate" id="fromDate" <%-- value=<%=from%> --%> class="form-control"></div>

<div class="col-lg-4">
To<input type="date" name="toDate" id="toDate" <%-- value=<%=to%> --%>  class="form-control"><br></div>

<div class="col-lg-4"><br>
<input type="submit" value="submit" class="btn btn-primary"></div></div></form>

<!-- <input type="reset" value="reset" onclick="resetField()"></form> -->







<!-- <tr class="success">

<div class="page-header pull-right">
	
	<input type="text" name="search" id="myInput" class="form-control" placeholder="search any data"> &nbsp;<span class="glyphicon glyphicon-search"></span>
	
	</div> -->
	<br>
	<div class=row>
	<div class="col-lg-12 col-lg-offset-0">
	
	
<table class="table table-bordered table-striped display" "   id="myTable">  
 <thead>
 <tr class="success"> 

<td> Message ID</td>
<td> Medicine name </td>
<td> Quantity</td>
<!-- <td> location</td> -->
<td> Message </td>
<td> Date and Time </td>
<td>Status</td>
<!-- <td>Reply</td> -->
<td>Delete</td>
</tr>
</thead>
<tbody>
<!-- <tbody id="myTable"> -->
<% 
for(MedicalMessageBeans mmb: mssglist)
{
%>
 <tr id="main_content"> 

<% if (mmb.getStatus().equals("seen")){ %>
<td><%=mmb.getMessage_id()%></td>
<td><%=mmb.getMessage_medicine_name()%></td>
<td><%=mmb.getMessage_medicine_quantity() %></td>
<%-- <td><%=mmb.getLocation() %> --%>
<td><%=mmb.getMessage_content() %></td>
<td><%=mmb.getMessage_date() %></td>
<td id="status" ><%=mmb.getStatus() %></td>
<% }else{%>
<td><b><%=mmb.getMessage_id()%></b></td>
<td><b><%=mmb.getMessage_medicine_name()%></b></td>
<td><b><%=mmb.getMessage_medicine_quantity() %></b></td>
<%-- <td><b><%=mmb.getLocation() %></b> --%>
<td><b><%=mmb.getMessage_content() %></b></td>
<td><b><%=mmb.getMessage_date() %></b></td>
<td id="status" ><b><a href="#" style="color:black;" onclick="tocheckmessage('<%=mmb.getMessage_id() %>')" id="mid" name="mid"><%=mmb.getStatus() %></a></b></td>
<%} %>

<%-- <td><a href="#" onclick="tocheckmessage('<%=mmb.getMessage_id() %>')" id="mid" name="mid">Reply</a></td> --%>
<td><a href="#" onclick="deleteRow('<%=mmb.getMessage_id()%>')" id="message_id" name="message_id">Delete</a></td></tr>


<!-- <td><a href='DeleteInbox?id="+mmb.getMessage_id()+"'>delete</a></td> -->

<%} %>

 </tbody>
</table>
</div>
 <script>
/* $(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable,#main_content").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
}); */




$(document).ready(function() {
	//alert(1234);
	
    $('#myTable').DataTable({
    	"order":[[0,"desc"]]
    });
    
});


</script> 

</div>
</div>


</div>


<script>



function tocheckmessage(mid)

{

	
	var req = new XMLHttpRequest();
	req.open("GET","CheckMessage?mid="+mid,true);
req.send();
	
	req.onreadystatechange = function()
	{
		if((req.readyState == 4)&&(req.status == 200))
			{
			window.location.href="inboxs.jsp";
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
	req.open("GET","DeleteMessages?message_id="+mid,true);
	req.send();
	req.onreadystatechange = function()
	
	{

	if((req.readyState == 4)&&(req.status==200))
		{
			window.location.href="inboxs.jsp";
		}
	}
	
}







</script>
	
	


</body>
</html>