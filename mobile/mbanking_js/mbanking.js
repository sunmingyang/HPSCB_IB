var http;
var otpTask;
var debug_version = true;

/*

43864036
43861605

23155

var otpTask = setInterval(function(){ myTimer() }, 1000);
clearInterval(otpTask);

*/
//Public IP HSBC Shimpla
//var serverIP = "117.239.0.75";
//var serverPort = "8643";


//Public IP Test Server

//var serverIP = "52.24.157.128";
//var serverPort = "8090";

//var serverIP = "198.38.85.31";
//var serverPort = "8090";

//262054  bank



//HSCB
//var serverIP = "192.168.20.29";		//"192.168.1.72";
//var serverPort = "8090";			//"8290";

//Public IP Test Server

//var serverIP = "198.38.85.31";
//var serverPort = "8090";
 
 
 
//Local IP Jaipur
//var serverIP = "192.168.1.128";
//var serverPort = "8290";


//var serverIP = "192.168.1.110";		//"192.168.1.72";
//var serverPort = "8290";	


//Local IP HP System
var serverIP = "117.239.0.75";
var serverPort = "8643";
var cbsserver="117.239.0.75";
var cbsserverPort="8180";


if(http == null)
	http=createRequestObject();

function createRequestObject(){
            var req;
            if(window.XMLHttpRequest){
                     //  alert("http object created");
                            req=new XMLHttpRequest();
            }
            else if(window.ActiveXObject){
                            req=new ActiveXObject("Microsoft.XMLHTTP");
            }else{
                            alert("Browser is not IE 5 or higher, or Firefox or Safari or Opera");
            }
            return req;
	}
 
	function getData(str, param) {
		try{
//$('#loading-indicator').show();
		$('#spinner').show();

			
		// alert("serverIP="+serverIP);
		// alert("serverPort="+serverPort);
        var ran=parseInt(Math.random()*9999);
	    var url = "";
	    if(str === 'authenticate')
	        //url="http://192.168.1.128:8290/AccountInfoAction.do?action=applicationURL&userID=4382096638&ran="+ran;
//	    	url = "http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=userAuthenticate&userID="+sessionStorage.userID+"&encPassword="+sessionStorage.password+"&ran="+ran;
        url = "http://"+serverIP+":"+serverPort+"/LoginWinAction.do?action=ibUsrLogin&userID="+sessionStorage.userID+"&encPassword="+sessionStorage.password+"&ran="+ran+"&origen=mobile";   
		//alert(url);
		else if(str === 'accounts')
            url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=fetchCustomerAccounts&custID="+param+"&ran="+ran;//27479
	    else if(str === 'ministatement')
			url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=getMiniStatement&accNo="+param+"&ran="+ran;
	    else if(str === 'balance')
			url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=fetchAccountBalance&accNo=002010006515" +"&ran="+ran;
        else if(str === 'cheque_book_order')
			url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=chequeBookRequest&accNo="+param+"&leaves=10&ran="+ran;
       	else if(str === 'cheque_stop_payment')
			url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=chequeStopPayment&accNo="+param+"&chequeNo="+sessionStorage.chequeNo+"&ran="+ran;
       	else if(str === 'cheque_enquiry')
			url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=chequeNoEnquiry&accNo="+param+"&chequeNo="+sessionStorage.chequeNo+"&ran="+ran;
       else if(str === 'confirmedPayee')
			url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=fetchPayee&userID="+param+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
       else if(str === 'sendOTP')
       		url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=sendOTP&userID="+param+"&beneficiaryAccNo="+sessionStorage.beneficiaryAccNo+"&purpose=Fund Transfer&mobile="+sessionStorage.mobileNo+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
       else if(str === 'fundTransferSelf')
       		url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=fundTransferwithinBank&userID="+sessionStorage.userID+"&accNo="+sessionStorage.from+"&beneficiaryAccNo="+sessionStorage.to+"&transferAmt="+sessionStorage.amount+"&OTP="+param+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
       else if(str === 'fundTransferOther')
            url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=fundTransferOtherBank&OTP="+param+"&userID="+sessionStorage.userID+"&beneMobile="+sessionStorage.benemobile+"&remiMobile="+sessionStorage.mobileNo+"&IFSCcode="+sessionStorage.ifsc+"&beneficiaryAccNo="+sessionStorage.to+"&accNo="+sessionStorage.from+"&mode="+sessionStorage.mode+"&transferAmt="+sessionStorage.amount+"&sessionID="+sessionStorage.sessionID;
       else if(str === 'addPayeeSameBank')
       		url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=fundTransferAddPayee&userID="+sessionStorage.userID+"&nickName="+sessionStorage.nickName+"&payeeName="+sessionStorage.payeeName+"&payeeAcc="+sessionStorage.payeeAcc+"&payeeType=S&accountType=S&mobile="+sessionStorage.mobileNo+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
       						//http://192.168.1.72:8280/TransactionAction.do?action=fundTransferAddPayee&userID=43860744&nickName=vinay&payeeName=Vinay Prakash Dwivedi&payeeAcc=002010001445&payeeType=S&accountType=S&mobile=9314506489&sessionID=F9677C6B32989F6A5D63F8CB1E0461B0&ran=12345
       else if(str === 'passwordChangeOTP')
            url=" http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=sendOTP"+param+"&sessionID=mobileapp"+"&simNo="+sessionStorage.simNumber+"&imeiNo"+sessionStorage.imeiNumber+"&ran="+ran;
        else if(str === 'passwordChangeConfirm')
			url=" http://"+serverIP+":"+serverPort+"/LoginWinAction.do?action=passWordChangeUrl"+param+"&sessionID=mobileapp"+"&ran="+ran;
       
     	else if(str === 'pending_payee_list')
     			url=" http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=fetchPayeeForConfirm&userID="+sessionStorage.userID+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
	 	else if(str === 'confirmPayeeOTP')
                url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=sendOTP"+param+"&purpose=Manage Payee&mobile="+sessionStorage.mobileNo+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
     	else if(str === 'confirmPayee')
              url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=otpVerify"+param+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
     	else if(str === 'accinfo')
                      url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=fetchPayeeDetail&userID="+sessionStorage.userID+"&PayeeAccountNo="+param;
     	else if(str === 'accinfoIMPS')
              url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=fetchPayeeDetail&userID="+sessionStorage.userID+"&PayeeAccountNo="+param;
		else if(str === 'sendOTPotherbank')
       		 url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=sendOTP&userID="+param+"&beneficiaryAccNo="+sessionStorage.beneficiaryAccNo+"&purpose=Fund Transfer&mobile="+sessionStorage.mobileNo+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
		else if( str === 'transactionProceed') // add this statement where url create in getdata method
     		url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=cashCollection&userID="+sessionStorage.userID+"&accNo="+sessionStorage.from+"&beneficiaryAccNo="+sessionStorage.useraccount+"&transferAmt="+sessionStorage.amount+"&sessionID="+sessionStorage.sessionID+"&Remark="+sessionStorage.narration+"&ran="+ran;
  		else if(str ==='acname')
             url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=fetchAccountBalance&accNo="+sessionStorage.acname+"&ran="+ran;
  		else if(str ==='applicationURLs')
  		//url="http://192.168.1.128:8290/AccountInfoAction.do?action=applicationURL&userID=4382096638&ran="+ran;
             url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=applicationURL&userID="+sessionStorage.userID+"&ran="+ran;
		//	   url="http://117.239.0.75:8643/AccountInfoAction.do?action=applicationURL&userID=4382096638&ran="+ran;
		else if(str ==='promptapplicationURLs')
          		//url="http://192.168.1.128:8290/AccountInfoAction.do?action=applicationURL&userID=4382096638&ran="+ran;
                     url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=applicationURL&userID="+sessionStorage.userID+"&ran="+ran;
		else if(str === 'deletePayee')
			url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=removePayee"+param+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
		else if(str === 'all_payee_list')
			url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=fetchPayee&userID="+sessionStorage.userID+"&sessionID="+sessionStorage.sessionID+"&ran="+ran;
		else if(str === 'AppActivation')
            url=" http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=passWordChangeUrl"+param+"&sessionID=mobileapp"+"&SIMNO="+sessionStorage.simNumber+"&imeiNo"+sessionStorage.imeiNumber+"&ran="+ran;
		else if(str ==='agaccountInfo')
			url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=fetchAccountBalance&accNo="+param+"&ran="+ran;
		else if(str ==='getagentname')
			url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=agentPincodeData&pinCode="+param+"&ran="+ran;
		else if(str ==='activityCharges')
			url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=getActivityCharges&activity="+param+"&document="+sessionStorage.document+"&sessionID="+sessionStorage.sessionID+"&amount="+sessionStorage.amount+"&ran="+ran;
		else if(str ==='sendagentOTP')
			url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=sendOTPAGN&DebitAccount="+sessionStorage.Faccno+"&beneficiaryAccNo="+sessionStorage.Taccno+"&sessionID="+sessionStorage.sessionID+"&purpose="+param+"&ran="+ran;
		else if(str ==='saveFTdata')
                     url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=postAgentTransaction&"+param;
		else if(str ==='getagentpayee')
                     url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=agentCustomerAccounts&mobileNo="+param+"&ran="+ran;
		else if(str ==='agentpayeeOTP')
                     url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=sendOTPPayment&"+param+"&ran="+ran;
		else if(str ==='cashpaymentconfirm')
                     url="http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=postAgentCashPayment&"+param+"&ran="+ran;
		else if(str ==='customeraccInfo')
			url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=fetchAccountBalance&accNo="+param+"&ran="+ran;
		else if(str ==='searchagent')
               url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=agentPincodeData&pinCode="+param+"&ran="+ran;
		else if(str ==='deactivateAtm')
             url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=atmDeactivateBySMS&accountNo="+param+"&userid="+sessionStorage.userID;
		else if(str ==='searchlocation')
		   url="http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=branchNearByLocationData&Latitude="+latitude+"&Longitude="+longitude+"&ran="+ran;

      if(debug_version)
       //	alert("Request URL="+url);


	    http.open("GET",url,true);
	   //http.open("GET",url,false);
	    if(str === 'authenticate')
            http.onreadystatechange= function (){authenticateResponse()};
	    else if(str === 'accounts')
			http.onreadystatechange= function (){accountsResponse()};
	    else if(str === 'ministatement')
			http.onreadystatechange= function (){miniStatementResponse()};
	    else if(str === 'balance')
			http.onreadystatechange= function (){balanceResponse()};
		else if(str === 'cheque_book_order')
			http.onreadystatechange= function (){chequeBookOrderResponse()};
		else if(str === 'cheque_stop_payment')
			http.onreadystatechange= function (){chequeStopPaymentResponse()};
		else if(str === 'cheque_enquiry')
			http.onreadystatechange= function (){chequeEnquiryResponse()};
		else if(str === 'confirmedPayee')
			http.onreadystatechange= function (){confirmedPayeeResponse()};
		else if(str === 'sendOTP')
			http.onreadystatechange= function (){OTPResponse()};
		else if(str === 'fundTransferSelf')
			http.onreadystatechange= function (){fundTransferResponse()};
		else if(str === 'fundTransferOther')
            http.onreadystatechange= function (){fundTransferIMPSResponse()};
		else if(str === 'addPayeeSameBank')
			http.onreadystatechange= function (){addPayeeSameBankResponse()};	
		else if(str === 'passwordChangeOTP')
			http.onreadystatechange= function (){passwordChangeOTPResponse()};
		else if(str === 'passwordChangeConfirm')
			http.onreadystatechange= function (){passwordChangeConfirmResponse()};	
		else if(str === 'pending_payee_list')
        			http.onreadystatechange= function (){pendingPayeeListResponse()};
        else if(str === 'confirmPayeeOTP')
                	http.onreadystatechange= function (){confirmPayeeOTPResponse()};
		else if(str === 'confirmPayee')
		  	http.onreadystatechange= function (){confirmPayeeResponse()};
		else if(str === 'accinfo')
		  	http.onreadystatechange= function (){accinfoResponse()};
		else if(str === 'accinfoIMPS')
            http.onreadystatechange= function (){accinfoIMPSResponse()};
		else if(str === 'sendOTPotherbank')
		  	http.onreadystatechange= function (){fundtransferotherbankOTPResponse()};
		else if( str === 'transactionProceed')
            http.onreadystatechange= function(){transactionProceedResponse()};
        else if(str ==='acname')
            http.onreadystatechange= function(){cashCollection()};
        else if(str ==='applicationURLs')
          	http.onreadystatechange= function(){applicationURLresponse()};
        else if(str ==='promptapplicationURLs')
          	http.onreadystatechange= function(){promptapplicationURLresponse()};
		else if(str === 'deletePayee')
			http.onreadystatechange= function (){deletePayeeResponse()};
		else if(str === 'all_payee_list')
			http.onreadystatechange= function (){allPayeeListResponse()};
		else if(str === 'AppActivation')
            http.onreadystatechange= function (){appActivationResponse()};
		 else if(str ==='agaccountInfo')
      		http.onreadystatechange= function(){processdata2()};
	 	else if(str ==='getagentname')
      		http.onreadystatechange= function(){processdata1()};
      	 else if(str ==='activityCharges')
            http.onreadystatechange= function(){processdata()};
   	 	else if(str ==='sendagentOTP')
            http.onreadystatechange= function(){processResOTP()};
		else if(str ==='saveFTdata')
            http.onreadystatechange= function(){process()};
		else if(str ==='getagentpayee')
            http.onreadystatechange= function(){processdata3()};
		else if(str ==='agentpayeeOTP')
        	http.onreadystatechange= function(){processResOTP()};
		else if(str ==='cashpaymentconfirm')
            http.onreadystatechange= function(){processdata4()};
		else if(str ==='customeraccInfo')
      		http.onreadystatechange= function(){cashprocessdata2()};
		else if(str ==='searchagent')
           	http.onreadystatechange= function(){searchagentresponse()};
 		else if(str ==='deactivateAtm')
            http.onreadystatechange= function(){deactivateAtmresponse()};
		 else if(str ==='searchlocation')
		     http.onreadystatechange= function(){searchnearBranchlocation()};
		

        http.send(null);
		//if(str === 'sendOTP')
        	//otpTask = setInterval(otpCall, 15000);

		}catch(err)
			{
				$('#spinner').hide();
				showAlert("Network Error ", "Unable to Connect Server");
				alert("Unable to Connect Server");
				
				//alert(err);
				//var response = "{'authorise':'Y','userType':'U','validUser':'Y','customerId':'25361'}";
				//getAuthenticationData(response);

				//var response ='{"accountList":[{"accountNo":"002018006582","accountType":"F","clearBalance":"5465.0000","customerName":"DHARYA SHARMA","underClgBalance":"0.0000"},{"accountNo":"002018006692","accountType":"F","clearBalance":"26673.0000","customerName":"DHARYA SHARMA","underClgBalance":"0.0000"},{"accountNo":"002018006581","accountType":"F","clearBalance":"5510.0000","customerName":"LAKSHAY SHARMA","underClgBalance":"0.0000"},{"accountNo":"002018006430","accountType":"F","clearBalance":"0.0000","customerName":"CHANDAN SHARMA","underClgBalance":"0.0000"},{"accountNo":"002018006383","accountType":"F","clearBalance":"0.0000","customerName":"CHANDAN SHARMA","underClgBalance":"0.0000"},{"accountNo":"002018006459","accountType":"F","clearBalance":"0.0000","customerName":"CHANDAN PRAKASH","underClgBalance":"0.0000"},{"accountNo":"002018006538","accountType":"F","clearBalance":"0.0000","customerName":"CHANDAN PRAKASH","underClgBalance":"0.0000"},{"accountNo":"002018006495","accountType":"F","clearBalance":"28264.0000","customerName":"LAKSHAY SHARMA","underClgBalance":"0.0000"},{"accountNo":"002018006496","accountType":"F","clearBalance":"28264.0000","customerName":"DHARYA SHARMA","underClgBalance":"0.0000"},{"accountNo":"002018006486","accountType":"F","clearBalance":"0.0000","customerName":"CHANDAN PRAKASHSHARMA","underClgBalance":"0.0000"},{"accountNo":"002010003699","accountType":"S","clearBalance":"1448.0000","customerName":"Chandan Prakash s/o lekh Raj","underClgBalance":"0.0000"},{"accountNo":"002040000361","accountType":"D","clearBalance":"0.0000","customerName":"CHANDAN PRAKASH S/O LEKH RAJ","underClgBalance":"0.0000"}]}';
				//getAccountsData(response);
				//var response = '{"tranList":[{"curbalance":"19143.0000","narration":"TO TRANSFER MIP#272","trdAmt":"250000.0000","trdDate":"2015-02-25 00:00:00.0","trdDrCr":"D"},{"curbalance":"19143.0000","narration":"BY CLG","trdAmt":"253375.0000","trdDate":"2015-02-25 00:00:00.0","trdDrCr":"C"},{"curbalance":"19143.0000","narration":"BY CASH","trdAmt":"15000.0000","trdDate":"2015-02-16 00:00:00.0","trdDrCr":"C"}]}';
				//getMiniStatementData(response);

			}             
    }

