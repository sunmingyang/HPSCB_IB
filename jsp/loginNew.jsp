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
    
    <title>HPSCB INTERNET BANKING</title>
</head>
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
                                <!-- <span class="checkbox">
                                    <input type="checkbox">
                                    Remember User Id
                                </span> -->

                                <html:hidden  property="password" styleId ="password"/>
                                <!-- New Login button  -->
                                <%-- <input value="Login" type="button" name="ok" onclick="login_submit()"  tabindex="3" > --%>

                            <button type="button"  value="Login" name="ok" onclick="login_submit()"> <i class="fa fa-sign-in" aria-hidden="true"></i> Login</button>

                            <input type="hidden" name="paramLogin" value="true" >
                            </div>
                        </form>
                    </div>
                    <div class="log-form-bottom">
                        <span class="mobile-log">
                            <a href="/jsp/4_4_forgot_password/4_4_forgot_password.jsp">Forgot Password ?</a>
                            <a href="callTo:18001808090">Need Help?</a>
                        </span>
                    </div>
                    <div class="log-form-bottom">
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
