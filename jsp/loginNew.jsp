<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script
        src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
        crossorigin="anonymous">
    </script>


<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>
<script language=JavaScript src="/scripts/MD5.js"> </script>
<script language=JavaScript src="/scripts/Enc_Desc.js"> </script>
<script>


	

function enterKey(evt) {
	evt =(evt)?evt:window.event;
    var c =(evt.which)?evt.which :evt.keyCode;
	if(c == 13)
		document.getElementById("ok").onclick();
	evt.keyCode=(!((c>=64 && c<=90) ||(c>=97 && c<=122)|| (c>=48 && c<=57) ))?0:event.keyCode;
   }
   function Ecodepwd()
	{
	  var sPwd = calcMD5(document.getElementById("sIbUsr_LogPass").value);
	  var sSessionId='<%=session.getId()%>';
	  document.getElementById("password").value=sPwd ;
	}

</script>


    <script src="/allNewCSS/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/dashBoard/css/custom.css">
    <link rel="stylesheet" href="/dashBoard/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/dashBoard/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/dashBoard/css/font-awesome.min.css">
    <link rel="stylesheet" href="/dashBoard/css/bootstrap.min.css">

    <!-- This Link for captcha style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/Captcha-login-page/captcha_style.css">
<!-- Font Awesome CDN Link for Icons -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/jsp/Captcha-login-page/captcha-min.css"/>
    
    <title>HPSCB INTERNET BANKING</title>
</head>
<style>
    .keys_icon:hover{
        cursor: pointer;
    }

    .hidden {
    display: none;
}

#virtualKeyboard {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
</style>
<body>

    <html:form action= "/jsp/login">

    <header class="site-header">
        <div class="top-header">
            <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="site-logo">
                        <a href="/jsp/loginNew.jsp">
                            <img src="/dashBoard/images/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-md-10">

                	<div class="main-upper-header-menu">
                		<ul>
                			<!-- <li>
                				<a href="#">
                					HPSCB Bank Home 
                				</a>
                			</li>

                			<li>
                				<a href="#">
                					About Us
                				</a>
                			</li> -->

                			<li>
                				<a href="callTo:18001808090">
                					Customer Care 
                				</a>
                			</li>

                			<!-- <li>
                				<a href="#">
                					Find ATM/Branch
                				</a>
                			</li>

                			<li>
                				<a href="#">
                					Mobile Banking
                				</a>
                			</li> -->

                		</ul>
                	</div>
                	                                      
                </div>
            </div>
        </div>
    </div>
  
    </header>
    <!-- <div class="menu">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="toggle d-none">
                        <span class="one"></span>
                        <span class="one"></span>
                        <span class="one"></span>
                    </div>
                    <ul>
                        <li>
                            <a href="#">
                               PERSONAL BANKING
                            </a>
                        </li>

                        <li>
                            <a href="#">
                              PRIVILEGE BANKING
                            </a>
                        </li>

                        <li>
                            <a href="#">
                               CORPORATE BANKING
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div> -->
  <!-- header-part-end -->

