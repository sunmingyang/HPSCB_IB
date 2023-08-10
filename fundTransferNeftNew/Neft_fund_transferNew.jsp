<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.text.*" %>

<%@ include file="/common/Include.jsp"%>
<link rel="stylesheet" href="/styles/table.css" type="text/css" />
<script language="JavaScript" src="/fundtransfer/scripts/neft.js"></script>
<script language="JavaScript" src="/scripts/MD5.js"></script>



<%
	String accountList="" ; 
	String [] accListArr= null ; 
	String  mobileNo="";
	String sessionId="";
	String pattern = "dd/MM/yyyy";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	String dateToday = simpleDateFormat.format(new Date());
	String customerId="";
	
	if (session.getAttribute("allAccountlist") != null ) { 
	
	   accountList=(String)session.getAttribute("allAccountlist"); 
	   System.out.println("FundAccountList-------- New NEFT Page --------"+accountList);
	   accListArr =accountList.split(",");
	  
	   sessionId= (String) session.getAttribute("sessionId");
	   
	    System.out.println("Session id is ------"+sessionId);
	   
	} 
String ChargeAmt=".00";
if (session.getAttribute("neftCharge") != null ) { 
	   ChargeAmt=(String)session.getAttribute("neftCharge");
	   System.out.println("neftCharge--------  New NEFT Page --------"+ChargeAmt);
	}
String userInFo[][]=null;
if (session.getAttribute("userInfo") != null ) { 
	   userInFo=(String[][])session.getAttribute("userInfo");
      System.out.println("userInFo------ New NEFT Page ----------"+userInFo[0][1]);
	   System.out.println("userInFo------ New NEFT Page ----------"+userInFo[0][2]);
      System.out.println("userInFo------ New NEFT Page ----------"+userInFo[0][3]);
      System.out.println("userInFo------ New NEFT Page ----------"+userInFo[0][4]);
      System.out.println("userInFo------ New NEFT Page ----------"+userInFo[0][5]);
      System.out.println("userInFo------ New NEFT Page ----------"+userInFo[0][6]);   
	   System.out.println("userInFo-------- New NEFT Page --------"+userInFo[0][7]);
      System.out.println("user info is :::::::::::::: -->"+userInFo[0][8]);
      
      customerId=userInFo[0][8];
	}

 int errorcount=0;
	String usrName = "";
	 String AccINFO[][] = (String[][])session.getAttribute("AccINFO"); 
    
	 System.out.println(" account information are ==================: -  "+ AccINFO[0][1] ); 
    System.out.println(" account information are ==================: -  "+ AccINFO[0][0] ); 
     

	 mobileNo= (String)session.getAttribute("customerMobile"); 
	  System.out.println("mobileNo------- New NEFT Page ---------"+mobileNo);
	  
	 
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
	System.out.println("usrName is-------- New NEFT Page ----------"+usrName);
	
	
	String login_id="";
	if(session.getAttribute("userid")!=null){
		login_id = (String)session.getAttribute("userid");
	}
	String openFor = "",sMode = "";
	if(request.getParameter("neftopenFor")!=null){
    openFor=(String)request.getParameter("neftopenFor");
	//System.out.println("neftopenFor------- New NEFT Page ---------"+openFor);
            }
	if(request.getParameter("sMode")!=null){
    sMode=(String)request.getParameter("sMode");
	//System.out.println("sMode-------- New NEFT Page --------"+sMode); 
            }

String sPendingListJson=(String)session.getAttribute("sVoucherData");
String aPendingListarr[][] =(String[][])session.getAttribute("aVoucherData");
session.removeAttribute("sVoucherData");
session.removeAttribute("aVoucherData");

String custRole=(String)session.getAttribute("custRole");
String custName = (String)session.getAttribute("custName");


/*code for-import data of payee start  */
      String fundinfo[][] = null ;
      if(request.getParameter("mode")!=null && request.getParameter("mode").equals("S"))
         fundinfo = (String[][])session.getAttribute("FUNDINFO_S");   
      else if(request.getParameter("mode")!=null && request.getParameter("mode").equals("O"))
         fundinfo = (String[][])session.getAttribute("FUNDINFO_O");   
      else 
	      fundinfo = (String[][])session.getAttribute("FUNDINFO");  
       
            
            String jsonAry="" ;            
				Gson gson = new Gson() ;
				jsonAry = gson.toJson(fundinfo);
				System.out.println("json response "+jsonAry);   