function otpCall(http)
{
	if(debug_version)
	alert("otp being sent again after 15 sec.");
	http.send(null);
}
function precise(){
getData("applicationURLs","");

//location.href=sessionStorage.precisecartURL;
}
function prompt(){

getData("promptapplicationURLs","");

}
function applicationURLresponse()
{
    if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
                			if(debug_version)
                    			alert(http.responseText);


                    			   var res='{"test":'+http.responseText+'}';
                                 //alert(res);
                                 var response=JSON.parse(res);
                                  var promptURL=response.test[0].AppURL;
                                  var promptURLmain=promptURL.replace("<MobileUserID>", sessionStorage.userID);
                                  var preciseURL=response.test[1].AppURL;
                                  var preciseURLmain=preciseURL.replace("<Mobileuserid>", sessionStorage.userID);
                                  sessionStorage.precisecartURL=preciseURLmain;
                                  sessionStorage.promptmeURL=promptURLmain;
                                 // alert(sessionStorage.precisecartURL);
                                 // alert(sessionStorage.promptmeURL);
                                 location.href= sessionStorage.precisecartURL;
                                  $('#spinner').hide();


                        }
                }

}
function promptapplicationURLresponse()
{
    if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
                			if(debug_version)
                    			alert(http.responseText);


                    			   var res='{"test":'+http.responseText+'}';
                                 //alert(res);
                                 var response=JSON.parse(res);
                                  var promptURL=response.test[0].AppURL;
                                  var promptURLmain=promptURL.replace("<MobileUserID>", sessionStorage.userID);
                                  var preciseURL=response.test[1].AppURL;
                                  var preciseURLmain=preciseURL.replace("<Mobileuserid>", sessionStorage.userID);
                                  sessionStorage.precisecartURL=preciseURLmain;
                                  sessionStorage.promptmeURL=promptURLmain;
                                 // alert(sessionStorage.precisecartURL);
                                 // alert(sessionStorage.promptmeURL);
                                 location.href= promptURLmain;
                                  $('#spinner').hide();


                        }
                }

}

	function pendingPayeeListResponse(){
         	if (http.readyState == 4)
        	{
            		// Check that a successful server response was received
            		if (http.status == 200)
            		{
            			if(debug_version)
                			alert(http.responseText);

                		eval('var objArray='+http.responseText);


						for (var i=0; i < objArray.length; i++)
						{

							$('#payee_table').append("<tr><td><input type='radio' name='pending_payee' id='' value="+objArray[i].accNo+" /></td><td>"+objArray[i].payeeName+"</td><td>"+objArray[i].accNo+"</td><td>Pending</td></tr>");

						}

					}
					else
					{
						// An HTTP problem has occurred
						alert("HTTP error: " + http.status);
					}
					$('#spinner').hide();
            }
    }
    function confirmPayeeOTPResponse()
	{
		if(debug_version)
			alert("confirmPayeeOTPResponse");
		if (http.readyState == 4)
		{
				// Check that a successful server response was received
				if (http.status == 200)
				{
					if(debug_version)
						alert(http.responseText);
					eval('var obj='+http.responseText);
					if(debug_version)
						alert(obj.authorise);
					if(obj.authorise === 'success')
						showAlert("alert-div", "Please Enter OTP Sent to Your Registered Mobile.", "");
					else
					{

						showAlert("alert-div","Error :", "Unable to Send OTP");
					}
					$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
				}
				else
				{

				}
				$('#spinner').hide();
	   }
	}
    function passwordChangeOTPResponse()
        	{
        		if(debug_version)
        			alert("passwordChangeOTPResponse");
        		if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
							if(debug_version)
                    			alert(http.responseText);
                    		eval('var obj='+http.responseText);
                    		if(debug_version)
                    			alert(obj.authorise);
                    		if(obj.authorise === 'success')
                    			showAlert("alert-div", "Please Enter OTP Sent to Your Registered Mobile.", "");
                    		else
                    		{

                    			showAlert("alert-div","Error :", "Unable to Send OTP");
                    		}
        					$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
        	    		}
        				else
        				{

        				}
        				$('#spinner').hide();
               }
        	}

	function confirmPayeeResponse()
            	{
            		if(debug_version)
            			alert("confirmPayeeResponse");
            		if (http.readyState == 4)
                	{
                    		// Check that a successful server response was received
                    		if (http.status == 200)
                    		{
    							if(debug_version)
                        			alert(http.responseText);
                        		eval('var obj='+http.responseText);
                        		if(debug_version)
                        			alert(obj.result);
                        		if(obj.result === 'success')
                        			showAlert("alert-div-self", "Payee Confirmed Successfully.", "");
                        		else
                        		{

                        			showAlert("alert-div-self","Error :", obj.Error);
                        		}
            					$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
            	    		}

            				$('#spinner').hide();
                   }
            	}
		function passwordChangeConfirmResponse()
        	{
        		
        		if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
							if(debug_version)
                    			alert(http.responseText);
                    		eval('var obj='+http.responseText);
                    		if(debug_version)
                    			alert(obj.result);
                    		if(obj.result === 'success')
                    			showAlert("alert-div", "Password Updated, Please Login with New Password", "");
                    		else
                    		{
                    			showAlert("alert-div","Error :", "Problem in Password Change");
                    		}
        					$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
        	    		}
        				else
        				{

        				}
        				$('#spinner').hide();
               }
        	}

    
	function authenticateResponse(){
	
         	if (http.readyState == 4)
        	{
            		// Check that a successful server response was received
            		if (http.status == 200)
            		{
                		//{"authorise":"Y","userType":"U","validUser":"Y","customerId":"25361"}
                		//alert(http.responseText);
						getAuthenticationData(http.responseText);
		    		}
					else if (http.status == 0)
					{
						// An HTTP problem has occurred
						//	alert("HTTP error: " + http.status);
						showAlert("Network Error ", "Unable to Connect Server");
						//alert("Unable to Connect Server");
					}
					$('#spinner').hide();
           }
           
           
    }

	function accountsResponse(){
         	if (http.readyState == 4)
        	{
            		// Check that a successful server response was received
            		if (http.status == 200)
            		{
                		//alert(http.responseText);	
						getAccountsData(http.responseText);
						sessionStorage.accounts = JSON.stringify(http.responseText);
					}
					else
					{
						// An HTTP problem has occurred
						alert("HTTP error: " + http.status);
					}
					$('#spinner').hide();
            }
    }
	function miniStatementResponse(){
         	if (http.readyState == 4)
        	{
            		// Check that a successful server response was received
            		if (http.status == 200)
            		{
                		//alert(http.responseText);
						getMiniStatementData(http.responseText);
					}
					else
					{
						// An HTTP problem has occurred
						alert("HTTP error: " + http.status);
					}
			}
			$('#spinner').hide();
    }
	function balanceResponse(){
         	if (http.readyState == 4)
        	{
            		// Check that a successful server response was received
            		if (http.status == 200)
            		{
                		//{"authorise":"Y","userType":"U","validUser":"Y","customerId":"25361"}
						//alert('balanceResponse response');
						//alert(http.responseText);	
					}
					else
					{
						// An HTTP problem has occurred
						alert("HTTP error: " + http.status);
					}
            }
            $('#spinner').hide();
	}

	function getAuthenticationData(response)
	{
			
			
			$('#spinner').hide();
			if(debug_version)
				alert("Authentication response\n" + response);
	
			if(response.length > 0)
			{
				eval('var obj='+response);
				
				//alert(obj.authorise +"\n"+obj.userType+"\n"+obj.validUser+"\n"+obj.customerId);
				//{"authorise":"Y","userType":"U","validUser":"Y","customerId":"25361"}
				if(obj.authorise === 'Y' && obj.validUser === 'Y')
				{
					sessionStorage.customerID = obj.customerId;
					sessionStorage.sessionID = obj.sessionId;
					sessionStorage.customerName = obj.custName;
					sessionStorage.lastLogin = obj.lastlogin;
					sessionStorage.mobileNo = obj.mobileNo;
					sessionStorage.from=obj.accountNo;

					//alert(sessionStorage.customerName+"\n"+ sessionStorage.lastLogin);
					//alert(" sessionStorage.customerID="+ sessionStorage.customerID);
					//alert(" sessionID=" + sessionStorage.sessionID);
					//location.href="home.html";
					location.href="mobilemenu.jsp";
				}
				else
					alert("Authentication Failed");
			}
			else
				alert("Authentication Failed");
	}
	function getAccountsData(response)
	{
			//alert("getAccountsData");
			//alert(response);
			eval('var objArray='+response);
			accounts_list ="";//all
			accounts_list_for_transfer ="";//s a c
			accounts_list_for_transfer_to ="";//s a c d t
			//objArray.accountList.forEach(function(obj){
			objArray.accountInformation.forEach(function(obj){
			if(accounts_list.length > 0)
				accounts_list = accounts_list + "," +obj.accountNo ;
			else
				accounts_list = accounts_list + obj.accountNo ;
			
					//alert(obj.accountNo +"\n" + obj.accountType +"\n" +obj.clearBalance);
					if(obj.accountType === "S")
					{
						$( "#saving" ).append( "<a href='./mini_statement.html?accountNo="+obj.accountNo+"&amount="+obj.clearBalance+"'><div  style='border: 2px solid;border-radius: 25px;background-color:#fbeded;color:#d9534f;margin-bottom:10px;font-weight: bold;min-height: 120px;margin-top:10px' id='_"+obj.accountNo+"' ><span style='font-size:14px;margin-left:10px;margin-top:20px;display: inline-block;'>"+obj.accountNo+"</span><br /><span style='font-size:12px;margin-left:10px;margin-top:10px;display: inline-block;'>Effective Available Balance</span><br /><span style='font-size:20px;margin-left:10px;margin-top:10px;display: inline-block;'>"+obj.clearBalance+"</span></div></a>" );
				if(accounts_list_for_transfer.length > 0)
					accounts_list_for_transfer = accounts_list_for_transfer + "," +obj.accountNo ;
				else
					accounts_list_for_transfer = accounts_list_for_transfer + obj.accountNo ;
				if(accounts_list_for_transfer_to.length > 0)
					accounts_list_for_transfer_to = accounts_list_for_transfer_to + "," +obj.accountNo ;
				else
					accounts_list_for_transfer_to = accounts_list_for_transfer_to + obj.accountNo ;

				}
					else if(obj.accountType === "A" || obj.accountType === "C" )
					{
						$( "#current" ).append( "<a href='./mini_statement.html?accountNo="+obj.accountNo+"&amount="+obj.clearBalance+"'><div  style='border: 2px solid;border-radius: 25px;background-color:#fbeded;color:#d9534f;margin-bottom:10px;font-weight: bold;min-height: 120px;margin-top:10px' id='_"+obj.accountNo+"' ><span style='font-size:14px;margin-left:10px;margin-top:20px;display: inline-block;'>"+obj.accountNo+"</span><br /><span style='font-size:12px;margin-left:10px;margin-top:10px;display: inline-block;'>Effective Available Balance</span><br /><span style='font-size:20px;margin-left:10px;margin-top:10px;display: inline-block;'>"+obj.clearBalance+"</span></div></a>" );
						if(accounts_list_for_transfer.length > 0)
							accounts_list_for_transfer = accounts_list_for_transfer + "," +obj.accountNo ;
						else
							accounts_list_for_transfer = accounts_list_for_transfer + obj.accountNo ;
						if(accounts_list_for_transfer_to.length > 0)
							accounts_list_for_transfer_to = accounts_list_for_transfer_to + "," +obj.accountNo ;
						else
							accounts_list_for_transfer_to = accounts_list_for_transfer_to + obj.accountNo ;
					}
					else if(obj.accountType === "F" )
					{
						$( "#fd" ).append( "<a href='./mini_statement.html?accountNo="+obj.accountNo+"&amount="+obj.clearBalance+"'><div  style='border: 2px solid;border-radius: 25px;background-color:#fbeded;color:#d9534f;margin-bottom:10px;font-weight: bold;min-height: 120px;margin-top:10px' id='_"+obj.accountNo+"' ><span style='font-size:14px;margin-left:10px;margin-top:20px;display: inline-block;'>"+obj.accountNo+"</span><br /><span style='font-size:12px;margin-left:10px;margin-top:10px;display: inline-block;'>Effective Available Balance</span><br /><span style='font-size:20px;margin-left:10px;margin-top:10px;display: inline-block;'>"+obj.clearBalance+"</span></div></a>" );
					}
					else if(obj.accountType === "D" || obj.accountType === "T")
					{
						$( "#loan" ).append( "<a href='./mini_statement.html?accountNo="+obj.accountNo+"&amount="+obj.clearBalance+"'><div  style='border: 2px solid;border-radius: 25px;background-color:#fbeded;color:#d9534f;margin-bottom:10px;font-weight: bold;min-height: 120px;margin-top:10px' id='_"+obj.accountNo+"' ><span style='font-size:14px;margin-left:10px;margin-top:20px;display: inline-block;'>"+obj.accountNo+"</span><br /><span style='font-size:12px;margin-left:10px;margin-top:10px;display: inline-block;'>Effective Available Balance</span><br /><span style='font-size:20px;margin-left:10px;margin-top:10px;display: inline-block;'>"+obj.clearBalance+"</span></div></a>" );
					if(accounts_list_for_transfer_to.length > 0)
						accounts_list_for_transfer_to = accounts_list_for_transfer_to + "," +obj.accountNo ;
					else
						accounts_list_for_transfer_to = accounts_list_for_transfer_to + obj.accountNo ;

					}
						

			
			});
			
			sessionStorage.accounts_list = accounts_list;
			sessionStorage.accounts_list_for_transfer = accounts_list_for_transfer;
			sessionStorage.accounts_list_for_transfer_to = accounts_list_for_transfer_to;
			$('#spinner').hide();
	}
	function getMiniStatementData(response)
	{

		//$( "#recent_transaction" ).append( "<ul data-role='listview' style='list-style: none;'>" );

		
		eval('var objArray='+response);
		objArray.tranList.forEach(function(obj){
				//alert(obj.narration);
				$( "#recent_transaction_list" ).append( "<li><div style='border: 0px solid;border-radius: 25px;background-color:#ffffff;margin-bottom:5px;font-weight: bold;min-height: 60px;margin-top:5px' id='account_div' ><span style='font-size:18px;margin-left:10px;margin-top:10px;display: inline-block;' id='account_number'>"+(obj.trdDate.split(" "))[0]+"</span><span style='font-size:20px;float:right;margin-top:10px;color:#d9534f;' id='account_label'>Rs. "+obj.trdAmt+" <span style='font-size:20px;display: inline-block;color:#C0C0C0;' >"+obj.trdDrCr+"</span></span><br /><span style='font-size:16px;margin-left:10px;margin-top:10px;display: inline-block;color:#C0C0C0;' id='account_amount'>"+obj.narration+"</span></div></li><hr/>" );
		});
			
		//$( "#recent_transaction" ).append( "</ul>" );
		$('#spinner').hide();
	}
	
	function getDetailedStatement()
	{
		fromDate = $("#fromDate").val();
		toDate = $("#toDate").val();
		if(fromDate.length > 0 && toDate.length > 0)
		{
		
			//alert(fromDate+"\n"+toDate);
			fromDateArray = fromDate.split("-");
			toDateArray = toDate.split("-");
			//alert(fromDateArray);
			//alert(toDateArray);
			
			
			var sUrl = "http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=getDetailStatement&accNo="+accountNumber+"&fromDate="+fromDateArray[2]+"/"+fromDateArray[1]+"/"+fromDateArray[0]+"&toDate="+toDateArray[2]+"/"+toDateArray[1]+"/"+toDateArray[0]+"&sessionID="+sessionStorage.sessionID;
		   
			
		///////////////////	var sUrl = "http://"+serverIP+":"+serverPort+"/AccountInfoAction.do?action=getDetailStatement&accNo="+accountNumber+"&fromDate="+fromDateArray[2]+"/"+fromDateArray[1]+"/"+fromDateArray[0]+"&toDate="+toDateArray[2]+"/"+toDateArray[1]+"/"+toDateArray[0];
		    if(debug_version)
		    	alert(sUrl);
			
			
			//var sUrl = "http://192.168.1.72:8290/AccountInfoAction.do?action=getDetailStatement&accNo=002010006515&fromDate=01/02/2015&toDate=31/03/2015";
		    window.location = sUrl;
			
			//myWindow =window.open(sUrl, '_self');
			// window.location.assign(sUrl);
		}
		else
			alert("Please Specify Period for Detailed Statement");
		$('#spinner').hide();
	}
	
    function back()
    {
    	//alert("Back " );
    	window.history.back();
    }
