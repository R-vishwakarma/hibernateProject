<%@page import="com.entities.Note"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_js_css.jsp"%>
<title>Edit page</title>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%></div>
	<h1 class="text-center">Edit your Note</h1>

	<br>


	<%
	int noteId = Integer.parseInt(request.getParameter("note_id").trim());
	Session s = factoryProvider.getFactory().openSession();

	Note note = s.get(Note.class, noteId);
	%>
	<div class="container item-center">
		<form action="UpdateServlet" method="post">
			<input value="<%=note.getId() %>" name="noteid" type="hidden">

			<div class="form-group">
				<label for="title">Note Title</label>
				<input type="text" name="notetitle" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter here" value="<%=note.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label>
				<textarea class="form-control" name="content" id="content"><%=note.getContent()%></textarea>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-success">Update</button>
			</div>
		</form>
	</div>
</body>
</html>
