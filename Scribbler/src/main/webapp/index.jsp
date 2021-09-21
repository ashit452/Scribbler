<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>

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
					<li class="current"><a href="index.jsp" title="">Home</a></li>									
					<li><a href="postsomething.jsp" title="">Post Something</a></li>
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

 <section id="bricks">
	
   	<div class="row masonry">
		<!-- <article class="brick entry format-quote animate-this" >

               <div class="entry-thumb">                  
	               <blockquote>
	                 	<p>Good design is making something intelligible and memorable. Great design is making something memorable and meaningful.</p>

	                 	<cite>Dieter Rams</cite> 
	               </blockquote>	          
               </div>   

        </article> -->
   		<!-- brick-wrapper -->
   		
         <div class="bricks-wrapper">

         	<div class="grid-sizer"></div>

         
<% 
	Dbhelper db=new Dbhelper();
	db.connectwithdb();
	String sql="select * from post_data where Status='A'";
	ResultSet rs=db.execquery(sql);
	while(rs.next()){
		Blob image=rs.getBlob("Image");
		byte[] imgdata=image.getBytes(1, (int)image.length());
		String imgDataBase64=new String(Base64.getEncoder().encode(imgdata));
%>
         	<article class="brick entry format-standard animate-this">

               <div class="entry-thumb">
                  <a href="single-standard.html" class="thumb-link">
	                  <img src="data:image/*;base64,<%= imgDataBase64 %>" style="width: 100%">             
                  </a>
               </div>

               <div class="entry-text">
               	<div class="entry-header">

               		<div class="entry-meta">
               			<div >
							<%=rs.getDate("Posteddate")+" "+rs.getTime("Postedtime")%>
						</div>
               			<span class="cat-links">
               				<%=rs.getString("Category") %>           				
               			</span>			
               		</div>

               		<h1 class="entry-title"><%=rs.getString("Title") %></h1>
               		
               	</div>
						<div class="entry-excerpt">
							<%=rs.getString("Description").substring(0,rs.getString("Description").length()/10) %>
						</div>
						
               </div>

        		</article> <!-- end article -->
<%} %>
           

         </div> <!-- end brick-wrapper --> 

   	</div> <!-- end row -->

   	<!-- <div class="row">
   		
   		<nav class="pagination">
		      <span class="page-numbers prev inactive">Prev</span>
		   	<span class="page-numbers current">1</span>
		   	<a href="#" class="page-numbers">2</a>
		      <a href="#" class="page-numbers">3</a>
		      <a href="#" class="page-numbers">4</a>
		      <a href="#" class="page-numbers">5</a>
		      <a href="#" class="page-numbers">6</a>
		      <a href="#" class="page-numbers">7</a>
		      <a href="#" class="page-numbers">8</a>
		      <a href="#" class="page-numbers">9</a>
		   	<a href="#" class="page-numbers next">Next</a>
	      </nav>

   	</div> -->

   </section> <!-- end bricks -->

<%@include file="footer.jsp" %>
<%@include file="footerscript.jsp" %>
