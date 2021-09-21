<%@page import="otp.Otpgenerate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="encryption.encrydecry"%>
<%@page import="database.Dbhelper"%>
<%@page import="mail.Mailforme" %>
<%
    try {
             
        String reemail=request.getParameter("resetemail");
        String name=request.getParameter("nameresetpass");
        String password;
        Dbhelper c=new Dbhelper();
        c.connectwithdb();
        ResultSet getdata;
       
        String sqlforfetchdatafromemail="select * from user_data where Email='"+reemail+"' and Username='"+name+"'";
        
        getdata=c.execquery(sqlforfetchdatafromemail);
        if(getdata.next()){
        	 Otpgenerate o=new Otpgenerate();
             password=o.getotp();
             Mailforme j=new Mailforme();
             j.sendmail(reemail,password);
             out.print(password);
        }
         } catch (Exception ex) {
           // Logger.getLogger(resetpassword.class.getName()).log(Level.SEVERE, null, ex);
        }
%>