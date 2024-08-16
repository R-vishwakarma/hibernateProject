<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_js_css.jsp"%>
<title>All Notes</title>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>

		<h1 class="text-uppercase">
		
		 <img class="card-img-top pb-2"   style="max-width:40px;" src="img/pencil.png" alt="Card image cap">  All Notes:</h1>

		<%
		Session s = factoryProvider.getFactory().openSession();
		Query q = s.createQuery("from Note");
		List<Note> list = q.list();
		%>

		<div class="row">
			<%
			for (Note note : list) {
			%>
			<div class="col-md-4">
				<div class="card mb-4">
					<div class="card-body">
					 <img class="card-img-top" style="max-width:40px;" src="img/pinned-notes.png" alt="Card image cap">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text">
						Note Content:
						<h5 class="card-content"><%=note.getContent()%></h5>
							</p>						
						
							<p class="card-tet">
							Note ID:
							<%=note.getId()%></p>
							
							 <a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-success">Update</a>
                    <a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-dark">Delete</a>
					</div>
				</div>
			</div>
			<%
			}
			s.close(); // Don't forget to close the session
			%>
		</div>

	</div>

</body>
</html>