/* code for-import data of payee close  */

String  date=DateTimeFunction.getIbDateTime();
		String time[]=date.split(" ")[1].split(":");
		date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);



%>

<script> 
var userid='<%=login_id%>';

function isNumberKey(evt) {

  var charCode = (evt.which) ? evt.which : evt.keyCode;  
  if (charCode > 31 && (charCode < 48 || charCode > 57))
    return false;
  return true;
}
var mob='<%=mobileNo%>';

function otp_number(){
		var id= document.getElementById("accNo").innerText;
	//	var mob=document.getElementById("mob").value;
		var drCr='C'
		var ran=parseInt(Math.random()*9999);
		var DebitAccount= document.getElementById("accNo").innerText;	
		var amount=document.getElementById("amount").value;
		
		var url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+id+"&mobile="+mob+"&sessionID=12" +"&ran="+ran+"&DrCr="+drCr+"&DebitAccount="+DebitAccount+"&purpose=Fund Transfer"+"&amount="+amount+"&txnType=Neft";
		//alert(url)
		
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
					var jsonData = JSON.parse(resArray)
//alert("jsonDAta")
if(jsonData.authorise=="failure")
{
alert(jsonData.errorMsg)
//jQuery(".OTP-confirm-popup").toggleClass("d-none");
//jQuery(".detail-confirm-popup").toggleClass("d-none");  
  	
}
else{
	
	                 if(jsonData.responseCode=='8'||jsonData.responseCode=='10')
	                	 {
	 					document.getElementById("authStatus").value='T' 
	 						alert("Trasaction is pending for authentication");
	 					
	 					
	                	 }


					//document.getElementById("srvrStatus").innerText( "Dear Customer your OTP has been sent on Mobile: " ); 
					alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
				}
					
				}
			}
	}


</script>
<script>
var mytotalJsonString = '' ;
	     var jspOpenFor='<%=sMode%>'; // capital O
		var jspopenFor = '<%=openFor%>';  
		var custrole = '<%=custRole%>';  
		 var brnchcode = '<%=userInFo[0][1]%>'; 
		 var custname = '<%=custName%>'; 
         //alert("NEFT Mode For:::"+custname);

</script>

<script>
   var aNo;
   function isNumberKey(evt) {

  var charCode = (evt.which) ? evt.which : evt.keyCode;  
  if (charCode > 31 && (charCode < 48 || charCode > 57))
    return false;
  return true;
}
	function radioClick(accountNo) {	
     // alert("Radio click is called");
	   aNo = accountNo;//.slice(6);
	   demo.innerHTML = aNo;
      savingAjax();		
	}

   function defaultSelectedValue(){
    // alert("defaultSelectedValue is called");
     var e = document.getElementById("accList").value;
     //alert("defalut selected acc : " + e);
	   aNo = e;//.slice(6);
	   // demo.innerHTML = e;
      savingAjax(); 
     //fetchPayeeDataForOtherBankTransfer();
   }

   function savingAjax(){
	   var ran=parseInt(Math.random()*9999);
      var URL ="/AccountInfoAction.do?action=fetchCustomerAccounts&custID=<%=customerId%>&ran="+ran; 
	   http.open("POST",URL,false);
		http.onreadystatechange= function (){processAccount()};
		http.send(null);
	}

   function processAccount()
	{
      if((http.readyState == 4) && (http.status == 200)){
		   var resArray=http.responseText;
         var jsonData = JSON.parse(resArray);

         for (var i = 0; i < jsonData.accountInformation.length; i++) {
            counter = jsonData.accountInformation[i];
            if(counter.accountType=="S" && counter.accountNo == aNo ){                             	                             
               document.getElementById("accNo").innerHTML = counter.accountNo;
               document.getElementById("accType").innerHTML = "Savings Account";
               document.getElementById("balance").innerHTML = counter.clearBalance;
               document.getElementById("branchName").innerHTML = counter.address;
               break;				
            }
            if(counter.accountType=="C" && counter.accountNo == aNo){			
               document.getElementById("accNo").innerHTML = counter.accountNo;
               document.getElementById("accType").innerHTML = "Current Account";
               document.getElementById("balance").innerHTML = counter.clearBalance;					
               document.getElementById("branchName").innerHTML = counter.address;					
            }
             if(counter.accountType=="D" && counter.accountNo == aNo ){                             	                             
               document.getElementById("accNo").innerHTML = counter.accountNo;
               document.getElementById("accType").innerHTML = "Savings Account";
               document.getElementById("balance").innerHTML = counter.clearBalance;
               document.getElementById("branchName").innerHTML = counter.address;
               break;				
            }
            if(counter.accountType=="A" && counter.accountNo == aNo){			
               document.getElementById("accNo").innerHTML = counter.accountNo;
               document.getElementById("accType").innerHTML = "Current Account";
               document.getElementById("balance").innerHTML = counter.clearBalance;					
               document.getElementById("branchName").innerHTML = counter.address;					
            }
            
         }
      }
      
   }

   function getPayeeDetail(sNickName){

   debugger;

   alert("hiiisds");
      //var nickName = sNickName.substring(0, 15);
       //var nickName = sNickName.split("~");
      var payeeDetails =  sNickName;
      //alert(payeeDetails);
      const payeeData = payeeDetails.split("~");      
      //adi~8800209949~023501505189~SBIN0032658~O~Adarsh12~151298~151298
      document.getElementById("payeeAccNo").innerHTML = payeeData[2] ;
      document.getElementById("racNo").innerHTML = payeeData[2] ;
      document.getElementById("beneficiaryHName").innerHTML = payeeData[5] ;
      document.getElementById("beneMobile").innerHTML =  payeeData[1] ;
      document.getElementById("rIFSC1").innerHTML =  payeeData[3] ;     
      document.getElementById("sAccountType").innerHTML = payeeData[6];

   }
