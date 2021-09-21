package reset;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.sun.org.slf4j.internal.Logger;

import database.Dbhelper;
import encryption.encrydecry;

/**
 * Servlet implementation class resetpassword
 */
@WebServlet("/resetpassword")
public class resetpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resetpassword() {
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
		PrintWriter p=response.getWriter();;
		try {
	        encrydecry e=new encrydecry();
	        String repass=request.getParameter("newpasswordishere");
	        repass=e.encdecme(repass);
	        String reemail=request.getParameter("emailresetpassword");
	        String name=request.getParameter("nameresetpass");
	        Dbhelper c=new Dbhelper();
	        
	        p.print(c.connectwithdb());
	        
	        String sqlforupdatepass="update user_data set Password='"+repass+"' where Email='"+reemail+"' and Username='"+name+"'";
	        int chk=c.exquery(sqlforupdatepass);
	        
	        
	        if(chk>0){
	            response.sendRedirect("login.jsp");
	        }
	        
	         } catch (Exception ex) {
	           p.print(ex.getMessage());
	        }
	}

}
