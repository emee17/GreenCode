<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.*" import="java.util.*" import="src.com.medical.beans.UserRegistrationBeans" import="src.com.medical.serviceImpl.MedicalServicesImpl" import="src.com.medical.dao.impls.MedicineDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css">
 <!-- <link rel="stylesheet" href="css/management.css">  -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

</head>
<body>
<%
/* String username1= (String)request.getSession().getAttribute("username");
out.println(username1);
String s=session.getAttribute("username").toString(); */
/*  String email = (String)session.getAttribute("usename"); */

/* MedicalServicesImpl mediservice=new MedicalServicesImpl(); */
 /*  UserRegistrationBeans urb = new UserRegistrationBeans(); */
//List<UserRegistrationBeans> list=Arrays.asList(urb); 

response.setHeader("Cache-control", "no-store, must-revalidate, private,no-cache");
if(session.getAttribute("username")==null)
{
	response.sendRedirect("users.jsp");
}

/* request.setAttribute("list", i); */

%>
<%
MedicineDaoImpl mdi =new MedicineDaoImpl();
List<UserRegistrationBeans> list=mdi.getUserRegistrationById(Integer.parseInt(request.getParameter("user_id"))); 
System.out.println(Integer.parseInt(request.getParameter("user_id")));

%><!-- 
<h1>User Profile</h1> -->
<%-- <div><jsp:include page="header_user.jsp" /></div> --%>
<center>
<h1>YOU CAN UPDATE OWN PROFILE</h1><BR>
<form action="UpdateUserProfile" method="post">
<div class="row">
<div class="col-md-4 col-md-offset-4">
<table class="table table-bordered table-striped  display"> 

 
 <%
 for(UserRegistrationBeans mmb: list)
	 {

%>
<tr>
<td>id:</td>
<td> <input type="text" name="user_id" value="<%=mmb.getUser_id() %>" readonly="readonly"></td></tr>
<tr>
<td>username:</td>
<td><input type="text" name="username" value="<%=mmb.getUsername()%>"></td></tr>
 <tr>
<td>password:</td>
<td><input type="password"name="password" value="<%=mmb.getPassword()%>"></td></tr>
<tr>
<td>address:</td>
<td><input type="text" name="address" value="<%=mmb.getAddress() %>"></td></tr>
<tr>
<td>mobile number:</td>
<td><input type="text"name="mobile_number" value="<%=mmb.getMobile_number() %>"></td></tr>
 <tr>
<td> Dob:</td>
<td><input type="date" name="dob" value="<%=mmb.getDob() %>"></td></tr>
<tr> 
<td>email id:</td>
<td><input type="text" name="emailid" value="<%=mmb.getEmailid() %>" readonly="readonly"></td></tr>
<% } %>

 



<%-- <tr><td colspan="2"><a href="user_profile.jsp?id=<%=urb.getUser_id()%>">Edit</a></td> --%>

</table></div></div>
<style="float: right;"><input type="submit" value="Update" style="background-color: red;color: white;">

</form>

</center>




</body>
</html>