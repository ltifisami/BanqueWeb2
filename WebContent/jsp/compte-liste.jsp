<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Gestion de Compte</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="home">Home</a>
        <a class="nav-link" href="new">Add Account</a>
        <a class="nav-link" href="#">Search Account</a>
      </div>
    </div>
  </div>
</nav>
	</header>
	<br>

	<div class="row" align="center">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Compte</h3>
			<hr>
			
			<br>
			<table id="tab" class="table table-striped table-bordered" style="width:100%">
				<thead>
					<tr>
						<th scope="col">Code</th>
						<th scope="col">Solde</th>
						<th scope="col">Date de la Création</th>
						<th scope="col">Etat d'activation</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="compte" items="${listeCompte}">

						<tr>
							<td><c:out value="${compte.code}" /></td>
							<td><c:out value="${compte.solde}" /></td>
							<td><c:out value="${compte.dateCreation}" /></td>
							<td><c:out value="${compte.active}" /></td>
							<td><a href="edit?code=<c:out value='${compte.code}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="delete?code=<c:out value='${compte.code}' />">Delete</a></td>
						</tr>
					</c:forEach>
		
				</tbody>
     <tfoot>
            <tr>
                <th>Code</th>
						<th >Solde</th>
						<th >Date de la Création</th>
						<th>Etat d'activation</th>
            </tr>
        </tfoot>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#tab').DataTable();
} );
</script>
</html>


