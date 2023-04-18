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
    <title>Project Manager Dashboard</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container-fluid">
		<div class="p-5">
			<div class="d-flex align-items-center border-bottom border-dark">
				<h1 class="me-5">Welcome to the Project Manager, <c:out value="${user.firstName}"/></h1>
				<a class="ms-5" href="/logout">logout</a>
			</div>
			<div class="d-flex justify-content-between">
				<h4 class="mt-2">All Projects:</h4>
				<a href="/projects/new"><button type="button" class="mt-2 btn btn-outline-dark me-3 rounded-0 myshadow">+ new project</button></a>
			</div>
			<div>
				<table class="table table-hover table-borderless table-width" style="background-color:;">
					<thead>
						<tr>
							<th>Project</th>
							<th>Team Lead</th>
							<th>Due Date</th>	
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="projects" items = "${projects}">
							<c:if test="${projects.joiner.id != user.id}">
								<tr>
									<td style="width:30%;"><a href="/projects/${projects.id}"><c:out value="${projects.title}"></c:out></a></td>
									<td style="width:25%;"><c:out value="${projects_users.user.fistName}"></c:out></td>
									<td style="width:18%;"><c:out value="${projects.dueDate}"></c:out></td>							
									<c:forEach var="projects_users" items="${projects_users}">
									<c:choose>
										<c:when test="${projects_users.user.id == user.id}">
											<td class="d-flex align-items-center">
												<a href="/projects/${projects.id}/edit">edit</a>
												<form action="/projects/${projects.id}/delete" method="post">
												    <input type="hidden" name="_method" value="delete">
												    <input class="btn text-primary text-decoration-underline" type="submit" value="delete">
												</form>
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<a href="/projects/${projects.id}/join">join</a>
											</td>
										</c:otherwise>
									</c:choose>
									</c:forEach>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>