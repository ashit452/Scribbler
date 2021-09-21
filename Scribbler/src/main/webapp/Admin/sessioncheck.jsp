<%


	 if(session.getAttribute("usernameadmin").toString()== null || session.getAttribute("usernameadmin").toString()== ""){
			    	response.sendRedirect("../login.jsp");
	    }
		
	

%>