function showMessage(isSch){
	if (http.readyState == 4){
		//Check that a successful server response was received
		if (http.status == 200){
			var resArray=http.responseText;
			var data="";
			if( resArray.includes("~"))
			{
			data=resArray.split("~");
			}else
			{   if( resArray.length>=0 &&  resArray.length<=20){
				data=resArray.substr(1,20);
				}
				else 
					data=resArray.substr(1,20);
				}
			var jsonData = JSON.parse(data[0]);
			if ((jsonData.result=="failure")&&(jsonData.Error=="OTP Mismatch")){
				//alert("Dear Customer your Transaction has been "+jsonData.result + " due to " + jsonData.Error);
				alert("Dear Customer your Transaction is failed");
				document.getElementById("secMsg").style.backgroundColor = 'red';
				document.getElementById("htr").innerText= "Transaction Failed"; 
				
			//	document.getElementById("otp").value="";
				//document.getElementById("otp").focus();

				jQuery(".OTP-confirm-popup").toggleClass("show");  
				if( retryOtpCount >= 0  ) 
				{
					retryOtpCount--;
				}
				else 
				jQuery(".OTP-confirm-popup").toggleClass("show");  	
				return false;
				}
				else if(isSch=="Y" && jsonData.result=="success") {
					//alert("Transaction scheduled successfully");
					document.getElementById("tID").innerText= "Transaction processed successfully"+jsonData.mobileNo ; 
				}
				else{
					// alert("Dear Customer your Transaction has been "+jsonData.result +" and Transaction Id: "+jsonData.transactionID);
					document.getElementById("tID").innerText= "Dear Customer your Transaction has been "+jsonData.result +" and Transaction Id: "			+jsonData.transactionID; 	
		   document.getElementById("tAc2").innerHTML=document.getElementById("racNo").innerText;				
					document.getElementById("txnUtrRef").innerText= jsonData.transactionID; 
				}
				//window.location.href = "/fundTransferNeftNew/fund_Transfer.jsp" 
			}
			else{
				//alert("HTTP error: " + http.status);
			}
		}
	}


	function callfundTrRetailWithInBank(date, custId, mobNo, userid , otp , trtype, remark , frmAc, toAc, amount , periodicity , benName,beneMobile,rIFSC1)     
		  {
			var payeemob = beneMobile;
			var chkFav = false;
			var beneficiaryAccNo= frmAc;
			//old
			var userid="<%=login_id%>" ;  		
			var trType="O";
			var periodicity="-1";		
			var purpose="NEFT";
			var isSch="N";		
			var acc=toAc;		
			var mode="O";
			var	scDate=date;	
			
			 /*var url="/request/DDRequest.do?action=SaveNeftRtgsData&userId="+userid+"&accountNo="+remiAccount+"&purpose="+purpose+"&sMode="+jspOpenFor+"&openFor="+jspopenFor+"&JSONString="+jsonStr+"&txnpass="+sPwd+"&schDate="+scDate;   
			 */
			 
			 /*var url="/request/DDRequest.do?action=SaveNeftRtgsData&userId="+userid+"&accountNo="+beneficiaryAccNo+"&purpose="+purpose+"&sMode="+jspOpenFor+"&openFor="+jspopenFor+"&JSONString="+jsonStr+"&txnpass="+sPwd+"&schDate="+scDate;   
			var url="/TransactionAction.do?action=fundTransferOtherBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessssionID=12&mode=O&isSch="+isSch+"&schDate="+scDate+"&trnType="+trType+"&periodicity="+periodicity+"&Remark="+remark+"&benName=" +benName+"&custID="+custId+"&payeemob="+payeemob+"&chkFav=0&ftrnwith="+"&custName=<%=custName%>&mmid=123456
			"+"&beneMobile="+payeemob+"&remiMobile="+payeemob+"&IFSCcode="+rIFSC1+"";
			*/
	//	alert(url);
		console.log(url);
		http.open("POST",url,false);
		var returVal= 0;
		http.onreadystatechange= function (){ returVal =showMessage(isSch); };
		http.send(null);  
		
	  }

	  alert("neft");
