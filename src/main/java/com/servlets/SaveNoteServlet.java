package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SaveNoteServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try {
			String title=request.getParameter("notetitle");
			String content=request.getParameter("content");
			
			Note note=new Note(title, content, new Date());
			
			Session s= factoryProvider.getFactory().openSession();
			
			Transaction t=s.beginTransaction();
			s.save(note);
			t.commit();
			s.close();
			 response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center'>Note added successfully...</h1>");
			out.println("<h1 style='text-align:center'><a href='all_notes.jsp'>View all notes...</a></h1>");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
