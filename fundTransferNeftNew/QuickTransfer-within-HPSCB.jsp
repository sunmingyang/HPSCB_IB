<!DOCTYPE html>
<%@ page import="java.text.*" %>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>
<%@ page import="java.text.*" %>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>
<%@ include file="/common/Include.jsp"%>


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
    //String value=fundinfo[i][0]+"~"+fundinfo[i][1]+"~"+fundinfo[i][2]+"~"+fundinfo[i][3]+"~"+fundinfo[i][4]+"~"+fundinfo[i][5]+"~"+fundinfo[i][6]+"~"+fundinfo[i][7];

      
	      fundinfo = (String[][])session.getAttribute("PayeeINFO");  
         
               //  System.out.println("fundInfo 10" + fundinfo[0][10]);
                 
            
           /*  String jsonAry="" ;            
				Gson gson = new Gson() ;
				jsonAry = gson.toJson(fundinfo);
				System.out.println("json response "+jsonAry);    */


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
		var drCr='D'
		var ran=parseInt(Math.random()*9999);
			var DebitAccount= document.getElementById("accNo").innerText;	
		var url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+id+"&mobile="+mob+"&sessionID=12" +"&ran="+ran+"&DrCr="+drCr+"&DebitAccount="+DebitAccount+"&purpose=Fund Transfer";
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
					var jsonData = JSON.parse(resArray);					
					//document.getElementById("srvrStatus").innerText( "Dear Customer your OTP has been sent on Mobile: " ); 
					alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
					
				}
			}
	}


		 var mytotalJsonString = '' ;
	     var jspOpenFor='<%=sMode%>'; // capital O
		 var jspopenFor = '<%=openFor%>';  
		 var custrole = '<%=custRole%>';  
		 var brnchcode = '<%=userInFo[0][1]%>'; 
		 var custname = '<%=custName%>'; 
         //alert("NEFT Mode For:::"+custname);

</script>
<script>


    function fetchAccTypeNew(){    
        //alert("fetchAccTypeNew is calling"); 
		//console.log(document.getElementById("racNo").value);
		 
		 
		// if(document.getElementById("selectList").value== "O"){
        //    // document.getElementById("ifsc").style.display="block";				 
		// 	//	return ; 
		// }

        if(document.getElementById("racNo").value == "" || document.getElementById("confirmPayeeAccNo").value == ""){
            alert("Please enter account no");
            return false;
        }
        
        if(document.getElementById("racNo").value == "" || document.getElementById("confirmPayeeAccNo").value == ""){
            alert("Account no not same");
            return false;
        }

        if(document.getElementById("racNo").value=="" ||   ( document.getElementById("racNo").value.length<5 && 
        document.getElementById ("racNo").value.length>16))
		{
			alert("1 please enter account number in correct format");
			    return false;
		}
		else{
				
			if(document.getElementById("racNo").value!="" && !( document.getElementById("racNo").value.length>5 
			        && document.getElementById("racNo").value.length<=16)  )
			{
			    alert("2 please enter account number in correct format");
				return false;
			}
        }
			
		 				   
				if(document.getElementById("racNo").value!="" && ( document.getElementById("racNo").value.length>5 
			         && document.getElementById("racNo").value.length<=16) )
			   {				   
                        var accno=document.getElementById("racNo").value;
                        var url="/fundtransfer/fund.do?action=ownAccPayee&fetchAccType=true&accountno="+accno;
                        http.open("post",url,false);
                        http.onreadystatechange= function (){
                            var res=http.responseText;
                            console.log( res);
                            var json=JSON.parse(res);
                            //alert(json)
                            console.log( json);				 
                            const array = json.split('~');
                            // alert(array[0]);
                            if(json==""){ 
                                alert("No type found for Account number:"+accno);
                            //  document.getElementBy("racNo").focus();
                            }
                            else if(json=="--") {
                                alert("Account is closed Cannot Be add as a payee");
                                document.getElementById("racNo").value="";
                                document.getElementById("racNo").focus();
                                return false ;
                            }
                            else
                            
                                // var selectedValue = response.selectedValue;

                                // Step 3: Set the selected value of the dropdown
                                var dropdown = document.getElementById('sAccountType');
                                console.log(array[1]);
                                document.getElementById('payeeName').value=array[1];
                                dropdown.value = array[0];
                                goForSaving=true;
                                document.getElementById('beneMobile').value=array[2];
                        
                            };
                        http.send(null);
			   }
			}
	
		 
		 



