<%
		if(session.getAttribute("username")==null){
			response.sendRedirect("login.jsp");
		}else{
			//String pageName=session.getAttribute("pagename").toString();
			session.invalidate();
			//response.sendRedirect(pageName);
			response.sendRedirect("index.jsp");
		}
		//out.print(pageName);
		
	
	/* if(pageName.equals("index.jsp")){
	    response.sendRedirect("index.jsp");
	 }else{
		 response.sendRedirect("login.jsp");
	 } */ 
%>
