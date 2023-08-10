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

	function otp_number(){
			var id=document.getElementById("fundkid").value
		//	var mob=document.getElementById("mob").value;
			var drCr='C'
			var ran=parseInt(Math.random()*9999);
			var url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+id+"&DebitAccount="+id+"&mobile="+mob+"&sessionID=12" +"&ran="+ran+"&DrCr="+drCr+"&purpose=Manage Payee"+"&txnType=confirmPayee";
		//	alert(url)
			http.open("POST",url,false);
		http.onreadystatechange= function (){processResOTP()};
				http.send(null);	
			
		}
		function processResOTP(){
			 if (http.readyState == 4)
				{
					// Check that a successful server response was received
					if (http.status == 200)
					{
						var resArray=http.responseText;
						var jsonData = JSON.parse(resArray);
						alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
					}
				}
		}

	function setUserId(id)
	{
			document.getElementById("fundkid").value=id;
	}

	function otp_confirm()
	{
		var id=document.getElementById("otp").value;
		var id1=document.getElementById("fundkid").value
       	if(id=="")
		{
		   alert("OTP is Blank \r\n 	Please enter OTP value.");
		   return false;
		}
		else if(id1=="")
		{
		   alert("No Payee selected for confirmation \r\n Please select a Payee to confirm.");
		   return false;
		}		
		var url="/TransactionAction.do?action=otpVerify&otp="+id+"&userID="+userid+"&beneficiaryAccNo="+id1;
		//document.forms[0].submit();
		http.open("POST",url,false);
		http.onreadystatechange= function (){processRes()};
		http.send(null);
	}
	function processRes(){
     if (http.readyState == 4)
				{
					// Check that a successful server response was received
					if (http.status == 200)
					{
						var resArray=http.responseText;
						var jsonData = JSON.parse(resArray);
						if (jsonData.result=="failure" ) { 
							confirm("Dear Customer , \r\nPayee confirmation has failed. \r\n Payee has not been confirmed due to wrong OTP. Please check the latest OTP.");
						}else {
							alert("Dear Customer ,Congratulations , \r\n Payee has been confirmed successfully. \n\n Now you can transfer funds to the confirmed Payee. ");
						}
						window.location.href="/fundtransfer/fund.do?action=fetchPayee&paramLogin=N";
					}
				}
	}

   alert("benificary");
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
    font-size: 12px;
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
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body>
		<html:form action="/TransactionAction.do">
   
      <div class="breadcrumb-container">
         <div class="row">
             <div class="col">
                 <div class="breadcrumb">
                     <div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
                     <div class="breadcrumb-item">    <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a></div>
                     <div class="breadcrumb-item"><a href="/addPayee/addManagePayee.jsp">Manage  Beneficiary</a></div>
                     
                     <div class="breadcrumb-item"><a> Confirm Beneficiary </a></div>
                 </div>
             </div>
         </div>
     </div>
      <!-- header-end -->


      <section class="PAYMENTS-TRANSFER-main  funds-tra ">
         <div class="container-fluid">
            <div class="payments-and-transfer-inner add-benifacriye">
               <div class="row">
                 
                  <div class="pay-heading">
                     <h6>
                        <img style="width: 20px"  src="/styles/images/add-user-account-icon 1.png" alt="" class="open-ifsc-box">
                        Confirm Beneficiary
                     </h6>  
                  </div>

                  <div class="select-account-table">
                  <div class="select-account-table-inner">
                    <table>
                        <tr>
						<th style='color: #092771'>S No</th>
                           <th style='color: #092771'>Beneficiary Nick Name</th>
							 <th style='color: #092771'> Beneficiary Mobile Num.</th>
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
					   <!-- <div class="procced-button">
                    <button type="button" onClick="otp_number()"><img src="/styles/images/next 2.png" alt=""> Get OTP</button>
                </div>
				  <span class="Beneficiary-inner-selection">
				   <label for="">
                        Enter Otp
                     </label>
				<input type="text" name="otp" id="otp">
				</span>
				 <div class="procced-button">
                    <button type="button" onClick="otp_confirm()"><img src="/styles/images/next 2.png" alt=""> Confirm OTP</button>
                </div> -->

                <div class="d-flex justify-content-center">
                  <div class="procced-button shadow-sm">
                      <button type="button" class="btn btn-primary" onclick="otp_number()">
                          <img src="/styles/images/next 2.png" alt="Next">
                          Get OTP
                      </button>
                  </div>
              </div>
              
            
              <span class="Beneficiary-inner-selection d-flex justify-content-center mt-3">
				   <label for="">
                        Enter Otp
                     </label>
				<input type="text" name="otp" id="otp">
				</span>
              
              <div class="d-flex justify-content-center mt-3">
                  <div class="procced-button shadow-sm">
                      <button type="button" class="btn btn-primary" onclick="otp_confirm()">
                          <img src="/styles/images/next 2.png" alt="Next">
                          Confirm OTP
                      </button>
                  </div>
              </div>
              
              


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