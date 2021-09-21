
<%@include file="header.jsp" %>

<style type="text/css">
 .newpassdiv{
            display: none;
        }
</style>
<section id="content-wrap" class="site-page">
   	<div class="row">
   		<div class="col-twelve">

   			<section>  

   			

					<div class="primary-content" id="div_login_form">

						
						<form name="cForm" id="cForm" method="post" action="login">
	  					   <fieldset>
						
						 <h1>Login</h1>
	                     <div class="form-field">
	  						      <input name="lusername" type="text" id="luser" class="full-width" placeholder="Your Username" value="" onkeydown="maxcheck(this);" required="required" maxlength="15">
	                     </div>
						 <div class="form-field hidden">
	  						      <input name="referer" type="hidden" id="ref" class="full-width"  value="<%String url = request.getHeader("referer"); if(url==null){out.print("");}else{out.print(url.substring(url.lastIndexOf("/")+1));} %>" >
	                     </div>
	                     <div class="form-field">
	  						      <input name="lpassword" type="password" id="lpass" class="full-width" placeholder="Your Password" value="" onkeydown="maxcheck(this);" required="required" maxlength="8" >
	                     </div>
						
	                    <h4>Forget Password? <a class="login_form" onclick="toggletoforgetpass(this.className);"  href="#">Click Here!</a> Or Not yet registered? <a class="login_form" onclick="togglemyforms(this.className);" href="#">Click Here!</a></h4>
	                     <%
	                     	String message=request.getParameter("message");
	                     	if(message!=null){
	                     %>
	                     <div class="alert-box ss-error hideit" id="error-msg">
						        <p><%=message %></p>
						        <i class="fa fa-times close"></i>
						 </div>
						 <%} %>
						 <button type="submit" class="submit button-primary full-width-on-mobile">Login</button>

	  					   </fieldset>
  				      </form> <!-- end form -->
  				    </div>
  				    <div class="primary-content" id="div_forget_form" style="display: none">

						
						<form name="cForm" id="cForm" action="resetpassword" method="post">
	  					   <fieldset>
						
						 <h1>Forget Password</h1>
	                     <div class="form-field">
	  						      <input type="text" id="resetname" required="required" autocomplete="off" name="nameresetpass" class="full-width" placeholder="Your Registered Username" value="" onkeydown="maxcheck(this);"  maxlength="15">
	                     </div>
						  <div class="form-field">
	  						      <input type="text" id="resetemail" required="required" autocomplete="off" name="emailresetpassword" class="full-width" placeholder="Your Registered Email" onblur="blurmyemail()" value="" >
	                     </div>
	                     <div class="form-field">
	  						      <input type="text" id="resetotp"  autocomplete="off" name="newotpreset"class="full-width" placeholder="Your One Time Password" value="" onkeyup="checkmyotp()">
	                     </div>
						<div class="form-field newpassdiv" id="newpassid">
	  						      <input type="password" id="resetnewpass"  autocomplete="off" name="newpasswordishere" class="full-width" placeholder="Your New Password" value="" onkeyup="checknewpassword()" onkeydown="maxcheck(this);" required="required" maxlength="8" >
	                     </div>
	                    <h4>Want to go Back to Login? <a class="forget_form" onclick="toggletoforgetpass(this.className);"  href="#">Click Here!</a></h4>
	                     <button type="submit" class="submit button-primary full-width-on-mobile">Reset</button>

	  					   </fieldset>
  				      </form> <!-- end form -->
  				    </div>
					<div class="primary-content" id="div_register_form" style="display: none">

						
						<form name="cForm" id="cForm" method="post" action="register">
	  					   <fieldset>
						
						 <h1>Register</h1>
	                     <div class="form-field">
	  						      <input name="rname" type="text" id="rname" class="full-width" placeholder="Your Name" value="" onkeydown="maxcheck(this);" required="required" maxlength="15">
	                     </div>

	                     <div class="form-field">
	  						      <input name="remail" type="email" id="remail" class="full-width" placeholder="Your Email" value=""  required="required">
	                     </div>
	                     <div class="form-field">
	  						      <input name="rusername" type="text" id="ruser" class="full-width" placeholder="Your Username" value="" onkeydown="maxcheck(this);" required="required" maxlength="15">
	                     </div>

	                     <div class="form-field">
	  						      <input name="rpassword" type="password" id="rpass" class="full-width" placeholder="Your Password" value="" onkeydown="maxcheck(this);" required="required" maxlength="8" >
	                     </div>


	                    <h4>Already registered? <a href="#" onclick="togglemyforms(this.className);" class="register_form">Click Here!</a></h4>
	                     <button type="submit" class="submit button-primary full-width-on-mobile">Register</button>

	  					   </fieldset>
  				      </form> <!-- end form -->
  				    </div>
					
				</section>
   		

			</div> <!-- end col-twelve -->
   	</div> <!-- end row -->		
   </section> <!-- end content -->
  
<script type="text/javascript">
	
	function maxcheck(m) {
		var id="#"+m.id;
		var maxLength = $(id).attr("maxlength");
		  if(maxLength == $(id).val().length) {
		    alert("You can't write more than " + maxLength +" chacters")
		  }
	}
	function toggletoforgetpass(m){
		 if (m=='login_form') {
				
			 	$('#div_login_form').css('display','none');
				$('#div_forget_form').css('display','');
			}
		 if (m=='forget_form') {
				
			 	$('#div_forget_form').css('display','none');
				$('#div_login_form').css('display','');
			}
	}
	function togglemyforms(m) {
	
	 if (m=='login_form') {
			
		 	$('#div_login_form').css('display','none');
			$('#div_register_form').css('display','');
		}
	 if (m=='register_form') {
			
		 	$('#div_register_form').css('display','none');
			$('#div_login_form').css('display','');
		}
	}
	var password="pass";
	    function blurmyemail(){
	    	
	    	$("#submitresetpass").attr("disabled",true);    
	        $.ajax({
	                url: 'resetmypassajax.jsp',
	                data: 'resetemail='+ $('#resetemail').val()+'&nameresetpass='+$("#resetname").val(),
	                type: 'post',
	                success: function(msg){
	                  if(msg.trim().length>0){
	                	  password=msg.trim();
		                  //alert(password);
	                  }
		                  
	                  
	           }}); 
	        }
	    function checkmyotp(){
	    	 if($('#resetotp').val() === password.trim()){
                 $('#newpassid').removeClass("newpassdiv");
                 $("#submitresetpass").attr("disabled",false);
                 
             }else{
                 $('#newpassid').addClass("newpassdiv");
                 $("#submitresetpass").attr("disabled",true);
             }
	    }
	       
	    function checknewpassword(){
	    	 if($('#resetotp').val() === password.trim()){
                 $("#submitresetpass").attr("disabled",false);
                
            }else{
                $('#newpassid').addClass("newpassdiv");
                $("#submitresetpass").attr("disabled",true);
            }
	    }
	   
    
        /* $("#").blur(function(){
                
        });  */
        
</script>

<%@include file="footerscript.jsp" %>
