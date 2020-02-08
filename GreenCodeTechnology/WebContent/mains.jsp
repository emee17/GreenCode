<%@page import="src.com.medical.serviceImpl.MedicalServicesImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="src.com.medical.beans.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>main</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootsrap.css">
 <!-- <link rel="stylesheet" href="css/management.css">  -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
 <script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
		
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js">
	
	
	
	
	
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
 

</head>
<body style="padding-top:70px">
</head>
<%
MedicalServicesImpl mediservice = new MedicalServicesImpl();
List<MedicalBeans> medicines = mediservice.getAllMedicineList();
%>



 <%
 response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("admin.jsp");
}

%>

 

<body>
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
<li class="active"><a href="permanentquerylist.jsp">PermanentusermessageInbox</a></li>


</ul>
</div>

<div class="jumbotron">
<center><h3 style="color:blUE;">MEDICINE Add, UPDATE, DELETE, INFORMATION</h3></center>

<<!-- div><center><label class="heading">Medicine Details</label></center></div> -->
	<form action="MedicalControllers"  id="medi_control" name="medi_control" onsubmit="return validation()" method="post" >
	<div class="row">
		<div class="col-lg-4">
			<div class="form-group">
				<label>Medicine Name</label>
				<input type="text" name="medicine_name" class="form-control" id="medicine_name" />
				<input  type="hidden" name="btnClicked1" id="btnClicked1">
			</div>
		</div>
			
		<div class="col-lg-4">
			<div class="form-group">
				<label>Medicine Company</label>
				<input type="text" class="form-control" name="medicine_company" id="medicine_company">
			</div>
		</div>
				
			
			<div class="col-lg-4">
			<div class="form-group">
				<label>Manufacture date</label>
				<input type="Date" name="manufacture_date" id="manufacture_date" class="form-control" />
				</div>
			</div>
		</div>
				
				
		<div class="row">
			<div class="col-lg-4">
				<div class="form-group">
				<label>Expiry_date</label>
				<input type="date" name="expiry_date" class="form-control" id="expiry_date" />
				</div>
			</div>
			
			<div class="col-lg-4">
				<div class="form-group">
				<label>vat</label>
				<input type="text" class="form-control" name="vat" id="vat">
				</div>
			</div>
				
			
			<div class="col-lg-4">
			<div class="form-group">
				<label>Category</label>
				<input type="text" name="category" id="category" class="form-control"/>
				</div>
			</div>
		</div>
			
		<div class="row">
				<div class="col-lg-4">
				<div class="form-group">
				<label>Quantity</label>
				<input type="text" name="quantity" class="form-control" id="quantity" />
				</div>
				</div>
			
				<div class="col-lg-4">
				<div class="form-group">
				<label>Unit price</label>
				<input type="text" name="unit_price" id="unit_price" class="form-control"/>
				</div>
				</div>
				
				
				<div class="col-lg-4">
				<div class="form-group">
				<label>medicine id</label>
				<input type="text" name="medicine_id" id="medicine_id" class="form-control" readonly="readonly"/>
				</div>
				</div>
				
			<!-- 	<div class="col-lg-4">
				<div class="form-group">
				<label>Medicine ID</label>
				<input type="text" name="medicine_id" id="medicine_id"  readonly="readonly" class="form-control"/>
				</div>
				</div> -->
				
		</div>
		<br>
					<div align="center">
					<input type="submit" name="btnClicked" value="insert" id="insert" 
						class="btn btn-success"  onclick="doSubmit(this.value);"> 
						<input type="reset" name="cancel" value="Cancel" class="btn btn-danger">
				
				<!-- 	 <div class="page-header pull-right">
	             <input type="text" placeholder="search" name="search" id="myInput"> &nbsp;<button class=" btn btn-success glyphicon glyphicon-search"></button> -->
	             
	             
	             
	             
	           
	             	
	             <br>
	            
	</div>
		
		</form>
				</div>
				
				<br>
			
			
			<div class="view_table">
			<table class="table table-bordered table-striped  display" id="myTable" >
		<thead>
			<tr class="success">
				<th>Medicine Id</th>
				<th>Medicine name</th>
				<th>Medicine company</th>
				<th>Manufacture date</th>
				<th>Expiry date</th>
				<th>Vat</th>
				<th>Category</th>
				<th>Quantity</th>
				<th>Unit Price</th>
				<th class="warning">Edit</th>
				<th class="danger">Delete</th>
				
			</tr>
		</thead>
		<tbody id="myTable">
		<% for(MedicalBeans mediBean: medicines){ %>
		
		<tr>
		<td><%=mediBean.getMedicine_id()%></td>
		<td><%=mediBean.getMedicine_name()%></td>
		<td><%=mediBean.getMedicine_company()%></td>
		<td><%=mediBean.getManufacture_date()%></td>
		<td><%=mediBean.getExpiry_date()%></td>
		<td><%=mediBean.getVat()%></td>
		<td><%=mediBean.getCategory()%></td>
		<td><%=mediBean.getQuantity() %></td>
		<td><%=mediBean.getUnit_price()%></td>
		<td><a href="#" onclick="callEdit('<%=mediBean.getMedicine_id() %>','<%=mediBean.getMedicine_name()%>','<%=mediBean.getMedicine_company()%>','<%=mediBean.getManufacture_date()%>',
               '<%=mediBean.getExpiry_date()%>','<%=mediBean.getVat()%>','<%=mediBean.getCategory()%>','<%=mediBean.getQuantity()%>','<%=mediBean.getUnit_price()%>')">Edit</a></td>
		<td><a href="#" onclick="callDelete('<%=mediBean.getMedicine_id()%>')">Delete</a></td>
		</tr>
		<% } %>
		
		</tbody>
		</table>
		
		<script>
					
										$(document).ready(function() {
											//alert(1234);
											
										    $('#myTable').DataTable({
										    	"order":[[0,"desc"]]
										    });
										});
				</script>
		
		
		
		
<!-- 		<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script> -->
			
			</div>
			
</div>
		<script type="text/javascript">
		
		
		
		function doSubmit(val) {
			
			$('#btnClicked1').val(val);
		}

		
		function callEdit(medicine_id,medicine_name, medicine_company, manufacture_date, expiry_date, vat, category,
			quantity, unit_price) {
		$('#medicine_name').val(medicine_name);
		$('#medicine_company').val(medicine_company);
		$('#manufacture_date').val(manufacture_date);
		$('#expiry_date').val(expiry_date);
		$('#vat').val(vat);
		$('#category').val(category);
		$('#quantity').val(quantity);
		$('#unit_price').val(unit_price);
		$('#medicine_id').val(medicine_id);
		$('#insert').val('Update');
	}
		
		function callDelete(id) {
			if(!confirm("Are you sure to delete the Record")){
				return false;
			}
			$('#medicine_id').val(id);
			$('#btnClicked1').val('delete');
			document.medi_control.submit();
		}
		
		
		  function validation(){
			alert("successfull")
		} 
		  
		  
		  
			/* function callEdit((id) {
				if(!confirm("Are you sure to update the Record")){
					return false;
				}
				$('#medicine_id').val(id);
				$('#btnClicked1').val('update');
				document.medi_control.submit();
			} */
			
		
		
		
		
		
		</script>
</body>
</html>