</script>


   <head>
    
      <%-- <link rel="stylesheet" href="/allNewCSS/custom.css"> --%>

     
   </head>
    <%@ include file="/header/headerbar.jsp"%>
    <jsp:include page="/dashBoard/dashboardNew.jsp" />
   <body onload="defaultSelectedValue()">

   <html:form action="/request/DDRequest">

     
     <!--  <section class="brad-log-time">
         <div class="inner-brad-log">
            <div class="container">
               <div class="row">
                  <div class="col-md-8">
                     <div class="bradcums">
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
                     </div>
                  </div>
                  <div class="col-md-4">
                     <div class="log-time">
                        <span class="time">
                          <%= (new java.util.Date()).toLocaleString()%>
                        </span>
                        <span>
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
      </section> -->

       <div class="breadcrumb-container">
    <div class="row">
        <div class="col">
            <div class="breadcrumb">
                <div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
                <div class="breadcrumb-item">  <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a></div>
                
                <div class="breadcrumb-item"><a>Fund Transfer With Neft </a></div>
            </div>
        </div>
    </div>
</div>
      <!-- header-end -->
      <section class="PAYMENTS-TRANSFER-main  funds-tra ">  
         <div class="container-fluid">
         
				<input type="hidden" name="trnType" id="trnType" value="neft" onclick="selectValue()" />
				
            <div class="payments-and-transfer-inner">
               <div class="row">

               

                  <div class="pay-heading">
                     <h6>
                        <img style="width: 20px" src="/styles/images/desktop-bank-transfer-icon 1.png" alt="">
                         Funds Transfer(Other Bank)
                     </h6>  
                  </div>

                  <div class="chosse-an-account">
                   
                  

                    <div class="   d-flex justify-content-center my-0  col-md-12 p-2">
                    	<div class="col-md-6 p-2"> <h6>Select the account from which you wish to transfer funds</h6></div> 
                    	 <div class="col-md-4" > <select property="sAccountType" id="accList" name="sUsrList1" list="AccountNoList" listkey="custId" class="form-select" listValue="accountNo" onchange="radioClick(this.value)" />
                        <%if (accListArr != null) { %>       
						
					            <% for(int i=0;i<accListArr.length;i++){
                                 if(i == 0){   
                           %>                               
                                 <option Selected value='<%=accListArr[i]%>'><%=accListArr[i]%></option>   
                                 <%
                                    continue;
                                 }%>          
                                          
                              <option value='<%=accListArr[i]%>'><%=accListArr[i]%></option>
						<%}}%> 
                     </select></div>
                         
                    </div>

                    
                  
                   </div>

             <!--    <div class="Selected-Account-Number">
                    <strong>Selected Account Number:  </strong>
                    <span id="demo"></span>
                </div> -->

                <div class="select-account-table">
                    <table>
                        <tr>
                            <th>Account No. / Nick Name</th>
                            <th>Account Type</th>
                            <th>HPSCB Branch</th>
                            <th>Balance</th>
                        </tr>
                        <tr>
                           <td id="accNo"></td>
                           <td id="accType"></td>
                           <td id="branchName"></td>
                           <td id="balance"></td>
                        </tr>
                    </table>
                </div>
    
                <div class="amount-selection-main-sec" style="width: 98%">  

                    <div class="amount-sec">
                        <span class="amt-inner">
                            <label for="">Amount*</label>
                            <%-- <input type="text"> --%>
                            <input type="text" id="amount" size="20" maxlength="15" value=".00" onpaste="return false;" ondrop="return false;" autocomplete="off"  pattern="[0-9]+" maxlength=15 onkeypress="return isNumberKey(event)" />
                        </span>

                        <span class="amt-inner">
                            <label for="">Purpose*</label>
                            <%-- <input type="text"> --%>
                            <input type="text" id="remark" />
                        </span>
						
						
