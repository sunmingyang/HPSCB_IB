<!DOCTYPE html>
<html lang="en">
   <head>
   <script src="/dashBoard/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="/dashBoard/css/owl.carousel.min.css">
      <link rel="stylesheet" href="/dashBoard/css/owl.theme.default.min.css">
      <link rel="stylesheet" href="/dashBoard/css/font-awesome.min.css">
      <link rel="stylesheet" href="/dashBoard/css/bootstrap.min.css">
      <link rel="stylesheet" href="/dashBoard/css/custom.css">
   <%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
 <%@ page import="java.util.*" %>

<% 
	String Arr= null, usrName="";
	String userInfo[][] = null;
	int j; 
	
	usrName = (String)session.getAttribute("user");
	userInfo = (String [][])session.getAttribute("userInfo");
	String brnCode=userInfo[0][1];
//out.writeln(""+request.setAttribute("brnCode",brnCode));
	System.out.println("Branch Code is this -->"+brnCode);
	String loginTime = (String)session.getAttribute("lastLoginTime");
    String totallogin = (String)request.getAttribute("totallogin");
	 String responseStr = (String)session.getAttribute("responseStr");

	boolean mobileUserAgent  = SessionHandler.mobileUserAgent(request.getHeader("User-Agent").toLowerCase()); 
	if (mobileUserAgent)	{
		response.sendRedirect("/mobile/mobilemenu.jsp");   
		System.out.println("GO TO ANDROID TABLET mobilemenu");
	} 
					
					
