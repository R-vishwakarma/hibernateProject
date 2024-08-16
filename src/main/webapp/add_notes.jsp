<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>


	<div class="container">
		<%@include file="navbar.jsp"%>

<br>
<h1>Please fill your note details</h1>
<br>
		
		<!-- this is add notes form -->

		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> <input type="text"  name="notetitle"
					class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" placeholder="Enter  here" required>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Note Content</label>
				<textarea class="form-control"  name="content"id="content"
					placeholder="Enter your content here" required></textarea>
			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-success">Add</button>
			</div>
		</form>
	</div>



</body>
</html>