function clearAll()
{
	sessionStorage.clear();
    localStorage.clear();
}
function close()
{
	Android.logOutExit();
}
	function login()
		{
			
			
			
			
			userID = $("#login-username").val();
			password = $("#login-password").val();
			//alert(imeiNumber);
			//alert("Going to login="+userID);
			
			if(userID.length == 0 )
				showAlert("Error", "Please Enter User ID");
			else if(password.length == 0 )
				showAlert("Error", "Please Enter Password");
			 else 
			 {
			 		//var str = "bank";
					//str_encoded = calcMD5(str);
					clearAll();

					sessionStorage.userID = userID;
					sessionStorage.password = calcMD5(password);//password;
					sessionStorage.imeiNumber = imeiNumber;
					sessionStorage.simNumber = simNumber;

					getData("authenticate", "");
					//location.href="home.html";
		
	 		  }
		}

	function chequeBookOrderResponse()
	{
		if (http.readyState == 4)
    	{
        		// Check that a successful server response was received
        		if (http.status == 200)
        		{
            		
            		//alert(http.responseText);
            		if(http.responseText === 'SUCCESS')
            			showAlert("alert-div-cheque-book", "Request Successfully Processed", "");
            		else
            			showAlert("alert-div-cheque-book", "Error :", "Unable to Process Request");
					
	    		}
				else
				{
					showAlert("alert-div-cheque-book", "Error :", "Unable to Process Request");
					// An HTTP problem has occurred
						//alert("HTTP error: " + http.status);
				}
				$('#spinner').hide();
       }
	}	
	function chequeEnquiryResponse()
	{
		if (http.readyState == 4)
    	{
        		// Check that a successful server response was received
        		if (http.status == 200)
        		{
            		
            		//alert(http.responseText);
            		showAlert("alert-div-cheque-enquiry", http.responseText, "");
            		
					
	    		}
				else
				{
					showAlert("alert-div-cheque-enquiry", "Error :", "Unable to Process Request");
					// An HTTP problem has occurred
						//alert("HTTP error: " + http.status);
				}
				$('#spinner').hide();
       }
	}	
	function chequeStopPaymentResponse()
	{
		if (http.readyState == 4)
    	{
        		// Check that a successful server response was received
        		if (http.status == 200)
        		{
            		
            		//alert(http.responseText);
            		
            		
            		if(http.responseText === 'SUCCESS')
            			showAlert("alert-div-stop-payment", "Request Successfully Processed", "");
            		else
            		{
            			var objArray=(http.responseText).split(",");
            			showAlert("alert-div-stop-payment","Error :", objArray[1].slice(0,-1));
            		}
					
	    		}
				else
				{
					showAlert("alert-div-stop-payment","Error :", "Unable to Process Request");
					// An HTTP problem has occurred
						//alert("HTTP error: " + http.status);
				}
				$('#spinner').hide();
       }
	}	
	
	function readJSONFile(fileName) {

		if(fileName === "payees")
			var jsonDataArray = JSON.parse(payees);
		return jsonDataArray;
		
		
		
		
		
		/*var jsonDataArray = JSON.parse(data);
	
		for (var i=0; i < jsonDataArray.length; i++)
		{
			alert(jsonDataArray[i].nickName +" :: "+ jsonDataArray[i].accNo);
		}
		*/

	}
	
	function readPayees(fileName) {
		if(fileName === "payees")
		var jsonDataArray = JSON.parse(payees);
		return jsonDataArray;
		
		
		/*
		//for (var i=0; i < jsonDataArray.length; i++)
		//{
		//	alert(jsonDataArray[i].nickName +" :: "+ jsonDataArray[i].accNo);
		//}
		*/

	}




