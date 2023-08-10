<!DOCTYPE html>
<html lang="en">
   <head>
   <%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
 <%@ page import="java.util.*" %>
      
       <%-- <link rel="stylesheet" href="css/custom.css"> --%>   
     
   </head>
  
   <%@ include file="/header/headerbar.jsp"%>
   <jsp:include page="/dashBoard/dashboardNew.jsp" />
   <body>
     
     

      <div class="breadcrumb-container">
         <div class="row">
             <div class="col">
                 <div class="breadcrumb">
                     <div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
                     <div class="breadcrumb-item">    <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a></div>
                   
                     
                     <div class="breadcrumb-item"><a>   Add & Manage Beneficiary</a></div>
                 </div>
             </div>
         </div>
     </div>
      <!-- header-end -->







      <section class="PAYMENTS-TRANSFER-main  funds-tra ">
         <div class="container-fluid">
            <div class="payments-and-transfer-inner">
               <div class="row">
                  <!-- <div class="pay-heading">
                     <h2>
                        <img src="/styles/images/add-user-account-icon 1.png" alt="">
                        Add & Manage Beneficiary
                     </h2>
                  </div> -->

                  <div class="pay-heading">
                     <h6>
                        <img style="width: 20px"  src="/styles/images/add-user-account-icon 1.png" alt="">
                        Add & Manage Beneficiary
                     </h6>  
                  </div>

                  <div class="selection-button">
                    <button type="button" onclick="window.location.href = 'addNewBeneficiary.jsp'">Add Beneficiary</button>

                    <button type="button" onclick="window.location.href = '/fundtransfer/fund.do?action=fetchPayee&paramLogin=N'">Confirm Beneficiary</button> 

                    <button type="button" onclick="window.location.href = '/fundtransfer/fund.do?action=updatePayeeData&paramLogin=N'">Update Beneficiary</button>

                    <button type="button" onclick="window.location.href = '/fundtransfer/fund.do?action=fetchPayeeForDeActive&paramLogin=Y'">De-Activate Beneficiary</button>                    

                    <!-- button type="button" onclick="window.location.href = ''">Activate</button -->

                    <!-- button type="button" onclick="window.location.href = ''">De-Activate</button -->

                    <!-- button type="button" onclick="window.location.href = ''">Delete</button -->
                  </div>

                  <div class="procced-button">
                    <button type="button" onclick="window.location.href = 'addNewBeneficiary.jsp'"><img src="/styles/images/next 2.png" alt=""> Proceed</button>

                  </div>
               </div>
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
                     <img src="/styles/images/logo.png" alt="" width="250">
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
      
     
      <script>

         alert("Manage Beneficiary")
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
         
         
      </script>
   </body>
</html>