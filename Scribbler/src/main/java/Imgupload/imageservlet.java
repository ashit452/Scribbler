package Imgupload;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Dbhelper;

/**
 * Servlet implementation class imageservlet
 */
@WebServlet("/imageservlet")
public class imageservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public imageservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String id=request.getParameter("id");
		try {
			PrintWriter out=response.getWriter();
			Dbhelper db=new Dbhelper();
			db.connectwithdb();
			String sql="select * from post_data where Pid="+id+"";
			ResultSet rs=db.execquery(sql);
			while (rs.next()) {
				 	Blob blob = rs.getBlob("Image");
		            byte byteArray[] = blob.getBytes(1, (int) blob.length());
		            response.setContentType("image/*");
		            OutputStream os = response.getOutputStream();
		            os.write(byteArray);
		            os.flush();
		            os.close();
			}
		}catch (Exception e) {
			e.getMessage();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
