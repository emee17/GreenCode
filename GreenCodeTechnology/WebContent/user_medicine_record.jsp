 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="src.com.util.query.ConnectionPack"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootsrap.css">



 <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
  <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

</head>


<title>Insert title here</title>

<style type="text/css">
#a{
padding-right: 20px;
color: YELLOW;

}
#div{
background-color: green;width: 100%;height: 40px;
margin-top: 5px;
}

</style>


<div id="div">

<a href="AddColumn" id="a">Buymedicine</a>
<a href="show_profile.jsp" id="a">Show profile</a>
 <a href="user_medicine_record.jsp" id="a">show own medicine record</a> 
<a href=""></a>
</div>




<%
String username= (String)request.getSession().getAttribute("username");
out.println(username);
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if(session.getAttribute("username")==null)
  {
  	response.sendRedirect("users.jsp");
  }
  %>
<body>
<div class="container">
<center><h1 style="color:blUE;"> USER MEDICINE RECORD</h1></center>
<div style="float: right; margin-top: -85px"><a href="UserSessionLogout" class="btn btn-info btn-lg">
<span class="glyphicon glyphicon-log-out" ></span> Log out</a></div>
<div class="container">
<div class="jumbotron" style="margin-top: 20px;">
<table  class="table table-striped table-bordered" id="myTable">

<thead>
<tr class="success">
<td>Medicine name</td>
<td>Mg</td>
<td>Price</td>
<td>Quantity</td>
<td>Date</td>

</tr></thead>
<tbody>
<%
try
{
Connection con = ConnectionPack.getConnection();
String name = session.getAttribute("username").toString();
System.out.print(name);
PreparedStatement pst = con.prepareStatement("select * from multiple where email_id=?");
pst.setString(1,name);
ResultSet rs = pst.executeQuery();
while(rs.next())
{
%>

<tr>
<%-- <td><%=rs.getString(2)%></td> --%>

<td><%=rs.getString(2)%></td>
<td><%=rs.getInt(3)%></td>
<td><%=rs.getInt(4)%></td>
<td><%=rs.getInt(5)%></td>
<td><%=rs.getString(8)%></td>
<%-- <td><%=rs.getString(9)%></td> --%>
</tr>
<%
}
}
catch(Exception e)
{
	e.printStackTrace();
}

%></tbody>
</table>
<script type="text/javascript">
$(document).ready(function() {
	//alert(1234);
	
    $('#myTable').DataTable()
    
});
</script>






</div>
</div>
</body>
</html>