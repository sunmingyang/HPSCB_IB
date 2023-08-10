<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/common/Include.jsp"%>
   


<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>
<script language=JavaScript src="/scripts/MD5.js"> </script>
<script language=JavaScript src="/scripts/Enc_Desc.js"> </script>

    
   
</head>
<style>
span.mob-chng-op {
  margin: 0 0 30px;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: 100%;
  font-size: 16px;
  text-transform: capitalize;
}
.left-section-log .log-in-area input {
    font-size: 20px;
    font-weight: 600;
}
</style>
<%@ include file="/header/headerbar-logout.jsp"%>
<body>
<% 

String customerId="";
String mobileNo="";
String mskMobNo="";
 if(session.getAttribute("userInfo")!=null){
		String userInFo[][]    = (String[][])session.getAttribute("userInfo");
       //session.removeAttribute("userInfo");
	   customerId=userInFo[0][8];
	   
	   System.out.println("customer id on OTP page is--------------"+customerId);
    }

  mobileNo = (String)session.getAttribute("customerMobile"); 
   mobileNo="******"+ mobileNo.substring(8);
   

	
%>
<script>
var userid="<%=customerId%>";
function isNumberKey(evt) {

  var charCode = (evt.which) ? evt.which : evt.keyCode;  
  if (charCode > 31 && (charCode < 48 || charCode > 57))
    return false;
  return true;
}
function otp_confirm(form) {
	
	var id=document.getElementById("otp").value;

   	if(id=="")
	{
	   alert("Please enter OTP");
	   return false;
	}
	
	var url="/TransactionAction.do?action=otpVerifyForLogin&otp="+id+"&userID="+userid+"&refNo="+userid;
	//document.forms[0].submit();
	http.open("POST",url,false);
	http.onreadystatechange= function () {processRes(form)};
	http.send(null);
	
	
}

function processRes(form) {
 
    if (http.readyState == 4) {
        // Check that a successful server response was received
        if (http.status == 200) {
            var resArray=http.responseText;
            var jsonData = JSON.parse(resArray);
            if (jsonData.result=="failure" ) { 
                alert("Dear Customer ,your login is failed due to wrong OTP");
                form.action="/jsp/loginNew.jsp";
                window.location.href="/jsp/loginNew.jsp";
            } else {
                console.log("Dear Customer , your OTP is confirmed successfully ");
                form.action="/dashBoard/dashboard.jsp";
                window.location.href="/dashBoard/dashboard.jsp";
            }
        }
    }
}




</script>



               
  
    </header>
   
  <!-- header-part-end -->

<section class="log-in-page">
    <div class="logininner">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="right-section-log">
                        <%-- <h2>
                            <strong>SECURE DIGITAL BANKING 
                                </strong>
                                <span>Please read carefully</span>
                        </h2>
                        <span class="never-log-in">
                            <strong>Never log in</strong> to your account from any link or APK file sent  through SMS, Email or messing apps.
                        </span>

                        <span class="never-log-in">
                            <strong>HPSCB bank NEVER</strong> Contacts customers for any secured banking information through phone, SMS, 
                            e-mail, weblinks or social media.
                        </span>
                        <span class="for-any">
                            <i class="fa fa-info" aria-hidden="true"></i>
                            For any further assistance,  call us on  0177-2832486
                        </span> --%>
                        <img src="/styles/images/banner-left.png" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="center-section-log">
                        <img src="/styles/images/do-not-share.png" alt="">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="left-section-log">
                        <form action="otp" onsubmit="return otp_confirm(this);" class="login-form">
                            <span class="heading-log">
                                <i class="fa fa-lock" aria-hidden="true"></i>
                                OTP Verification
                            </span>
                            <div class="log-in-area">
                                <span class="mob-chng-op">
                                    sent on mobile no <%=mobileNo%>
                                 <!--  <a href="login.html">Change</a>-->
                                </span>
                                <span class="log-with-mob-otp">                                    
									<input type="text" id="otp" onpaste="return false;" ondrop="return false;" autocomplete="off"  pattern="[0-9]+" maxlength=6 onkeypress="return isNumberKey(event)" style="min-width: 100% !important; width: 100% !important;">				
                                </span>
                                
                                <!-- <span class="checkbox">
                                    <input type="checkbox">
                                    Remember User Id
                                </span> -->
                                <%-- <button class="auth" type="submit" value="Login" name="ok" onclick="login_submit()" > 
                                    <i class="fa fa-sign-in" aria-hidden="true"></i> 
                                    <a href="dashboard.html">AUTHENTICATE</a>
                                </button> --%>
                                <%-- <button type="submit"  value="Login" name="ok" onclick="login_submit()"> 
                                    <i class="fa fa-sign-in" aria-hidden="true"></i> 
                                    AUTHENTICATE
                                </button> --%>

                                <%-- <button type="submit"  value="Login" name="ok" onclick="validateOtp()"> <i class="fa fa-sign-in" aria-hidden="true"></i> AUTHENTICATE</button> --%>

                                <button type="submit" > AUTHENTICATE </button>
                                <%-- <button type="button" onclick="otp_confirm()" <a>AUTHENTICATE</a></button> --%>

                                <div class="btnGroup otp-count-down">
                                    <%-- <span class="Btn" id="verifiBtn">
                                      <button type="submit">Resend OTP:</button>
                                    </span> --%>
                                    <span class="timer">
                                      <span id="counter"></span>
                                    </span>
                                  </div>

                            </div>
                        </form>
                    </div>
                    <div class="log-form-bottom">
                        <span class="mobile-log">
                            <%-- <a href="">Forgot Password ?</a>
                            <a href="help.html">Need Help?</a> --%>
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
                        <img src="/styles/images/important.png" alt="">
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
                                Did you know
                            </span>
                            <span>
                                <a href="faq.html">FAQ</a>
                            </span>
                        </h2>
                        <ul>
                            <li>Experience the all new Bill Pay! Over 12,000+ Billers to pay from. Simply choose your Biller and pay Bill in few clicks.</li>
                            <li>Have a dream to fulfil or a goal to achieve? Get the funds you need with an HPSCB Bank Instant Personal Loan. T&C apply.</li>
                            <li>Cannot save every month? No worries! With iWish Flexible RD you can save any amount, anytime to achieve your wishes. Login to i wish. T&C apply.</li>
                        </ul>
                        
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</section>


  <!-- Footer-start -->

  
    
    

    <%@ include file="/header/footer.jsp"%>


    <!-- =-===================================================== -->

    

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



function countdown() {
        var seconds = 5;
        function tick() {
          var counter = document.getElementById("counter");
          seconds--;
          counter.innerHTML =
            "0:" + (seconds < 10 ? "0" : "") + String(seconds);
          if (seconds > 0) {
            setTimeout(tick, 1000);
          } else {
            document.getElementById("verifiBtn").innerHTML = `
                <div class="Btn" id="ResendBtn">
                    <button type="submit">Resend</button>
                </div>
            `;
            document.getElementById("counter").innerHTML = "";
          }
        }
        tick();
      }
      countdown();

    </script>

</body>
</html>