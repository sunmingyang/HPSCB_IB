
    <%@ include file="/header/headerbar.jsp"%>
    <jsp:include page="/dashBoard/dashboardNew.jsp" />
   <body>
     
     

      <div class="breadcrumb-container">
         <div class="row">
             <div class="col">
                 <div class="breadcrumb">
                     <div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
                     <div class="breadcrumb-item">    <a>Fund Transfer</a></div>
                   
                     
                    
                 </div>
             </div>
         </div>
     </div>
      <!-- header-end -->
      <section class="PAYMENTS-TRANSFER-main  funds-tra my-5">
         <div class="container-fluid">
            <div class="payments-and-transfer-inner">
               <div class="row">
                  
                 <div class="inner-funds-transfer-heading">
                     <h2>
                        <img src="/styles/images/wallet-to-bank-icon 1.png" alt="">
                        Within HPSCB
                     </h2>
                     <div class="fund-transfer-list one">
                        <ul>
                           <li>
                              <a href="/fundTransferNeftNew/Fund-Transfer-Own-Bank.jsp">
                              <img src="/styles/images/fund-transfer-icon 2.png" alt="">
                              Self HPSCB A/C 
                              </a>
                           </li>
                           <li>
                              <a href="/sfmsneft/SaveNeft.do?action=getPayeetDataSameBank">
                              <img src="/styles/images/accounts-of-other.png" alt="">
                              Other A/c Within HPSCB 
                              </a>
                           </li>
                           <li>
                              <a href="/sfmsneft/SaveNeft.do?action=getPayeetDataForQuickTransferSameBank">
                              <img src="/styles/images/quick-transfer.png" alt="">
                              Quick Transfer (Within-HPSCB) 
                           </a>
                        </li>
                        </ul>
                     </div>
                  </div>
                  <div class="inner-funds-transfer-heading">
                     <h2>
                        <img src="/styles/images/wallet-to-bank-icon 1.png" alt="">
                        Outside HPSCB
                     </h2>
                     <div class="fund-transfer-list one">
                        <ul>
                           <li>
                              <a href="/sfmsneft/SaveNeft.do?action=getAccountData">
                              <img src="/styles/images/other-bank.png" alt="">
                              Other Bank Transfer
                              </a>
                           </li>
                            <li>
                              <a href="/sfmsneft/SaveNeft.do?action=getAccountDataQuickTransferOtherBank">
                              <img src="/styles/images/quick-transfer.png" alt="">
                              Quick Transfer (Other-Bank) 
                           </a>
                          <!-- <li>
                              <a href="">
                              <img src="/styles/images/imps-fund-transfer.png" alt="">
                              IMPS Fund Transfer
                              </a>
                           </li>-->
                           <!--<li>
                               <a href="/sfmsneft/SaveNeft.do?action=getAccountData">
                              <img src="/styles/images/neft-and-rtgs.png" alt="">
                              NEFT & RTGS Fund Transfer
                              </a>
                           </li> -->
                         <!--  <li>
                              <a href="">
                              <img src="/styles/images/internation-fund-transfer.png" alt="">
                              International Funds Transfer 
                              </a>
                           </li>-->
                        </ul>
                     </div>
					 
                  </div>
				  
                     
				  <div class="inner-funds-transfer-heading">
                     <h2>
                        <img src="/styles/images/fund-transfer-icon-head.png" alt="">
						         Beneficiary
						</h2>
                  </div>
                  <div class="fund-transfer-list one">
                     <ul>
                        
                        <li>
                           <a href="/addPayee/addManagePayee.jsp">
				  
                           <img src="/styles/images/add-and-manage.png" alt="">
                            Add & Manage Beneficiary 
                           </a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- <section class="back-home-button">
         <div class="container">
            <div class="inner-back-home">
               <button> <a href="/dashBoard/dashboard.jsp"> BACK</a></button>
               <button> <a href="/dashBoard/dashboard.jsp">HOME</a></button>
            </div>
         </div>
      </section> -->
      <!-- footer-start -->
      
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