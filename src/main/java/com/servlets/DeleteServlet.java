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


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			Session s=factoryProvider.getFactory().openSession();
			
			Transaction t=s.beginTransaction();
			Note note=s.get(Note.class,noteId);
			s.delete(note);
			t.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	
	}
