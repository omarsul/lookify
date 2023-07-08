<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>create</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
	
    <div class="container">
		<h1 class="text-primary">Add a Song:</h1>
		<div>
			<a href="/songs">Dashboard</a>
		</div>
		<form:form action="/songs/create" method="post" modelAttribute="song" class="form">
		    <div class="row g-3 align-items-center">
		    <div>
		    	<div class="col-auto">
		        	<form:label path="title" class="col-form-label">song title:</form:label>
		       	</div>
		        <form:errors path="title"/>
		        <div class="col-auto">
		        	<form:input path="title" class="form-control"/>
		        </div>
		    </div>
		    <div>
		    	<div class="col-auto">
		        <form:label path="artist" class="col-form-label">artist:</form:label>
		        </div>
		        <form:errors path="artist"/>
		        <div class="col-auto">
		        <form:input path="artist" class="form-control"/>
		        </div>
		    </div>
		    <div>
		        <div class="col-auto">
		        <form:label path="rating" class="col-form-label">rating (1-10):</form:label>
		        </div>
		        <form:errors path="rating"/>
		        <div class="col-auto">
		        <form:input type="number" path="rating" class="form-control"/>
		        </div>
		    </div>
		    </div>   
		    <input type="submit" value="Submit"/>
		</form:form>    
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>