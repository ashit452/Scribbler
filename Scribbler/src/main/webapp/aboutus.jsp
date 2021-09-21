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
					<li><a href="postsomething.jsp" title="">Post Something</a></li>
					<li><a href="explore.jsp" title="">Explore</a></li>	
					<li class="current"><a href="aboutus.jsp" title="">About Us</a></li>	
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

  <!-- content
   ================================================== -->
   <section id="content-wrap" class="site-page">
   	<div class="row">
   		<div class="col-twelve">

   			<section>  

   				<div class="content-media">						
						<img src="images/cover.png">						  
					</div>

					<div class="primary-content">

						<h1 class="entry-title add-bottom">Learn More About Us.</h1>	

						<p class="lead">Scribbler is like social media for readers and writers, scribbler will provide an environment for the user to post any content like Stories, poems, quotes, the experience of life or anything. This platform will provide the audience/readers with the same interest and also provide very interesting content to read to their audience by interest.
						</p>

						

					</div>						

				</section>  		

			</div> <!-- end col-twelve -->
   	</div> <!-- end row -->
		
   </section> <!-- end content -->

   <!-- end bricks -->

<%@include file="footer.jsp" %>
<%@include file="footerscript.jsp" %>
