<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Project</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container-fluid">
	<div class="p-5">
		<div class="d-flex align-items-center justify-content-between border-bottom border-dark">
			<h1>Create a Project!</h1>
			<a href="/projects">Home</a>
		</div>
		<div class="mt-3 width">	
			<form:form class="" action="/projects/create" method="post" modelAttribute="project">
				<div>
					<form:label class="fw-bold mt-2 form-label" path='title'>Project Title:</form:label>
					<form:errors class="text-danger" path="title"/>
		   			<form:input class="form-control" path='title'/>
				</div>
				<div>
					<form:label class="fw-bold mt-2 form-label" path='description'>Project Description:</form:label>
					<form:errors class="text-danger" path="description"/>
					<form:textarea class="form-control" path="description" cols="20" rows="3"></form:textarea>    		
				</div>	
				<div>
					<form:label class="fw-bold mt-2 form-label" path='dueDate'>Project Due Date:</form:label>
					<form:errors class="text-danger" path="dueDate"/>
					<form:input class="form-control" path='dueDate' type='date'/>
				</div>	
				<div>
					<form:errors path="users" class="error"/>
					<form:input type="hidden" path="users" value="${user.id}" class="form-control"/>
				</div>	
		   		<input class="mt-3 btn btn-outline-dark me-3 rounded-0 myshadow" type="submit" value="Create"/>
   			</form:form>
		</div>	
	</div>	
</div>
</body>
</html>