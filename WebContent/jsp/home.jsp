<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" scope="page" 
value="${renderRequest.getContextPath()}"/>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Gestion de Compte</title>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <!-- bootstrap5 dataTables css cdn -->
    <link
      rel="stylesheet"
      href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css"
    />
</head>



<div class="container">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="#">Home</a>
        <a class="nav-link" href="new">Add Account</a>
        <a class="nav-link" href="#">Search Account</a>
      </div>
    </div>
  </div>
</nav>

<br>

	<div class="row">

		<div class="col-md-3">
			<div >
				<div >
	<h7> Gestion des Comptes</h7>					
<hr>
<a href="list"> List des Comptes </a>
<br>
<a  href="new"> Ajouter Compte </a>
<br>
<br>
<br>
<h7> Gestion des Produits</h7>
<hr>
<a href="#"> List des Produits </a>
<br>
<a  href="#">List des Produits </a>
<br>
<br>
<br>
<h7> Gestion des Brokers</h7>					
<hr>
<a href="broker"> List des Brokers </a>
<br>


				</div>
			</div>
		</div>

		<div class="col-md-9">
			<div >
				<div >
						<div >
			<br>
			
		
			<table id ="tab" class="table table-striped table-bordered"  style="width:100%">
				<thead>
					<tr>
						<th>Code</th>
						<th >Solde</th>
						<th >Date de la Création</th>
						<th >Etat d'activation</th>
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
			</div>
			
		</div> <!-- end col md 9 -->
	</div><!-- end row -->


</div><!-- end containing of content -->
<!-- bootstrap5 dataTables js cdn -->
    <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script>
      $(document).ready(function () {
        $('#tab').DataTable();
      });
    </script>
</body>
</html>