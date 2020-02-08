<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="src.com.util.query.*" import="java.sql.*" import="src.com.medical.beans.UserRegistrationBeans"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" >
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootsrap.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#a{
padding-right: 20px;
color:yellow;

}
#div{
background-color: green;width: 100%;height: 40px;
margin-top: 5px;
}

</style>

<div id="div">

<a href="addcolumn.jsp" id="a">Buymedicine</a>
<a href="show_profile.jsp" id="a">Show profile</a>
<a href="user_medicine_record.jsp" id="a">Show own Medicine record</a>
<!-- <a href="user_medicine_record.jsp" id="a">show medicine</a> -->
<a href=""></a>
</div>




</head>

<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if(session.getAttribute("username")==null)
  {
  	response.sendRedirect("users.jsp");
  }
  %>
<% 
String username1= (String)request.getSession().getAttribute("username");
out.println(username1);
UserRegistrationBeans urb = new UserRegistrationBeans();
String s=session.getAttribute("username").toString();

int user_id=0;
String uname="";
String password="";
String address="";
String mobile_number="";
String email_id="";
String dob="";
try

{  
	Connection con=ConnectionPack.getConnection();
	PreparedStatement ps = con.prepareStatement("select *  from user_registration where email_id=?");
	ps.setString(1,s);
    ResultSet result=ps.executeQuery();
   
    
	while(result.next()) {
		
		user_id=result.getInt("user_id");
		uname=result.getString("username");
		password=result.getString("password");
		address=result.getString("address");
		mobile_number=result.getString("mobile_number");
		email_id=result.getString("email_id");
		dob=result.getString("dob");	
		
	}
	urb.setUser_id(user_id);
	urb.setUsername(uname);
	urb.setPassword(password);
	urb.setAddress(address);
	urb.setMobile_number(mobile_number);
	urb.setEmailid(email_id);
	urb.setDob(dob);
}
	
catch(Exception e)
{
	e.printStackTrace();

}
%>
<CENTER>
<h1>PROFILE</h1></CENTER>

<div class="container">
<div style="float: right; margin-top: -85px"><a href="UserSessionLogout" class="btn btn-info btn-lg">
<span class="glyphicon glyphicon-log-out" ></span> Log out</a></div>
<!-- <div class="container">
<div class="jumbotron" style="margin-top: 60px;"> -->
<!-- <table  class="table table-striped table-bordered">
<tr class="success"></tr></table></div> -->
<div class="row">
			<div class="col-md-6 col-md-offset-3" >
			<table class="table table-bordered table-striped  display">


<tr>
<td>user id</td>
<td><%out.print(user_id);%></td></tr>
<tr>	
<td>user name</td>
<td><%out.print(uname);%></td></tr>
<%-- <tr>
<td>password </td>
<td><%out.print(password);%></td></tr>
<tr> --%>
<td>address</td>
<td><%out.print(address);%></td></tr>

<tr>
<td> mobile number </td>
<td><%out.print(mobile_number); %></td></tr>
<tr>
<td>email id</td>
<td><%out.print(email_id);%></td></tr>
<tr>
<td>Dob </td>
<td><%out.print(dob); %></td></tr>


<%-- <td>Edit</td>
</tr>

<tr>
<td><%out.print(user_id);%></td>
<td><%out.print(uname);%></td>
<td><%out.print(password);%></td>
<td><%out.print(address);%></td>
<td><%out.print(mobile_number); %></td>
<td><%out.print(email_id);%></td>
<td><%out.print(dob); %></td>
<td><a href="#" id="edit" onclick="edit('<%=urb.getUser_id()%>','<%=urb.getUsername()%>','<%=urb.getPassword()%>','<%=urb.getAddress()%>','<%=urb.getMobile_number()%>','<%=urb.getEmailid()%>','<%=urb.getDob()%>')">Edit</a>
</tr> --%>

<!-- </table>
<div id="profile_edit_form">

<form action="UpdateUserProfile">
<center>
ID<input type="text" readonly="readonly" id="id" name="id"><br>
User_name<input type="text" name="username" value="" id="username"><br>
Password<input type="password" name="password" id="password"><br>
Address<input type="text" name="address" id="address"><br>
Mobile<input type="text" name="mobile_number" id="mobile_number"><br>
Email id<input type="text" name="emailid" id="emailid"><br>
Dob<input type="date" name="dob" id="dob"><br>
<input type="submit" value="submit"></center>
</form>

</div> -->



<!-- <script>
function edit(userid,username,password,address,mobile_number,eamailid,dob)

{
	
	$('#id').val(userid);
	$('#username').val(username);
	$('#password').val(password);
	$('#address').val(address);
	$('#mobile_number').val(mobile_number);
	$('#emailid').val(eamailid);
	$('#dob').val(dob);
	}


</script> -->

</table>
<tr><td colspan="8"><a href="user_profile.jsp?user_id=<%=urb.getUser_id()%>">Edit</a></td></tr></div></div></div>
</body>
</html>