</script>

<script>
   var aNo;
   var retryOtpCount=3;
   
	function radioClick(accountNo) {	
     // alert("Radio click is called");
	   aNo = accountNo;//.slice(6);
	   demo.innerHTML = aNo;
      savingAjax();		
	}

   function defaultSelectedValue(){
    // alert("defaultSelectedValue is called");
     var e = document.getElementById("fromAccount").value;
     //alert("defalut selected acc : " + e);
	   aNo = e;//.slice(6);
	   demo.innerHTML = e;
      savingAjax(); 
    // fetchPayeeDataForOtherBankTransfer();
   }

   function savingAjax(){
	   var ran=parseInt(Math.random()*9999);
      var URL ="/AccountInfoAction.do?action=fetchCustomerAccounts&custID="+<%=userInFo[0][8]%>+"&ran="+ran; 
	   http.open("POST",URL,false);
		http.onreadystatechange= function (){processAccount()};
		http.send(null);
	}

   function processAccount()
	{
      if((http.readyState == 4) && (http.status == 200)){
		   var resArray=http.responseText;
         var jsonData = JSON.parse(resArray);
//	console.log(counter.accountType + ":" + jsonData.accountInformation.length );
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
         }
      }
      
   }

   function getPayeeDetail(sNickName){
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
      // document.getElementById("rIFSC1").innerHTML =  payeeData[3] ;     
      document.getElementById("sAccountType").innerHTML = payeeData[6];
      document.getElementById("beneLimt").innerHTML = payeeData[8];

   }
   
	function callfundTrRetailWithInBank(date, custId, mobNo, userid , otp , trtype, remark , frmAc, toAc, amount , periodicity , benName,beneMobile)     
      {
		var payeemob = beneMobile;
		var chkFav = false;
		var beneficiaryAccNo= frmAc;
		//old
		var userid="<%=login_id%>" ;  		
		var trType="O";
		var periodicity="-1";		
		var purpose="Fund Transfer";
		var isSch="N";		
		var acc=toAc;		
		var mode="S";
		var	scDate=date;		
		var url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID=12&sMode=SingleTran&isSch="+isSch+"&schDate="+scDate+"&trnType="+trType+"&periodicity="+periodicity+"&Remark="+remark+"&benName=" +benName+"&custID="+custId+"&payeemob="+payeemob+"&chkFav="+chkFav+"&ftrnwith=";
	//	alert(url);
		console.log(url);
		http.open("POST",url,false);
		var returVal= 0;
		http.onreadystatechange= function (){ returVal =showMessage(isSch); };
		http.send(null);  
		
	  }
   
   function fundTrRetailWithInBank(date)  {  	  
		var remark =document.getElementById("remark").value;
		var  benName = document.getElementById("beneficiaryHName").innerText;
		var payeemob = document.getElementById("beneMobile").innerHTML;
		var chkFav = "false";
		var  custId = '<%=customerId%>';
		var beneficiaryAccNo= document.getElementById("accNo").innerText;
		//old
		var userid='<%=login_id%>' ;  
		var otp=document.getElementById("otp").value;

		//geetika
		var trType="O";
		var periodicity="-1";
		
		var purpose="Fund Transfer";
		var isSch="N";
		
		var acc=document.getElementById("racNo").innerText;
		var amount=document.getElementById("amount").value;
		var mode="S";
		var	scDate=date;
		
		var url="/TransactionAction.do?action=fundTransferwithinBank&OTP="+otp+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID=12&sMode=SingleTran&isSch="+isSch+"&schDate="+scDate+"&trnType="+trType+"&periodicity="+periodicity+"&Remark="+remark+"&benName="+benName+"&custID="+custId+"&payeemob="+payeemob+"&chkFav="+chkFav+"&ftrnwith=";
		//alert(url)
		http.open("POST",url,false);
		var returVal= 0;
		http.onreadystatechange= function (){ returVal =showMessage(isSch)};
		http.send(null);  
		if ( returVal==1  ) jQuery(".OTP-confirm-popup").toggleClass("show");  
			
	}
	
	function showMessage(isSch){
	if (http.readyState == 4){
		//Check that a successful server response was received
		if (http.status == 200){
			var resArray=http.responseText;
			var data=resArray.split("~");
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
				//document.getElementById("srvrStatus").innerText= "Transaction processed successfully"+jsonData.mobileNo ; 
			}
			else{
				console.log( "jsonData.transactionID: "+jsonData.transactionID);
				if ( jsonData.transactionID == "-1" || jsonData.transactionID == -1 ){
					
				
				
				// alert("Dear Customer your Transaction has been "+jsonData.result +" and Transaction Id: "+jsonData.transactionID);
				//document.getElementById("srvrStatus").innerText= "Dear Customer your Transaction has been "+jsonData.result +" and Transaction Id: "			+jsonData.transactionID; 	
				document.getElementById("secMsg").style.backgroundColor = 'red';
				document.getElementById("htr").innerText= "Transaction Status :"+" Failed"; 
				document.getElementById("tAc2").innerHTML=document.getElementById("racNo").innerText;				
				document.getElementById("txnUtrRef").innerText= " Failed "; 
				}
				else 
				{
					document.getElementById("secMsg").style.backgroundColor = 'green';
					document.getElementById("htr").innerText= "Transaction Status :"+" Success"; 
					document.getElementById("tAc2").innerHTML=document.getElementById("racNo").innerText;				
					document.getElementById("txnUtrRef").innerText= jsonData.transactionID; 
				}					
				
			}
			//window.location.href = "/fundTransferNeftNew/fund_Transfer.jsp" 
		}
		else{
			//alert("HTTP error: " + http.status);
		}
	}
}




