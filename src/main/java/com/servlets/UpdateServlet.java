package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;

public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve the form data
            String title = request.getParameter("notetitle");
            String content = request.getParameter("content");
            int noteId = Integer.parseInt(request.getParameter("noteid"));

            // Open a new Hibernate session
            Session s = factoryProvider.getFactory().openSession();
            Transaction t = s.beginTransaction();

            // Get the note object from the database
            Note note = s.get(Note.class, noteId);

            // Update the note details
            note.setTitle(title);
            note.setContent(content);
            note.setAdddedDate(null); // Set the date if necessary, or remove this line

            // Commit the transaction
            t.commit();
            s.close();

            // Redirect to all_notes.jsp after updating
            response.sendRedirect("all_notes.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Optionally handle exceptions and display an error page
         
        }
    }
}
