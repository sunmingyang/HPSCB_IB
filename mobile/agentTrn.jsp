	<%@ include file="/common/Include.jsp" %>
	<%
		String accountList="" ; 
		String [] AccListArr= null ; 
		if (session.getAttribute("allAccountlist") != null ) { 
		   accountList=(String)session.getAttribute("allAccountlist");
		   AccListArr =accountList.split(",");
		}
		String userInfo[][] = null;
 		if (session.getAttribute("userInfo") != null ) {
 			userInfo = (String [][])session.getAttribute("userInfo");
 		}
	    int errorcount=0;
		String usrName = "";
		 String AccINFO[][] = (String[][])session.getAttribute("AccINFO"); 
		 System.out.println(AccINFO);
		if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
		String login_id="";
		if(session.getAttribute("userid")!=null){
			login_id = (String)session.getAttribute("userid");
			System.out.println("snxw--------------------------"+login_id);
		}
		String isHold="";
		String isFailed = "";
		if(request.getParameter("holdTran")!=null){
		   isHold = (String)request.getParameter("holdTran");
		   
		}
		else if(request.getParameter("isFailed")!=null)
   		isFailed=(String)request.getParameter("isFailed");
  		String [][] sData=null;
	%>
	<script>

	function fillData()
 {
	   
	    <% 
	    if(isHold.equals("true"))
   			sData=(String[][])session.getAttribute("holdTranData");
    	else if(isFailed.equals("true"))
   			sData=(String[][])session.getAttribute("failedTrn");
    	if(sData!=null){
     	int i=Integer.parseInt(request.getParameter("tranid"));
   	    /*for(int i=0;i<sData.length;i++)
	     System.out.println(i+"        "+sData[i]);*/
	    if(sData[i][1].charAt(0)=='C'){%>
	     document.getElementById("location").checked=true;
	     document.getElementById("locationN").disabled=true;
	     document.getElementById("cust_Id").value="<%=sData[i][19]%>";
	     document.getElementById("cash_from_name").value="<%=sData[i][2]%>";
	     document.getElementById("cash_from_address").value="<%=sData[i][3]%>";
	     document.getElementById("cash_from_state").value="<%=sData[i][6]%>";
	     document.getElementById("cash_from_city").value="<%=sData[i][4]%>";
	     document.getElementById("cash_from_pincode").value="<%=sData[i][5]%>";
	     document.getElementById("cash_from_mobno").value="<%=sData[i][7]%>";
	     document.getElementById('detailsT').style.display="none";
	  <%}else if(sData[i][1].charAt(0)=='B'){%>
	     document.getElementById("locationN").checked=true;
	     document.getElementById("location").disabled=true;
	     document.getElementById("bank_from_a/cno").value="<%=sData[i][0]%>";
	     document.getElementById("bank_from_name").value="<%=sData[i][2]%>";
	     document.getElementById("bank_from_mobno").value="<%=sData[i][7]%>";
	     document.getElementById('detailsF').style.display="none";
	  <%}
	     if(sData[i][1].charAt(2)=='C'){%>
	     document.getElementById("tolocation").checked=true;
	     document.getElementById("tolocationN").disabled=true;
	     document.getElementById("cash_to_Id").value="<%=sData[i][20]%>";
	     document.getElementById("cash_to_name").value="<%=sData[i][8]%>";
	     document.getElementById("cash_to_address").value="<%=sData[i][9]%>";
	     document.getElementById("cash_to_state").value="<%=sData[i][12]%>";
	     document.getElementById("cash_to_city").value="<%=sData[i][10]%>";
	     document.getElementById("cash_to_pincode").value="<%=sData[i][11]%>";
	     document.getElementById("cash_to_mobno").value="<%=sData[i][13]%>"; 
	     var  select = document.getElementById('cname');
	           var opt = document.createElement('option');
	            opt.value ="<%=sData[i][15]%>" ;
	            opt.innerHTML ="<%=sData[i][21]%>";
	            select.appendChild(opt);
	      document.getElementById('cname').value="<%=sData[i][15]%>";
	     
	     document.getElementById('todetailsT').style.display="none";
	   <%}else if(sData[i][1].charAt(2)=='B'){%>
	       document.getElementById("tolocationN").checked=true;
	     document.getElementById("tolocation").disabled=true;
	     document.getElementById("bank_to_a/cno").value="<%=sData[i][14]%>";
	     document.getElementById("bank_to_name").value="<%=sData[i][8]%>";
	     document.getElementById("bank_to_mobno").value="<%=sData[i][13]%>";
	     document.getElementById("bank_to_ifsc").value="<%=sData[i][16]%>";
	     document.getElementById('todetailsF').style.display="none";
	   <%}%>
	    <%if(isHold.equals("true")){%>
     		document.getElementById('otptable').style.display="none";
		 <%}else if(isFailed.equals("true")){%>
		     document.getElementById("ok").style.display="none";
		     document.getElementById("cancel").style.display="none";
		     document.getElementById('otptable').style.display="block";
		<%}%>
	   
	    document.getElementById("amount").value="<%=sData[i][17]%>";
	    document.getElementById("commission").value="<%=sData[i][18]%>";
	    
	     
	 <% }else{%>
	   document.getElementById('detailsT').style.display="none";
	   document.getElementById('detailsF').style.display="none";
	   document.getElementById('todetailsT').style.display="none";
	   document.getElementById('todetailsF').style.display="none";
	   document.getElementById('otptable').style.display="none";
	  <%}%>
	   acc_bal();
	}
	function acc_bal()
   	{
    	var ran=parseInt(Math.random()*9999);
        var URL ="/AccountInfoAction.do?action=fetchCustomerAccounts&custID="+<%=userInfo[0][8]%>+"&ran="+ran;
     	http.open("POST",URL,false);
  		http.onreadystatechange= function (){processAccount()};
  		http.send(null);
   	}
	function processAccount()
   	{
    	if (http.readyState == 4)
     	{
	      	if (http.status == 200)
	      	{
	       		var resArray=http.responseText;
	       		var jsonData = JSON.parse(resArray);
				var bal=parseFloat(jsonData.accountInformation[0].clearBalance );
				var Afterbal= bal.toFixed(2);
	       		document.getElementById("acbal").value=Afterbal ;
	      	}
     	}
  	}
	
	function change()
	{
		if(document.getElementById("location").checked){
			document.getElementById('detailsT').style.display="none";
	        document.getElementById('detailsF').style.display="block";
			document.getElementById("location").value="location1"
			document.getElementById("location").checked=true;
			document.getElementById('detailsT').style.display="none";
		}else{
		
			document.getElementById("locationN").value="location2"
			document.getElementById("locationN").checked=true;
			document.getElementById('detailsT').style.display="block";
			document.getElementById('detailsF').style.display="none";
		}

	}
	function tochange()
	{
		if(document.getElementById("tolocation").checked){
			 document.getElementById('todetailsT').style.display="none";
	         document.getElementById('todetailsF').style.display="block";
			 document.getElementById("tolocation").value="tolocation1"
			 document.getElementById("tolocation").checked=true;
			 document.getElementById('todetailsT').style.display="none";
		}else{
		
			document.getElementById("tolocationN").value="tolocation2"
			document.getElementById("tolocationN").checked=true;
			document.getElementById('todetailsT').style.display="block";
			document.getElementById('todetailsF').style.display="none";
		}

	}
	function chargesData()
	{
	  var amount=document.getElementById("amount").value;
	   if(amount=="")
	{
	  	alert("please enter the Amount");
		return false;
	}
	   var doc='FNT';
	   var loc="";
	   var toLoc="";
	   if(document.getElementById("location").checked==true){
			loc="C";
	   }
	   if(document.getElementById("locationN").checked==true){
			loc="B";
	   }
	   if(document.getElementById("tolocation").checked==true){
			toLoc="C"
	   }
	   if(document.getElementById("tolocationN").checked==true){
			toLoc="B";
	   }
	   var activity=loc+"T"+toLoc+"FND";
	   var ran=parseInt(Math.random()*9999);
	var url="/TransactionAction.do?action=getActivityCharges&activity="+activity+"&document="+doc+"&sessionID=<%=session.getId()%>&amount="+amount+"&ran="+ran;
		http.open("POST",url,false);
		http.onreadystatechange= function (){processdata()};
		http.send(null);
	}

	function processdata()
	  {
	    if (http.readyState == 4)
	   {
	    if (http.status == 200)
	    {
	     var resArray=http.responseText;
	     var jsonData = JSON.parse(resArray);
	    
	    var com=parseFloat(jsonData);
	
	 	var Aftercom= com.toFixed(2);
	   	document.getElementById("commission").value=Aftercom;
	     
	    }
	   }
	 }
	</script>
	<script>
	function saveData()
	{
		 var Fname="";
		 var Faccno="";
		 var Faddress="";
		 var Fcity="";
		 var Fstate="";
		 var Fpin="";
		 var Fmobileno="";
		 var Tname="";
		 var Taccno="";
		 var Taddress="";
		 var Tcity="";
		 var Tstate="";
		 var Tpin="";
		 var Tmobileno="";
		 var Tifsc="";
		 var Tagentkid="";
		var amount=document.getElementById("amount").value;
     if(amount=="")
	{
	  	alert("please enter the Amount");
		return false;
	}
	var FcustId ="";
   	var TcustId ="";
    FcustId=document.getElementById("cust_Id").value;
  	TcustId=document.getElementById("cash_to_Id").value;
  
	var userId = document.getElementById("userid").value;
	   var doc='FNT';
	   var loc="";
	   var toLoc="";
	   if(document.getElementById("location").checked==true){

		                 Fname=document.getElementById("cash_from_name").value;
								if(Fname=="")
									{
									alert("please enter sender name");
									return false;
								}
						 Faccno=document.getElementById("accList").value;
						 Faddress=document.getElementById("cash_from_address").value;
							 if(Faddress=="")
							{
								alert("please enter sender address");
								return false;
							}
						 Fcity=document.getElementById("cash_from_city").value;
						 Fstate=document.getElementById("cash_from_state").value;
						 Fpin=document.getElementById("cash_from_pincode").value;
						if(Fpin.length<6)
							{
								alert("please enter 6 digit sender pin code");
								return false;
							}
						 Fmobileno=document.getElementById("cash_from_mobno").value;
							 if(Fmobileno=="" )
							{
								alert("please enter sender mobile number");
								return false;
							}
							if(Fmobileno.length<10)
							{
								alert("please enter 10 digit sender mobile number");
								return false;
							}

		
			loc="C";
	   }
	   if(document.getElementById("locationN").checked==true){
		                 Fname=document.getElementById("bank_from_name").value;
						 Faccno=document.getElementById("bank_from_a/cno").value;
							 if(Faccno=="")
							{
								alert("please enter sender account number");
								return false;
							}
						 Fmobileno=document.getElementById("bank_from_mobno").value;
			loc="B";
	   }
	   if(document.getElementById("tolocation").checked==true){
						
		                 Tname=document.getElementById("cash_to_name").value;
						 if(Tname=="")
							{
								alert("please enter reciever name");
								return false;
							}
						 Taddress=document.getElementById("cash_to_address").value;
						 if(Taddress=="")
							{
								alert("please enter reciever address");
								return false;
							}
						 Tcity=document.getElementById("cash_to_city").value;
						 Tstate=document.getElementById("cash_to_state").value;
						 Tpin=document.getElementById("cash_to_pincode").value;
						 if(Tpin=="")
							{
								alert("please enter reciever pin code");
								return false;
							}
							 if(Tpin.length<6)
							{
								alert("please enter 6 digit reciever pin code");
								return false;
							}
						 Tmobileno=document.getElementById("cash_to_mobno").value;
						 if(Tmobileno=="")
							{
								alert("please enter reciever mobile number");
								return false;
							}
							if(Tmobileno.lenght<10)
							{
								alert("please enter 10 digit reciever mobile number");
								return false;
							}
						 Tagentkid=document.getElementById("kid").value;
						 Taccno="";
						 
			toLoc="C"
	   }
	   if(document.getElementById("tolocationN").checked==true){
						 Tname=document.getElementById("bank_to_name").value;
						 Taccno=document.getElementById("bank_to_a/cno").value;
							if(Taccno=="")
							{
								alert("please enter reciever account number");
								return false;
							}
						 Tmobileno=document.getElementById("bank_to_mobno").value;
							   if(Tmobileno=="")
							{
								alert("please enter reciever mobile number");
								return false;
							}
						 Tifsc=document.getElementById("bank_to_ifsc").value;
			toLoc="B";
	   }
				
	   var activity=loc+"T"+toLoc+"FND";
       var tranType =activity;
       var agOTP=document.getElementById("agotp").value
		    if(agOTP=="")
							{
								alert("please enter OTP recieved");
								return false;
							}
		var senderOTP=document.getElementById("senderotp").value
		    if(senderOTP=="")
							{
								alert("please enter sender OTP recieved");
								return false;
							}
      var comAmt = document.getElementById("commission").value;
	   var remarks = document.getElementById("remark").value;
	   var accBal = document.getElementById("acbal").value;
	      
	var obj={
 "userId": userId,
 "tranType": tranType,
 "from_Account":Faccno,
 "from_mobile":Fmobileno,
 "from_name":Fname,
 "from_address":Faddress,
 "from_city":Fcity,
 "from_pincode":Fpin,
 "from_state":Fstate,
 "to_Account":Taccno,
 "to_name":Tname,
 "to_address":Taddress,
 "to_state":Tstate,
 "to_city":Tcity,
 "to_mobile":Tmobileno,
 "to_pin":Tpin,
 "amount":amount,
 "commission":comAmt,
 "remarks":remarks,
 "IFSCode":Tifsc,
 "agentKid":Tagentkid,
 "F_custId":FcustId,
 "T_custId":TcustId,
 "accBal":accBal
 };
				var jsonStr = JSON.stringify(obj);
				var ran=parseInt(Math.random()*9999);
     
				<% if(isFailed.equals("true")){%>
				     var purpose="ReFund Transfer";
				     var ran=parseInt(Math.random()*9999);
				     <% if(sData!=null){
				      int trnkid=Integer.parseInt(request.getParameter("tranid"));%>
				      var url="/TransactionAction.do?action=postAgentFailureCashPayment&DebitAccount="+Faccno+"&SenderMobile="+Tmobileno+"&sessionID=<%=session.getId()%>&agmobile=<%=sData[trnkid][7]%>&agOTP="+agOTP+"&beneOTP="+senderOTP+"&purpose="+purpose+"&tranKid=<%=sData[trnkid][22]%>&userID="+userId+"&beneAccount="+Taccno;

				     <%}%>
				     http.open("POST",url,false);
				     http.onreadystatechange= function (){refundProcess()};
				     http.send(null);
			   <%} else { %>
   				var hold="false";
			    var trnkid="-1";
			    <% if(isHold.equals("true") && sData!=null){
			      int id=Integer.parseInt(request.getParameter("tranid"));
			      
			    %>
			       hold="true";
			       trnkid="<%=sData[id][22]%>";
			    <%}%>
			        var url="/TransactionAction.do?action=postAgentTransaction&DebitAccount="+Faccno+"&sessionID=<%=session.getId()%>&activity="+activity+"&document="+doc+"&agOTP="+agOTP+"&senderOTP="+senderOTP+"&JSONSTRING="+jsonStr+"&beneficiaryAccNo="+Taccno +"&toMobile="+Tmobileno+"&repost="+hold+"&trnkid="+trnkid;
					http.open("POST",url,false);
						http.onreadystatechange= function (){
						process(Faccno,activity,doc,agOTP,senderOTP,jsonStr,Taccno,Tmobileno)
					};
	   
					http.send(null);
   				<%} %>	
		 
	}
		function process(Faccno,activity,doc,agOTP,senderOTP,jsonStr,Taccno,Tmobileno){
  		//alert(http.status);
		if (http.readyState == 4)
			{
				if (http.status == 200)
				{
					   var resArray=http.responseText;
					   var jsonData = JSON.parse(resArray);
						var tid="";
						if(jsonData.substring(2,3)=="&"){
					        tid=jsonData.substring(3);
					        jsonData=jsonData.substring(0,2);
        				}
        				var hold=false;
        
					   if(jsonData=="-1"){
							 alert("Dear Customer your Transaction has been Failed");
						window.location.href = "/fundtransfer/agentTrn.jsp";
					   
						}else if(jsonData=="-2"){
							alert("Dear Customer your OTP do not match");
							return false ; 
						
						}else if(jsonData=="-3"){
							alert("Dear Customer your OTP has been expired ");
							return false ; 
						}
						else if(jsonData=="-PH"){
							alert("Transaction not completed due to un-sufficient fund");
							hold=true;
							window.location.href = "/fundtransfer/agentTrn.jsp"	;
						}
						else if(jsonData=="-H")
						{
						       
							hold=confirm("Dear Customer your Transaction is not successful because of insufficient balance\n Do you want to hold your transaction.");
					        if(hold==true)
					        {    
						        message="Transaction is hold...";
						        var url="/TransactionAction.do?action=postAgentTransaction&DebitAccount="+Faccno+"&sessionID=<%=session.getId()%>&activity="+activity+"&document="+doc+"&agOTP="+agOTP+"&senderOTP="+senderOTP+"&JSONSTRING="+jsonStr+"&beneficiaryAccNo="+Taccno+"&toMobile="+Tmobileno+"&isHold="+hold+"&trankid="+tid;
						        http.open("post",url,false);
						        http.onreadystatechange= function (){
						        try{
						           var resArray1=http.responseText;
						           var jsonData1=JSON.parse(resArray1);
						           if(jsonData1=="-H1")
						           {
						                message="Transaction Hold Successfully";
						            	alert("Transaction Hold Successfully");
						           		return true;
						           }
						           else
						           {
							            message="Transaction not Hold Successfully";
							            hold="true";
							            return true;
						           }
						          }
						          catch(e)
						          {}
						        };
						        http.send(null);
						       }
						       else
						       {
					            	hold=true;
					        		message="Transaction not successful due to insufficient balance";
					        		alert(message);
					       }
					              
						}
						else if(jsonData=="false")
						{
						       alert("Some error occurred");
						       hold=true;
						}
						else{
							
							alert("Dear Customer your Transaction has been successfully and Transaction Id: "+jsonData);
							window.location.href = "/fundtransfer/agentTrn.jsp"	;
							
						}
				         window.location.href = "/fundtransfer/agentTrn.jsp" ;
				      
					}
					else
					{
						alert("HTTP error: " + http.status);
					}
			}

	}
	function refundProcess()
	{
		if (http.readyState == 4)
	   	{
		    if (http.status == 200)
		    {
			    var resArray=http.responseText;
			    var jsonData = JSON.parse(resArray);
				if(jsonData=="-1")
				{
				     alert("Your transaction is failed due to some reason");
				}
				else if(jsonData=="-4")
				       {
				         alert("Your transaction is alresdy refunded");
				}
				else if(jsonData=="-2")
			    {
			     alert("Dear Customer your OTP did not match.");
			    }
			    else  if(jsonData=="-3")
			    {
			     alert("Dear Customer your OTP has been expired ");
			    }
			    else
			    {
			     alert("Dear customer your failed transaction is successfully refunded and Your id is"+jsonData);
			     //return false;
			    }
		    	window.location.href="/fundtransfer/refundFailed.jsp";
		   }
		}
	}
	function otp_number(){
				//	document.getElementById('otptable').style.display="block";
					 if(document.getElementById("location").checked==false && document.getElementById("locationN").checked==false ||  document.getElementById("tolocation").checked==false && document.getElementById("tolocationN").checked==false)
					{
					alert("please select from/to  option");
									return false;
					
					}

					
					if(document.getElementById("location").checked==true){

		                 Fname=document.getElementById("cash_from_name").value;
								if(Fname=="")
									{
									alert("please enter sender name");
									return false;
								}
						 Faccno=document.getElementById("accList").value;
						 Faddress=document.getElementById("cash_from_address").value;
							 if(Faddress=="")
							{
								alert("please enter sender address");
								return false;
							}
						 Fcity=document.getElementById("cash_from_city").value;
						 Fstate=document.getElementById("cash_from_state").value;
						 Fpin=document.getElementById("cash_from_pincode").value;
						if(Fpin.length<6)
							{
								alert("please enter 6 digit sender pin code");
								return false;
							}
						 Fmobileno=document.getElementById("cash_from_mobno").value;
							 if(Fmobileno=="" )
							{
								alert("please enter sender mobile number");
								return false;
							}
							if(Fmobileno.length<10)
							{
								alert("please enter 10 digit sender mobile number");
								return false;
							}

		
			loc="C";
	   }
	   if(document.getElementById("locationN").checked==true){
		                 Fname=document.getElementById("bank_from_name").value;
						 Faccno=document.getElementById("bank_from_a/cno").value;
							 if(Faccno=="")
							{
								alert("please enter sender account number");
								return false;
							}
						 Fmobileno=document.getElementById("bank_from_mobno").value;
			loc="B";
	   }
	   if(document.getElementById("tolocation").checked==true){
		  
		                 Tname=document.getElementById("cash_to_name").value;
						 if(Tname=="")
							{
								alert("please enter reciever name");
								return false;
							}
						 Taddress=document.getElementById("cash_to_address").value;
						 if(Taddress=="")
							{
								alert("please enter reciever address");
								return false;
							}
						 Tcity=document.getElementById("cash_to_city").value;
						 Tstate=document.getElementById("cash_to_state").value;
						 Tpin=document.getElementById("cash_to_pincode").value;
						 if(Tpin=="")
							{
								alert("please enter reciever pin code");
								return false;
							}
							 if(Tpin.length<6)
							{
								alert("please enter 6 digit reciever pin code");
								return false;
							}
						 Tmobileno=document.getElementById("cash_to_mobno").value;
						 if(Tmobileno=="")
							{
								alert("please enter reciever mobile number");
								return false;
							}
							if(Tmobileno.lenght<10)
							{
								alert("please enter 10 digit reciever mobile number");
								return false;
							}
							 Taccno="";
			toLoc="C"
	   }
	   if(document.getElementById("tolocationN").checked==true){
						 Tname=document.getElementById("bank_to_name").value;
						 Taccno=document.getElementById("bank_to_a/cno").value;
							if(Taccno=="")
							{
								alert("please enter reciever account number");
								return false;
							}
						 Tmobileno=document.getElementById("bank_to_mobno").value;
							   if(Tmobileno=="")
							{
								alert("please enter reciever mobile number");
								return false;
							}
							  if(Tmobileno.length<10)
							{
								alert("please enter 10 digit reciever mobile number");
								return false;
							}
							var test=document.getElementById("test").value;
							if(test==""){
						 Tifsc=document.getElementById("bank_to_ifsc").value;
						 if(Tifsc.length<11)
							{
								alert("please enter 11 digit reciever IFSC Code as reciever is of other bank");
								return false;
							}
							}
			toLoc="B";
	   }
					var amount=document.getElementById("amount").value;
     if(amount=="")
	{
	  	alert("please enter the Amount");
		return false;
	}
				//	var frommobile=document.getElementById("mob").value;
					document.getElementById('otptable').style.display="block";
				    var purpose='Fund Transfer';
					var ran=parseInt(Math.random()*9999);
					var url="/TransactionAction.do?action=sendOTPAGN&DebitAccount="+Faccno+"&beneficiaryAccNo="+Taccno+"&tomobile="+Tmobileno+"&sessionID=<%=session.getId()%>&frommobile="+Fmobileno+"&purpose="+purpose+"&ran="+ran;
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


function getAgent()
			{
				var pinCode=document.getElementById('cash_to_pincode').value;
				 var ran=parseInt(Math.random()*9999);
				 
			 var url ="/AccountInfoAction.do?action=agentPincodeData&pinCode="+pinCode+"&ran="+ran; 
					http.open("POST",url,false);
					http.onreadystatechange= function (){processdata1()};
					http.send(null);	
				
			}
				
		function processdata1(){
							if (http.readyState == 4)
			   {
						// Check that a successful server response was received
						if (http.status == 200)
			   {

					var resArray=http.responseText;
					var jsonData = JSON.parse(resArray);
					document.getElementById('cname').options.length=1;
					document.getElementById("webData").value='';
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
	
	function selData(val){
	var resArray=document.getElementById("webData").value;
	  var jsonData = JSON.parse(resArray);
 for(var i=0;i<jsonData.length;i++){
					
					  var kid=jsonData[i].acsKid;
					  var name=jsonData[i].acsName;
		if(kid==val){	
			document.getElementById("kid").value=kid;
		
		}
	}
}
	function getName(id)
			{
				
				 var acnumber=document.getElementById(id).value;
				 var ran=parseInt(Math.random()*9999);
				 var url ="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+acnumber+"&ran="+ran; 
				//	alert(url);
					http.open("POST",url,false);
					http.onreadystatechange= function (){processdata2(id)};
					http.send(null);	
				
			}
				
		function processdata2(id1){
							if (http.readyState == 4)
			   {
						// Check that a successful server response was received
						if (http.status == 200)
			   {
							var resArray=http.responseText;
							var jsonData = JSON.parse(resArray);
                         document.getElementById('test').value=jsonData.customerName;
							if(id1=="bank_from_a/cno")
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
	
	function bacck(){
			window.location.href = "/mobile/Agent_fund_transfer.html"
			}

	function data_from_custId_ajax()
  	{ 

	   var custId = document.getElementById("cust_Id").value
	    var ran=parseInt(Math.random()*9999);
	     var url="/AccountInfoAction.do?custID="+custId+"&action=fetchcustDetail&ran="+ran;
	     http.open("POST",url,false);
	     http.onreadystatechange= function (){processRescustData()};
	     http.send(null); 
   }
   function processRescustData()
   {
     if (http.readyState == 4)
     {
     
      // Check that a successful server response was received
      if (http.status == 200)
      {
       var resArray=http.responseText;
       var jsonData = JSON.parse(resArray);
  
		if((jsonData.accountList!="")&&(jsonData.accountList!=null)){ 
	 	   document.getElementById("cash_from_name").value=jsonData.accountList[0].CustomerName ;
	       document.getElementById("cash_from_mobno").value=jsonData.accountList[0].mobileNo ;
	       document.getElementById("cash_from_address").value=jsonData.accountList[0].houseNo +  jsonData.accountList[0].houseDetail ;
	       document.getElementById("cash_from_city").value=jsonData.accountList[0].cityName ;
	       document.getElementById("cash_from_pincode").value=jsonData.accountList[0].pinCode ;
	       document.getElementById("cash_from_state").value=jsonData.accountList[0].stateName ;
	       document.getElementById("cust_Id").value=jsonData.accountList[0].customerId ;
		}else{
	    	document.getElementById("cash_from_name").value="";
	       	document.getElementById("cash_from_address").value="";
	       	document.getElementById("cash_from_city").value="";
	       	document.getElementById("cash_from_pincode").value="";
	       	document.getElementById("cash_from_state").value="";
	       	document.getElementById("cust_Id").value="";
  			return false;
		}
    }
   }
  }

	function data_to_custId_ajax()
  	{ 

  
  	var custId = document.getElementById("cash_to_Id").value
    var ran=parseInt(Math.random()*9999);
    var url="/AccountInfoAction.do?custID="+custId+"&action=fetchcustDetail&ran="+ran;
    http.open("POST",url,false);
    http.onreadystatechange= function (){processRescust_to_Data()};
    http.send(null); 
    
   }
   function processRescust_to_Data(){
     if (http.readyState == 4)
     {
     
      // Check that a successful server response was received
      if (http.status == 200)
      {
       	var resArray=http.responseText;
       	var jsonData = JSON.parse(resArray);
		if((jsonData.accountList!="")&&(jsonData.accountList!=null)){ 
		    document.getElementById("cash_to_name").value=jsonData.accountList[0].CustomerName ;
		       document.getElementById("cash_to_mobno").value=jsonData.accountList[0].mobileNo ;
		       document.getElementById("cash_to_address").value=jsonData.accountList[0].houseNo +  jsonData.accountList[0].houseDetail ;
		       document.getElementById("cash_to_city").value=jsonData.accountList[0].cityName ;
		       document.getElementById("cash_to_pincode").value=jsonData.accountList[0].pinCode ;
		       document.getElementById("cash_to_state").value=jsonData.accountList[0].stateName ;
		       document.getElementById("cash_to_Id").value=jsonData.accountList[0].customerId ;
		  }
		  else{
		    	document.getElementById("cash_to_name").value="";
		       	document.getElementById("cash_to_address").value="";
		       	document.getElementById("cash_to_city").value="";
		       	document.getElementById("cash_to_pincode").value="";
		       	document.getElementById("cash_to_state").value="";
		       	document.getElementById("cash_to_Id").value="";
		   
		  }
  	 }
     }
  }
  
  function data_from_mob_ajax()
   {

    var mobno = document.getElementById("cash_from_mobno").value
     var ran=parseInt(Math.random()*9999);
      var url="/AccountInfoAction.do?mobno="+mobno+"&action=fetchcustDetail&ran="+ran;
      http.open("POST",url,false);
      http.onreadystatechange= function (){processRescustData()};
      http.send(null);
   }



	function data_to_mob_ajax()
   {
   	var mobno = document.getElementById("cash_to_mobno").value
    var ran=parseInt(Math.random()*9999);
    var url="/AccountInfoAction.do?mobno="+mobno+"&action=fetchcustDetail&ran="+ran;
    http.open("POST",url,false);
    http.onreadystatechange= function (){processRescust_to_Data()};
    http.send(null);
   }
  
	</script>

	<body style="margin:0 0 0 0;" onload="fillData()"><br>
	<form action="/request/DDRequest">

	<% if(((request.getParameter("tranStatus")==null)&& isHold.equals("")) || (isHold.equals("true") || (isFailed.equals("true")) || (request.getParameter("tranStatus")!=null && !request.getParameter("tranStatus").equals("Transaction is successful")))){%>
	<table align="center" class="wrapperDataTable" cellpadding="0" cellspacing="0"  >
		<tr>
			<td  class="wrapperDataTableTR" align="center" width=1000px > Agent Fund Transfer </td>
		</tr>
		<tr>
		<td>
		<table border="" align="center">
 		<tr>
   		<td>Available Balance:<input type=text  id="acbal" style="margin-left:65px; background-color:#EFEFEF; TEXT-ALIGN: right;"  tabindex="-1" readonly  />  </td>
      	</tr>
      		<tr>
		<td align="center">
		Acc No. From
       <select name="sUsrList1"  list="AccountNoList" listkey="custId" listValue="accountNo" style="width:200; background-color:#EFEFEF;" id="accList"  tabindex="-1" onChange="mobileNo()">					<%
					if (AccListArr != null)
					for(int i=0;i<AccListArr.length;i++){%>
					<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
					<%}%>
					</select> 
		</td>
		</tr>
		<tr>
		<td align="center">
		  <p> From <input type="radio" name="group1" id="location" value="C" onclick="change()" >Cash &nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="radio"  name="group1" id="locationN" value="B" onclick="change()">Bank</p>
		</td>
		</tr>
		<tr>
		<td align="center">
		<br/>
		   <table id="detailsT" align="center" >
		   <tr>
		   <td>
		   <table>
		   <tr><td>
			A/c number
					<input type=text  id="bank_from_a/cno" style="margin-left:90px;" onblur="getName(this.id)" />
		   </td></tr>
		   <tr><td>
			Name
					<input type=text  id="bank_from_name" style="margin-left:120px;" readonly/>
		   
		   </td></tr>
		   <tr><td>
		   Mobile Number
					<input type=text  id="bank_from_mobno" style="margin-left:72px;" readonly/>
		   
		   </td></tr>
		  
		   </table>
					</td>
				 </tr>
				</table>
		<table id="detailsF" align="left" >
		 <tr>
		 <td>
		 <table>
		  <tr><td>
 			Sender Mobile 
    	 <input type=text  id="cash_from_mobno" style="margin-left:72px;" onblur="data_from_mob_ajax()" maxlength=10 />
     
     </td></tr>
    		   <tr><td>
		   Name
					<input type=text  id="cash_from_name" style="margin-left:120px;"/>
		   </td></tr>
		   <tr><td>
			Address
					<input type=text  id="cash_from_address"  style="margin-left:106px;"/>
		   
		   </td></tr>
		   <tr><td>
			City
					<input type=text  id="cash_from_city"  style="margin-left:127px;"/>
		   
		   </td></tr>
			<tr><td>
			PinCode
					<input type=text  id="cash_from_pincode"  style="margin-left:110px;" maxlength=6/>
		   
		   </td></tr>
		   <tr><td>
			State
					<input type=text  id="cash_from_state"  style="margin-left:119px;"/>
		   
		   </td></tr>
		     <tr><td>
    			<input type="hidden"  id="cust_Id"  style="margin-left:119px;"/>
     		</td></tr>
		   
		   </table>
		 </td>
		</tr>
		</table>
		<tr>
		<td align="center">
		  <p> To <input type="radio" name="group2" id="tolocation" value="C" onclick="tochange()" >Cash &nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="radio"  name="group2" id="tolocationN" value="B" onclick="tochange()">Bank</p>
		</td>
		</tr>
		<tr>
		<td align="center">
		<br/>
		   <table id="todetailsT" align="center" >
		   <tr>
		   <td>
		   <table>
		   <tr><td>
			A/c number
					<input type=text  id="bank_to_a/cno" style="margin-left:90px;" onblur="getName(this.id)" />
		   </td></tr>
		   <tr><td>
			Name
					<input type=text  id="bank_to_name" style="margin-left:120px;"/>
		   
		   </td></tr>
		   <tr><td>
		   Mobile Number
					<input type=text  id="bank_to_mobno" style="margin-left:72px;" maxlength=10/>
		   
		   </td></tr>
		   <tr>
		<td>
		<label><bean:message bundle="hindi" key= "45054"/></label>
	<input type="text" name="rifsc" style="margin-left:123px;"  maxlength=11  value=""  id="bank_to_ifsc" >
		</td>
		 </tr>
		   </table>
					</td>
				 </tr>
				</table>
		<table id="todetailsF" align="left" >
		 <tr>
		 <td>
		 <table>
   		<tr><td>
     	Receiver Mobile 
     	<input type=text  id="cash_to_mobno" style="margin-left:72px;"  onblur="data_to_mob_ajax()" maxlength=10/>
        </td></tr>
     		 
		   <tr><td>
		   Name
					<input type=text  id="cash_to_name" style="margin-left:120px;"/>
		   </td></tr>
		   <tr><td>
			Address
					<input type=text  id="cash_to_address"  style="margin-left:105px;"/>
		   
		   </td></tr>
		   <tr><td>
			City
					<input type=text  id="cash_to_city"  style="margin-left:126px;"/>
		   
		   </td></tr>
			
		   <tr><td>
			State
					<input type=text  id="cash_to_state"  style="margin-left:120px;"/>
		   
		   </td></tr>
		   <tr><td>
			PinCode
			<label><font size="2" color="red">*</font></label>&nbsp;
					<input type=text  id="cash_to_pincode"  style="margin-left:95px;" maxlength=6 onblur="getAgent()"/>
		   
		   </td></tr>
		   <tr>
		<td>
		 Select To Agent
					<select style="margin-left:70px; " property="name" id="cname" onchange="selData(this.value)">
				<option value="">Select</option>
					
				</select>
		</td>
		</tr>
		 <tr><td>
     	<input type="hidden"  id="cash_to_Id"  style="margin-left:119px;"/>
      	</td></tr>
  
		   </table>
			
		 </td>
		 
		</tr>


		</table>
		<tr>
		  <td align="left">
		  Amount
		    <input type="text" style="margin-left:115px;  TEXT-ALIGN: right;"  Id="amount"  size="20"  maxlength="15" onblur="chargesData()" />
		    
		  </td>
  		</tr>
		<tr>
		<td align="left">
  		Charges
      	<input type="text" style="margin-left:112px; background-color:#EFEFEF;  TEXT-ALIGN: right;"  Id="commission"  size="20"  maxlength="15"  tabindex="-1" readonly/>
	  	</td>
		</tr>
		<tr>
		 <td align="left">
		Remarks
				<input type="text" style="margin-left:112px;"  Id="remark"  size="20"  maxlength="15"  />
				 
		</td>
		</tr>
		</td>
		</tr>
		
		  <tr>
		  </br>
		<td align="center">
			<input type="button" name="ok" tabindex="22" value="Send OTP" onclick="otp_number()" class="Button" id="ok">
			<input type="button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel"></td>
		</td>
		 </tr>
		<tr>
		<td>
		<table id="otptable">
		<tr>
		<td>
		 Enter Agent OTP: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="agotp">
		 </td>
		</tr>
		<tr>
		<td>
		 Enter Sender OTP: &nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="senderotp"> 
		 </td>
		</tr>
		<tr>
		<td align="center">
		<input type="button" onClick="saveData()" style="width:100px" value="confirm"/>
		 </td>
		</tr>
		 </table>
		</td>
		</tr>
			

					   </td>
					  </tr>
					   <tr>
				<td>
					<input type="hidden"  style="margin-left: px;" maxlength="35"  value="<%=login_id%>" size="40" id="userid">
					<input type="hidden"  style="margin-left: px;" maxlength="35"  value="" size="40" id="test">
					
				</td>
				</tr>
	</table>
    <input type="hidden" name="webData" id="webData"/>

	<input type="hidden" name="kid" id="kid"/>
	<%}else if(request.getParameter("tranStatus")!=null){%>
   <font color="red" style="font-weight:bold;font-size:medium;">
    <%=request.getParameter("tranStatus")%>
   </font>
  <%}else{%>
   <font color="red" style="font-weight:bold;font-size:medium;">
    No Hold Transaction
   </font>
  <%}%>
	</form> 		
	</body>


	


		 
