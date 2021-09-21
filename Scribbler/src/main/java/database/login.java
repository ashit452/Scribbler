package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import encryption.encrydecry;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	ResultSet rs;
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out=response.getWriter();
		String username=request.getParameter("lusername");
		String password=request.getParameter("lpassword");
		String referer=request.getParameter("referer");
		Dbhelper db=new Dbhelper();
		encrydecry encdnc=new encrydecry();
		int i=db.connectwithdb();
		if (i==0) {
			out.print("not connected!");
		}
		rs=db.execquery("select * from user_data where Username='"+username+"' and Password='"+encdnc.encdecme(password)+"'");
		//out.print("select * from user_data where username='"+username+"' and password='"+encdnc.encdecme(password)+"'");
		
		if(!rs.equals(null)) {
			out.print("hello");
			try {
				while(rs.next()) {
					
					 
					
					  if(rs.getCharacterStream("Role").read()=='U') { 
						  out.print(referer); 
						  HttpSession session=request.getSession();
						  session.setAttribute("username", username); 
						  session.setAttribute("userid", rs.getInt("Uid"));
						  if(referer.length()>0 || referer.equals("login.jsp")) { 
							  response.sendRedirect("index.jsp"); 
							  }
						  else {
							  response.sendRedirect(referer); 
							  }
						  }else if(rs.getCharacterStream("Role").read()=='A') { 
							  HttpSession session=request.getSession(); 
							  session.setAttribute("usernameadmin", username);
							  response.sendRedirect("Admin/index.jsp"); 
						}
					 
					 
					 
					//response.sendRedirect("index.jsp");
					
				}
			} catch (SQLException e) {
				out.print(e.getMessage());
			}
		}else {
			out.print("hello");
			request.setAttribute("message", "Check Your Credentials, please!");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			
		}
		
	}

}
