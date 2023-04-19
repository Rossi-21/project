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
    <title> Edit Project</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container-fluid">
		<div class="p-5">
			<div class="d-flex align-items-center justify-content-between border-bottom border-dark">
				<h1>Edit Project</h1>
			</div>
			<div>
			<form:form class="width mt-3" action="/projects/${project.id}" method="post" modelAttribute="project">
				<input type="hidden" name="_method" value="put">
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
				<div>
					<form:label class="form-label fw-bold mt-2" path='title'>Title:</form:label>
					<form:errors class="text-danger" path="title"/>
		   			<form:input class="form-control" path='title'/>
				</div>
				<div>
	    			<form:label class="form-label fw-bold mt-2" path="description">Description:</form:label>
	    			<form:errors class="text-danger" path="description"/>
	    			<form:textarea class="form-control" path="description" cols="20" rows="3"></form:textarea>
	    		</div>
				<div>
					<form:label class="form-label fw-bold mt-2" path='dueDate'>Due Date:</form:label>
					<form:errors class="text-danger" path="dueDate"/>
		    		<form:input class="form-control" path='dueDate' type='date'/>
				</div>
				<a href="/projects"><btn class="mt-3 btn btn-outline-dark me-3 rounded-0 myshadow">Cancel</btn></a>
	    		<input class="btn btn-outline-dark me-3 rounded-0 myshadow mt-3" type="submit" value="Submit"/>	
		 	</form:form>	
			</div>
		</div>
	</div>
</body>
</html>