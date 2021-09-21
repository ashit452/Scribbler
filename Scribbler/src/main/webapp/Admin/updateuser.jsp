<%@page import="database.Dbhelper"%>
<%
String task = request.getParameter("task");
String id=request.getParameter("id");
Dbhelper db=new Dbhelper();
db.connectwithdb();
if(task.equals("block")){
	int i=db.exquery("update user_data set Status='B' where Uid='"+id+"'");
	if(i>0){
		response.sendRedirect("viewUser.jsp");
	}else{
		out.print("something went wrong");
	}
}

if(task.equals("unblock")){
	int i=db.exquery("update user_data set Status='A' where Uid='"+id+"'");
	if(i>0){
		response.sendRedirect("viewUser.jsp");
	}else{
		out.print("something went wrong");
	}
}
%>