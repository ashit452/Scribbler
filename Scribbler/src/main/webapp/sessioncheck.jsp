<%

String uri = request.getRequestURI();
String pageName = uri.substring(uri.lastIndexOf("/")+1);
if(pageName.length()!=0){
	 if(session.getAttribute("username")== null || session.getAttribute("username")== ""){
		
		
		 if(!pageName.equals("login.jsp")){
			 if(!pageName.equals("index.jsp")){
			    	response.sendRedirect("login.jsp");
			 }
	    }
		
	}else{
		if(pageName.equals("login.jsp")){
			//session.setAttribute("pagename", pageName);
			response.sendRedirect("logout.jsp");
		}
		//out.print(pageName);
	}
} 

%>