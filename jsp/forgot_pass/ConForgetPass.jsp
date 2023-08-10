
<head>
    
    <%-- <link rel="stylesheet" href="css/custom.css">       --%>

    <script src="forgotPass.js"></script>
    <script language=JavaScript src="/scripts/MD5.js"> </script>
    <script src="dataValidation.js"></script>

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

div#ResendBtn button {
    margin: 0;
    width: 100% !important;
}

button.submit-button {
    margin: 30px 0 20px !important;
}

div#ResendBtn {
    width: 100% !important;
}

div#verifiBtn {
    width: 100%;
}

span.error{
    color: red;
}

span.error {
    display: block !important;
}

.forgot-password-inner .fotgot-form label {
    display: block !important;
    width: 100%;
    margin: 10px 0 0;
}

.forgot-password-inner .fotgot-form form input {
    margin: 0 0 2px;
}
</style>

<%@ include file="/header/headerbar-logout.jsp"%>
<body>



    <%-- <header class="site-header">
        <div class="top-header">
            <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="site-logo">
                        <%-- <a href="index.html">
                            <img src="/styles/images/logo.png" alt="" width="150">
                        <%-- </a> 
                    </div>
                </div>
                <div class="col-md-10">

                	<div class="main-upper-header-menu">
                		<ul>
                	

                			<%-- <li>
                				<a href="#">
                					Customer Care 
                				</a>
                			</li> -

                		

                		</ul>
                	</div>
                	                                      
                </div>
            </div>
        </div>
    </div>
  
    </header> --%>
<div class="forgot-password-main">
    <div class="container">
        <div class="forgot-password-inner">
            <div class="fotgot-form">
                <h3>Forgot Password</h3>
                <form action=""  >

                     <label>Enter OTP : </label>                    
                    <input type="text" id="otp" onpaste="return false;" ondrop="return false;" autocomplete="off" pattern="[0-9]+" maxlength="6" onkeypress="return isNumberKey(event)">

                    <label>New Password : </label> 
                    <%-- <input type="password" id="pass" required> --%>
                    
                    
                    <input type="password" minlength="8"  required maxlength="20"
                    onblur=" checkPass(this);"
                    pattern="(?=.*[ -/:-@[-`{-~])(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
                    title="Unsatisfied Password Policy"
                    name="password1" id="pass"/>
                    <span id="passwordError1" class="error"></span>
                    
                    <%-- <input type="password"   id="pass"   /> --%>
                    


                    <label>Conform Password : </label> 
                    <%-- <input type="password" id="cnfPass" required> --%>
                    
                    
                    
                    <input type="password" minlength="8"  required maxlength="20"
                    onblur="checkCnfPass(this);"
                    pattern="(?=.*[ -/:-@[-`{-~])(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}"
                    title="Unsatisfied Password Policy"
                    name="password2" id="cnfPass"/>
                    <span id="passwordError2" class="error"></span>
                    
                    <%-- <input type="password"  id="cnfPass"  /> --%>
                    
                    
                    
                    
                    
                    <%-- <button type="submit" class="submit-button">Get OTP</button> --%>
                    
                   
                    <%-- <span id="counter"></span>
                    <div id="verifiBtn" ></div> --%>
                     <P>
                        Your must contains atleast 
                        1 Capital character,
                        1 small character, 
                        minimum length 8 characters, 
                        maxlength 20 characters, 
                        1 special symbol and 1 digit.
                      </P>
                    <button type="button" class="submit-button">Submit</button>
                </form>
            </div>
            <div class="bottns">
               
            </div> 
        </div>
    </div>
</div>
<section class="back-home-button mt-5">
    <div class="container">
        <div class="inner-back-home">            
            <button type="button" onclick="window.location.href='/jsp/forgot_pass/forgetPass.jsp'"> <a>BACK</a></button>
            <button type="button" onclick="window.location.href='/jsp/loginNew.jsp'"> <a>HOME</a></button>
        </div>
    </div>
</section>


  

<script>
    jQuery(".submit-button").click(function(){ 
        hello();                
        // forgetPassResponse(); 
        // otp_number();                
    });
</script>

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
</script>   --%>

</body>
</html>