</script>

   <head>
  
   <%-- <link rel="stylesheet" href="/fundTransferNeftNew/css/custom.css"> --%>
       
    
   
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
   <script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
	<script language="JavaScript" src="/scripts/common.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
     
   </head>
   <%@ include file="/header/headerbar.jsp"%>
    <body onload="defaultSelectedValue()" >
       <html:form action="/TransactionAction.do">
        <section class="brad-log-time">
         <div class="inner-brad-log">
            <div class="container">
               <div class="row">
                  <div class="col-md-8">
                     <div class="bradcums">
                        <ul>
                           <li>
                              <a href="/dashBoard/dashboard.jsp">Dashboard</a>
                              >
                             <a href="/fundTransferNeftNew/fund_Transfer.jsp">Fund Transfer</a>
                              >
                              <strong>
                                Quick Trasnfer A/c Within HPSCB
                              </strong>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-4">
                     <div class="log-time">
                        <span class="time">
                           <%=(new java.util.Date()).toLocaleString()%>
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
                
                <div class="payments-and-transfer-inner">
                    <div class="row">
                        <div class="pay-heading">
                            <h2>
                                <img src="/styles/images/quick-trans.png" alt="">
                                Quick Transfer (Without Adding Beneficiary)
                            </h2>
                        </div>
                        <div class="chosse-an-account">
				            <label for="">From Account</label>
                           <select name="fromAccount" id="fromAccount" onchange="radioClick(this.value)">											
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
                           </select>                    
                        </div>
                        <div class="Selected-Account-Number">
                            <strong>Selected Account Number:  </strong>
                            <span id="demo"></span>
                        </div>
                        

                        <div class="select-account-table">
                            <table>
                                <tr>
                                    <th>Account No. / Nick Name</th>
                                    <th>Account Type</th>
                                    <th>HPSCB Branch</th>
                                    <th>Balance</th>
                                </tr>
                                <tr>
                                <td style="font-size:13px;font-weight: bolder" id="accNo"></td>
                                <td style="font-size:13px;font-weight: bolder" id="accType"></td>
                                <td style="font-size:13px;font-weight: bolder" id="branchName"></td>
                                <td style="font-size:13px;font-weight: bolder" id="balance"></td>
                                </tr>
                            </table>
                         </div>

                        <div class="amount-selection-main-sec quick-transfer-inputs">
                            <div class="amount-sec">
                                <span class="amt-inner">
                                    <label for="">Beneficiary Account Number*</label>
                                    <input type="passsword" property="racNo" styleId="racNo" id="racNo" maxlength="16"
					                    onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))"> 
                                        
                                </span>

                                <span class="amt-inner">
                                    <label for="">Re-enter Beneficiary Account Number*</label>
                                    <input type="text" property="confirmPayeeAccNo" styleId="rectangle_258_ek5" id="confirmPayeeAccNo" maxlength="16" 
					                    onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))"
					                    onchange="return fetchAccTypeNew()"> 
                                      
                                </span>

                                <span class="amt-inner">
                                    <label for="">Beneficiary Name*</label>
                                    <input type="text" id="payeeName">
                                </span>

                                <span class="amt-inner">
                                    <label for="">Account Type*</label>
                                    <select name="" id="sAccountType" >
                                        <option value="">---Select---</option>
                                        <option  value="">Saving Account</option>
                                        <option value="">Current Account</option>
                                    </select>
                                </span> 
                                
                            </div>
                            
                            <div class="select-shedual-option">
                                <h5>Select Payment Option</h5>
                                <span class="shedual-date">
                                <span>Payment Option</span>
                                <span class="input-paid">
                                    <input type="radio" checked>
                                    Within HPSCB
                                
                                </span>
                                <%-- <span class="input-paid">
                                    <input type="radio">
                                    Other Bank Transfer
                                
                                </span> --%>
                                
                                </span>
                            </div>

                            <div class="amount-selection-main-sec quick-transfer-inputs">
                                <div class="amount-sec">
                                    <span class="amt-inner">
                                        <label for="">Amount*</label>
                                          <input name="amount" id="amount" type="text" onpaste="return false;" ondrop="return false;" autocomplete="off"  pattern="[0-9]+" maxlength=15 onkeypress="return isNumberKey(event)"> 
                                    </span> 
                                    </span>
                                    <%-- <span class="amt-inner">
                                    <label for="" class="find-ifsc"> IFSC Code </label> --%>
                                    <%-- <label for="" class="find-ifsc">IFSC Code* <a href="">Find IFSC</a></label> --%>
                                    <%-- <input type="text" name="" id="ifsc"> --%>
                                    
                                    </span>
                                    <span class="amt-inner">
                                        <label for="">Remark*</label>
                                        <input type="text" id="remark">
                                    </span>
                                    <span class="amt-inner">
                                        <%-- <label for="">Remark*</label> --%>
                                        <input type="hidden" id="beneLimt">
                                        <input type="hidden" id="beneMobile">
                                    </span>
    
                                    
                                </div>


                            
                            <div class="note-plz">
                                <p>
                                    Please note, Beneficiary Account Number and IFSC information will ONLY be used for Electronic Fund Transfer (please ensure correctness), the Beneficiary Name provided will not be considered for Electronic Fund Transfer as per RBI guidelines.
                                </p>
                            </div>
                            <%-- <div class="accept-term-con">
                                <input type="checkbox" name="" id="">
                                I accept the <a href="">Terms and Conditions</a>
                            </div> --%>
                            <div class="buttons">
                                <button type="button" class="submit-button"><img src="/styles/images/submit.png" alt=""> SUBMIT</button>
                                <button type="button" onclick="window.location.href = 'fund-transfer.html'"><img src="/styles/images/cancle.png" alt=""> CANCEL</button>
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
                        <span>Dinesh kumar</span>
                        </span>
                        <span class="con-details">
                        <span>From A/C:</span>
                        <span>9876543211234567</span>
                        </span>
                        <span class="con-details">
                        <span>To A/C:</span>
                        <span>1234567891234567</span>
                        </span>
                        <span class="con-details">
                        <span>Amount:</span>
                        <span>₹ 5000</span>
                        </span>
                        
                    </div>
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="confirm-btn"><img src="/styles/images/next 2.png" alt=""> Confirm</button>
                        <button type="button" class="edit-btn"><img src="/styles/images/edit.png" alt=""> Edit</button>
                    </div>
                </div>
            </section>
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

                        
                    </div>
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="confirm-btn"><img src="/styles/images/next 2.png" alt=""> Confirm</button>
                        <button type="button" class="edit-btn"><img src="/styles/images/edit.png" alt=""> Edit</button>
                    </div>
                </div>
            </section>

            <section class="OTP-confirm-popup">
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
                              <button type="submit" onClick=(resendOtp();)>Resend OTP:</button>
							  
                            </span>
                            <span class="timer">
                              <span id="counter"></span>
                            </span>
							
                          </div>
                    
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="AUTHENTICATE" ><img src="/styles/images/auth.png" alt=""> AUTHENTICATE</button>
			<button type="button" onclick="window.location.href = '/sfundTransferNeftNew/fund_Transfer.jsp'" >Cancel</button>
                    </div>
                </div>
            </section>

              <section class="transction-succesfull-popup">
                <div class="confirm-inner">                    
                    <span class="succesful-msg" id="secMsg">
                        <h2 id="htr">Transaction Successful</h2>
                        <span class="time"></span>
						 <!-- span id="srvrStatus"></span -->
                    </span>

                    <div class="confi-table">

                       <span class="con-details">
                        <span>Transaction ID:</span>
                        <span id="txnUtrRef" name="txnUtrRef"></span>
						
                        </span>
						
                        <span class="con-details">
                        <span>Paid To:</span>
                        <span id="tAc2"></span>
                        </span>
                        <span class="con-details">
                        <span>Debit From A/C:</span>
                        <span id="fAc2"></span>
                        </span>
                        <span class="con-details">
                        <span>Bank Name:</span>
                        <span>Himachal Pradesh State Co-operative Bank Ltd.</span>
                        </span>
                        <span class="con-details">
                        <span>Amount:</span>
                        <span id="damt2"></span>
                        </span>
						<span class="con-details">
                            <span>Remark:</span>
                           	<span id="dremark2"></span>
                        </span>
                        <!-- <span class="con-details">
                        <span>Transaction Type:</span>
                        <span>NEFT</span>
                        </span> -->

                        
                    </div>
                    
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="done" onclick="window.location.href = '/fundTransferNeftNew/fund_Transfer.jsp'">DONE</button>
						
						                       
						
                    </div>
                </div>
            </section>
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
        <footer>
           
        </footer>

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
            jQuery(".submit-button").click(function(){ 
            
                  var	acNo=document.getElementById("demo").innerText;
                  //alert(acNo);
                  var acNo2 = $('#racNo').val();
                  acNo2=document.getElementById("racNo").value;
                  //alert(acNo2);
                  var aamt = $('#amount').val();
                  var abalance = $('#balance').val();
                  var aremark = $('#remark').val();	
                  var aactype = document.getElementById("accType").innerHTML;
                  var trnLimit = document.getElementById("beneLimt").innerHTML;

                  var cnfAccno = document.getElementById("confirmPayeeAccNo").value;
                  alert(cnfAccno);

                //   if(aamt > trnLimit){
                //      alert("Amount Should be less then limit");  
                //      window.location.href="/fundTransferNeftNew/QuickTransfer-within-HPSCB.jsp";
                //   }                  

                if(acNo =="" ||  acNo2 == ""){
                    confirm( "Please enter account no");		
                  return false;
                }

                if(acNo2 != cnfAccno){
                    confirm( "Account no not same");		
                  return false;
                }

                if(aamt > 10000){
                  confirm( "You Can't transfer more than 10000 in a day using Quick Transfer");		
                  return false;    
                }

                // if(aamt > trnLimit){
                //   confirm( "You can't trasnfer more then daily limit");		
                //   return false;    
                // }


                  console.log ( acNo +"|"+acNo2 +"|"+aamt +"|"+aremark)			;
                  if(  aamt=="" || aamt =="0" || aremark=="") 
                  {
                  confirm( "Amount or Remark is not specified \r\n  Please fill amount, cannot continue... ");		
                  return false;
                  }			
                  else if(aamt <= abalance && aactype=="Savings Account")
                  {
                     confirm( "Please check the balance \r\n If you want to continue");		
                  return false;
                  }
                  else if( acNo2 =="" || acNo =="" || acNo2 === acNo ) 
                  {
                     confirm( "Account Number Found Same \r\n  Selected From Account and To Account are Same , cannot continue...\r\n Please Re-Select Accounts. ");				
                     $("fromAccno:selected").prop("selected", false)				;
                     $("toAccno:selected").prop("selected", false);				
                     return false;
                  }else 
                  {				
                     jQuery(".detail-confirm-popup").toggleClass("show"); 
                        $('#dremark').html(aremark);						
                        $('#fAc').html(acNo);
                        $('#tAc').html(acNo2);
                        $('#damt').html(aamt);			
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
			otp_number();
			// optresult = otp_number ();
			
         
		 });
         });

         jQuery(document).ready(function(){  
         jQuery(".confirm-btn").click(function(){  
         jQuery(".OTP-confirm-popup").toggleClass("show");  
		 
		 // optresult = otp_number ();
			// Button Name and Lablel should chage 
			//If not success go back to edit 
			// OTP Not Received 
			// Resend the OTP counting with 
			// if not received then go back to edit 
			//
		 
         });
         });
         
         jQuery(document).ready(function(){  
         jQuery(".AUTHENTICATE").click(function(){  
         jQuery(".OTP-confirm-popup").toggleClass("show");  		 
		 
		 callfundTrRetailWithInBank("<%=DateTimeFunction.getIbDateTime()%>", 
		 "<%=customerId%>", 
		 '<%=mobileNo%>', 
		 "<%=login_id%>", 
			document.getElementById("otp").value ,
		'S', document.getElementById("remark").value  , 
		aNo, 
		document.getElementById("racNo").value  , 
		document.getElementById("amount").value   , 
		"-1" ,"<%=session.getAttribute("user").toString()%>",
		 document.getElementById("beneMobile").value );
		 
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
         jQuery(".transction-succesfull-popup").toggleClass("show");  
			var	acNo2=document.getElementById("demo").innerText;			
			var aNo2 = $('#racNo').val();
			aNo2=document.getElementById("racNo").value;
			var aamt = $('#amount').val();	
						
			var aaremark = $('#remark').val();			
			console.log ( aNo2 +"|"+acNo2 +"|"+aamt +"|"+dremark2)
			$('#fAc2').html(acNo2);			
			$('#tAc2').html(aNo2);
			$('#dremark2').html(aaremark);
			$('#damt2').html(aamt);	
			
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
      <script>
      
      
      function radioClick(accountNo) {	
    	     // alert("Radio click is called");
    		   aNo = accountNo;//.slice(6);
    		   demo.innerHTML = aNo;
    	      savingAjax();		
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
    		url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+accno+"&mobile="+mobile+"&sessionID="+sessionId+"&purpose="+purpose+"&amount="+amount+"&ran="+ran;
    		http.open("POST",url,false);
    		http.onreadystatechange= function (){processResOTP()};
    		http.send(null); 
    	}
      
      
      </script>
       </html:form>
   </body>
</html>