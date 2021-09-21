<%@page import="database.Dbhelper"%>
<%
String categoryname=request.getParameter("Categoryname");
String categoryid=request.getParameter("Categoryid");
Dbhelper db=new Dbhelper();
db.connectwithdb();
int i =db.exquery("update category set Category='"+categoryname+"' where Catid='"+categoryid+"'");
if(i>0){
	response.sendRedirect("viewCategory.jsp");
}
%>