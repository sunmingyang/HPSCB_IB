
<head>        
    <%-- <link rel="stylesheet" href="css/custom.css">        --%>
</head>

<style>
    .forgot-password-inner .fotgot-form {
    width: 60%;
    margin: 100px auto;
    box-shadow: 0 0 10px 0px #ccc;
    padding: 40px;
    border-radius: 15px;
}

.forgot-password-inner .fotgot-form h3 {
    margin: 0 0 30px;
    border-bottom: 1px solid #ccc;
    padding: 0 0 15px;
    font-size: 26px;
    color: #2D3079;
}

.forgot-password-inner .fotgot-form form {
    display: flex;
    flex-wrap: wrap;
}

.forgot-password-inner .fotgot-form form input {
    width: 100%;
    margin: 0 0 20px;
    height: 55px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
}

.forgot-password-inner .fotgot-form form button {
    width: 100%;
    height: 55px;
    font-size: 20px;
    border: 0;
    background: #0067B8;
    color: #fff;
    font-weight: 500;
    margin: 100px 0 50px;
    border-radius: 5px;
}


.forgot-password-inner .fotgot-form form label {
  width: 100%;
  margin: 10px 0 0;
}



</style>
<%@ include file="/header/headerbar-logout.jsp"%>

<body>    
    
<div class="forgot-password-main">
    <div class="container">
        <div class="forgot-password-inner">
            <div class="fotgot-form">
                <h3>Forgot Password</h3>
                <form action="">
                    <label>User Id : </label> 
                    <input type="text" id="CustomerId" maxlength="15" required>
                    <%-- <input type="text" id="otp" onpaste="return false;" ondrop="return false;" autocomplete="off" pattern="[0-9]+" maxlength="6" onkeypress="return isNumberKey(event)"> --%>
                    <label>If you have forget your Login id then please contact your Branch. </label>
                     <%-- <label>Mobile No. : </label> 
                    <input type="text" id="CustomerMobileNo" required> --%>
                    <%-- <button type="submit" class="submit-button">Get OTP</button> --%>
                    <button type="button" class="submit-button" >Get OTP</button>
                </form>
            </div>
            <div class="bottns"></div>
        </div>
    </div>
</div>
<section class="back-home-button mt-5">
    <div class="container">
        <div class="inner-back-home">
            <button type="button" onclick="window.location.href='/jsp/loginNew.jsp'"> <a>BACK</a></button>
            <button type="button" onclick="window.location.href='/jsp/loginNew.jsp'"> <a>HOME</a></button>
        </div>
    </div>
</section>

