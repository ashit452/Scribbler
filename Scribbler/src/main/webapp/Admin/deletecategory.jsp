<%@page import="database.Dbhelper"%>
<%

String id=request.getParameter("id");
Dbhelper db=new Dbhelper();
db.connectwithdb();
int i=db.exquery("delete from category where Catid='"+id+"'");
if(i>0){
	response.sendRedirect("viewCategory.jsp");
}else{
	out.print("something went wrong");
}
%>