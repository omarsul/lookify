<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>languages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  </head>
  <body>
	<div class="container">
		<h3><a href="/songs/create"><c:out value="Add New"/></a></h3>
		<h3><a href="/topTen"><c:out value="Top songs"/></a></h3>
		<form action="/search" method="POST">
					<input type="search" name="artist" /> 
					<input type="submit" value="Search Artists" />
		</form>
		<h1 class="text-primary">lookify </h1>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Name</th>
		      <th scope="col">Rating</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${songs}" var="song">
		  	<tr>
		  		<td><c:out value="${song.getId()}"/></td>
		  		<td><a href="/view/${song.getId()}"><c:out value="${song.getTitle()}"/></a></td>
		  		<td><c:out value="${song.getRating()}"/></td>
		  		
	  		
		  		<td>
		  			<form action="/song/del/${song.getId()}" method="post">
    					<input type="hidden" name="_method" value="delete">
    					<input type="submit" value="Delete">
					</form>
				</td>
		  	</tr>
		  </c:forEach>
		  </tbody>
		</table>
		<br>
		<br>
		<br>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  </body>
</html>