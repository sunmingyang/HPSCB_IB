<%

	 String mob=(String)session.getAttribute("customerMobile");
	 System.out.println("rohit-------------------"+mob);
	 int errorcount=0;
		String usrName = "";
		String fundinfo[][] = (String[][])session.getAttribute("FUNDINFO");   
		session.removeAttribute("FUNDINFO");
		if(session.getAttribute("user") != null)
			usrName = (String)session.getAttribute("user");
		
		String login_id="";
		if(session.getAttribute("userid")!=null){
			login_id = (String)session.getAttribute("userid");//New changes on 16/07/2008;
		}
		
	%>
	 <script language="JavaScript" >
	var userid='<%=login_id%>' ;
	var mob='<%=mob%>'

	// function otp_number(){
	// 		var id=document.getElementById("fundkid").value
	// 	//	var mob=document.getElementById("mob").value;
	// 		var drCr='C'
	// 		var ran=parseInt(Math.random()*9999);
	// 		var url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+id+"&mobile="+mob+"&sessionID=12" +"&ran="+ran+"&DrCr="+drCr+"&purpose=Manage Payee";
	// 		//alert(url)
	// 		http.open("POST",url,false);
	// 	http.onreadystatechange= function (){processResOTP()};
	// 			http.send(null);	
			
	// 	}
	// 	function processResOTP(){
	// 		 if (http.readyState == 4)
	// 			{
	// 				// Check that a successful server response was received
	// 				if (http.status == 200)
	// 				{
	// 					var resArray=http.responseText;
	// 					var jsonData = JSON.parse(resArray);
	// 					alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
	// 				}
	// 			}
	// 	}



	function setUserId(id)
	{
			document.getElementById("fundkid").value=id;
	}

	function deActiveBenificiary(){
		//var id=document.getElementById("otp").value;
		var id1=document.getElementById("fundkid").value;      
		if(id1==""){
		   alert("Please select a Beneficiary.");
		   return false;
		}		
		var url="/TransactionAction.do?action=deActiveBenificiary&userID="+userid+"&beneficiaryAccNo="+id1;
		//document.forms[0].submit();
		http.open("POST",url,false);
		http.onreadystatechange= function (){processRes()};
		http.send(null);
	}
	function processRes(){
      if (http.readyState == 4){
			// Check that a successful server response was received
			if (http.status == 200){			
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				if (jsonData.result=="failure") { 
					confirm("Could not Process your request Please try later");
				}else {
					alert("Beneficiary is DeActivated successfully.");
				}
				window.location.href="/fundtransfer/fund.do?action=fetchPayeeForDeActive&paramLogin=N'";
			}
		}
	}
	</script>



   <head>
      
   <%-- <link rel="stylesheet" href="/addPayee/css/custom.css">   --%>
	  <%@ include file="/common/Include.jsp" %>  
		<script language="JavaScript" src= "/scripts/MD5.js"></script>   
    
	<link rel = "stylesheet" href="/styles/table.css"  type = "text/css">
	<%@ page import="easycbs.bancmateib.fundtransfer.actionform.AddpayeeForm"%>
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
     
   </head>
    <%@ include file="/header/headerbar.jsp"%>


<style>
.select-account-table table th {
    font-size: 16px;
    font-family: 'Montserrat';
    font-weight: 600;
}

.select-account-table table td {
    padding: 10px;
    font-size: 16px;
}

.select-account-table table td input[type="radio"] {
    width: 50px !important;
    height: 20px;
}

.select-account-table table td input {
    padding: 3px 5px;
    font-size: 18px;
    border: 1px solid #ccc;
    BORDER-RADIUS: 3PX;
}

.select-account-table .select-account-table-inner {
    overflow-x: scroll;
}

span.Beneficiary-inner-selection {
    width: 100%;
    display: block;
    text-align: center;
}

span.Beneficiary-inner-selection label {
    font-size: 18px;
}

span.Beneficiary-inner-selection label::after {
    content: ':';
    margin-right: 10px;
}

span.Beneficiary-inner-selection input {
    width: 250px;
    height: 45px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    padding: 10px;
    font-size: 26px;
    font-weight: 600;
    letter-spacing: 20px;
}


