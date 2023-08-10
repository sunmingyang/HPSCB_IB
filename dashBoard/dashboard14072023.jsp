<!DOCTYPE html>
<html lang="en">
   <head>
   
 <%-- <link rel="stylesheet" href="/dashBoard/css/custom.css"> --%>
   <%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
 <%@ page import="java.util.*" %>

<% 
	String Arr= null, usrName="",loggedInUserId = "";
	String userInfo[][] = null;
	int j; 
	
	usrName = (String)session.getAttribute("user");
   loggedInUserId = (String)session.getAttribute("AdminName");
	userInfo = (String [][])session.getAttribute("userInfo");

   System.out.println("Logged in user  ::::::" + loggedInUserId);
  


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

   	session.setAttribute("usrName",usrName);			
					
%>
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
	<script language="JavaScript" src="/scripts/common.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	 

    
      
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
 <%@ include file="/header/headerbar.jsp"%>
	<body onload="displayData()"> 
   
     <section class="brad-log-time">
         <div class="inner-brad-log">
            <div class="container">
               <div class="row">
                  <div class="col-md-8">
                     <%-- <div class="bradcums">
                        <ul>
                           <li>
                              <a href="/dashBoard/dashboard.jsp">Dashboard</a>
                              >
                             
                              <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a>
                              >
                              <strong>
                                Fund Transfer
                              </strong>
                           </li>
                        </ul>
                     </div> --%>
                  </div>
                  <div class="col-md-4">
                     <div class="log-time">
                        <span class="time">
                        <%= (new java.util.Date()).toLocaleString()%>
                        </span>
                        <%-- <span class="profile">
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
                        </span> --%>
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
                         <!--  <img src="/styles/images/profile-icon-2.png" alt="">-->
                           </span>
                           <span class="back-wel-comeee">
                           WEL COME 
                           <strong><%=usrName %></strong>
                           </span>
                        </div>
                        <%-- <div class="profile-button">
                           <span class="icon">
                           <img src="/styles/images/my-account-icon 2.png" alt="">
                           </span>
                           <button>MY PROFILE</button>
                        </div> --%>
                        <%-- <div class="profile-button debitcard">
                           <span class="icon">
                           <img src="/styles/images/card-pin-icon 1.png" alt="">
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
                                 <img src="/styles/images/shortcut-icon 1.png" alt="">
                                 My Shortcuts
                              </h2>
                           </div>
                           <div class="short-menu" id="short-menu">
                              <ul>
                                 <li>
                                    <a href="/accsum/acc_sum.do?action=setDetail">Account Statement</a>
                                 </li>
                                <!-- <li>
                                    <a href="#">e-Statement</a>
                                 </li>-->
                                 <li>
                                    <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a>
                                 </li>

                                 <li>
                                    <div id="menuData">
                                    </div>
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
                                 <img src="/styles/images/account-summery.png" alt="">
                                 <a href="/accDetails/accSummary.jsp"> Account Summary </a>
                              </li> --%>
                              <li>
                                 <img src="/styles/images/bank-statement.png" alt="">
                                <a href="/accsum/acc_sum.do?action=setDetail">Account Statement</a>
                              </li>
                              <li>
                                 <img src="/styles/images/profile-website.png" alt="">
                                <a href="/my_profile/my_profile.jsp">My Profile</a>
                              </li>
                              <li>
                                 <img src="/styles/images/fund-transfer-icon-head.png" alt="">
                                 <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a>
                              </li>
                                 <!--<li>
                                 <img src="/styles/images/pending-statement.png" alt="">
                                 <a href="#">Pending Statement</a>
                                 </li>
                                 <li>
                                 <img src="/styles/images/spend-ana.png" alt="">
                                 <a href="#">Spend Analyzer</a>
                                 </li>
                                 <li>
                                 <img src="/styles/images/know-cibil.png" alt="">
                                 <a href="#">Know Your CIBIL Score </a>
                                 </li>
                                 <li>
                                 <img src="/styles/images/reward.png" alt="">
                                 <a href="#">HPSCB Rewards</a>
                                 </li>
                                 <li>
                                 <img src="/styles/images/select-your.png" alt="">
                                 <a href="#">Select Your Segment</a>
                                 </li>
                                 <li>
                                 <img src="/styles/images/upi-icon 4.png" alt="">
                                 <a href="#">Enable / Disable Accounts For Upi</a>
                                 </li>
                                 <li>
                                 <img src="/styles/images/KYC.png" alt="">
                                 <a href="#">Update KYC</a>
                                 </li> -->
                           </ul>
                        </div>
                        <!-- tabing-aria -->
                        <div class="tabing-dashboard">
                           <div class="tab">
                              <button id="defaultOpen" class="tablinks"  onclick="openCity(event, 'accounts')"> 
                                 <img src="/styles/images/account-number-icon 1.png" alt="">
                                    Saving/Current
                              </button>
                              <button class="tablinks"  onclick="openCity(event, 'loan')"> 
                                 <img src="/styles/images/bank-finance-loan-icon 1.png" alt="">
                                    LOAN
                              </button>
                              <%-- <button class="tablinks" onclick="openCity(event, 'cards')"> <img src="/styles/images/tab/card-pin-icon 2.png" alt="">CARD</button> --%>
                              <%-- <button class="tablinks"  onclick="openCity(event, 'fd')"> 
                                 <img src="/styles/images/deposit 1.png" alt="">    FIXED DEPOSIT
                              </button> 
                            <button class="tablinks"  onclick="openCity(event, 'fd')"> <img src="/styles/images/deposit 1.png" alt=""> FIXED DEPOSIT</button>
                              <button class="tablinks" onclick="openCity(event, 'rd')"> <img src="/styles/images/deposit 1.png" alt=""> RD</button> --%>
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
                                    <img src="/styles/images/car-price-icon 1.png" alt="">
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
                                    <img src="/styles/images/car-price-icon 1.png" alt="">
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
                                    <img src="/styles/images/car-price-icon 1.png" alt="">
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
      
    <%@ include file="/header/footer.jsp"%>	
    
