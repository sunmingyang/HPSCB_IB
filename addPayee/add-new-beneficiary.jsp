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
         crossorigin="anonymous"></script>
      <script src="js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="css/owl.carousel.min.css">
      <link rel="stylesheet" href="css/owl.theme.default.min.css">
      <link rel="stylesheet" href="css/font-awesome.min.css">
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <%-- <link rel="stylesheet" href="css/custom.css"> --%>
	  <%@ include file="/common/Include.jsp" %>  
		<script language="JavaScript" src= "/scripts/MD5.js"></script>   
    <script language="JavaScript" src="/fundtransfer/scripts/addpayee.js"></script> 
	<link rel = "stylesheet" href="/styles/table.css"  type = "text/css">
	<%@ page import="easycbs.bancmateib.fundtransfer.actionform.AddpayeeForm"%>
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
      <title>HPSCB INTERNET BANKING</title>
   </head>
    <%@ include file="/header/headerbar.jsp"%>
  	<body>
		<html:form action="/fundtransfer/fund.do">
     
      <section class="brad-log-time">
         <div class="inner-brad-log">
            <div class="container">
               <div class="row">
                  <div class="col-md-6">
                     <div class="bradcums">
                        <ul>
                           <li>
                              <a href="dashboard.html">Dashboard</a>
                              >
                              <a href="PAYMENTS-TRANSFER.html">Payments & Transfer</a>
                              >
                              <strong>
                              Fund Transfer
                              </strong>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div class="log-time">
                        <span class="time">
                        28-Mar-2023, [ 04:16:06 AM IST ]
                        </span>
                        <span class="">
                            <strong><%=session.getAttribute("usrName") %></strong>
                        </span>
                        <span class="profile">
                        <img src="/styles/images/profile.png" alt="">
                        <img src="/styles/images/down-aroowwww.png" alt="">
                        </span>
                        <span class="profile-menu">
                           <ul>
                              <li>
                                 <a href="my-profile.html">My Profile</a>
                              </li>
                              <li>
                                 <a href="index.html">Log Out</a>
                              </li>
                           </ul>
                        </span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- header-end -->







      <section class="PAYMENTS-TRANSFER-main  funds-tra my-5">
         <div class="container">
            <div class="payments-and-transfer-inner add-benifacriye">
               <div class="row">
                  <div class="pay-heading">
                     <h2>
                        <img src="/styles/images/add-user-account-icon 1.png" alt="" class="open-ifsc-box">
                        Add & Manage Beneficiary
                       
                        
                     </h2>
                  </div>

                  <div class="select-payee-bank">
                     <label for="">Select Payee Bank</label>
                     <select name="" id="">
                        <option value="">Select Bank</option>
                        <option value="">HPSCB Bank</option>
                        <option value="">Other Bank</option>
                     </select>
                  </div>


                  <div class="pay-heading">
                     <h2>
                        
                       
                        Enter Payee Details
                        
                     </h2>
                  </div>

                  <div class="selection-button">
                   <span class="Beneficiary-inner-selection">
                     <label for="">
                        Beneficiary Name
                     </label>
                      <html:text property="payeeName" styleId="payeeName"/> 
                   </span>
                   

                   <span class="Beneficiary-inner-selection">
                     <label for="">
                        Nick Name
                     </label>
                     <input type="text " placeholder="Enter Nick Name">
                   </span>

                   
                    <span class="Beneficiary-inner-selection">
                     <label for="">
                        Account Type
                     </label>
                     <select name="select" id="account type">
                        <option value="">Account Type</option>
                        <option value="">Saving Account</option>
                        <option value="">Current Account</option>
                    </select>
                    </span>

                    <span class="Beneficiary-inner-selection">
                     <label for="">
                        Account Number
                     </label>
                     <input type="text " placeholder="Enter Account Number">
                    </span>

                    <span class="Beneficiary-inner-selection">
                     <label for="">
                        Confirm A/C Number
                     </label>
                     <input type="text " placeholder="Confirm A/C Number">
                    </span>

                    <span class="Beneficiary-inner-selection">
                     <span class="ifsc-with-search">
                        <label for="">
                           IFSC
                        </label>
                        <input type="search" id="search" placeholder="Enter IFSC">
                        <img src="images/icon _search_.jpg" alt="" class="open-ifsc-box">
                        <span class="ifsc-box">
                           <span class="inner"> <span class="lable">Branch Name:</span> <p class="name">HPSCB Bank</p></span>
                            <span class="inner"><span class="lable">Branch Code:</span>  <p class="code">HPSCB001122</p></span>
                            <span class="inner"><span class="lable">Address:</span> <p class="address">The Mall, Ridge, Shimla</p></span>
                            <button class="okay">OK</button>
                        </span>
                    </span>
                    </span>

                    

                    

                    

                    
                  </div>

                  <div class="procced-button">
                    <button type="button" onclick="window.location.href = 'add-new-beneficiary.html'"><img src="/styles/images/next 2.png" alt=""> GET OTP</button>

                  </div>
               </div>
            </div>
         </div>
      </section>


      








      <section class="back-home-button">
         <div class="container">
            <div class="inner-back-home">
               <button> <a href="dashboard.html"> BACK</a></button>
               <button> <a href="dashboard.html">HOME</a></button>
            </div>
         </div>
      </section>








      <!-- footer-start -->
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
                     <a href="index.html">
                     <img src="/images/logo.png" alt="" width="250">
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
    <%@ include file="/header/footer.jsp"%>

      <!-- =-===================================================== -->
      <script
         src="https://code.jquery.com/jquery-3.6.4.min.js"
         integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
         crossorigin="anonymous"></script>
      <script src="js/owl.carousel.min.js"></script>
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
         
         jQuery(document).ready(function(){  
         jQuery(".profile").click(function(){  
         jQuery(".profile-menu").toggleClass("show");  
         });
         });
         
         function openCity(evt, cityName) {
         var i, tabcontent, tablinks;
         tabcontent = document.getElementsByClassName("tabcontent");
         for (i = 0; i < tabcontent.length; i++) {
         tabcontent[i].style.display = "none";
         }
         tablinks = document.getElementsByClassName("tablinks");
         for (i = 0; i < tablinks.length; i++) {
         tablinks[i].className = tablinks[i].className.replace(" active", "");
         }
         document.getElementById(cityName).style.display = "flex";
         evt.currentTarget.className += " active";
         }

         jQuery(document).ready(function(){  
         jQuery(".open-ifsc-box").click(function(){  
         jQuery(".ifsc-box").toggleClass("active");  
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".okay").click(function(){  
         jQuery(".ifsc-box").toggleClass("active");  
         });
         });
         
         
      </script>
	  </html:form>
   </body>
</html>