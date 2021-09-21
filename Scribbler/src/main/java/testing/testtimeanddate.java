package testing;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class testtimeanddate
 */
@WebServlet("/testtimeanddate")
public class testtimeanddate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testtimeanddate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 PrintWriter out=response.getWriter();
		 SimpleDateFormat dateTimeInGMT = new SimpleDateFormat("yyyy-M-dd hh:mm:ss aa");
         dateTimeInGMT.setTimeZone(TimeZone.getTimeZone("IST"));
         String dateandtime=dateTimeInGMT.format(new Date());
         String[] dateandtimearray=dateandtime.split(" ");
         out.print("\nDate:"+dateandtimearray[0]);
         out.print("\nTime:"+dateandtimearray[1]+" "+dateandtimearray[2]);
         out.print("\n"+java.sql.Date.valueOf(dateandtimearray[0]));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
