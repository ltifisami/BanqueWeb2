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


				</div>
			</div>
		</div>

		<div class="col-md-9">
		
		
				<div class="card">
			<div class="card-body">
				<c:if test="${compte != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${compte == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${compte != null}">
            			Edit Compte
            		</c:if>
						<c:if test="${compte == null}">
            			Add New Compte
            		</c:if>
					</h2>
				</caption>

				<c:if test="${compte != null}">
					<input type="hidden" name="code" value="<c:out value='${compte.code}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Solde</label> <input type="text"
						value="<c:out value='${compte.solde}' />" class="form-control"
						name="solde" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
		</div> <!-- end col md 9 -->
	</div><!-- end row -->


</div><!-- end containing of content -->
</body>
</html>       