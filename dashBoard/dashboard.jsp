<!DOCTYPE html>
<html lang="en">
   <head>
   
 <link rel="stylesheet" href="/dashBoard/css/custom.css"> 
   <%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
 <%@ page import="java.util.*" %>
<%@ include file="/header/headerbar.jsp"%>
<% 
	String Arr= null, usrName="",loggedInUserId = "",custRole= "";
	String userInfo[][] = null;
	int j; 
      custRole  =(String) session.getAttribute("custRole");
     
		System.out.println( "cust role in the dashBoardpage ::::::::::: "+ custRole);
	
	usrName = (String)session.getAttribute("user");
   loggedInUserId = (String)session.getAttribute("AdminName");
	userInfo = (String [][])session.getAttribute("userInfo");

   System.out.println("Logged in user  ::::::" + loggedInUserId);
  
  ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
		myList = (ArrayList<String>)session.getAttribute("resStr");
	}
   System.out.println("myList in dashBoard page "+myList);

   session.setAttribute("custIdUser",userInfo[0][8]);

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
             
          img#dwnArrow {
            margin-left: 250%;
            /* height: 3%; */
         }   
             
             }

             img#dwnArrow {
             margin-left: 300%;
            }
         }
   </style>
    <jsp:include page="/dashBoard/dashboardNew.jsp" />
	<body onload="displayData()"> 
   
     <section class="brad-log-time" style="height: 20px">
         <div class="inner-brad-log">
            <div class="container">
               <div class="row">
                  <div class="col-md-8">                     
                  </div>
                  <div class="col-md-4">
                     <div class="log-time">
                        <span class="time">
                        <%= (new java.util.Date()).toLocaleString()%>
                        </span>                        
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>



      <section class="dashboard-start " style="margin-top:-40px">
         <div class="dashboasrd-inner">
            <div class="container">
               <div class="row">
                              <ul style="display: none">
                                 <li id="FDDetails">
                                    <%-- <a href="/accDetails/FD_details.jsp">FD Account Details</a> --%>
                                 </li>

                                 <li>
                                    <a> <i>Dynamic Menus </i> </a>
                                 </li>

                                 <li>
                                    <div id="menuData">
                                    </div>
                                 </li>
                                 <%-- <li>
                                    <div id="SubmenuData">
                                    </div>
                                 </li> --%>     
                              </ul>
                        
                        </div>
                   
                  <div class="col-md-12">
                     <div class="dashboard-shadow right-section">
                        
                       
                      
                        <!-- tabing-aria -->
                        <div class="tabing-dashboard">
                           <div class="tab">
                              <button id="defaultOpen" class="tablinks"  onclick="openCity(event, 'accounts')"> 
                                 <img src="/styles/images/account-number-icon 1.png" alt="">
                                    Saving/Current
                              </button>
                              <button class="tablinks"  onclick="openCity(event, 'loan')"> 
                                 <img src="/styles/images/bank-finance-loan-icon 1.png" alt="">
                                   Loan
                              </button>
                              <button class="tablinks"  onclick="openCity(event, 'fd')"> 
                                 <img src="/styles/images/deposit 1.png" alt="">    Fixed Deposit
                              </button> 
                              <button class="tablinks"  onclick="openCity(event, 'rd')"> 
                                 <img src="/styles/images/deposit 1.png" alt="">     Recurring Deposit
                              </button>                             
                           </div>
                        </div> 

                      
                      <div id="accounts" class="tabcontent tabing-dash accounts">
                              <div id="sav">
                              </div>						  
                      </div>                       

                        <div id="loan" class="tabcontent tabing-dash loan">
                           <div id="test">
						         </div>						  
                        </div>

                         <div id="fd" class="tabcontent tabing-dash">
                           <div id="fixedDeposite">
						         </div>						  
                        </div>						

                        <div id="rd" class="tabcontent tabing-dash">
                           <div id="RdDeposite">
						         </div>						  
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

     // userMenu();
      savingAjax();
      
      //findUserMenu();
      //findUserSubMenu();      
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

      
      $(document).ready(function(){
         //Hide the sub tables by default
         $(".07, .08, .10, .13").hide();
         //When a row of the table with class "Account" is clicked
         $(".Account").click(function(){
         //Toggle the visibility of the sub table with class "07"
            $(".07").toggle();
         });
         //When a row of the table with class "Fund" is clicked
         $(".Fund").click(function(){
         //Toggle the visibility of the sub table with class "08"
            $(".08").toggle();
         });
         //When a row of the table with class "Request" is clicked
         $(".Request").click(function(){
         //Toggle the visibility of the sub table with class "10"
            $(".10").toggle();
         });
         //When a row of the table with class "Settings" is clicked
         $(".Settings").click(function(){
         //Toggle the visibility of the sub table with class "13"
            $(".13").toggle();
         });
         
      });



      
      console.log("Page Load Successfully");

   }

   // function savingAjax () {
   async function onloadFun() {
      localStorage.removeItem("fdAccNo");
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
            var FdDetails = "";
            var RdDetails = "";
            var fdAcc = "";

            var jsonData = JSON.parse(resArray);           

            for (var i = 0; i < jsonData.accountInformation.length; i++) { // start for loop
               counter = jsonData.accountInformation[i];
               
               if(counter.accountType=="S"){  			
                  loanDiv2222+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one">'+'<strong>'+" Account Number"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.brancode+'</span>'+'</div>'+            
                        '</div>'+
                     '</div>'		                         
               }    

               if(counter.accountType=="A"){                  
                  loanDiv+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one">'+'<strong>'+" Account Number"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.brancode+'</span>'+'</div>'+               
                        '</div>'+
                     '</div>'                     
               }	

               if(counter.accountType=="T" || counter.accountType=="C"){                  
                  loanDiv+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one" >'+'<strong>'+" Account Number"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.brancode+'</span>'+'</div>'+		 
                        '</div>'+
                     '</div>'                             
               }    


               if(counter.accountType=="F"){      
                    fdAcc +=  '<a href="/accDetails/FD_details.jsp">FD Details</a>'   
                     localStorage.removeItem("fdAccNo");
                     localStorage.setItem("fdAccNo",counter.accountNo);
                     console.log("FD acc details ",counter.accountNo);
                  FdDetails+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one" >'+'<strong>'+" Account Number"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.brancode+'</span>'+'</div>'+		 
                        '</div>'+
                     '</div>'                             
               } 

               if(counter.accountType=="E"){                  
                  RdDetails+=
                     '<div>'+
                        '<div class="account-head">'+'<span class="accountss-dash">'+counter.actEname+'</span>'+
                           '<div class="account one" >'+'<strong>'+" Account Number"+'</strong>'+'<span>'+counter.accountNo+'</span>'+'</div>' +
                           '<div class="account two">'+'<strong>'+"Balance"+'</strong>'+'<span>'+counter.clearBalance+'</span>'+'</div>'+
                           '<div class="account three" >'+'<strong>'+"Branch"+'</strong>'+'<span>'+counter.brancode+'</span>'+'</div>'+		 
                        '</div>'+
                     '</div>'                             
               }          
               


         } // End for loop
      } 
      var testDiv='<div class="owl-carousel accounts-dashboard owl-loaded owl-drag">';
      var testDiv2= '<div class="owl-carousel accounts-dashboard owl-loaded owl-drag">';
      
      //  <li id="FDDetails">
      //    <a href="/accDetails/FD_details.jsp">FD Account Details</a>
      //  </li>  

       document.getElementById("FDDetails").innerHTML = fdAcc;

      document.getElementById("test").innerHTML =testDiv+loanDiv+'</div>'
      document.getElementById("sav").innerHTML =testDiv+loanDiv2222+'</div>'	
      document.getElementById("fixedDeposite").innerHTML =testDiv+FdDetails+'</div>'	
      document.getElementById("RdDeposite").innerHTML =testDiv+RdDetails+'</div>'	

     
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
   function userMenu(){
	   //alert("userMenu is calling")	   
      var URL ="/AccountInfoAction.do?action=fetchIBUsrMnu&userId="+<%=loggedInUserId%>+"&custRole="+'<%=custRole%>'; 
	   http.open("GET",URL,false);
		http.onreadystatechange= function (){UserMenuDisplay()};
		http.send(null);
   }
	function UserMenuDisplay(){ 
         //alert(" UserMenuDisplay is calling ");
         if((http.readyState == 4) && (http.status == 200)){
            var resArrayMnu=http.responseText;  
            var jsonData = JSON.parse(resArrayMnu);    
            var atmDetails = "";  
            var tableBody =  '<table style="margin-top:8%;" class="mnu">' ;        
            for (var i = 0; i < jsonData.Menu.length; i++) { 
               const test1 =  JSON.stringify(jsonData.Menu[i][1]);              
               var subMnu = getSubMnuData(jsonData.Menu[i][1]);
               var subM ="";
               for (var j = 0; j < subMnu.SubMenu.length; j++) { 
                  subM += '<tr>'+ '<td>'+ '<img src="/styles/images/rightArrow.png"  id="dwnArrow" >' + '<a href= '+subMnu.SubMenu[j][1]+ '>' +subMnu.SubMenu[j][0] +'</a>' +'</td>'+'</tr>'  
               } 
               atmDetails+=
               //<img src="/styles/images/down-aroowwww.png" alt="">
                  '<tr style="color:blue;">'+ 
                     '<td>'+'<b>'+ jsonData.Menu[i][0] + '</b>'+'</td>'  +  
                     '<td  >'+'<b>'+ '<img src="/styles/images/downArrow1.png" style="margin-left:150%;" alt="" id="dwnArrow" class='+jsonData.Menu[i][0]+ '>' + '</b>'+'</td>'  + 
                  '</tr>'+
                  '<tr>' +                                                            
                     '<td>'+ '<table style="margin-left:5%;" class='+ jsonData.Menu[i][1]+ '>'+ subM +'</table>'+'</td>'                          
                  '</tr>'
             }                    
            document.getElementById("menuData").innerHTML = tableBody + '<tbody>' + atmDetails + '</tbody>' + '</table>' ;   
         }       
     }
</script>

<script>
   function getSubMnuData(menuLvlno){
      userSubMenu(menuLvlno);
      var sMnu = UserSubMenuDisplay();            
      return sMnu;
   }
</script>

<script>
   function userSubMenu(menuLvlno){	   
      var URL ="/AccountInfoAction.do?action=fetchIBUsrSubMnu&userId="+<%=loggedInUserId%>+"&custRole="+'<%=custRole%>'+"&mnu_lvsno="+menuLvlno; 
	   http.open("GET",URL,false);
		http.onreadystatechange= function (){UserSubMenuDisplay()};
		http.send(null);
   }
	function UserSubMenuDisplay(){ 
         var jsonData="";      
         if((http.readyState == 4) && (http.status == 200)){
            var resArrayMnu=http.responseText;  
               jsonData = JSON.parse(resArrayMnu);  
               return jsonData;  
               var sumMenuDetails = "";                 
         }    
     }
</script>
     
</body>
</html>
