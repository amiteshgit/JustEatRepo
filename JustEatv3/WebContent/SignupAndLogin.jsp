<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Sign-Up/Login Form</title>
  <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
      
    <link href="signupAndLoginCSS.css" rel="stylesheet" type="text/css">
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
          <script type="text/javascript"  language="JavaScript" src="signupAndLoginJS.js"></script>
    
</head>

<body>
  <div class="form">
      
      <ul class="tab-group">
        <li class="tab active" id="signupTab"><a href="javascript:signupLogin('signupTab','loginTab','signup','login')">Sign Up</a></li>
        <li class="tab" id="loginTab"><a href="javascript:signupLogin('loginTab','signupTab','login','signup')">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup" style="display:block">   
          <h1>Sign Up for Free</h1>
          
          <form action="/" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                First Name<span class="req">*</span>
              </label>
              <input type="text" required autocomplete="off" />
            </div>
        
            <div class="field-wrap">
              <label>
                Last Name<span class="req">*</span>
              </label>
              <input type="text"required autocomplete="off"/>
            </div>
          </div>

          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Set A Password<span class="req">*</span>
            </label>
            <input type="password"required autocomplete="off"/>
          </div>
          
          <button type="submit" class="button button-block"/>Get Started</button>
          
          </form>

        </div>

        <div id="login" style="display:none">   
          <h1>Welcome Back!</h1>
          
          <s:form action="login">
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input name="userID" type="text"required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input name="password" type="password"required autocomplete="off"/>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button type="submit" class="button button-block"/>Log In</button>
          
          </s:form>

        </div>
        
      </div><%-- tab-content --%>
      
</div> <%-- /form --%>


</body>
</html>
