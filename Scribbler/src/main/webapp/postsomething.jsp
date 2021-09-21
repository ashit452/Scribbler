<%@page import="java.sql.ResultSet"%>
<%@page import="database.Dbhelper"%>
<%@include file="header.jsp" %>
<body id="top">

	<!-- header 
   ================================================== -->
   <header class="short-header">   

   	<div class="gradient-block"></div>	

   	<div class="row header-content">

   		<div class="logo">
	         <a href="index.jsp">Arthur</a>
	      </div>

	   	<nav id="main-nav-wrap">
				<ul class="main-navigation sf-menu">
					<li ><a href="index.jsp" title="">Home</a></li>									
					<li class="current"><a href="postsomething.jsp" title="">Post Something</a></li>
					<li><a href="explore.jsp" title="">Explore</a></li>	
					<li><a href="aboutus.jsp" title="">About Us</a></li>	
					<% 
					if(session.getAttribute("username")==null || session.getAttribute("username")==""){
					%>
					<li style="height:28px;background-color: white; border-radius: 45px;">
						<a href="login.jsp" ><span style="padding-left:10px;margin-right: 10px;"><i class="fa fa-user"></i></span></a>
					</li>
					<%}else{ %>
					<li class="has-children" style="height:28px;background-color: white; border-radius: 45px;">
						<a href="profile.jsp" ><span style="padding-left:10px;margin-right: 10px;"><i class="fa fa-user"></i></span><span style="padding-right:10px;"><%=session.getAttribute("username").toString().toUpperCase() %></span></a>
						<ul class="sub-menu">
			            <li><a href="profile.jsp">Profile</a></li>
			            <li><a href="logout.jsp">Logout</a></li>
			         </ul>
					</li>
					<%} %>
					
					
														
				</ul>
			</nav> <!-- end main-nav-wrap -->

			<div class="search-wrap">
				
				<form role="search" method="get" class="search-form" action="#">
					<label>
						<span class="hide-content">Search for:</span>
						<input type="search" class="search-field" placeholder="Type Your Keywords" value="" name="s" title="Search for:" autocomplete="off">
					</label>
					<input type="submit" class="search-submit" value="Search">
				</form>
				
   	
				<a href="#" id="close-search" class="close-btn">Close</a>

			</div> <!-- end search wrap -->	

   

			<div class="triggers">
				
				<a class="search-trigger" href="#"><i class="fa fa-search"></i></a>
				<a class="menu-toggle" href="#"><span>Menu</span></a>
				
			</div> <!-- end triggers -->
			
   	</div>     		
   	
   </header> <!-- end header -->
<section id="content-wrap" class="site-page">
   	<div class="row">
   		<div class="col-twelve">

  		<section>  

   			

					<div class="primary-content" id="div_login_form">

						
						<form name="cForm" id="cForm" method="post" action="addpost" enctype="multipart/form-data">
	  					   <fieldset>
						
						 <h1>Post Something</h1>
						 
						  <div class="form-field">
                     		  <input name="pimg" type="file"  id="pImage" class="full-width" accept="image/*" title="Choose Image">
                     		</div>
	                     <div class="form-field">
	  						      <input name="ptitle" type="text" id="luser" class="full-width" placeholder="Your Post Title" value="" onkeydown="maxcheck(this);" required="required" maxlength="15">
	                     </div>
						 
			        	<div class="ss-custom-select">
			        		<select class="full-width" name="pcat" id="sampleRecipientInput">
			        		<%
						 
	                      	Dbhelper db=new Dbhelper();
	                      	db.connectwithdb();
	                      	ResultSet rs=db.execquery("select * from category");
	                      	
	                      	while(rs.next()){
	                      %>
						
						<option value="<%=rs.getString("Category").toString() %>" data-badge=""><%=rs.getString("Category").toString() %></option>
						<%
							
	                      	}
						%>
				        	</select>
			        	</div>			         	
			     		
                    	<textarea class="full-width" name="pdes" placeholder="Your Post Description" id="exampleMessage"></textarea>

						 <button type="submit" class="submit button-primary full-width-on-mobile">Post</button>

	  					   </fieldset>
  				      </form> <!-- end form -->
  				    </div>
  		</section> 			
   		

		</div> <!-- end col-twelve -->
   	</div> <!-- end row -->		
  </section>


<%@include file="footer.jsp" %>
<%@include file="footerscript.jsp" %>
