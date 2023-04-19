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
    <title>Project Tasks</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container-fluid">
		<div class="p-5">
			<div class="d-flex align-items-center justify-content-between border-bottom border-dark">
				<h1>Project: <c:out value="${project.title}"/></h1>
				<a href="/projects">Home</a>
			</div>
			<h4 class="mt-2">Project Lead: <c:out value="${project.user.firstName}"/></h4>
			<div>
				<form:form class="form" action="/projects/create/task" method="post" modelAttribute="task">
					<form:label class="fw-bold mt-2 form-label" path='description'>Create a task ticket for this team:</form:label>
					<form:errors class="text-danger" path="description"/>
					<form:textarea class="form-control" path="description" cols="20" rows="3"></form:textarea>
					<form:errors path="project" class="error"/>
					<form:input type="hidden" path="project" value="${project.id}" class="form-control"/>
					<form:errors path="user" class="error"/>
					<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
					<input class="btn btn-outline-dark me-3 rounded-0 myshadow mt-3" type="submit" value="Submit"/>
				</form:form>
			</div>
			<c:forEach var="tasks" items="${tasks}">
				<c:if test="${tasks.project.id == project.id}">
				<div class="mt-4">
					<h5>Added by <c:out value="${tasks.user.firstName}"/> on <fmt:formatDate value="${tasks.createdAt}" pattern="MM/dd/yyyy"/> </h5>
				</div>
				<div>
					<p><c:out value="${tasks.description}"/></p>
				</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
</body>
</html>