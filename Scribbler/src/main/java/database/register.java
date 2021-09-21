package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import encryption.encrydecry;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter pw=response.getWriter();
		String name=request.getParameter("rname");
		String email=request.getParameter("remail");
		String username=request.getParameter("rusername");
		String password=request.getParameter("rpassword");
		
		registerbean Rbean=new registerbean();
		Rbean.setName(name);
		Rbean.setEmail(email);
		Rbean.setUsername(username);
		Rbean.setRole("U");
		Rbean.setStatus("A");
		encryption.encrydecry e=new encrydecry();
		password=e.encdecme(password);
		Rbean.setPassword(password);
		Dbhelper db=new Dbhelper();
		int con=db.connectwithdb();
		if(con==0) {
			pw.print("Connection not created");
		}else {
			pw.print("Connection created");
		}
		int i=db.insertforregistration(Rbean);
		if(i>0) {
			
			  HttpSession session=request.getSession(); 
			  session.setAttribute("username",username);
			 
			response.sendRedirect("interests.jsp");
		}else {
			pw.print("not register!");
		}
		
	}

}