<section class="log-in-page">
    <div class="logininner">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="right-section-log">
                        <h2>
                            <strong>SECURE DIGITAL BANKING 
                                </strong>
                                <span>Please read carefully</span>
                        </h2>
                        <span class="never-log-in">
                            <strong>Never log in</strong> to your account from any link or APK file sent  through SMS, Email.
                        </span>

                        <span class="never-log-in">
                            <strong>HPSCB Bank Never</strong> Contacts customers through personal Phone No. or e-mail/Social Media for any banking Transactions.
                        </span>
                        <span class="for-any">
                            <i class="fa fa-info" aria-hidden="true"></i>
                            For any further assistance,  call us on  0177-2832486
                        </span>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="center-section-log">
                        <img src="/dashBoard/images/do-not-share.png" alt="">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="left-section-log">
                        <form action="" class="login-form">
                            <span class="heading-log">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                                Login to Internet Banking
                            </span>
                            <div class="log-in-area">
                                <!-- <input type="text" name="user-id" placeholder="User ID" > -->
                                <!-- New User id input -->
                                <label> User ID</label>
                                <html:text   property="sIbUsr_LogId" styleId="sIbUsr_LogId"  size="20"
                                 maxlength="15"  onkeypress="javascript:isValidNumAlpha()" />
                                
                                <!-- <input type="password" name="password" placeholder="Password"> -->
                                <!-- New Password input -->
                                <label> Password </label>
                                <html:password   property="sIbUsr_LogPass" styleId="sIbUsr_LogPass" size="20"
                                 maxlength="15" />
                                 <div class="keys_icon" id="keys_icon" style="padding-top: 8px; position: relative; top: -62px; left: 87%">
                                    <img src="/jsp/images/keyboard.png" style="height: 33px;">
                                </div>
                                <html:hidden  property="password" styleId ="password"/>
                                <!-- New Login button  -->
                                <%-- <input value="Login" type="button" name="ok" onclick="login_submit()"  tabindex="3" > --%>

                                <div class="col-md-12">
                                    <div class="captcha-area d-flex">
                                        <div class="captcha-img" style="height: 40px; position: relative;">
                                            <img src="/jsp/Captcha-login-page/captcha-bg.png" alt="Captch Background" style="height: 40px; position: absolute; top: 0; left: 0;">
                                            <span class="captcha" style="color: black; top:20px"></span>
                                        </div>                            
                                        <div class="captcha-div" style="height: inherit;">
                                        <a onclick="reloadCaptcha();" >
                                            <img style="height: 30px;margin: 4px; background-color:#0fa8f7" src="<%=request.getContextPath()%>/jsp/Captcha-login-page/refresh-2-xxl.png" alt="Captcha Background">
                                        </a>
                                            </input>
                                        </div>
                                    </div>
                                    <!-- <form action="#" class="input-area-captcha"> -->
                                    <div class="p-1">
                                    <action="#" class="input-area input input-area-captcha">
                                    <!-- <div class="input-area-captcha  input-area input"> -->
                                    <input type="text" onchange="functioncl()" id="captchabox" placeholder="Enter captcha" maxlength="6" onkeypress="isValidNumAlpha()" autocomplete="off" spellcheck="false" required>
                                        <!-- <button style="display: none;" class="check-btn">Check</button> -->
                                    <!-- </form> -->
                                    </div>
                                    <div class="status-text"></div>
                                    
                                    <!-- this is for captcha sc -->
                                    <script src="<%=request.getContextPath()%>/jsp/Captcha-login-page/captcha_script.js"></script>
                                </div>

                            <button type="button"  value="Login" name="ok" onclick="login_submit()"> <i class="fa fa-sign-in" aria-hidden="true"></i> Login</button>

                            <input type="hidden" name="paramLogin" value="true" >
                            </div>
                        </form>
                    </div>
                    <div id="virtualKeyboard" class="hidden" style="background-color: #ffffff;">
                            <table width="300" border="1" bordercolor="black" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="keyPadHeading" align="center">
                                        Virtual Keypad (Only for Password)
                                        <input type="button"  value="X" name="buttonclose" id="buttonclose"  class="type4d"  onclick="disableKeyPad()"  disabled >
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="padding-top:5px;padding-bottom:5px;border-top:0">
                                        <table width="300" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="center">
                                                    <table  border="0" bordercolor="red" cellspacing="4" cellpadding="0">
                                                        <tr>
                                                            <td>
                                                                <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="v" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('V');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="k" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('K');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="e" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('E');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="w" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('W');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="j" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('J');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="h" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('H');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="y" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Y');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="q" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Q');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="l" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('L');}"  disabled >
                                                                <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="f" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('F');}"  disabled >
                                                            </td>
                                                            <td style="width:10px">
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="button" value="7" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   name="number1" id="number1"  class="type1d"
                                                                                           onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('7');}" disabled >
                                                                                        <input type="button" value="1" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   name="number1" id="number1"  class="type1d"
                                                                                           onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('1');}" disabled >
                                                                                        <input type="button" value="4" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   name="number1" id="number1"  class="type1d"
                                                                                           onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('4');}" disabled >
                      
                                                                                    </td>
                                                                                </tr>
                                                                                <tr >	
                                                                                    <td>
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="b"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('B');}" disabled >
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="o"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('O');}" disabled >
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="g"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('G');}" disabled >
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="p"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('P');}" disabled >
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="x"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('X');}" disabled >
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="r"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('R');}" disabled >
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="a"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('A');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="t"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('T');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="u"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('U');}" disabled >
                                                                                    </td>
                                                                                    <td style="width:10px">
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="8"  name="number2"  id="number2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('8');}" disabled > 
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="2"  name="number2"  id="number2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('2');}" disabled > 
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="6"  name="number2"  id="number2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('6');}" disabled > 
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="z"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Z');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="n"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('N');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="i"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('I');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="d"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('D');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="s"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('S');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="m"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('M');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="c"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('C');}" disabled >
                                                                                    </td>
                                                                                    <td style="width:10px">
                                                                                    </td>
                                                                                    <td>
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="3"  name="number3" id="number3"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('3');}" disabled >
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="0"  name="number3" id="number3"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('0');}" disabled >
                                                                                        <input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="9"  name="number3" id="number3"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('9');}" disabled >
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="$"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('$');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="&"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('&');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value=":"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(':');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="^"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('^');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="{"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('{');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="."  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('.');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="_"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('_');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="("  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('(');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="&#34;"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('dQuot');}" disabled >
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="["  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('[');}" disabled >
                                                                                    </td>
                                                                                    <td style="width:10px">
                                                                                    </td>
                                                                                    <td style="padding-left:22px">
                                                                                        <input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="5"  name="number4" id="number4"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('5');}" disabled >  
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="3">
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="!"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('!');}" disabled >
                                                                                        <input  type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="-"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('-');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="'"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('sQuot');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="\"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('bslash');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="?"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('?');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="~"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('~');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"    value=")"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(')');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value=";"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(';');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"     value="]"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(']');}" disabled >
                                                                                        <input  type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="<"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('<');}" disabled >
                                                                                        <input  type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="}"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('}');}" disabled >
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="3">
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="`"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('`');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="*"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('*');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="%"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('%');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="#"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('#');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="/"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('/');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="@"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('@');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value=">"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('>');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value=","  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(',');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="+"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('+');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="="  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('=');}" disabled >
                                                                                        <input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="|"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('|');}" disabled >
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="3">
                                                                                        <input type="button" onMouseOver="setBorder1(this)" onMouseOut="resetBorder1(this)"   name="button6" id="button6"  class="type2d" value="Back Space"  onclick="func_back()" disabled>
                                                                                        <input type="button" onMouseOver="setBorder1(this)" onMouseOut="resetBorder1(this)"   name="button7" id="button7"  class="type2d" value="Clear" onclick="func_clear()"  disabled >
                                                                                        <input type="button" onMouseOver="setBorder1(this)" onMouseOut="resetBorder1(this)"    name="button8" id="button8" class="type2d" value="Caps Lock" onclick="func_capslock(this)" disabled>
                                                                                        <input type="hidden" name="test" value="false" >
                                                                                        <input type="hidden" name="test" value="false" >
                                                                                        <input type="hidden" name="charFirstRowhidden" value='V|K|E|W|J|H|Y|Q|L|F|'>
                                                                                        <input type="hidden" name="numFirstRowhidden" value='7|1|4|'>
                                                                                        <input type="hidden" name="charSecondRowhidden" value='B|O|G|P|X|R|A|T|U|'>
                                                                                        <input type="hidden" name="numSecondRowhidden" value='8|2|6|'>
                                                                                        <input type="hidden" name="charThirdRowhidden" value='Z|N|I|D|S|M|C|'>
                                                                                        <input type="hidden" name="numThirdRowhidden" value='3|0|9|'>
                                                                                        <input type="hidden" name="speFirstRowhidden" value='type1d spe_dol|type1d spe_amp|type1d spe_co|type1d spe_exp|type1d spe_cob|type1d spe_fs|type1d spe_underscore|type1d spe_rob|type1d spe_dquot|type1d spe_sob|'>
                                                                                        <input type="hidden" name="numFourthRowhidden" value='5|'>
                                                                                        <input type="hidden" name="speSecondRowhidden" value='type1d spe_ex|type1d spe_hyphen|type1d spe_squot|type1d spe_bslash|type1d spe_qm|type1d spe_tilde|type1d spe_rcb|type1d spe_semico|type1d spe_scb|type1d spe_lt|type1d spe_ccb|'>
                                                                                        <input type="hidden" name="speThirdRowhidden" value='type1d spe_ep|type1d spe_asterix|type1d spe_per|type1d spe_hash|type1d spe_fslash|type1d spe_at|type1d spe_gt|type1d spe_comma|type1d spe_plus|type1d spe_equal|type1d spe_pipe|'>
                                                                                        <!-- <input type="button"   name="button9" id="button9" class="type3 shiftl"   onclick="func_shift(this)"  disabled> -->
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                        </table>
                                </td>
                                </tr>
                        </table>
                    </div>
                    <div class="log-form-bottom">
                        <span class="mobile-log">
                            <a href="/jsp/4_4_forgot_password/4_4_forgot_password.jsp">Forgot Password ?</a>
                            <a href="callTo:18001808090">Need Help?</a>
                        </span>
                        <span class="mobile-log">
                            <a href="/accDetails/NewUserRegistration.jsp">User Register for IB</a>
                        </span>
                    </div>
                                    </div>

            </div>
        </div>
    </div>
