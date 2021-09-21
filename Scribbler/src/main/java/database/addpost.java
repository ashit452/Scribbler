package database;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;



import Imgupload.parttoblob;

/**
 * Servlet implementation class addpost
 */

@WebServlet("/addpost")
@MultipartConfig(maxFileSize = 16177216)
public class addpost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addpost() {
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
		PrintWriter out=response.getWriter();
		ResultSet rs;
		HttpSession session=request.getSession(false);
		String username=session.getAttribute("username").toString();
		Dbhelper db=new Dbhelper();
		db.connectwithdb();
		String sql="select Uid from user_data where Username='"+username+"'";
		rs=db.execquery(sql);
		out.print("\nhello6");
		try {
			out.print("\nhello 5");
			
			
			if(rs.next()) {
				out.print("\nhello 4.0");
				Part file1=request.getPart("pimg");
				out.print("\nhello 4");
				
				InputStream blob= parttoblob.getmyblob(file1);
				String Title=request.getParameter("ptitle");
				String Category=request.getParameter("pcat");
				String Description=request.getParameter("pdes");
				out.print("\nhello 3");
				postbeans pb=new postbeans();
				pb.setUid(rs.getInt("Uid"));
				pb.setTitle(Title);
				pb.setCategory(Category);
				pb.setDescription(Description);
				pb.setImage(blob);
				pb.setStatus("A");
				out.print("\nhello 2");
				int a=db.insertforpost(pb);
				out.print("\nhello"+a);
				if(a>0) {
					response.sendRedirect("index.jsp");
				}else {
					out.print("not working");
				}
			}else {
				out.print("no user found");
			}
		}catch(Exception e) {
			e.getMessage();
		}
		
		
	}

}
