<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" import="src.com.medical.serviceImpl.MedicalServicesImpl" import="java.util.* " import="src.com.medical.beans.MedicalBeans"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css">
<!--  <link rel="stylesheet" href="css/management.css"> --> 
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>  


 <!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">-->

<!-- <!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<!-- 
Latest compiled JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script> -->
<style type="text/css">
#a{
padding-right: 20px;
color: YELLOW;

}
#div{
background-color: green;width: 100%;height: 40px;
margin-top: -15px;
}

</style>

<div id="div">

<a href="addcolumn.jsp" id="a">Buymedicine</a>
<a href="show_profile.jsp" id="a">Show profile</a>
 <a href="user_medicine_record.jsp" id="a">show own medicine record</a> 
<a href=""></a>
</div>


<script type="text/javascript">
$(document).ready(function(){
	var count=0;
	$('#add').click(function(){
		count=count+1;
		$('#table1').append("<tr><td><input type='checkbox' style='height: 25px;width: 25px;'></td><td><input list='var' type='text' id='mname"+count+"' name='mname'></td><td><input type='text' id='mg"+count+"' name='mg'></td><td><input type='text' id='quantity"+count+"' name='quantity' onkeydown=calCulatePrice('mname"+count+"','mg"+count+"','price"+count+"','quantity"+count+"')></td><td><input type='text' id='price"+count+"'  name='price'></td></tr>");
		});

	 $("#form_submit").click(function(){
		$('#count').val(count);
		
		$("form").submit(function(){
		    //alert("Submitted");
		});
	}); 
});
function calCulatePrice(mname,mg, price, quantity){
	var medicineName = $('#'+mname).val();
	var medicineMg =  $('#'+mg).val();
	var medicineQuantity =  $('#'+quantity).val();
    console.log(medicineName+" "+medicineMg+" "+medicineQuantity)
    $.post('MedicinePriceCalculation',{
		"mname" : medicineName,
	     "mg": medicineMg

  },
function(response){
	  console.log(response);
	   
	 $('#'+price).val( parseInt(response) *  parseInt($('#'+quantity).val())); 
	    	
 });
}
</script>


</head>


<%

String username= (String)request.getSession().getAttribute("username");
out.println(username);
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  if(session.getAttribute("username")==null)
  {
  	response.sendRedirect("users.jsp");
  }
  
  
  MedicalServicesImpl rsi=new MedicalServicesImpl();
 
  List<MedicalBeans> list=rsi.getAllMedicineList();
  request.setAttribute("list1", list);
  %>
<body>

<br><br><br><br><br><br>

<div class="container">
<div style="float: right; margin-top: -105px"><a href="UserSessionLogout" class="btn btn-info btn-lg">
<span class="glyphicon glyphicon-log-out" ></span> Log out</a></div>
<!-- <div class="container">
<div class="jumbotron" style="margin-top: 60px;"> -->
<table  class="table table-striped table-bordered">
<tr class="success"></tr></table></div>



	<center>
	<table>
	
	<tr>
					<td><input type="button" id="add" value="Add" class="btn btn-primary"></td>
					<td><input type="button" id="delete" value="Delete" class="btn btn-danger" onclick="deleteRow('table1')"></td>
						
				</tr>
	</table>
	<br>
		<form action="MultipleAddColumn" method="post" onsubmit="return validation()" >
			<input type="hidden" id="count" name="count">
			
			<div class="row">
			<div class="col-md-5 col-md-offset-2" >
			<table border="0px;" id="table1" class="table table-bordered">
				
				 <tr class="success">
					<td>Delete</td>
					<td>Medicine name</td>
					<td>Mg</td>
					<td>Quantity</td>
					<td>Price</td>
					
				</tr> 
				
				<tr>
					
					
					<td><input type='checkbox' style='height: 25px;width: 25px;'></td>
					<td><input  list="var"  type="text" id="mname" name="mname" onblur="getmedicine()"><br><span id="medicine" class="text-danger" ></span></td>
					<datalist id="var">
<c:forEach items="${list1}" var="r">
    <option value="${r.getMedicine_name()}">
 
  </c:forEach>
   </datalist>
   					
   			
					<!-- <td><input type="text" id="mg" name="mg"><br><span id="vat" class="text-danger"></span></td> -->
					 <td><select name="mg" id="mg" style="margin-right: 15px;width: 200px;height: 30px;border-radius: 15px;">
			 <option>select mg</option>
			<option>50</option>
			<option>100</option>
			<option>250</option>
			<option>500</option>
			
			</select>
			
					
					<td><input type="text" id="quantity" name="quantity"  onkeydown="calCulatePrice('mname','mg','price','quantity');"><br><span id="quantity" class="text-danger"></span></td>
					<td><input type="text" id="price" name="price"></td>
					
				</tr>

			</table><br><br>
			</div>
			</div>
			<input type="submit" class="btn btn-info" id="form_submit" value="submit">
		</form>
		
		
		
			<script type="text/javascript">
		function validation(){
			
			var mname=document.getElementById('mname').value;
			var mg=document.getElementById('mg').value;

			var quantity=document.getElementById('quantity').value;
			if(mname==""){
				document.getElementById('medicine').innerHTML="**required medicine name"
				return false;
			}
			if(mg==""){
				document.getElementById('vat').innerHTML="**required  medicine mg "
				return false;
		}
			if(quantity==""){
				document.getElementById('quantity').innerHTML="**required medicine  quantity"
				return false;
			}
			alert('sent successfull');
		
		}
		
		function deleteRow(tableID) {
		
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;
			//alert(rowCount);
			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				//alert("chkbox"+chkbox);
				if(null != chkbox && true == chkbox.checked) {
					if(rowCount <= 1) {
						alert("Cannot delete all the rows.");
						break;
					}
					table.deleteRow(i);
					rowCount--;
					i--;
				}


			}
			}catch(e) {
				alert(e);
			}
		}
		
		/* function getmedicine()
		{
			alert("Im in");
			var mname1 = $("#mname").val();
			alert(mname1);
			 $.post('ToFindCorrect_mg',{
					"medicine_name" : mname1,
				     },
			function(response){
				  console.log("console"+response);
				   
				 $('#mg').val(parseInt(response)); 
				    	
			 }); */
			
			
			/* var req = new XMLHttpRequest();
			req.open("POST","ToFindCorrect_mg?mname="+mname1,true);
			req.send();
			req.onreadystatechange = function()
			
			{

			if((req.readyState == 4)&&(req.status==200))
				{
				alert("suuccess");
				$("#mg").val( parseInt(response));
				}
			} */

			
		
		
		

	
		
		
		
	</script>
	 
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
			
	</center></div>
	</body>
</html>