</style>

  	<body>
		<html:form action="/TransactionAction.do">
     
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
                              <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a>
							                                >
                              <a href="/addPayee/addManagePayee.jsp">Add & Manage  Beneficiary</a>
                              >                              
                              <strong>
                                 De-Active Beneficiary
                              </strong>
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
      <!-- header-end -->


      <section class="PAYMENTS-TRANSFER-main  funds-tra my-5">
         <div class="container">
            <div class="payments-and-transfer-inner add-benifacriye">
               <div class="row">
                  <div class="pay-heading">
                     <h2>
                        <img src="/styles/images/add-user-account-icon 1.png" alt="" class="open-ifsc-box">
                        De-Active Beneficiary   
                     </h2>
                  </div>
                  <div class="select-account-table">
                  <div class="select-account-table-inner">
                    <table style='font-family:"Courier New", Courier, monospace; font-size:80%' ...>
                        <tr>
						         <th style='color: #092771'>S No</th>
                           <th style='color: #092771'>Beneficiary Nick Name</th>
							      <th style='color: #092771'> Beneficiary Mobile Number</th>
                           <th style='color: #092771'>Account No.</th>
                           <th style='color: #092771'>IFSC Code</th>
							      <th style='color: #092771'>Own/Other bank</th>
							      <th style='color: #092771'>Beneficiary Name</th>							
                           <th style='color: #092771'>Account Type</th>    
                           <th style='color: #092771'>Beneficiary Email</th>                      
                           <th style='color: #092771'>Beneficiary Limit</th>
                        </tr>
                        <tr>
                              <%
                           if (fundinfo != null )
                           {
                              for(int i=0;i<fundinfo.length;i++) {
                                 if(fundinfo[i][4].equals("S"))
                                    fundinfo[i][4]="Same Bank";
                                 else if(fundinfo[i][4].equals("O"))
                                 fundinfo[i][4]="Other Bank";
                              }
                           for(int i=0;i<fundinfo.length;i++){%>
                           <tr>
                              <td><input style="background-color:#BFBFBF; width:12px; " name="sOut_req" type="radio" value="screen"  name="1" onclick="setUserId('<%=fundinfo[i][7]%>')" ></td>
                              <td><input  readonly name="sNickName<%=fundinfo[i][7]%>" id="sNickName" value="<%=fundinfo[i][0]%>"></td>
                              <td><input readonly name="mob<%=fundinfo[i][7]%>" id="mob" value="<%=fundinfo[i][1]%>"></td>
                              <td><input readonly sname="sPayeeAcc<%=fundinfo[i][7]%>" id="sPayeeAcc" value="<%=fundinfo[i][2]%>"></td>
                              <td><input readonly  name="IFSCcode<%=fundinfo[i][7]%>" id="IFSCcode" value="<%=fundinfo[i][3]%>"></td>
                              <td><input readonly name="select<%=fundinfo[i][7]%>" id="select" value="<%=fundinfo[i][4]%>"></td>
                              <td><input readonly name="payeeName<%=fundinfo[i][7]%>" id="payeeName" value="<%=fundinfo[i][5]%>"></td>
                              <td><input readonly  name="sAccountType<%=fundinfo[i][7]%>" id="sAccountType" value="<%=fundinfo[i][6]%>">

                              <td><input readonly name="payeeName<%=fundinfo[i][7]%>" id="payeeEmail" value="<%=fundinfo[i][8]%>"></td>
                              <td><input  readonly name="sAccountType<%=fundinfo[i][7]%>" id="payeeLimit" value="<%=fundinfo[i][9]%>"> </td>



                              <input type ="hidden" name="fundkid" id="fundkid" >
                              <input type ="hidden" name="sessionID" id="sessionID" value="" >
                              <input type ="hidden" name="sessionID" id="sessionID" value="" >
                              <input type="hidden" id="mob" size="20" readonly="true" value="<%=mob%>"/>
                              <td>
                              </td>
                           
						      </tr>
						<%}}%>
                        </tr>
                    </table>

                    </div>
					 <%-- <div class="procced-button">
                    <button type="button" onClick="otp_number()"><img src="/styles/images/next 2.png" alt=""> Get OTP</button>
                </div>
                  <span class="Beneficiary-inner-selection">
                        <label for="">
                                 Enter Otp
                        </label>
                        <input type="text" name="otp" id="otp">
                  </span> --%>
				      <div class="procced-button">
                     <button type="button" class="btn btn-danger" onClick="deActiveBenificiary()">
                        Delete Beneficiary 
                     </button>
                  </div>
				  


      <section class="back-home-button">
         <div class="container">
            <div class="inner-back-home">
               <button> <a href="/dashBoard/dashboard.jsp"> BACK</a></button>
               <button> <a href="/dashBoard/dashboard.jsp">HOME</a></button>
            </div>
         </div>
      </section>








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