// for same bank but for others account
	function confirmedPayeeResponse()
	{
	
		if (http.readyState == 4)
    	{
    	//alert(http.status);
        		// Check that a successful server response was received
        		if (http.status == 200)
        		{
            		
            		//alert(http.responseText);
            		
					eval('var objArray='+http.responseText);
			
					var s= document.getElementById('to_accounts_others');
				//	var s1= document.getElementById('to_accounts_IMPS');

						if(s.options.length == 1)
						{
							for (var i in objArray) {
								s.options[s.options.length]= new Option( objArray[i].accNo+" "+objArray[i].nickName+" "+objArray[i].mobileNo, objArray[i].accNo);
				//				s1.options[s1.options.length]= new Option( objArray[i].accNo+" "+objArray[i].nickName+" "+objArray[i].mobileNo, objArray[i].accNo);
							}
						}

					
	    		}
				
				$('#spinner').hide();
       }
	
	}

function OTPResponse()
	{
		if (http.readyState == 4)
    	{
        		// Check that a successful server response was received
        		if (http.status == 200)
        		{
            		if(debug_version)
            			alert("OTP Response if="+http.responseText);
            		eval('var obj='+http.responseText);
            		if(obj.authorise.toLowerCase() === 'Success'.toLowerCase())
            		{
            			//showAlert("alert-div-self","OTP Sent To Mobile Number ", obj.mobileNo);
            			location.href="fund_transfer_same_bank_confirm.html?from="+from+"&to="+to+"&amount="+amount+"&remarks="+remarks+"&mobileNo="+obj.mobileNo;
            		}
					else
						showAlert("alert-div-self","Error", " Unable to send OTP");
	    		}
				else
				{
					if(debug_version)
                        alert("OTP Response else="+http.responseText);
					//showAlert("alert-div-self","Error", http.responseText);
				}
				$('#spinner').hide();
				$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
				//clearInterval(otpTask);
       }
	}		
	
	function fundTransferResponse()
	{
		if (http.readyState == 4)
    	{
        		// Check that a successful server response was received
        		if (http.status == 200)
        		{
            		if(debug_version)
            			alert("Fund Transfer Response="+http.responseText);
            		eval('var obj='+http.responseText);
            		//alert(obj.result);
            		if(obj.result.toLowerCase() === 'Success'.toLowerCase())
            		{
            			//showAlert("alert-div", "Request Successfully Processed", "");
            			if(debug_version)
            				alert("Request Successfully Processed");
            		/////	location.href="home.html";
            			if(obj.transactionID === '-1')
            				showAlert("alert-div","Error :", 'Invalid OTP '+obj.Error);
            			else
            			{
            				sessionStorage.removeItem("accounts");
                            getData("accounts",sessionStorage.customerID);//custID
            				showAlert("alert-div","Fund Transfer Done Successfully, Transaction ID :", "  "+obj.transactionID);
            				document.getElementById("fund_transfer_submit").disabled = true;
            			}
            		}
            		else
            		{
            			
            			showAlert("alert-div","Error :", obj.Error);
            		}
					$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
	    		}
				else
				{
					
				}
				$('#spinner').hide();
       }
	}	
	
	
	
	
	
	
	function addPayeeSameBankResponse()
	{
		if (http.readyState == 4)
    	{
        		// Check that a successful server response was received
        		if (http.status == 200)
        		{
            		if(debug_version)
            			alert("addPayeeSameBankResponse="+http.responseText);
            		eval('var obj='+http.responseText);
            		//alert(obj.result);
            		if(obj.authorise.toLowerCase() === 'Success'.toLowerCase())
            		{
            			//showAlert("alert-div", "Request Successfully Processed", "");
            			if(debug_version)
            				alert("Request Successfully Processed");
            			location.href="manage_payee.html";
            			
            		}
            		else
            		{
            			
            			showAlert("alert-div","Error :", "Unable to Process Request");
            		}
					$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
	    		}
				else
				{
					
				}
				$('#spinner').hide();
       }
	}	
	//for imps
	       function accinfoResponse()
        {

        if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
                		                 var res='{"test":'+http.responseText+'}';
                                        // alert(res);
                                         var response=JSON.parse(res);
                                         //alert("nick name="+response.test[0].nickName);
                                         document.getElementById("payee_name").value=response.test[0].payeeName;
                                         document.getElementById("account_number").value=response.test[0].accNo;
                           				 document.getElementById("mob_no").value=response.test[0].mobileNo;
                                         document.getElementById("nick_name").value=response.test[0].nickName;
                                         document.getElementById("ifsc_code").value=response.test[0].ifsCode;
                        			    $('#spinner').hide();

                		}
        }
        }
          function accinfoIMPSResponse()
                {

                if (http.readyState == 4)
                    	{
                        		// Check that a successful server response was received
                        		if (http.status == 200)
                        		{
                        		alert(http.responseText);
                        		var response=http.responseText;
                        		if(response.length > 0)
                                			{
                                				 var res='{"test":'+http.responseText+'}';
                                				  var response=JSON.parse(res);
                                                  document.getElementById("payee_name_IMPS").value=response.test[0].payeeName;
                                                  document.getElementById("account_number_IMPS").value=response.test[0].accNo;
                                                  document.getElementById("mob_no_IMPS").value=response.test[0].mobileNo;
                                                  document.getElementById("nick_name_IMPS").value=response.test[0].nickName;
                                                  document.getElementById("ifsc_code_IMPS").value=response.test[0].ifsCode;

                                                  $('#spinner').hide();
                                				}
                        		}
                }
                }
	function fundtransferotherbankOTPResponse()
	{
	if (http.readyState == 4)
        	{
            		// Check that a successful server response was received
            		if (http.status == 200)
            		{
                		if(debug_version)
                			alert("OTP Response if="+http.responseText);
                		eval('var obj='+http.responseText);
                		if(obj.authorise.toLowerCase() === 'Success'.toLowerCase())
                		{
                			//showAlert("alert-div-self","OTP Sent To Mobile Number ", obj.mobileNo);
                			location.href="fund_transfer_other_bank_confirm.html?from="+from+"&to="+to+"&amount="+amount+"&remarks="+remarks+"&mobileNo="+obj.mobileNo;
                		}
    					else
    						showAlert("alert-div-self","Error", " Unable to send OTP");
    	    		}
    				else
    				{
    					if(debug_version)
                            alert("OTP Response else="+http.responseText);
    					//showAlert("alert-div-self","Error", http.responseText);
    				}
    				$('#spinner').hide();
    				$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
    				//clearInterval(otpTask);

	}
	
	}
	function cashCollection()
    	{
    		if(http.readyState == 4)
    		{
    				if(http.status == 200)
    				{

    					if(debug_version)
    		                	{
    	                        		eval('var obj='+http.responseText);
            	                		if(obj.customerName =="")
                    	        		{
                            			document.getElementById("demo").innerHTML="Invalid Account No";
                            			document.getElementById("acName").value="";
                            			}

    	                        		else
            	                		{
                    	        		document.getElementById("demo").innerHTML="";
                            			document.getElementById("userAcName").value=obj.customerName;
                            			}
    					}
    				}
    		}
    	}

    function transactionProceed()
    	{

    		var useraccount=$("#acName").val();
    		var uName=$('#userAcName').val();
    		var amount=$('#useramount').val();
    		var narration=$('#narration').val();
    		alert("hello");
    		alert(useraccount);
    		sessionStorage.useraccount=useraccount;
    		sessionStorage.uName=uName;
    		sessionStorage.amount=amount;
    		sessionStorage.narration=narration;
    		getData("transactionProceed","");
    	}

    function cancle()
    	{
    		document.getElementById("acName").value="";
    		document.getElementById("userAcName").value="";
    		document.getElementById("useramount").value="";
    		document.getElementById("narration").value="";
    	}

    function transactionProceedResponse()
    	{
    	    alert(http.status);
    		if(http.readyState == 4)
    		{
    				if(http.status == 200)
    				{
    					if(debug_version)
    					alert(http.responseText);
    	                		{
            	        			eval('var obj='+http.responseText);
            	        			alert(obj.transactionID);
                    				if(obj.transactionID>0)
                    				{
                    				alert("Transaction Successful");
                    				cancle();
                    				}
                    				else
                    				{
                    					alert("Transaction not Complete");
                    				}
                    			}
                    			 $('#spinner').hide();
                    		}
    		}
    	}

 function getName()
 {
        var acname=$("#acName").val();
        if(acname!=null)
        {
       	 	sessionStorage.acname=acname;
        	getData("acname","");
        $('#spinner').hide();
		}

  }
	function fundTransferIMPSResponse()
	{
alert("response");
	if(http.readyState == 4)
        		{
        				if(http.status == 200)
        				{
        					if(debug_version)
        					alert(http.responseText);
	                    }
	            }
	}

	
	function allPayeeListResponse(){
          	if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
                			if(debug_version)
                    			alert(http.responseText);

                    		eval('var objArray='+http.responseText);


    						for (var i=0; i < objArray.length; i++)
    						{

    							$('#added_payee_table').append("<tr><td><input type='radio' name='tobdelete_payee' id='' value="+objArray[i].accNo+" /></td><td>"+objArray[i].payeeName+"</td><td>"+objArray[i].accNo+"</td><td>Confirmed</td></tr>");

    						}

    					}
    					else
    					{
    						// An HTTP problem has occurred
    						alert("HTTP error: " + http.status);
    					}
    					$('#spinner').hide();
                }
        }

		function deletePayeeResponse()
       	{
                		if(debug_version)
                			alert("deletePayeeResponse");
                		if (http.readyState == 4)
                    	{
                        		// Check that a successful server response was received
                        		if (http.status == 200)
                        		{
        							if(debug_version)
                            			alert(http.responseText);
                            		eval('var obj='+http.responseText);
                            		if(debug_version)
                            			alert(obj.result);
                            		if(obj.result === 'success')
                            			showAlert("alert-div-delete", "Payee Deleted Successfully.", "");
                            		else
                            		{

                            			showAlert("alert-div-delete","Error :", obj.Error);
                            		}
                					$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
                	    		}
								location.href="manage_payee.html";
                				$('#spinner').hide();
                       }
       	}
       	
       	function appActivationResponse()
        {

        		if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
							if(debug_version)
                    			alert(http.responseText);
                    		eval('var obj='+http.responseText);
                    		if(debug_version)
                    			alert(obj.result);
                    		if(obj.result === 'success')
                    		{
                    			localStorage.ActivationPIN = "activated";
                                location.href="login.html?imeiNumber="+sessionStorage.imeiNumber+"&simNumber="+sessionStorage.simNumber ;

                    		}

                    			//showAlert("alert-div", "Password Updated, Please Login with New Password", "");
                    		else
                    		{
                    			showAlert("alert-div","Error :", "Problem in Activation");
                    		}
        					$('#container-div').scrollTop($('#container-div').scrollTop()+"px");
        	    		}
        				else
        				{

        				}
        				$('#spinner').hide();
               }
        }
       	
       	function setOTP(otp)
		{
			$("#otp").val(otp);
		}

	     function processdata2()
         {
         			if (http.readyState == 4)
            			   {
                						// Check that a successful server response was received
                						if (http.status == 200)
                			   {
                							var resArray=http.responseText;
                							alert(resArray);
                							var jsonData = JSON.parse(resArray);
                							if(sessionStorage.id=="bank_from_a/cno")
                				   {
                							document.getElementById('bank_from_name').value=jsonData.customerName;
                					        document.getElementById('bank_from_mobno').value=jsonData.mobileNo;
                				   }else{
                							document.getElementById('bank_to_name').value=jsonData.customerName;
                							document.getElementById('bank_to_mobno').value=jsonData.mobileNo;
                				   }


                						}
                					}

                }
                function processdata1()
                {
                							if (http.readyState == 4)
                			   {
                						// Check that a successful server response was received
                						if (http.status == 200)
                			   {

                					var resArray=http.responseText;
                					alert(resArray);
                					var jsonData = JSON.parse(resArray);
                					document.getElementById("webData").value=resArray;
                					 for(var i=0;i<jsonData.length;i++){
                					 var nameList = jsonData[i].acsName;
                					 var kid=jsonData[i].acsKid;
                                     select = document.getElementById('cname');
                			         var opt = document.createElement('option');
                			         opt.value = kid;
                			         opt.innerHTML = nameList;
                			         select.appendChild(opt);

                				  }
                						}
                					}

            	}


            	function processdata()
            	{
            			 if (http.readyState == 4)
            			{
            				if (http.status == 200)
            				{
            					var resArray=http.responseText;
            				    var jsonData = JSON.parse(resArray);
            					alert(jsonData);
                  				document.getElementById("commission").value=jsonData;

            				}
            			}
            	}
            	function processResOTP()
            	{
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
            	function process(){
                    		if (http.readyState == 4)
                    			{
                    				if (http.status == 200)
                    				{
                    					   var resArray=http.responseText;
                    					   var jsonData = JSON.parse(resArray);
                    					   alert(jsonData);


                    				}
                    			}

                	}
                  	function processdata3()
                        	{
                        		 if (http.readyState == 4)
                                {
                                    if (http.status == 200)
                                    {
                        				   var resArray=http.responseText;
                        				  var jsonData = JSON.parse(resArray);
                        				   document.getElementById("webData").value=resArray;
                        				  for(var i=0;i<jsonData.length;i++){
                        					 var nameList = jsonData[i].from_name;
                        					 var kid=jsonData[i].agntrn_kid;
                                             select = document.getElementById('cname');
                        			         var opt = document.createElement('option');
                        			         opt.value = kid;
                        			         opt.innerHTML = nameList;
                        			         select.appendChild(opt);

                        				  }


                        			}
                        		}
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
            		function processdata4()
            		{
            			 if (http.readyState == 4)
            			{
            				if (http.status == 200)
            				{
            					var resArray=http.responseText;
            				    var jsonData = JSON.parse(resArray);
            					alert(jsonData);
            				}
            			}
            		}

             	}
            	function cashprocessdata2()
             	{
             					if (http.readyState == 4)
                 			   {
                 						// Check that a successful server response was received
                 						if (http.status == 200)
                 			   {
                 							var resArray=http.responseText;
                 							alert(resArray);
                 							var jsonData = JSON.parse(resArray);
                 							document.getElementById('bank_from_name').value=jsonData.customerName;
                 					        document.getElementById('bank_from_mobno').value=jsonData.mobileNo;
                 					        document.getElementById('bank_from_ifsc').value=jsonData.mobileNo;

                 			   }



                	 }

                 }
	
	
	function searchagentresponse()
	{
	if (http.readyState == 4)
        	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
                			if(debug_version)
                    			alert(http.responseText);

                    		eval('var objArray='+http.responseText);


    						for (var i=0; i < objArray.length; i++)
    						{

    							$('#agent_table').append("<tr><td>"+objArray[i].acsName+"</td></tr>");

    						}

    					}
    					else
    					{
    						// An HTTP problem has occurred
    						alert("HTTP error: " + http.status);
    					}
    					$('#spinner').hide();
                }
	}
	
	function deactivateAtmresponse()
	{
		if (http.readyState == 4)
            	{
                		// Check that a successful server response was received
                		if (http.status == 200)
                		{
                			if(debug_version)
                    			alert(http.responseText);

                    	//	eval('var objArray='+http.responseText);
											var resArray1=http.responseText;
											var jsonData1=JSON.parse(resArray1);
											if(jsonData1=="Y")
											{
							       				alert("ATM Deactivated Successfully");
												//return true;
											}
											else
											{
												alert("ATM not deactivated Successfully");
												//return true;
											}

    					}
    					else
    					{
    						// An HTTP problem has occurred
    						alert("HTTP error: " + http.status);
    					}
    					$('#spinner').hide();
                }
	}

	function showPosition(position) {
	 var format = localStorage.getItem("y");
	     latitude = (position.coords.latitude).toString().substring(0,7);
	     longitude = (position.coords.longitude).toString().substring(0,7);
   	}
   	