<span class="amt-inner">
 <label for="">Transfer Date</label>
 <input type="text" id="schDate" 	readOnly maxlength="10" placeholder="dd/mm/yyyy" 	value="<%=dateToday%>" /> <b>												
												 </b></span>
</span>

                       
                        <a href="/addPayee/addManagePayee.jsp">
                           <h6> Click here to add a new Other Bank Beneficiary / Change Limit</h6>
                        </a>

                    </div>

                    <div class="select-the-benificery-account d-flex">
                        <div class="chosse-an-account">
                            <select name="sNickName" id="sNickName" class="form-select" onchange="getPayeeDetail(this.value)">
                              <option value="-1">Select the Beneficiary Name</option>
                              
                              <%
										   if (fundinfo != null) {
											   for(int i=0;i<fundinfo.length;i++) {											    
                                     String value=fundinfo[i][0]+"~"+fundinfo[i][1]+"~"+fundinfo[i][2]+"~"+fundinfo[i][3]+"~"+fundinfo[i][4]+"~"+fundinfo[i][5]+"~"+fundinfo[i][6]+"~"+fundinfo[i][7];
									   %>
												<option value='<%=value%>'> <%=fundinfo[i][0]%> </option>                                    
										<%}}%>
                            </select>
                        </div>
                    </div>

                    <div class="Selected-Account-Number  d-flex">
                        <h6>Selected Account Number:  </h6>
                        <span id="payeeAccNo"><h6>Select Above</h6></span>
                    </div>

                    <div class="select-account-table">
                        <table>
                            <tr>
                                <th>Account No</th>
                                <th>Beneficiary Name</th>
                                <th>Mobile No</th>
                                <th>IFSC Code</th>
                                <!--<th>Limit</th>-->
                            </tr>
                            <tr>
                                <td style="display:none;" id="sAccountType" >----</td>
                                <%-- <input type="hidden" maxlength="35" value="" size="40" id="sAccountType" /> --%>
                                <td id="racNo" ></td>
                                <td id="beneficiaryHName" ></td>
                                <td id="beneMobile" ></td>
                                <td id="rIFSC1" ></td>
                               <!-- <td id="transLimit" >50000.00</td>-->
                            </tr>
                        </table>
                    </div>


                 

                    <div class="note-plz">
                        <p  style="font-size: 12px">
                            Please note, Beneficiary Account Number and IFSC information will ONLY be used for Electronic Fund Transfer (please ensure correctness), the Beneficiary Name provided will not be considered for Electronic Fund Transfer as per RBI guidelines.
                        </p>
                    </div>

                    <div class="accept-term-con">
                        <input type="hidden" name="" id="" value="true">
                                                <input type="hidden" name="" id="" value="true">
                    
                        <!-- I accept the <a href="">Terms and Conditions</a> -->
                    </div>

                    <div class="buttons">
                        <button type="button" name="ok" value="SUBMIT" id="ok" class="submit-button  btn-sm"><img src="/styles/images/submit.png" alt=""> SUBMIT</button>
                        
                        <button type="button" ><img src="/styles/images/cancle.png" alt=""> <a style="color: inherit;" href="/dashBoard/dashboard.jsp">CANCEL</a></button>
                    </div>






                    



                </div>
                  
                  </div>
               </div>
            </div>


            <section class="detail-confirm-popup">
                <div class="confirm-inner">
                    <h4>Confirm Your Details</h4>
                    <div class="confi-table">

                        <span class="con-details">
                            <span>Name:</span>
                            <span><%=session.getAttribute("user").toString()%></span>
                        </span>

                        <span class="con-details">
                            <span>From A/C:</span>
                            <span id="fAc" name="fAc"></span>
                        </span>

                        <span class="con-details">
                            <span>To A/C:</span>
                           <span id="tAc" name="tAc"></span> 
                        </span>

                        <span class="con-details">
                            <span>Amount:</span>
                           	<span id="damt" name="damt"></span>
                        </span>
			<span class="con-details">
                            <span>Remark:</span>
                           	<span id="dremark" name="remark"></span>
                        </span>
	
						<span class="con-details">
                            <span>IFSC :</span>
                            <span id="rIFSC11" name="rIFSC1"></span>
                        </span>
                        <span class="con-details">
                            <span>Transaction Type:</span>
                            <span>Other Bank</span>
                        </span>
                        
                    </div>
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="confirm-btn"><img src="/styles/images/next 2.png" alt=""> Confirm</button>
                        <button type="button" class="edit-btn"><img src="/styles/images/edit.png" alt=""> Edit</button>
                    </div>
                </div>
            </section>

            <div id="otpConfirm"
            <section class="OTP-confirm-popup" >
                <div class="confirm-inner">
                    <h2>
                        <img src="/styles/images/padlock-black-icon 1.png" alt="">
                        OTP Verification</h2>
                        
                        <span class="sent">
                            OTP sent on mobile no 
                            <!-- a href="">Change</a -->
                        </span>
                        <span class="otp-inputs">
                            <input type="text" id="otp" value="" type="text" onpaste="return false;" ondrop="return false;" autocomplete="off"  pattern="[0-9]+" maxlength=6 onkeypress="return isNumberKey(event)">
                           
                        </span>

                        <div class="btnGroup otp-count-down">
                            <span class="Btn" id="verifiBtn">
                              <input type ="hidden" type="submit" onClick="resendOtp();"></input>
							  
                            </span>
                            <span class="timer">
                              <span id="counter"></span>
                            </span>
                          </div>
                    
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="AUTHENTICATE" ><img src="/styles/images/auth.png" > Authenticate</button>
						<button type="button" onClick="" >Cancel</button>
                    </div>
                </div>
            </section>
			</div>



