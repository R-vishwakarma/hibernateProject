<!doctype html>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Including all necessary CSS and JS files -->
    <%@include file="all_js_css.jsp"%>

    <title>Index Page</title>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="container">
        <%@include file="navbar.jsp"%>
    </div>

    <!-- Main Content -->
    <div class="container mt-5">
        <!-- Welcome Section -->
        <div class="jumbotron text-center">
            <h1 class="display-4">Welcome to My Notes Application</h1>
            <p class="lead">Easily create, view, and manage your notes.</p>
            <hr class="my-4">
            <p>Start by adding a new note or viewing all your existing notes.</p>
            <a class="btn btn-primary btn-lg" href="add_notes.jsp" role="button">Add New Note</a>
            <a class="btn btn-success btn-lg" href="all_notes.jsp" role="button">View All Notes</a>
        </div>

        <!-- Featured Notes Section -->
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-center">Featured Notes</h2>
                <hr>
                <!-- Dynamic Content: Example of displaying featured notes -->
                <div class="card-deck">
                    <%
                        // Example code to fetch and display some notes from the database
                        Session s = factoryProvider.getFactory().openSession();
                        List<Note> notes = s.createQuery("from Note").setMaxResults(3).list();
                        s.close();

                        for(Note note : notes) {
                    %>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%=note.getTitle()%></h5>
                            <p class="card-text"><%=note.getContent().substring(0, Math.min(100, note.getContent().length())) + "..."%></p>
                        </div>
                        <div class="card-footer">
                            <a href="view_note.jsp?note_id=<%=note.getId()%>" class="btn btn-info">Read More</a>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="text-center mt-5">
        <p>&copy; 2024 My Notes Application. All Rights Reserved.</p>
    </footer>
</body>
</html>