function searchnearBranchlocation()
 {
 if (http.readyState == 4)
             {
                   // Check that a successful server response was received
                  if (http.status == 200)
                  {

                  if(debug_version)
                      alert("http.responseText"+http.responseText);
                     eval(' var objArray='+http.responseText);

        var locations = [
                                           [objArray[0].brnName,objArray[0].brnlat,objArray[0].longi, 3],
                                           [objArray[1].brnName, objArray[1].brnlat,  objArray[1].longi, 2],
                                           [objArray[2].brnName, objArray[2].brnlat,objArray[2].longi, 1]
                                    ];
      var map = new google.maps.Map(document.getElementById('map'), {
                                  zoom: 10,
                                  center: new google.maps.LatLng(26.8121, 75.7419),
                                  mapTypeId: google.maps.MapTypeId.ROADMAP
                                });

                                var infowindow = new google.maps.InfoWindow();

                                var marker, i;

                                for (i = 0; i < locations.length; i++) {
                                  marker = new google.maps.Marker({
                                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                    map: map
                                  });

                                  google.maps.event.addListener(marker, 'click', (function(marker, i) {
                                    return function() {
                                      infowindow.setContent(locations[i][0]);
                                      infowindow.open(map, marker);
                                    }
                                  })(marker, i));
                                  }
         }
         else
         {
          // An HTTP problem has occurred
          alert("HTTP error: " + http.status);
         }
         $('#spinner').hide();
      }
 }