%>
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
	<script language="JavaScript" src="/scripts/common.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	 

    
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
      
      <title>HPSCB INTERNET BANKING</title>
   </head>

   <style>
      @media(max-width:1441px){
      .container {
         max-width: 100%;
      }

      @media(max-width:991px){
         section.dashboard-start .dashboard-shadow .ineer-right-sec h2 {
            font-size: 18px;
            margin: 0 0 20px;
         }

         section.dashboard-start .dashboard-shadow.left-section {
            margin: 0 0 20px;
         }

         section.dashboard-start .dashboard-shadow .getting {
            font-size: 14px;
         }

         .menu-dash-right ul li {
            width: 100%;
            margin: 0 0 15px;
            border-bottom: 1px solid #ccc;
            padding: 0 0 15px;
         }

         .tabing-dashboard .tab {
            width: 140%;
         }

         .tabing-dashboard .tab button {
            width: 60%;
            margin: 0 20px 0 0;
         }

         .tabing-dashboard {
            overflow-x: scroll !important;
         }

         .tabing-dash {
            padding: 0 5px;
         }

         .site-logo {
            text-align: center;
            padding: 6px 0 6px;
         }
               }
         }
   </style>
 
	<body onload="savingAjax()">
      <header class="site-header">
         <div class="top-header">
            <div class="container">
               <div class="row">
                  <div class="col-md-2">
                     <div class="site-logo">
                        <a href="index.html">
                        <img src="/images/logo.png" alt="" width="250">
                        </a>
                     </div>
                  </div>
                  <div class="col-md-10">
                    
                  </div>
               </div>
            </div>
         </div>
      </header>
      <div class="menu">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="toggle d-none">
                     <span class="one"></span>
                     <span class="one"></span>
                     <span class="one"></span>
                  </div>
                  <ul class="dashboard-menu">
                   <!--  <li>
                        <a href="#">
                        <img src="/dashBoard/images/dashboard/overview.png" alt="">
                        OVERVIEW
                        </a>
                     </li>
                     <li class="sub-menu-item-3 index-menu">
                        <a href="#">
                        <img src="/dashBoard/images/dashboard/my-account.png" alt="">
                        MY ACCOUNTS  
                        </a>
                        <ul class="sub-menu">
                           <li>
                               <a href="new-account-first.html">
                                   New Account Open
                               </a>
                           </li>
                       </ul>
                     </li>
                     <li class="sub-menu-item-3">
                        <a href=" PAYMENTS-TRANSFER.html">
                        <img src="/dashBoard/images/dashboard/transfer.png" alt="">
                        PAYMENTS & TRANSFER
                        </a>
                        <ul class="sub-menu">
                           <li>
                             <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">
                              FUND TRANSFER
                              </a>
                           </li>
                           <!--<li>
                              <a href="">
                              BILL PAYMENTS
                              </a>
                           </li>
                           <li>
                              <a href="">
                              QUICK PAY
                              </a>
                           </li>
                           <li>
                              <a href="">
                              RECHARGE 
                              </a>
                           </li>
                           <li>
                              <a href="">
                              RECEIVE FUNDS
                              </a>
                           </li>
                           <li>
                              <a href="">
                              MANAGE PAYEES
                              </a>
                           </li>
                           <li>
                              <a href="">
                              MANAGE BILLERS
                              </a>
                           </li>
                           <li>
                              <a href="">
                              TRANSACTION STATUS
                              </a>
                           </li>
                           <li>
                              <a href="">
                              TAX CENTER
                              </a>
                           </li>-->
                        </ul>
                    </li>
                    <!-- <li class="sub-menu-item-3 index-menu">
                        <a href="INVESTMENTS-INSURANCE.html">
                        <img src="/dashBoard/images/dashboard/investment.png" alt="">
                        INVESTMENTS & INSURANCE 
                        </a>

                        <ul class="sub-menu">
                           <li>
                               <a href="">
                                 General Insurance
                               </a>
                           </li>
                           <li>
                               <a href="">
                                 RD
                               </a>
                           </li>

                           <li>
                              <a href="">
                                 Life Insurance
                              </a>
                          </li>

                          <li>
                           <a href="">
                              Insure Online
                           </a>
                       </li>

                       <li>
                        <a href="">
                           Invest Online
                        </a>
                    </li>

                    <li>
                     <a href="">
                        Other Services
                     </a>
                 </li>
                       </ul>

                     </li>
                     <li>
                        <a href="exclusive-offering.html">
                        <img src="/dashBoard/images/dashboard/offer.png" alt="">
                        EXCLUSIVE OFFERINGS
                        </a>
                     </li>
                     <li>
                        <a href="#">
                        <img src="/dashBoard/images/dashboard/customer-service.png" alt="">
                        CUSTOMER SERVICE
                        </a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <section class="brad-log-time">
         <div class="inner-brad-log">
            <div class="container">
               <div class="row">
                  <div class="col-md-8">
                     <div class="bradcums">
                        <ul>
                          <li>
                              <a href="dashboard.html">DashBoard</a>
                              >
                              <strong>
                              Page Name
                              </strong>
                           </li>-->
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <div class="log-time">
                        <span class="time">
                            <%= (new java.util.Date()).toLocaleString()%>
                        </span>
                        <span class="profile">  
                           <i class="fa fa-user" aria-hidden="true"></i>                     
                           <img src="/dashBoard/images/down-aroowwww.png" alt="">
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
      <section class="dashboard-start my-5">
         <div class="dashboasrd-inner">
            <div class="container">
               <div class="row">
                  <div class="col-md-4">
                     <div class="dashboard-shadow left-section">
                        <div class="wel-come-profile">
                           <span class="profile-icon">
                         <!--  <img src="/dashBoard/images/profile-icon-2.png" alt="">-->
                           </span>
                           <span class="back-wel-comeee">
                           WEL COME BACK
                           <strong><%=usrName %></strong>
                           </span>
                        </div>
                        <%-- <div class="profile-button">
                           <span class="icon">
                           <img src="/dashBoard/images/my-account-icon 2.png" alt="">
                           </span>
                           <button>MY PROFILE</button>
                        </div> --%>
                        <%-- <div class="profile-button debitcard">
                           <span class="icon">
                           <img src="/dashBoard/images/card-pin-icon 1.png" alt="">
                           </span>
                         <!--  <button>MY CARD PIN</button>-->
                        </div> --%>
                        <div class="last-visited">
                           <%-- <div class="last">
                              <span>Last visited:</span>
                              <span><%= (new java.util.Date()).toLocaleString()%></span>
                           </div> --%>
                           <button type="button" onclick="window.location='/jsp/login.do?action=ibUsrLogout'"> 
                           <i class="fa fa-sign-in" aria-hidden="true"></i>
                           LOG OUT
                        </button>
                        </div>
                        <div class="my-short-cut">
                           <div class="short-inner">
                              <h2>
                                 <img src="/dashBoard/images/shortcut-icon 1.png" alt="">
                                 My Shortcuts
                              </h2>
                           </div>
                           <div class="short-menu">
                              <ul>
                                 <li>
                                    <a href="/accsum/acc_sum.do?action=setDetail">Detailed Statement</a>
                                 </li>
                                <!-- <li>
                                    <a href="#">e-Statement</a>
                                 </li>-->
                                 <li>
                                    <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a>
                                 </li>
                               <!--  <li>
                                    <a href="#">My Favorites</a>
                                 </li>-->
                                <!-- <li>
                                    <a href="#">Bill Payments</a>
                                 </li>-->
                               <!--  <li>
                                    <a href="#">Quick Pay</a>
                                 </li>-->
                                 <!--<li>
                                    <a href="#">Prepaid Recharge</a>
                                 </li>-->
                               <!--  <li>
                                    <a href="#">Payment To HPSCB Bank Credit Card</a>
                                 </li>-->
                               <!--  <li>
                                    <a href="#">Pay Any Visa Credit Card</a>
                                 </li>-->
                                <!-- <li>
                                    <a href="#">Scheduled Transaction</a>
                                 </li>-->
                                <!-- <li>
                                    <a href="#">Open Fixed Deposit</a>
                                 </li>-->
                                <!-- <li>
                                    <a href="#">Service Requests</a>
                                 </li>-->
                               <!--  <button type="button"> 
                                 CUSTOMIZE LINKS
                                 </button>-->
                              </ul>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-8">
                     <div class="dashboard-shadow right-section">
                        <div class="ineer-right-sec">
                           <h2>Welcome To HPSCB Internet Banking</h2>
                        </div>
                        <div class="getting">
                           Getting Started
                        </div>
                        <div class="menu-dash-right">
                           <ul>
                              <%-- <li>
                                 <img src="/dashBoard/images/log-dash/account-summery.png" alt="">
                                 <a href="/accDetails/accSummary.jsp"> Account Summary </a>
                              </li> --%>
                              <li>
                                 <img src="/dashBoard/images/log-dash/bank-statement.png" alt="">
                                <a href="/accsum/acc_sum.do?action=setDetail">Account Statement</a>
                              </li>
                              <li>
                                 <img src="/dashBoard/images/log-dash/profile-website.png" alt="">
                                <a href="/my_profile/my_profile.jsp">My Profile</a>
                              </li>
                              <li>
                                 <img src="/dashBoard/images/payment-transfer/fund-transfer-icon-head.png" alt="">
                                 <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a>
                              </li>
                                 <!--<li>
                                 <img src="/dashBoard/images/log-dash/pending-statement.png" alt="">
                                 <a href="#">Pending Statement</a>
                                 </li>
                                 <li>
                                 <img src="/dashBoard/images/log-dash/spend-ana.png" alt="">
                                 <a href="#">Spend Analyzer</a>
                                 </li>
                                 <li>
                                 <img src="/dashBoard/images/log-dash/know-cibil.png" alt="">
                                 <a href="#">Know Your CIBIL Score </a>
                                 </li>
                                 <li>
                                 <img src="/dashBoard/images/log-dash/reward.png" alt="">
                                 <a href="#">HPSCB Rewards</a>
                                 </li>
                                 <li>
                                 <img src="/dashBoard/images/log-dash/select-your.png" alt="">
                                 <a href="#">Select Your Segment</a>
                                 </li>
                                 <li>
                                 <img src="/dashBoard/images/log-dash/upi-icon 4.png" alt="">
                                 <a href="#">Enable / Disable Accounts For Upi</a>
                                 </li>
                                 <li>
                                 <img src="/dashBoard/images/log-dash/KYC.png" alt="">
                                 <a href="#">Update KYC</a>
                                 </li> -->
                           </ul>
                        </div>
                        <!-- tabing-aria -->
                        <div class="tabing-dashboard">
                           <div class="tab">
                              <button id="defaultOpen" class="tablinks"  onclick="openCity(event, 'accounts')"> 
                                 <img src="/dashBoard/images/tab/account-number-icon 1.png" alt="">
                                    Saving/Current
                              </button>
                              <button class="tablinks"  onclick="openCity(event, 'loan')"> 
                                 <img src="/dashBoard/images/tab/bank-finance-loan-icon 1.png" alt="">
                                    LOAN
                              </button>
                              <%-- <button class="tablinks" onclick="openCity(event, 'cards')"> <img src="/dashBoard/images/tab/card-pin-icon 2.png" alt="">CARD</button> --%>
                              <%-- <button class="tablinks"  onclick="openCity(event, 'fd')"> 
                                 <img src="/dashBoard/images/tab/deposit 1.png" alt="">    FIXED DEPOSIT
                              </button> 
                            <button class="tablinks"  onclick="openCity(event, 'fd')"> <img src="/dashBoard/images/tab/deposit 1.png" alt=""> FIXED DEPOSIT</button>
                              <button class="tablinks" onclick="openCity(event, 'rd')"> <img src="/dashBoard/images/tab/deposit 1.png" alt=""> RD</button> --%>
                           </div>
                        </div>
                        
                        <%-- <div id="accounts" class="tabcontent tabing-dash accounts" >
                          <div id="sav">
                          </div>
						      </div>                          --%>
                       
                        <!-- END -->

                        <!-- account div start  -->
                           <div id="accounts" class="tabcontent tabing-dash accounts">
                              <div id="sav">
                              </div>						  
                           </div>
                        <!--- account div end -->

                        <div id="loan" class="tabcontent tabing-dash loan">
                           <div id="test">
						         </div>						  
                        </div>
						
						
                        <div id="cards" class="tabcontent tabing-dash loan">
                           <div class="owl-carousel accounts-dashboard">
                              <div>
                                 <div class="account-head">
                                    <span class="accountss-dash">
                                    <img src="/dashBoard/images/tab/car-price-icon 1.png" alt="">
                                    Debit Card
                                    </span>
                                    <div class="account one">
                                       <strong>Card Number</strong>
                                       <span>123XX678XXX234XX <a href="">SHOW</a></span>
                                    </div>
                                    <div class="account two">
                                       <strong>Card Amount</strong>
                                       <span>₹XXXXXX  <a href="">SHOW</a></span>
                                    </div>
                                    <div class="account three">
                                       <strong>Pending Amount</strong>
                                       <span>₹XXXXXX  <a href="">SHOW</a></span>
                                    </div>
                                    <div class="hyper-links">
                                       <a href="">VIEW DETAILS</a>
                                       <a href="">STATEMENT</a>
                                     </div>
                                 </div>
                              </div>
                              <div>
                                 <div class="account-head">
                                    <span class="accountss-dash">
                                    <img src="/dashBoard/images/tab/car-price-icon 1.png" alt="">
                                    Credit Card
                                    </span>
                                    <div class="account one">
                                       <strong>Card Number</strong>
                                       <span>123XX678XXX234XX <a href="">SHOW</a></span>
                                    </div>
                                    <div class="account two">
                                       <strong>Card Amount</strong>
                                       <span>₹XXXXXX  <a href="">SHOW</a></span>
                                    </div>
                                    <div class="account three">
                                       <strong>Pending Amount</strong>
                                       <span>₹XXXXXX  <a href="">SHOW</a></span>
                                    </div>
                                    <div class="hyper-links">
                                       <a href="">VIEW DETAILS</a>
                                       <a href="">STATEMENT</a>
                                    </div>
                                 </div>
                              </div>
                              <div>
                                 <div class="account-head">
                                    <span class="accountss-dash">
                                    <img src="/dashBoard/images/tab/car-price-icon 1.png" alt="">
                                    Kissan Credit Card
                                    </span>
                                    <div class="account one">
                                       <strong>Card Number</strong>
                                       <span>123XX678XXX234XX <a href="">SHOW</a></span>
                                    </div>
                                    <div class="account two">
                                       <strong>Card Amount</strong>
                                       <span>₹XXXXXX  <a href="">SHOW</a></span>
                                    </div>
                                    <div class="account three">
                                       <strong>Pending Amount</strong>
                                       <span>₹XXXXXX  <a href="">SHOW</a></span>
                                    </div>
                                    <div class="hyper-links">
                                       <a href="">VIEW DETAILS</a>
                                       <a href="">STATEMENT</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div id="fd" class="tabcontent tabing-dash loan">
                           <div class="owl-carousel accounts-dashboard">
                           </div>
                        </div>
                        <div id="rd" class="tabcontent tabing-dash loan">
                           <div class="owl-carousel accounts-dashboard">
                           </div>
                        </div>
                        <!-- p class="the-hpscb-pergrafh">The HPSCB Bank offers various Deposit plans that you can choose from depending on the term period, nature of deposit and its unique saving and withdrawal features.</p -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
         </div>
      </section>
      <!-- footer-start -->
      <%-- <footer>
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
                     <img src="/images/logo.png" alt="" width="150">
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
         </div>
         
      </footer> --%>
	  <div class="bottom-footer">
            <div class="container">
               <div class="row">
                  <class class="col-md-12">
                     <p>Copyright &#169;  2023, Himachal Pradesh State Co-operative Bank Ltd. All Rights Reserved.</p>
                  </div>
               </div>
            </div>
         </div>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
            crossorigin="anonymous">
      </script>
      <script src="/dashBoard/js/owl.carousel.min.js"></script>
      <!-- =-===================================================== -->
    
