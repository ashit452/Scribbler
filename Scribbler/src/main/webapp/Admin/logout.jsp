<%
	if(session.getAttribute("usernameadmin")==null){
		response.sendRedirect("../login.jsp");
	}else{
		//String pageName=session.getAttribute("pagename").toString();
		session.setAttribute("usernameadmin", null);
		//response.sendRedirect(pageName);
		response.sendRedirect("../login.jsp");
	}
%>