function getPreference()
{
	
	 var lastlogintime,fmt,timefmt,flag ;
	
	if (typeof(Storage) !== "undefined") {
	  if (localStorage.getItem("mdate")!== null) {
	            fmt = localStorage.getItem("mdate");
	         if (localStorage.getItem("mtime")!== null) {
	       	    timefmt = localStorage.getItem("mtime");
	       	    alert(timefmt);
	       	    if(timefmt == "24 hrs")
	       	    {  flag = timefmt;
	       	     } else
	       	     {
	       	     flag = timefmt;
	       	     }
	         } else
	          {      //alert("No Preferewnces available for time format. Default settings will apply.")
	                   $("#lastLogin").text("Last Logged in on "+sessionStorage.lastLogin);
	                 alert("No Preferences Available.Default settings will apply.");
	         }
	         } else {
	         //alert(sessionStorage.lastLogin);
	    $("#lastLogin").text("Last Logged in on "+sessionStorage.lastLogin);
	    alert("No Preferences Available.Default settings will apply.");
	    return ;
	     }
	} else {
	  $("#lastLogin").text("Last Logged in on "+sessionStorage.lastLogin);
	    alert( "Sorry, your browser does not support Web Storage...");
	}
	      var mydate,mytime, restime  ;
	
		var m1;
		 lastlogintime = sessionStorage.lastLogin.toString();
			 logintime = lastlogintime.substring(11,21);
					var d,m,y,month;
					d = lastlogintime.substring(8,10);
					m = lastlogintime.substring(5,7);
					y= lastlogintime.substring(0,4);
	
					var hr,min,sec,sec1;
					hr = logintime.substring(0,2);
					min = logintime.substring(3,5);
					sec = logintime.substring(6,8);
					sec1 = logintime.substring(9,10);
	       if(m<10)
		   {
		   m1 = m.substring(1,2)-1;
		   }
	   if(flag == "12 hrs") {
	   if(logintime.substring(0,2)>=12)
	   {
	   var hr1 = hr-12;
	    logintime = hr1+":"+min+":"+sec+"."+sec1+"PM";
	   } else { //alert("12hrels");
	   }  }
	
	
	    else if(flag == "24 hrs ") {
	   if(logintime.substring(0,2)<=12)
	   {
	 var hr1 = +hr + 12;
	 logintime = hr1+":"+min+":"+sec+"."+sec1+"PM";
	   }  else { //alert("24hrelse");
	   } }
	
	var month = new Array();
	    month[0] = "January";
	    month[1] = "February";
	    month[2] = "March";
	    month[3] = "April";
	    month[4] = "May";
	    month[5] = "June";
	    month[6] = "July";
	    month[7] = "August";
	    month[8] = "September";
	    month[9] = "October";
	    month[10] = "November";
	    month[11] = "December";
	
	     month = month[m1];
		   debugger;
					if(fmt!=null&&fmt === "DD.MM.YYYY")
					{
					mydate = d+"."+m+"."+y;
					alert("mydate "+mydate);
					} else if(fmt!=null&&fmt === "MONTH-DD-YYYY")
					{
					 mydate = month+"-"+d+"-"+y;
					alert("mydate "+mydate);
					} else if(fmt!=null&&fmt === "YYYY-DD-MM")
	                {
	                				 mydate = m+"-"+d+"-"+y;
	                				alert("mydate "+mydate);
	                }
	                else if(fmt!=null&&fmt === "MM/DD/YYYY")
	                {
	                                				 mydate = m+"/"+d+"/"+y;
	                                				alert("mydate "+mydate);
	                }
	                 else if(fmt!=null&&fmt === "DD-MM-YYYY")
	                                {
	                                 	 mydate = d+"-"+m+"-"+y;
	                                     alert("mydate "+mydate);
	                                }
				var res = mydate+" "+logintime;
				$("#lastLogin").text("Last Logged in on "+res);
}