</section>

<section class="impoted my-5">
    <div class="inner-imported">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="title">Important security information:</h2>
                </div>

                <div class="col-md-10">
                     <div class="impotant-right-section">
                        <ul>
                            <li> Before logging in, please ensure that the URL address on the address bar of your internet browser starts with https://hpscb.com/ </li>
                            <li>Never provide your User ID or password to any one on phone or in response to a mail. Report a suspicious mail.</li>
                            <li>Do not enter login or other sensitive information in any pop up window.</li>
                            <li>Verify the site's security certificate by clicking on the padlock icon of your internet browser. For more details, click here.</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <span class="right-img">
                        <img src="/dashBoard/images/important.png" alt="">
                    </span>
                </div>

                <div class="col-md-12">
                    <h2 class="title">Digital Security:</h2>
                    <ul>
                        <li>
                            https://hpscb.com/  has been verified by Entrust. The communication of your private information from any address beginning with "https" is encrypted and secured using SSL.
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="log-notice my-5">
    <div class="log-notice-inner">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="inner-log-notice-col">
                        <h2>
                            Important Notices
                        </h2>
                        <ul>
                            <li>
                                Introducing, the new toll-free number to call our Personal Banking Customer Care and avail our banking services : 1800 180 8090
                            </li>

                            <li>
                                An additional feature of "CAPTCHA" has been introduced for HPSCB Bank’s Internet Banking login, to ensure a safer banking experience.
                            </li>

                            <li>
                                If you are using an old version of Internet Explorer, please update to the latest version immediately, to enjoy a seamless banking experience.
                            </li>

                            <li>
                                If you are using an older version of Android, please update it to the 6.0 version and above immediately, to enjoy a seamless banking experience.
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="inner-log-notice-col">
                        <h2>
                            <span>
                                <i class="fa fa-question" aria-hidden="true"></i>
                                Did you know ?
                            </span>
                            <!-- span>
                                <a href="faq.html">FAQ</a>
                            </span -->
                        </h2>
                        <ul>
                            <li>Experience the all new Bill Pay! Over 12,000+ Billers to pay from. Simply choose your Biller and pay Bill in few clicks.</li>
                            <li>Have a dream to fulfil or a goal to achieve? Get the funds you need with an HPSCB Bank Instant Personal Loan. T&C apply.</li>
                            <li>Cannot save every month? No worries! With iWish Flexible RD you can save any amount, anytime to achieve your wishes. Login to I wish. T&C apply.</li>
                        </ul>
                        
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</section>


  <!-- Footer-start -->

  <!-- footer>
    <div class="footer-follow-aria">
        <a href="#">
        <span><i class="fa fa-twitter" aria-hidden="true"></i></i>Follow:  @hpscblofficial</span>
    </a>
    </div>
    <div class="logo-aria-fooetr">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <a href="/jsp/loginNew.jsp">
                        <img src="/dashBoard/images/logo.png" alt="">
                    </a>
                </div>
                <div class="col-md-10">
                    <p>
                        The Himachal Pradesh State Cooperative Bank Ltd. is an Apex bank of the State of Himachal Pradesh; and is listed as Scheduled Bank with its branches spread across 6 districts of the State and one branch at New Subzi Mandi, New Delhi.
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-menu">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="menu-footer">
                        <h4 class="heading">
                            HPSCB
                        </h4>
                        <ul>
                            <li>
                                <a href="#">About Us</a>
                            </li>

                            <li>
                                <a href="#">Managing Committee</a>
                            </li>

                            <li>
                                <a href="#">Board of Directors</a>
                            </li>

                            <li>
                                <a href="#">Branches Network</a>
                            </li>

                            <li>
                                <a href="#">ATM Network</a>
                            </li>

                            <li>
                                <a href="#">Contact Us</a>
                            </li>

                            <li>
                                <a href="#">Right To Information</a>
                            </li>

                            <li>
                                <a href="#">List of Unclaimed Deposits</a>
                            </li>

                            <li>
                                <a href="#">Customer grievance Redressal Policy</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="menu-footer">
                        <h4 class="heading">
                            Loans
                        </h4>
                        <ul>
                            <li>
                                <a href="#">Home Loan</a>
                            </li>

                            <li>
                                <a href="#">Car Loan</a>
                            </li>

                            <li>
                                <a href="#">Personal Loan</a>
                            </li>

                            <li>
                                <a href="#">Education Loan</a>
                            </li>

                            <li>
                                <a href="#">Hotel/Motel/Tiny Tourism</a>
                            </li>

                            <li>
                                <a href="#">Financing of Hydel Projects</a>
                            </li>

                            <li>
                                <a href="#">Interest Rates on Loans</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="menu-footer">
                        <h4 class="heading">
                            Deposits
                        </h4>
                        <ul>
                            <li>
                                <a href="#">Savings Account</a>
                            </li>

                            <li>
                                <a href="#">Current Account</a>
                            </li>

                            <li>
                                <a href="#">Recurring Deposit</a>
                            </li>

                            <li>
                                <a href="#">Fixed Deposit</a>
                            </li>

                            <li>
                                <a href="#">Himpurnivesh Deposit</a>
                            </li>

                            <li>
                                <a href="#">Sarvapriya Deposit</a>
                            </li>

                            <li>
                                <a href="#">Mahalaxmi Deposit</a>
                            </li>

                            <li>
                                <a href="#">Interest Rates on Deposits</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="menu-footer">
                        <h4 class="heading">
                            ACSTI
                        </h4>
                        <ul>
                            <li>
                                <a href="#">About ACSTI</a>
                            </li>

                            <li>
                                <a href="#">Facilities</a>
                            </li>

                            <li>
                                <a href="#">Faculty</a>
                            </li>

                            <li>
                                <a href="#">Courses Calendar</a>
                            </li>

                            <li>
                                <a href="#">How to Reach</a>
                            </li>

                            <li>
                                <a href="#">Contact Us</a>
                            </li>
                        </ul>
                    </div>
                </div>



            </div>
        </div>
    </div -->
    <div class="bottom-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <p>Copyright © 2023 Himachal Pradesh State Co-operative Bank Ltd.All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </div>
 </footer>




    <!-- =-===================================================== -->


   
    </html:form>
