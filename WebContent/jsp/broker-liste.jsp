<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Map"%>
    <%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script type="text/javascript"  src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" > </script>
<title>Paramétrage des Brokers</title>
</head>
<body>
<br>
<br>
<br>
<br>
<div class="container">
<div class="row">
<div align="center"><h4> Paramétrage des Brokers</h4></div>
<div class="class="col-md-3">


 <h1> How to insert,edit,delete selected row from html table using jquery </h1>
        <form id="addcustomerform">

            <div class="form-group">
                <label>CustomerID:</label>
                <input type="text" name="txtCustomerID" id="txtCustomerID" class="form-control" value="" required="">
            </div>
            <div class="form-group">
                <label>CustomerName:</label>
                <input type="text" name="txtCustomerName" id="txtCustomerName" class="form-control" value="" required="">
            </div>
            <div class="form-group">
                <label>ContactName:</label>
                <input type="text" name="txtContactName" id="txtContactName" class="form-control" value="" required="">
            </div>
            <div class="form-group">
                <label>Address:</label>
                <textarea class="form-control" name="txtAddress" id="txtAddress"></textarea>
            </div>
            <div class="form-group">
                <label>PostalCode:</label>
                <input type="text" name="txtPostalCode" id="txtPostalCode" class="form-control" value="" required="">
            </div>
            <button type="submit" id="btnaddcustomer" class="btn btn-primary save-btn">add Customer</button>

        </form>
        <br />
        <fieldset>
            <legend>Customer List
            </legend>
            <table class="table">
                <thead>
                    <tr>
                        <th>CustomerID</th>
                        <th>CustomerName</th>
                        <th>ContactName</th>
                        <th>Address</th>
                        <th>PostalCode</th>
                    </tr>
                </thead>
                <tbody id="tblbody">

                </tbody>
            </table>
        </fieldset>

<div>
</div>
<div class="class="col-md-6">
  <div id="accordion">
  <% Map<String ,List<Integer>> listBrokers = (Map<String ,List<Integer>>) request.getAttribute("listBroker"); %>
  <%  for (Map.Entry broker : listBrokers.entrySet()) { %>
  <div class="card">
      <div class="card-header">
      <div>
      <table >
  <tr>
      <td ><a class="btn" data-bs-toggle="collapse" href="#collapse-<%= broker.getKey()%>"> >  </a></td>
      <td ><a class="btn" data-bs-toggle="collapse" href="#collapse-<%= broker.getKey()%>"> <%= broker.getKey() %> </a></td>
     <td><a class="btn" data-bs-toggle="collapse" href="#collapse-<%= broker.getKey()%>">  -  <%= broker.getKey() %>  </a></td>

  <td><a class="btn" href="#" > Update </a><td>
<td><a class="btn" href="#" > Delete </a><td>
  
  <tr>
</table>
      
      </div>
      
      <%-- <div >
 <a class="btn" data-bs-toggle="collapse" href="#collapse-<%= broker.getKey()%>"> >  </a>
<a class="btn" data-bs-toggle="collapse" href="#collapse-<%= broker.getKey()%>"><%= broker.getKey() %> - </a>
<a class="btn" data-bs-toggle="collapse" href="#collapse-<%= broker.getKey()%>"><%= broker.getKey() %> </a>
<a class="btn" href="#" > Update </a>
<a class="btn" href="#" > Delete </a>
</div> --%>

      </div>
      <div id="collapse-<%= broker.getKey()%>" class="collapse" data-bs-parent="#accordion">
        <div class="card-body">
          <table class = "table table-striped .table-sm ">
        <thead>
        <tr>
        <td>CCP ID</td>
        <td>Broker member id</td>
        </tr>
        </thead>
        <tbody>
        <% for (Integer i : (List<Integer>)broker.getValue()) { %>
        
        <tr>
        <td><%= i%></td>
        <td> <%= i%></td>
        </tr>
          <% }%>
          </tbody>
          </table>
        </div>
      </div>
    </div>
   <% } %>
  
   
    
  </div>
</div>
</div>
</div>
</div>
<script type="text/javascript">
    //add customer
 $("#btnaddcustomer").on("click", function (e) {
        e.preventDefault();
        var CustomerID = $("#txtCustomerID").val();
        var CustomerName = $("#txtCustomerName").val();
        var ContactName = $("#txtContactName").val();
        var Address = $("#txtAddress").val();
        var PostalCode = $("#txtPostalCode").val();
        var tablerow = "<tr data-CustomerID='" + CustomerID + "' data-CustomerName='" + CustomerName + "'"
                        + "data-ContactName='" + ContactName + "' data-Address='" + Address + "' data-PostalCode='" + PostalCode + "'>"
                      + "<td>" + CustomerID + "</td>"
                      + "<td>" + CustomerName + "</td>"
                      + "<td>" + ContactName + "</td>"
                      + "<td>" + Address + "</td>"
                      + "<td>" + PostalCode + "</td>"
                      + "<td>" +
                      "<button class='btn btn-info btn-xs btn-editcustomer'><i class='fa fa-pencil' aria-hidden='true'></i>Edit</button>" +
                      "<button class='btn btn-danger btn-xs btn-deletecustomer'><i class='fa fa-trash' aria-hidden='true'>Delete</button>"
                      + "</td>"
                      + "</tr>";
        debugger;
        $("#tblbody").append(tablerow);
        $("input[type='text']").each(function () {
            $(this).val("");
        });
        $("#textarea").val('');
    });
 </script>
 <script type="text/javascript">