// method to convert amount to indian format

function processAmountData(amt,id)
{
		var mamt,num =0,isamtformatavail = "false";
		debugger;
		if (typeof(Storage) !== "undefined") {
		//if (localStorage.getItem("y")!== null && localStorage.getItem("q")!== null) {
		  if (localStorage.getItem("mamt")!== null) {
		mamt = localStorage.getItem("mamt");
		isamtformatavail = "true";
		if(mamt == "2Digit")
		{
		num = 2;
		} else { num = 3;}
		  } else { // no seting avail
		  alert("No Preferences Available.Default settings will apply.");
		  }
		  } else { //storage na
		   alert( "Sorry, your browser does not support Web Storage...");
		  }
		
		var x = amt;
		var id = id;
		x=x.toString();
		var afterPoint = '';
		if(x.indexOf('.') > 0)
		   afterPoint = x.substring(x.indexOf('.'),x.length);
		   if(isamtformatavail=="true")
		   {
		   afterPoint = afterPoint.substring(0,num+1);
		   }
		x = Math.floor(x);
		x=x.toString();
		var lastThree = x.substring(x.length-3);
		var otherNumbers = x.substring(0,x.length-3);
		if(otherNumbers != '')
		    lastThree = ',' + lastThree;
		var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
		document.getElementById(id).value = res;

 }

   	function createCIN(){
	    location.href="http://"+serverIP+":"+serverCBSPort+"/CobaSys/CustId/CMMCustomerIdPreAction.do?cmmmode=new&appSrc=TABBANKING&custID="+sessionStorage.customerID;
	} 
  
  function openAcount(){
     location.href="http://"+serverIP+":"+serverCBSPort+"/CobaSys/account/acopen/acOpen.do?action=executeOpen&param=1101&appSrc=TABBANKING&custID=" + sessionStorage.customerID+"&atpType=S";
	} 
	
function openFD(){
           var murl = "http://"+serverIP+":"+serverPort+"/request/FdRequest.do?action=saveFdReqest";  
 		   location.href= murl;
                } 

       function openRD(){
       location.href= "http://"+serverIP+":"+serverCBSPort+"/CobaSys//account/acopen/acOpen.do?action=executeOpen&param=1101&appSrc=TABBANKING&custID="+sessionStorage.customerID+"&atpType=E";
		  } 

     	function fundTransfer(){
           var murl = "http://"+serverIP+":"+serverPort+"/TransactionAction.do?action=PayeeWithinBank&mode=S";  
 		   location.href= murl;
	} 
