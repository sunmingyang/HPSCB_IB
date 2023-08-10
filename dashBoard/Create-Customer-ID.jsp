
<html lang="en">
    <head>
        
    </head>

   <%@ include file="/header/headerbar.jsp"%>

    <body>      
       
        <section class="brad-log-time">
        <div class="inner-brad-log">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="bradcums">
                            <ul>
                                <li>
                                    <a href="/dashBoard/dashboard.jsp">Dashboard</a>
                                    >
                                    <strong>Create Customer ID</strong>
                                </li>
                            </ul>
                        </div>
                    </div>  
                    <div class="col-md-6">
                     <div class="log-time">
                        <span class="time">
                            <%= (new java.util.Date()).toLocaleString()%>
                        </span>
                        <span class="">
                            <strong><%=session.getAttribute("usrName") %></strong>
                        </span>
                        <span class="profile">                       
                          <i class="fa fa-user" aria-hidden="true"></i>                     
                           <img src="/styles/images/down-aroowwww.png" alt="">
                        </span>
                        <span class="profile-menu">
                           <ul>
                              <li>
                                <a href="/my_profile/my_profile.jsp">My Profile</a>
                              </li>
                              <li>
                                <a href="/jsp/login.do?action=ibUsrLogout">Log Out</a>
                              </li>
                           </ul>
                        </span>
                     </div>
                    </div>              
                </div>
            </div>
        </div>
    </section>
        <!-- header-end  -->



        <section class="account-kyc my-5">
            <div class="container">
                <div class="row">
                    <div class="kyc-inner">
                        <h3> Create Customer ID</h3>
                    <span class="your-account-no -is">
                        <span>Your Account Number is:</span>
                        <strong>123456789123446</strong>
                    </span>

                    <div class="inputs-fillds create-customer-id">
                        <span class="filleds not-changed-input">
                            <label for="">Account Number</label>
                            <input  placeholder="Please Enter Account No" >
                        </span>

                        <span class="filleds not-changed-input">
                            <label for="">Customer Name</label>
                            <input type="text"  placeholder="Please Enter Customer Name">
                        </span>

                        <span class="filleds not-changed-input">
                            <label for="">Registered Mobile Number</label>
                            <input type="text" placeholder="Enter Registered Mobile Number">
                        </span>

                        <span class="filleds not-changed-input " >
                            <label for="">City</label>
                            <input type="text" placeholder="Please Enter city">
                        </span>

                        <span class="filleds not-changed-input " >
                            <label for="">Pin-Code</label>
                            <input type="text" placeholder="Please Pin Code">
                        </span>

                        <span class="filleds not-changed-input ">
                            <label for="">Address</label>
                            <input type="text" placeholder="Please Enter Address">
                        </span>

                        

                        <span class="filleds not-changed-input ">
                            <label for="">State</label>
                            <input type="text" placeholder="Please Enter State">
                        </span>
                        

                    </div>

                        
                     
                            
                            
                        

                        <div class="next-button my-5 text-center">
                            <button type="button" class="creat-customer-id-button">GET OTP</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="OTP-confirm-popup">
            <div class="confirm-inner">
                <h2>
                    <img src="/styles/images/padlock-black-icon 1.png" alt="">
                    OTP Verification
                </h2>
                <span class="sent">
                OTP sent on mobile no +91 95XXX09X04
                <a href="">Change</a>
                </span>
                <span class="otp-inputs">
                <input type="text">
                <input type="text">
                <input type="text">
                <input type="text">
                <input type="text">
                <input type="text">
                </span>
                <div class="btnGroup otp-count-down">
                    <span class="Btn" id="verifiBtn">
                    <button type="submit">Resend OTP:</button>
                    </span>
                    <span class="timer">
                    <span id="counter">0:47</span>
                    </span>
                </div>
                <div class="buttons confirm-detailsss">
                    <button type="button" class="AUTHENTICATE"onclick="window.location='dashboard.jsp' "><img src="/styles/images/auth.png" alt=""> AUTHENTICATE</button>                        
                </div>
            </div>
        </section>












        <!-- Footer-start -->
       
             <%@ include file="/header/footer.jsp"%>
  
        <!-- =-===================================================== -->
        
        <script>
            jQuery(document).ready(function(){  
             jQuery(".confirm-popup-open").click(function(){  
             jQuery(".confirm-popup-verfy-detais").toggleClass("show");  
             });
             });
            
            
             jQuery(document).ready(function(){  
             jQuery(".cancle-btn-vrfy").click(function(){  
             jQuery(".confirm-popup-verfy-detais").toggleClass("show");  
             });
             });

             jQuery(document).ready(function(){  
             jQuery(".creat-customer-id-button").click(function(){  
             jQuery(".OTP-confirm-popup").toggleClass("show");  
             });
             });
      
                
            
            
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
                
        </script>
    </body>
</html>