<%-- <section class="OTP-confirm-popup">
                <div class="confirm-inner">
                    <h2>
                        <img src="/styles/images/padlock-black-icon 1.png" alt="">
                        OTP Verification
                    </h2>
                    <span class="sent">
                    OTP sent on mobile no 
                    <a href="">Change</a>
                    </span>
                    <span class="otp-inputs">
						
		                <input type="text" id="otp" onpaste="return false;" ondrop="return false;" autocomplete="off" pattern="[0-9]+" maxlength="6" onkeypress="return isNumberKey(event)">				
                    </span>
                    <div class="btnGroup otp-count-down">
                        <span class="Btn" id="verifiBtn">
                <div class="Btn" id="ResendBtn">
                    <button type="submit">Resend</button>
                </div>
            </span>
                        <span class="timer">
                        <span id="counter"></span>
                        </span>
                    </div>
                    <div class="buttons confirm-detailsss">
                        <button  type="button" class="AUTHENTICATE"><img src="/styles/images/auth.png" alt=""> Authenticate</button> 
                        <%-- onclick="window.location.href = 'Conform-forget-password.jsp';"                   
                    </div>
                </div>
            </section> --%>


      
        <%-- <script>

            
            function countdown() {
                var seconds = 59;
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
        
          
    </script>    --%>
    <!-- =-===================================================== -->

<script>
        // jQuery(".submit-button").click(function(){                 
        //     jQuery(".OTP-confirm-popup").toggleClass("show");  
        //     otp_number();                
        //  });


         jQuery(".submit-button").click(function(){                 
            jQuery(".OTP-confirm-popup").toggleClass("show");  
            if(isEmpty()){
                alert("field can not be left blank.");
            } else {
                otp_number();                
            }
         });

        function isEmpty() {
            var isCorrect = false;
            var CustomerId =jQuery("#CustomerId");
            //var CustomerMobileNo =jQuery("#CustomerMobileNo");
            if (jQuery.trim(CustomerId.val()) == "") {
                isCorrect = true;
            }
            // if (jQuery.trim(CustomerMobileNo.val()) == "") {
            //     isCorrect = true;
            // }
            return isCorrect;
        }


        // jQuery(document).ready(function(){  
        //     jQuery(".AUTHENTICATE").click(function(){  
        //     jQuery(".OTP-confirm-popup").toggleClass("show");
        //        // alert("click on otp confirm popup");                                           
		// 			verifyOTPForForgetPass();		 
        //     });
        // });
        
</script>

<script>

// async function verifyOTPForForgetPass(){	
//                     alert("otp number is calling");                                
//                     var userId = document.getElementById("CustomerId").value;				
//                     var mob = document.getElementById("CustomerMobileNo").value;
//                     var otp = document.getElementById("otp").value;
//                     //alert("userId: ::: " + userId + "mobile ::::" + mob);              
                        
//                     // {"userID":"9020180349","beneficiaryAccNo":"902052300000112","sessionID":"","OTP":"181328"}
//                     const jsonData  =  await fetch("http://127.0.0.1:8643/rest/AccountService/OtpVerify", {
//                         method: "POST",
//                         body: JSON.stringify({
//                             "userID": userId,
//                             "beneficiaryAccNo": mob,
//                             "sessionID":"cdm",
//                             "OTP": otp                    
//                         }),
//                         headers: {
//                             "Content-type": "application/json; charset=UTF-8",
//                             "Access-Control-Allow-Origin": "*"
//                         }
//                     }).then(response => response.json()).then(response=>processverifyOTP(response));
//                         // .then(data => console.log(data));			
//                 }

//                 function processverifyOTP(response){
//                     var userId = document.getElementById("CustomerId").value;				
//                     var mob = document.getElementById("CustomerMobileNo").value;
//                     var otp = document.getElementById("otp").value;
//                     alert(otp);
//                     alert(" processverifyOTP function is calling ");
//                     console.log(response,"data");
//                     const verifyStatus = response.result;
//                     console.log(verifyStatus);

//                     localStorage.setItem("userID",userId);
//                     localStorage.setItem("beneficiaryAccNo",mob);
//                     localStorage.setItem("sessionID","cdm");
//                     localStorage.setItem("OTP",otp);


//                     if (verifyStatus == "success"){
//                         alert("Password forgot Successfully");
//                         window.location.href="/jsp/4_4_forgot_password/Conform-forget-password.jsp";
//                     }                   
//                     else{
//                         alert(" Invalid OTP ");
//                     }                    		
//                 } 

// </script>


<script>
    async function otp_number(){	
        //alert("otp number is calling");               
        var userId = document.getElementById("CustomerId").value;				
		//var mob = document.getElementById("CustomerMobileNo").value;          
      try {
        const jsonData  =  await fetch("http://127.0.0.1:8643/rest/AccountService/sendOtpForgotPsw", {
            method: "POST",
            body: JSON.stringify({
                "userID":userId,
                "beneficiaryAccNo":userId,
                "sessionID":"cdm",
                "purpose":"passwordchange"                      
            }),
            headers: {
                "Content-type": "application/json; charset=UTF-8",
                "Access-Control-Allow-Origin": "*"
            }
        }).then(response => response.json()).then(response=>processResOTP(response));
             // .then(data => console.log(data));
      } catch (e) {
        console.log("error");
         console.log(e);
        //alert(e); 
      }
        			
	}

    function processResOTP(response){
        //alert("API response get successfully");
        console.log(response);
        var verifyDetails = response.authorise;
        var userId = document.getElementById("CustomerId").value;				
		//var mob = document.getElementById("CustomerMobileNo").value;

        localStorage.setItem("userID",userId);
        localStorage.setItem("beneficiaryAccNo",userId);
        
        if(verifyDetails == "success"){
            const mobileno = response.mobileNo;
            alert("Dear Customer your OTP has been sent on Mobile: " + mobileno);
            console.log(mobileno);	
            window.location.href="/jsp/forgot_pass/ConForgetPass.jsp";
        }  
        else{
            alert("User Id Does not Exist");
            //window.location.href="/jsp/forgot_pass/forgetPass.jsp";
        }  
        //window.location.href="/jsp/forgot_pass/forgetPass.jsp";     			
    }
			 
		
</script> 





</body>
</html>