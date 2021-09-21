package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.apache.jasper.tagplugins.jstl.core.Out;

import java.sql.ResultSet;
import static database.Dbcredential.*;
public class Dbhelper {
	Connection con;
	PreparedStatement prd;
	ResultSet rs;
	Statement st;
public int connectwithdb() {
		int i=0;
		try {
			Class.forName(DRIVER);
			con=DriverManager.getConnection(URL,USR,PASS);
			st=con.createStatement();
			System.out.print(con);
			if (con!=null) {
				i++;
				return i;
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			System.out.print(e.getMessage());
		}
		return i;
		
	}

public int exquery(String qry){
    int ans=0;
     try{
         ans=st.executeUpdate(qry); 
         
    }
     catch(Exception e2){
         e2.printStackTrace();
     }
     return ans;
 }
	/*
	 * public int insertintodb(Mydatabean mdb) { int i=0; try { prd=con.
	 * prepareStatement("insert into DoctorInfo(DoctorName,DoctorSpecialization,ConsultationFee,DoctorLocation,DoctorExperience) values(?,?,?,?,?)"
	 * ); prd.setString(1,mdb.getDoctorName());
	 * prd.setString(2,mdb.getDoctorSpecialization());
	 * prd.setDouble(3,mdb.getConsultationFee());
	 * prd.setString(4,mdb.getDoctorLocation());
	 * prd.setInt(5,mdb.getDoctorExperience()); i=prd.executeUpdate(); } catch
	 * (SQLException e) { System.out.print(e.getMessage()); } return i; }
	 */
	
	 public int insertforregistration(registerbean Rbean) {
		 int i=0;
		 
		 try {
			prd=con.prepareStatement("Insert into user_data(Name,Email,Username,Password,Role,Status) values(?,?,?,?,?,?)");
			prd.setString(1, Rbean.getName());
			prd.setString(2, Rbean.getEmail());
			prd.setString(3, Rbean.getUsername());
			prd.setString(4, Rbean.getPassword());
			prd.setString(5, Rbean.getRole());
			prd.setString(6, Rbean.getStatus());
			i=prd.executeUpdate();
			return i;
		} catch (SQLException e) {
			System.out.print(e);
		}
		 return i;
	 }
	 public int insertforcategory(categorybean Rbean) {
		 int i=0;
		 
		 try {
			prd=con.prepareStatement("Insert into category(Category) values(?)");
			prd.setString(1, Rbean.getCategoryname());
			
			i=prd.executeUpdate();
			return i;
		} catch (SQLException e) {
			System.out.print(e);
		}
		 return i;
	 }
	
	  public ResultSet execquery(String sql) { 
		  try { 
			  st=con.createStatement();
			  rs=st.executeQuery(sql); 
			  } catch (SQLException e) {
				  System.out.print(e.getMessage()); 
			  } 
		  return rs; 
		  }
	 
	public int insertforinterest(interestbean ibean) {
		int i=0;
		try {
			prd=con.prepareStatement("Insert into interest(Uid,Interest) values(?,?)");
			prd.setInt(1, ibean.getUid());
			prd.setString(2, ibean.getInterest());
			i=prd.executeUpdate();
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public int insertforpost(postbeans pb) {
		SimpleDateFormat dateTimeInGMT = new SimpleDateFormat("yyyy-M-dd HH:mm:ss");
        dateTimeInGMT.setTimeZone(TimeZone.getTimeZone("IST"));
        String dateandtime=dateTimeInGMT.format(new Date());
        String[] dateandtimearray=dateandtime.split(" ");
        String date=dateandtimearray[0];
        String time=dateandtimearray[1];
        		
       
		int i=0;
		try {
			prd=con.prepareStatement("Insert into post_data(Uid,Title,Category,Description,Image,Status,Postedtime,Posteddate) values(?,?,?,?,?,?,?,?)");
			prd.setInt(1,pb.getUid());
			prd.setString(2,pb.getTitle());
			prd.setString(3,pb.getCategory());
			prd.setString(4,pb.getDescription());
			prd.setBlob(5,pb.getImage());
			prd.setString(6,pb.getStatus());
			prd.setTime(7,Time.valueOf(time));
			prd.setDate(8,java.sql.Date.valueOf(date));
			i=prd.executeUpdate();
			return i;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.print(e.getMessage());
		}
		return i;
	}
}
