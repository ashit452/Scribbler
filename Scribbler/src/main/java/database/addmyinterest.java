package database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addmyinterest
 */
@WebServlet("/addmyinterest")
public class addmyinterest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addmyinterest() {
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
		ResultSet rs;
		PrintWriter out=response.getWriter();
		String[] items=request.getParameterValues("myinterest");
		String myinterest=String.join("','", items);
		HttpSession session=request.getSession(false);
		String username=session.getAttribute("username").toString();
		myinterest="'"+myinterest+"'";
		interestbean ibean=new interestbean();
		
		Dbhelper db=new Dbhelper();
		db.connectwithdb();
		String sql="select Uid from user_data where Username='"+username+"'";
		rs=db.execquery(sql);
		out.print(sql);
		try {
			if(rs.next()) {
				ibean.setUid(rs.getInt("Uid"));
				ibean.setInterest(myinterest);
				int i=db.insertforinterest(ibean);
				//out.print("hello");
				if(i>0) {
					response.sendRedirect("index.jsp");
				}
			}else {
				out.print("hello");
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