<script>
	function savingAjax(){
		//alert("saving ajax")
	   var ran=parseInt(Math.random()*9999);
      var URL ="/AccountInfoAction.do?action=fetchCustomerAccounts&custID="+<%=userInfo[0][8]%>+"&ran="+ran; 
	   http.open("POST",URL,false);
		http.onreadystatechange= function (){processAccount()};
		http.send(null);
   }
	function processAccount(){ // process data start
         if((http.readyState == 4) && (http.status == 200)){
            var resArray=http.responseText;
            //alert(resArray);
            var counter;
            var loanDiv2222="";
            var loanDiv= "";
            var jsonData = JSON.parse(resArray);
            for (var i = 0; i < jsonData.accountInformation.length; i++) { // start for loop
               counter = jsonData.accountInformation[i];
               if(counter.accountType=="S"){  			
                  loanDiv2222+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one">'+'<strong>'+"Loan Account"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.address+'</span>'+'</div>'+            
                        '</div>'+
                     '</div>'		                         
               }
               if(counter.accountType=="A"){                  
                  loanDiv+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one">'+'<strong>'+"Loan Account"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.address+'</span>'+'</div>'+               
                        '</div>'+
                     '</div>'                     
               }			
               if(counter.accountType=="T"){                  
                  loanDiv+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one" >'+'<strong>'+"Loan Account"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.address+'</span>'+'</div>'+		 
                        '</div>'+
                     '</div>'                             
               }                    		
         } // End for loop
      } 
      var testDiv='<div class="owl-carousel accounts-dashboard owl-loaded owl-drag">';
      var testDiv2= '<div class="owl-carousel accounts-dashboard owl-loaded owl-drag">';
      document.getElementById("test").innerHTML =testDiv+loanDiv+'</div>'
      document.getElementById("sav").innerHTML =testDiv+loanDiv2222+'</div>'	
     } // process data end

	function getdetail(ptaddr){
		var pttable=document.getElementById("table");
		var s=ptaddr.parentNode.parentNode;
		var t=s.rowIndex;
		var ptRowCount=pttable.rows.length;
		var accountNO = pttable.rows[t].childNodes[1].innerHTML;
		window.open("FdDetail.jsp?accountNO="+accountNO,"_self");
	}

</script>

<script>
   jQuery(document).ready(function(){  
      jQuery(".profile").click(function(){  
         jQuery(".profile-menu").toggleClass("show");  
      });
   });         
         
   jQuery(document).ready(function(){  
      jQuery('.accounts-dashboard').owlCarousel({
         loop:false,
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
               v:true,
               op:false
         }
         }
      })
   });
         
   function openCity(evt, Tabname) {
      // Declare all variables
      var i, tabcontent, tablinks;         
      // Get all elements with class="tabcontent" and hide them
      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
         tabcontent[i].style.display = "none";
      }         
      // Get all elements with class="tablinks" and remove the class "active"
      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
         tablinks[i].className = tablinks[i].className.replace(" active", "");
      }   
      // Show the current tab, and add an "active" class to the button that opened the tab
      document.getElementById(Tabname).style.display = "block";
      evt.currentTarget.className += " active";
   }         
   document.getElementById("defaultOpen").click();              
    
</script>

<style>
   .owl-nav.disabled {
      display: block !important;
   }
</style>
  
     
</body>
</html>