<script>

  function displayData(){
      savingAjax();
      //findUserMenu();
   }
   async	function savingAjax () {
      await onloadFun().then(() => {
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
         });
      });
console.log("then()");

   }

   // function savingAjax () {
   async function onloadFun() {
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
                           '<div class="account one">'+'<strong>'+" Account Number"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.address+'</span>'+'</div>'+            
                        '</div>'+
                     '</div>'		                         
               }              

                

               if(counter.accountType=="A"){                  
                  loanDiv+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one">'+'<strong>'+" Account Number"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.address+'</span>'+'</div>'+               
                        '</div>'+
                     '</div>'                     
               }	

               if(counter.accountType=="T"){                  
                  loanDiv+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one" >'+'<strong>'+" Account Number"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
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
            
         
   // jQuery(document).ready(function(){  
   //    jQuery('.accounts-dashboard').owlCarousel({
   //       loop:false,
   //       margin:10,
   //       responsiveClass:true,
   //       responsive:{
   //          0:{
   //             items:1,
   //             nav:true
   //          },
   //          600:{
   //             items:2,
   //             nav:false
   //          },
   //          1000:{
   //             items:2,
   //             nav:true,
   //             loop:false
   //       }
   //       }
   //    })
   // });
         
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



<script>
    async function findUserMenu(){   
      alert("findUserMenu is calling ");
   try {
        const jsonData  =  await fetch("http://127.0.0.1:8643/rest/AccountService/menuList/"+ 116525010)
        // "http://127.0.0.1:8643/rest/AccountService/accountBalance/"+ sAccNO     
        .then(response => response.json()).then(response=>displayUserMenu(response));         
      }catch (e) {
        console.log("error");
         console.log(e);       
      }      			
}    	

    function displayUserMenu(response){     
      alert("api is responding  is calling ");  
        console.log(response); 
        var atmDetails = "";
      var tempLen = response.Menu.length;
         //console.log(tempLen); 
        var tableBody =  '<table >'   ;
      
      //if(tempLen > 0){
            for (var i = 0; i < tempLen; i++) {
               console.log("1111");
                atmDetails+=
                '<tr>'+                    
                  //   '<td>'+ '<span>'+response.Menu[i][0]+'</span>'+'</td>'+
                    '<td>'+ '<span>'+ '<a href='+ response.Menu[i][1] +'>' + response.Menu[i][0] + '</a>' +'</span>'+'</td>'+
                    
                '</tr>'
            }   
            //console.log(atmDetails);       
            document.getElementById("menuData").innerHTML = tableBody + '<tbody>' + atmDetails + '</tbody>' + '</table>' ; 
       //}

    }	 
		
</script> 


     
</body>
</html>