<section  class="transction-succesfull-popup">
                <div class="confirm-inner">
                    
                    <span class="succesful-msg" id="succesful-msg">
                        <h2 id="htr" name="htr">Transaction Successful</h2>
                        <span class="time">  <%= (new java.util.Date()).toLocaleString()%></span>
	<input type="hidden"  id="srvrStatus">
                    </span>

                    <div class="confi-table">

                        <span class="con-details">
                            <span >Transaction ID:</span>
                             <span id="tID" name="tID"></span>
                        </span>

                        <span class="con-details">
                        <span>Paid To:</span>
                        <span id="tAc2"></span>
                        </span>

                        <span class="con-details">
                        <span>Debit From A/C:</span>
                        <span id="fAc2"></span>
                        </span>

                        <!-- span class="con-details">
                            <span>Bank Name:</span>
                            <span id="bName"><img src="/styles/images/image 20.png" alt="">   </span>
                        </span -->

                        <span class="con-details">
                        <span>Amount:</span>
                        <span id="damt2"></span>
                        </span>

                        <span class="con-details">
                            <span>IFSC Code:</span>
						<span id="rIFSC12" name="rIFSC12"></span>
                        </span>

			<span class="con-details">
                            <span>Transaction Type:</span>
                            <span>Other Bank</span>
                        </span>
                        
                    </div>
                    
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="done" onclick="window.location.href = '/sfmsneft/SaveNeft.do?action=getAccountData'"> DONE</button>                        
                    </div>
                </div>
            </section>



         
      </section>
     <!--  <section class="back-home-button">
         <div class="container">
            <div class="inner-back-home">
               <button> <a href="/dashBoard/dashboard.jsp"> BACK</a></button>
               <button> <a href="/dashBoard/dashboard.jsp">HOME</a></button>
            </div>
         </div>
      </section> -->


      <!-- footer-start -->
      <!--  footer>
        <div class="footer-follow-aria">
            <a href="#">
            <span><i class="fa fa-twitter" aria-hidden="true"></i></i>Follow:  @hpscblofficial</span>
            </a>
         </div>
         <div class="logo-aria-fooetr">
            <div class="container">
               <div class="row">
                  <div class="col-md-2">
                    <a href="/jsp/loginNew.jsp">
                     <img src="/images/logo.png" alt="" width="250">
                     </a>
                  </div>
                  <div class="col-md-10">
                     <!-- p>
                        The Himachal Pradesh State Cooperative Bank Ltd. is an Apex bank of the State of Himachal Pradesh; and is listed as Scheduled Bank with its branches spread across 6 districts of the State and one branch at New Subzi Mandi, New Delhi.
                     </p>
                  </div>
               </div>
            </div> -->
    <%@ include file="/header/footer.jsp"%>
    <!-- =-===================================================== -->