//handle edit button click
 $("#tblbody").on("click", ".btn-editcustomer", function () {
     debugger;
     var CustomerID = $(this).parents("tr").attr('data-CustomerID');
     var CustomerName = $(this).parents("tr").attr('data-CustomerName');
     var ContactName = $(this).parents("tr").attr('data-ContactName');
     var Address = $(this).parents("tr").attr('data-Address');
     var PostalCode = $(this).parents("tr").attr('data-PostalCode');

     $(this).parents("tr").find("td:eq(0)").html('<input name="txtupdate_CustomerID" id="txtupdate_CustomerID" value="' + CustomerID + '">');
     $(this).parents("tr").find("td:eq(1)").html('<input name="txtupdate_customerName" id="txtupdate_customerName" value="' + CustomerName + '">');
     $(this).parents("tr").find("td:eq(2)").html('<input name="txtupdate_ContactName" id="txtupdate_ContactName" value="' + ContactName + '">');
     $(this).parents("tr").find("td:eq(3)").html('<input name="txtupdate_Address" id="txtupdate_Address" value="' + Address + '">');
     $(this).parents("tr").find("td:eq(4)").html('<input name="txtupdate_PostalCode" id="txtupdate_PostalCode" value="' + PostalCode + '">');



     $(this).parents("tr").find("td:eq(5)").prepend("<button class='btn btn-primary btn-xs btn-updatecustomer'><i class='fa fa-pencil' aria-hidden='true'></i>Update</button>"
         + "<button class='btn btn-warning btn-xs btn-cancelupdate'><i class='fa fa-times' aria-hidden='true'>Cancel</button>")
     $(this).hide();
 });

 $("#tblbody").on("click", ".btn-cancelupdate", function () {
     debugger;
     var CustomerID = $(this).parents("tr").attr('data-CustomerID');
     var CustomerName = $(this).parents("tr").attr('data-CustomerName');
     var ContactName = $(this).parents("tr").attr('data-ContactName');
     var Address = $(this).parents("tr").attr('data-Address');
     var PostalCode = $(this).parents("tr").attr('data-PostalCode');

     $(this).parents("tr").find("td:eq(0)").text(CustomerID);
     $(this).parents("tr").find("td:eq(1)").text(CustomerName);
     $(this).parents("tr").find("td:eq(2)").text(ContactName);
     $(this).parents("tr").find("td:eq(3)").text(Address);
     $(this).parents("tr").find("td:eq(4)").text(PostalCode);


     $(this).parents("tr").find(".btn-editcustomer").show();
     $(this).parents("tr").find(".btn-updatecustomer").remove();
     $(this).parents("tr").find(".btn-cancelupdate").remove();
 });

 $("#tblbody").on("click", ".btn-updatecustomer", function () {
     var CustomerID = $(this).parents("tr").find("input[name='txtupdate_CustomerID']").val();
     var CustomerName = $(this).parents("tr").find("input[name='txtupdate_customerName']").val();
     var ContactName = $(this).parents("tr").find("input[name='txtupdate_ContactName']").val();
     var Address = $(this).parents("tr").find("input[name='txtupdate_Address']").val();
     var PostalCode = $(this).parents("tr").find("input[name='txtupdate_PostalCode']").val();

     debugger;

     $(this).parents("tr").find("td:eq(0)").text(CustomerID);
     $(this).parents("tr").find("td:eq(1)").text(CustomerName);
     $(this).parents("tr").find("td:eq(2)").text(ContactName);
     $(this).parents("tr").find("td:eq(3)").text(Address);
     $(this).parents("tr").find("td:eq(4)").text(PostalCode);

     $(this).parents("tr").attr('data-CustomerID', CustomerID);
     $(this).parents("tr").attr('data-CustomerName', CustomerName);
     $(this).parents("tr").attr('data-ContactName', ContactName);
     $(this).parents("tr").attr('data-Address', Address);
     $(this).parents("tr").attr('data-PostalCode', PostalCode);


     $(this).parents("tr").find(".btn-editcustomer").show();
     $(this).parents("tr").find(".btn-cancelupdate").remove();
     $(this).parents("tr").find(".btn-updatecustomer").remove();
 });
 </script>
 <script type="text/javascript">
 //delete row from the table
 $("#tblbody").on("click", ".btn-deletecustomer", function () {
     $(this).parents("tr").remove();
 });
 </script>
    </script>
</body>
</html>