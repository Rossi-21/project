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
    <title>Project Manager</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>

<body>
	<div class="container-fluid d-flex mx-auto reg">
		<div class="p-5">
			<div class="d-flex align-items-center border-bottom border-dark">
				<h1 class="me-5">the Project Manager</h1>
			</div>
			<div class="d-flex mt-3">
				<div class="">
					<h1>Register</h1>
					<form:form class="" action="/register" method="post" modelAttribute="newUser">
						<div>
							<form:label class="fw-bold mt-2 form-label" path='firstName'>First Name:</form:label>
							<form:errors class="text-danger" path="firstName"/>
				   			<form:input class="form-control" path='firstName'/>
						</div>
						<div>
							<form:label class="fw-bold mt-2 form-label" path='lastName'>Last Name:</form:label>
							<form:errors class="text-danger" path="lastName"/>
				   			<form:input class="form-control" path='lastName'/>
						</div>
						<div>
							<form:label class="fw-bold mt-2 form-label" path='email'>Email:</form:label>
							<form:errors class="text-danger" path="email"/>
							<form:input class="form-control" path='email' type='text' />
						</div>
						<div>
							<form:label class="fw-bold mt-2 form-label" path='password'>Password:</form:label>
							<form:errors class="text-danger" path="password"/>
							<form:input class="form-control" path='password' type="password"/>	    		
						</div>			
				   		<div>
				   			<form:label class="fw-bold mt-2 form-label" path="confirm">Confirm Password:</form:label>
				   			<form:errors class="text-danger" path="confirm"/>
							<form:input class="form-control" path='confirm' type="password"/>	
				   		</div>
				   		<input class="btn btn-outline-dark me-3 mt-3 rounded-0 myshadow" type="submit" value="Submit"/>
		   			</form:form>
				</div>			
				<div class="ms-5">
					<h1>Login</h1>
					<form:form class="" action="/login" method="post" modelAttribute="newLogin">
						<div>
							<form:label class="fw-bold mt-2 form-label" path='email'>Email:</form:label>
							<form:errors class="text-danger" path="email"/>
				   			<form:input class="form-control" path='email'/>
						</div>
						<div>
							<form:label class="fw-bold mt-2 form-label" path='password'>Password:</form:label>
							<form:errors class="text-danger" path="password"/>
							<form:input class="form-control" path='password' type="password"/>	    		
						</div>			
				   		<input class="btn btn-outline-dark me-3 mt-3 rounded-0 myshadow" type="submit" value="Login"/>
		   			</form:form>
				</div>
			</div>
			
		</div>
	</div>
	
</body>
</html>