<input type="hidden" style="margin-left:115px;"  Id="charge"  size="20"  maxlength="15" value="<%=ChargeAmt%>" />
<input type="hidden" style="margin-left:115px;"  Id="txnpass"  name="txnpass" size="20"  maxlength="15" value="0" />
 <input type="hidden" style="margin-left: px;" maxlength="35"
					value="<%=login_id%>" size="40" id="userid" />
				<input type="hidden" style="margin-left: px;" maxlength="35"
					value="<%=mobileNo%>" size="40" id="mobileNo" />
				<input type="hidden" style="margin-left: px;" maxlength="35"
					value="<%=sessionId%>" size="40" id="sessionId" />
				<input type="hidden" style="margin-left: px;" maxlength="35"
					value="<%=usrName%>" size="40" id="usrName" />
						<input type="hidden" style="margin-left: px;" maxlength="35"
					value="A" size="40" id="authStatus" />
					


      
   
   </body>
</html>


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
         jQuery(".submit-button").click(function(){  
		 
			var	acNo=document.getElementById("demo").innerText;
			var acNo2 = $('#racNo').val();
			acNo2=document.getElementById("racNo").innerText;
			var aamt = $('#amount').val();
			var aremark = $('#remark').val();	
			var arIFSC= document.getElementById("rIFSC1").innerText;
			console.log ( acNo +"|"+acNo2 +"|"+aamt +"|"+aremark);
			if(  aamt=="" || aamt =="0" || aremark=="") 
			{
			confirm( "Amount or Remark is not specified \r\n  Please fill amount, cannot continue... ");		
			return false;
			}
			else if( acNo2 =="" || acNo =="" || acNo2 === acNo ) 
			{
				confirm( "Account Number Found Same \r\n  Selected From Account and To Account are Same , cannot continue...\r\n Please Re-Select Accounts. ");				
				
				return false;
			}else 
			{				
            jQuery(".detail-confirm-popup").toggleClass("show"); 
			$('#dremark').html(aremark);						
			$('#fAc').html(acNo);
			$('#tAc').html(acNo2);
			$('#damt').html(aamt);			
			$('#rIFSC11').html(arIFSC);
			}	
        
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".edit-btn").click(function(){  		 
         jQuery(".detail-confirm-popup").toggleClass("show");  
         });
         });

			jQuery(document).ready(function(){  
            jQuery(".confirm-btn").click(function(){  
            jQuery(".detail-confirm-popup").toggleClass("show");  
			
            });
            });
         jQuery(document).ready(function(){  
         jQuery(".confirm-btn").click(function(){  
		 jQuery(".detail-confirm-popup").toggleClass("show");  
			otp_number(); 		
         jQuery(".OTP-confirm-popup").toggleClass("show");  
         });
         });
         
         jQuery(document).ready(function(){  
         jQuery(".AUTHENTICATE").click(function(){  
         
		 //(".OTP-confirm-popup").toggleClass("show");  		 
		 
		
		 /*callfundTrRetailWithInBank("<%=DateTimeFunction.getIbDateTime()%>", 
		 "<%=customerId%>", 
		 '<%=mobileNo%>', 
		 "<%=login_id%>", 
			document.getElementById("otp").value ,
		'S', document.getElementById("remark").value  , 
		aNo, 
		document.getElementById("racNo").innerText  , 
		document.getElementById("amount").value   , 
		"-1" ,"<%=session.getAttribute("user").toString()%>",
		 document.getElementById("beneMobile").innerHTML , 
		 document.getElementById("rIFSC1").innerHTML 
		 );
		 */
         /*if ( false == fundTrRetailWithInBank("<%=DateTimeFunction.getIbDateTime()%>")) 
		 {
			 jQuery(".OTP-confirm-popup").toggleClass("show");  
			 Cancel Edit Trnsaction 
			 
		 }
		  */
			 
		 
		 
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".AUTHENTICATE").click(function(){
			saveData();			 
        
			jQuery(".transction-succesfull-popup").toggleClass("show");  
			
			var	acNo=document.getElementById("demo").innerText;
			var acNo2 = $('#racNo').val();
			acNo2=document.getElementById("racNo").innerText;
			var aamt = $('#amount').val();
			var aremark = $('#remark').val();	
			
			var aarIFSC= document.getElementById("rIFSC1").innerText;
			$('#dremark2').html(aremark);						
			$('#fAc2').html(acNo);
			$('#tAc2').html(acNo2);
			$('#damt2').html(aamt);			
			$('#rIFSC12').html(aarIFSC);
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
         
        function selectValue(){
		/*if(document.getElementById("neftrtgs1").checked){
			document.getElementById("neftrtgs1").value="neft"
			//alert(document.getElementById("select1").value);

		}
		else{
			document.getElementById("neftrtgs2").value="rtgs"
			//alert(document.getElementById("select").value)
		}
		*/
	} 
function otp_numberWithInBank(date){
    		var userid=document.getElementById("userid").value ;
    		var sessionId= document.getElementById("sessID").value;
    		var accno= document.getElementById("accnoTd").innerHTML;
    		var  search = document.getElementById("search").value;
    		if(search=='0'){
    			alert("Select From search");
    			document.getElementById("search").focus;
    			return false; 
    		}
    		var  searchVal = document.getElementById("searchVal").value;
    		if(searchVal==""){
    			alert("Plaese enter value of  "+search);
    			document.getElementById("searchVal").focus();
    			return false;
    		}
    		var mobile=document.getElementById("UserMobile").value;
    		var trType=document.getElementById("paymentType").value;
    		var periodicity=document.getElementById("periodicity").value;
    		var scDate=document.getElementById("schDate").value;
    		var scTime_hr=parseInt(document.getElementById("schTime_hr").value);
    		var scTime_min=parseInt(document.getElementById("schTime_min").value);
    		var time=date.split(" ")[1].split(":");
    		var amount=document.getElementById("amount").value;
    		var purpose="Fund Transfer";
    		var isSch=document.getElementById("isSchedule").value;
    		if(trType=="R" && periodicity=="-1"){
    			alert("Select periodicity");
    			document.getElementById("periodicity").focus();
    			return false;
    		}
    		if(isSch=="Y"){
    			if(isValidDateFormat("schDate")==false){
    				alert("Enter valid Schedule date");
    				document.getElementById("schDate").value="";
    				document.getElementById("schDate").focus();
    				return false;
    			}
    			else if((!dateComparision("schDate","tDate") && (document.getElementById("tDate").value==scDate))){
    				alert("Schedule date must be greater than today's date");
    				document.getElementById("schDate").value="";
    				document.getElementById("schDate").focus();
    				return false;
    			}else if(!dateComparision("schDate","tDate") && scTime_hr<parseInt(time[0])){
    				alert("Schedule time must be greater than current time");
    				return false;
    			}
    		}
    		var ran=parseInt(Math.random()*9999);
    		url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+accno+"&mobile="+mobile+"&sessionID="+sessionId+"&purpose="+purpose+"&amount="+amount+"&ran="+ran+"&txnType=Neft";
    		http.open("POST",url,false);
    		http.onreadystatechange= function (){processResOTP()};
    		http.send(null); 
    	}
      </script>
	    </html:form>
   </body>
</html>