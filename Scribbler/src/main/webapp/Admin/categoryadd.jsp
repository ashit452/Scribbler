<%@page import="database.categorybean"%>
<%@page import="database.Dbhelper"%>
<%
String categoryname=request.getParameter("CategoryName");
Dbhelper db=new Dbhelper();
db.connectwithdb();
categorybean cbean=new categorybean();
cbean.setCategoryname(categoryname);
int i =db.insertforcategory(cbean);
if (i>0){
	response.sendRedirect("viewCategory.jsp");
}else{
	out.print("something went wrong");
}
%>