</body>
</html>

<script
src="https://code.jquery.com/jquery-3.6.4.min.js"
integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
crossorigin="anonymous"></script>
<script src="/dashBoard/js/owl.carousel.min.js"></script>


<script>
    var $box = $(".box");

$(".closei").each(function () {
var color = $(this).css("backgroundColor");
var content = $(this).html();
$(this).click(function () {
$box.css("backgroundColor", color);
$box.addClass("open");
$box.find("p").html(content);
});

$(".close").click(function () {
$box.removeClass("open");
$box.css("backgroundColor", "transparent");
});

$("body").toggleClass("overlay");
$("#pop-toggle").click(function () {
$(".popup").toggle();
$("body").toggleClass("overlay");
});
$(".close").click(function () {
$(".popup").toggle();
$("body").toggleClass("overlay");
});
});

jQuery(document).ready(function(){  
jQuery(".close").click(function(){  
    jQuery(".popScroll").toggleClass("d-none");  
});
});

jQuery('.owl-carousel').owlCarousel({
loop:true,
margin:10,
responsiveClass:true,
responsive:{
    0:{
        items:1,
        nav:true
    },
    600:{
        items:2,
        nav:false
    },
    1000:{
        items:2,
        nav:true,
        loop:true
    }
}
})

</script>



