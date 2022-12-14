<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:out value="${page }"></c:out></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<h1 class="text-center mt-3">Welcome to TODO Manager</h1>
		
		<div class="row mt-4">
			<div class="col-md-2">
				<!-- <h3 class="text-center">Options</h3> -->

				
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">
						Menu</button>
					<a href='<c:url value="/add"></c:url>'
						class="list-group-item list-group-item-action">Add ToDo</a> <a
						href='<c:url value="/index"></c:url>'
						class="list-group-item list-group-item-action">View ToDo</a>

				</div>
			</div>
			<div class="col-md-10">
				<c:if test="${page=='home' }">
					<h1 class="text-center">ALL TODOS</h1>
					<c:forEach  items="${todo }" var ="t" >
						<div class=card>
							<div class="card-body">
								<h3>
									<c:out value="${t.todoTitle }"></c:out>
								</h3>
								<p>
									<c:out value="${t.todoContent }"></c:out>
								</p>
							</div>
						</div>
					</c:forEach>

				</c:if>
				<c:if test="${page=='add' }">
					<h1 class="text-center">Add TODO</h1>
					<form:form action="savaTodo" method="post" modelAttribute="todo">
						<div class="form-group mt-4">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter you Todo Title" />
						</div>
						<div class="form-group mt-3">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="Enter you Todo Content" cssStyle="height:300px;" />
						</div>
						<div class="container text-center mt-2">
							<button class="btn btn-outline-success">Add ToDo</button>
						</div>

					</form:form>

				</c:if>


			</div>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>