<script language="JavaScript">

    function setBorder(o){
    
    o.className = "setborder";
    
    } 
    function resetBorder(o){
    o.className = "resetborder";
    }
    function setBorder1(o){
    
    o.className = "setborder1";
    
    } 
    function resetBorder1(o){
    o.className = "resetborder1";
    }
    function showKeyPadBenifit(){
    //alert("under progress !!!");
    window.open("/common/Virtual_KB_Benefit.html","Knowmore","toolbar=0,location=0,directories=0,status=1,menubars=0,scrollbars=1,resizable=1,width=780,height=550,valign=top");
    }
    
    function showForgotPassword(){
    //alert("under progress !!!");
    }
    //var bankAppUrl = "https://10.15.1.129:8080/";
    //var flag=true;
    //function MM_openBrWindow(theURL,winName,features) { //v2.0
    
    //window.open(theURL,winName,features);
    
    //}
        {
            document.getElementById("sIbUsr_LogId").focus();
            <logic:messagesPresent property="Deactive">
            document.getElementById("diverrmessage").style.display ="block";
            </logic:messagesPresent>
    
            <logic:messagesPresent property="Locked">
            document.getElementById("diverrmessage").style.display ="block";
            </logic:messagesPresent>
    
            <logic:messagesPresent property="alreadyLogin">
            document.getElementById("diverrmessage").style.display ="block";
            </logic:messagesPresent>
    
    
            <logic:messagesPresent property="WrongPass">
            document.getElementById("diverrmessage").style.display ="block";
            </logic:messagesPresent>
    
            <logic:messagesPresent property="NoServer">
            document.getElementById("diverrmessage").style.display ="block";
            </logic:messagesPresent>
    
            <logic:messagesPresent property="LogOut">
            document.getElementById("diverrmessage").style.display ="block";
            </logic:messagesPresent>
        }
    function disableKeyPad(){
    
    
    var test=confirm("Virtual keyboard is recommended to protect your password. Are you sure you want to use normal keyboard?");
        if(test)
        {
    
    
                 var firstNewRowSplit   = document.forms[0].charFirstRowhidden.value;
                 var secondNewRowSplit  = document.forms[0].charSecondRowhidden.value;
                 var thirdNewRowSplit   = document.forms[0].charThirdRowhidden.value;
                 var fourthNewRowSplit  = document.forms[0].numFirstRowhidden.value;
                 var fifthNewRowSplit   = document.forms[0].numSecondRowhidden.value;
                 var sixthNewRowSplit   = document.forms[0].numThirdRowhidden.value;
                 var seventhNewRowSplit = document.forms[0].speFirstRowhidden.value;
                 var eigthNewRowSplit   = document.forms[0].numFourthRowhidden.value;
                 var ninthNewRowSplit   = document.forms[0].speSecondRowhidden.value;
                 var tenthNewRowSplit   = document.forms[0].speThirdRowhidden.value;
    
                 document.forms[0].sIbUsr_LogPass.value="";
                 document.forms[0].sIbUsr_LogPass.readOnly=false;
    
                 flag='false';
                 firstNewRow=firstNewRowSplit.split("|");
    
                    document.forms[0].buttonclose.disabled=true;			 
                  for(var i=0;i<10;i++)
                  {
                        document.forms[0].button1[i].disabled=true;
                  }
                  for(var i=0;i<9;i++){
                     document.forms[0].button2[i].disabled=true;
                  }
    
                   for(var i=0;i<7;i++){
                     document.forms[0].button3[i].disabled=true;
                  }
    
                  for(var i=0;i<3; i++)
                  {
                    document.forms[0].number1[i].disabled=true;
    
                  }
                  for(var i=0;i<3;i++)
                  {
                    document.forms[0].number2[i].disabled=true;
                  }
                  for(var i=0;i<3;i++)
                  {
                    document.forms[0].number3[i].disabled=true;
                    }
                  for(var i=0;i<10;i++)
                  {
                   document.forms[0].button4[i].disabled=true;
    
                 }
                  for(var i=0;i<11;i++)
                 {
                     document.forms[0].button5[i].disabled=true;
    
                 }
                   for(var i=0;i<11;i++)
                 {
    
                     document.forms[0].button10[i].disabled=true;
    
                 }
    
                   document.forms[0].number4.disabled=true;
                   document.forms[0].button6.disabled=true;
                   document.forms[0].button7.disabled=true;
                   document.forms[0].button8.disabled=true;
                   //document.forms[0].button9.disabled=true;
              }else{
    
                   document.forms[0].virtualpassword.checked=true;
    
              }
    
    
    }
     function virtualKey(){
    // alert("aaya");
    
    
    
                 var firstNewRowSplit   = document.forms[0].charFirstRowhidden.value;
                 var secondNewRowSplit  = document.forms[0].charSecondRowhidden.value;
                 var thirdNewRowSplit   = document.forms[0].charThirdRowhidden.value;
                 var fourthNewRowSplit  = document.forms[0].numFirstRowhidden.value;
                 var fifthNewRowSplit   = document.forms[0].numSecondRowhidden.value;
                 var sixthNewRowSplit   = document.forms[0].numThirdRowhidden.value;
                 var seventhNewRowSplit = document.forms[0].speFirstRowhidden.value;
                 var eigthNewRowSplit   = document.forms[0].numFourthRowhidden.value;
    
                 var ninthNewRowSplit   = document.forms[0].speSecondRowhidden.value;
                 var tenthNewRowSplit   = document.forms[0].speThirdRowhidden.value;
    
    
                 document.forms[0].sIbUsr_LogPass.readOnly=true;
                  document.forms[0].sIbUsr_LogPass.value="";
    
                 firstNewRow=firstNewRowSplit.split("|");
    
                    document.forms[0].buttonclose.disabled=false;			 
                  for(var i=0;i<10;i++)
                  { 
                      document.forms[0].button1[i].disabled=false;
    
    
                  }
    
                  for(var i=0;i<9;i++)
                  {
                      document.forms[0].button2[i].disabled=false;
                  }
    
                  for(var i=0;i<7;i++)
                  {
                     document.forms[0].button3[i].disabled=false;
                  }
    
                  for(var i=0;i<3;i++)
                  {
                     document.forms[0].number1[i].disabled=false;
    
                  }
                   for(var i=0;i<3;i++)
                  {
                    document.forms[0].number2[i].disabled=false;
    
                  }
                  for(var i=0;i<3;i++)
                  {
                    document.forms[0].number3[i].disabled=false;
    
                  }
    
                  for(var i=0;i<10;i++)
                 {
    
                    document.forms[0].button4[i].disabled=false;
                  }
                  for(var i=0;i<11;i++)
                 {
    
                    document.forms[0].button5[i].disabled=false;
                 }
                 for(var i=0;i<11;i++)
                 {
    
                    document.forms[0].button10[i].disabled=false;
                 }
    
    
    
                document.forms[0].number4.disabled=false;
                document.forms[0].button6.disabled=false;
                document.forms[0].button7.disabled=false;
                document.forms[0].button8.disabled=false;
                //document.forms[0].button9.disabled=false;
    
    
    
    
    }
    var isSpace=true;
    function func_spaceBarProhibit(event)
    {
    
        var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        
        if((keyCode=="32") || (keyCode=="13"))
        {
                alert("Please use mouse only for virtual keybord!!!");
                 isSpace=false;
                 return false;
        }
            isSpace=true;
            return true;
    }
     var flag ='false';
       function func_clear()
       {
           document.forms[0].sIbUsr_LogPass.value="";
       }
    
       function func_capslock(obj)
      {
    
            var firstRowSplit  = document.forms[0].charFirstRowhidden.value;
            var secondRowSplit = document.forms[0].charSecondRowhidden.value;
            var thirdRowSplit = document.forms[0].charThirdRowhidden.value;
    
            if( flag=='true' ){
                flag='false';
               obj.className ='type2d';
                firstRow = firstRowSplit.split("|");
    
                for(i=0;i<firstRow.length-1;i++){
                      document.forms[0].button1[i].value=firstRow[i].toLowerCase();
                }
                   secondRow =secondRowSplit.split("|");
                  for(i=0;i<secondRow.length-1;i++){
                          document.forms[0].button2[i].value=secondRow[i].toLowerCase();
                  }
                thirdRow =thirdRowSplit.split("|");
                for(i=0;i<thirdRow.length-1;i++){
                          document.forms[0].button3[i].value=thirdRow[i].toLowerCase();
                 }
        }else{
    
                  flag='true';
    
                  obj.className='type2d';
    
                  firstRow = firstRowSplit.split("|");
                  for(i=0;i<firstRow.length-1;i++){
                          document.forms[0].button1[i].value=firstRow[i];
                  }
    
                  secondRow =secondRowSplit.split("|");
                  for(i=0;i<secondRow.length-1;i++){
                          document.forms[0].button2[i].value=secondRow[i];
                  }
    
                  thirdRow =thirdRowSplit.split("|");
                  for(i=0;i<thirdRow.length-1;i++){
                          document.forms[0].button3[i].value=thirdRow[i];
                  }
    
               }
    
      }
    
     function func_back(){
         var j=document.forms[0].sIbUsr_LogPass.value;
         document.forms[0].sIbUsr_LogPass.value=j.substring(0,j.length-1);
    }
    function func_click(obj)
    {
        if(obj=='sQuot'){
           obj=obj.replace(/sQuot/,'\'');
        }
        if(obj=='dQuot'){
           obj=obj.replace(/dQuot/,'\"');
        }
        if(obj=='bslash'){
           obj=obj.replace(/bslash/,'\\');
        }
    
    
        var i= obj;
    
        if(flag=='true' ){
           var j = document.forms[0].sIbUsr_LogPass.value+i.toUpperCase();
           document.forms[0].sIbUsr_LogPass.value=j;
    
        }else{
           var j = document.forms[0].sIbUsr_LogPass.value+i.toLowerCase();
           document.forms[0].sIbUsr_LogPass.value=j;
         }
    
    }
    
    </script>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
    const keyboardIcon = document.getElementById("keys_icon");
    const virtualKeyboard = document.getElementById("virtualKeyboard");

    keyboardIcon.addEventListener("click", function() {
        console.log("working");
        if (virtualKeyboard.classList.contains("hidden")) {
            virtualKeyboard.classList.remove("hidden");
            virtualKey();
        } else {
            virtualKeyboard.classList.add("hidden");
        }
    });

});

</script>