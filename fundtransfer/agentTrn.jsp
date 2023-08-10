
	<%@ include file="/common/Include.jsp" %>


<style>
.required {
	color: red;
	
}

.ipfile{
	font-family: none !important;
	font-size: 20px !important;
}
</style>

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
		String mob=(String)session.getAttribute("customerMobile");
		System.out.println("Mob : "+mob);
		
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

function isNumberKey(evt)
	{
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57))
	return false;

	return true;
	}

function alphaOnly(event)
{
	var c= (evt.which) ? evt.which : evt.keyCode;
	event.keyCode=(!((c>=65 && c<=90) ||(c>=97 && c<=122)|| (c==32)|| (c>=48 && c<=57)  ||(c==45) ||(c==47) ||(c==46)))?0:event.keyCode;
}

function Accept_Amt(ctrlName, Desvalue, e) {
    var keycode = getKeyCode(e);
    if (keycode != 0) {
        var KeyTyped = String.fromCharCode(keycode);
        var lCode = KeyTyped.charCodeAt(0);

        if ((lCode >= 46 && lCode <= 57) && (lCode != 47)) {

            var nstr = document.getElementById(ctrlName).value.slice();

            var p = 0;
            var intd = 0;
            for (var y = 0; y <= (nstr.length) - 1; y++) {
                if ((nstr.charCodeAt(y) == 46)) {
                    p = p + 1;
                    intd = y;
                }
            }
            if (p == 1) {
                if (lCode == 46) {
                    e.returnValue = false;
                    return false;
                }
                else {
                    if (document.getElementById(ctrlName).value.length - intd == Desvalue + 1) {
                        var selectedText = document.getElementById(ctrlName);

                        if (selectedText != "") {
                            var newRange = SelectText(ctrlName);
                            if (newRange == "") {
                                e.returnValue = false;
                                return false;
                            }
                        }
                    }
                }
            }
        }
        else {
            e.returnValue = false;
            return false;
        }
    }
}
	

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
	   
	   Tr_rifsc.style.display="none";
	}
	function acc_bal()
   	{
		var ran=parseInt(Math.random()*9999);
		var sAcList = document.getElementsByName('sUsrList1')[0];	
  		var acnumber = sAcList.options[sAcList.selectedIndex].value;			//edited on 23-09-2019
        var URL ="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+acnumber+"&ran="+ran;
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
				var bal=parseFloat(jsonData.accBalance); 
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
						url=process(Faccno,activity,doc,agOTP,senderOTP,jsonStr,Taccno,Tmobileno)
					};
	   
					http.send(null);
					
					if(url=="")
				   	{
						var message="Transaction not successful due to insufficient balance";
					     alert(message);
						  window.location.href = "/fundtransfer/agentTrn.jsp" ;
				   	}
				   	else{
					    http.open("POST",url,false);
						        http.onreadystatechange= function (){holdTranFun(http);
								};
						        http.send(null);
						 // window.location.href = "/fundtransfer/agentTrn.jsp" ;
				   	}
				
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
						        return url;
						        
						       }
						       else
						       {
					            	return "";
					            	/*
					            	hold=true;
					        		message="Transaction not successful due to insufficient balance";
					        		alert(message);
					        		*/
					       }
					              
						}
						else if(jsonData=="false")
						{
						       alert("Some error occurred");
						       hold=true;
						}
						else{
							
							alert("Dear Customer your Transaction has been successfully and Transaction Id: "+jsonData);
							 
							var fst1=jsonData.split("~");
							document.getElementById("DrTrdKid").value=fst1[0];
							document.getElementById("CrTrdKid").value=fst1[1];
							
							/*window.location.href = "/fundtransfer/agentTrn.jsp"	;
							*/
						}
				        // window.location.href = "/fundtransfer/agentTrn.jsp" ;
				      
					}
					else
					{
						alert("HTTP error: " + http.status);
					}
			}

	}
	function holdTranFun(http){
			if (http.readyState == 4 && http.status == 200)
				{
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
				var AgentMobileNo ='<%=mob%>';
				Tmobileno=document.getElementById("bank_to_mobno").value;
				Fmobileno=document.getElementById("bank_from_mobno").value;
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
						var amount=document.getElementById("amount").value;
						var availbal = document.getElementById('bank_from_availbal').value;
						if(amount>availbal)													//added on 23-09-2019
						{
							alert("Transfer amount cannot be greater than available balance ");
							return false;
						}
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
	if(amount!=""){
    	var ret = checkAmount();
   		if(ret==false)
    	{
    	return false;
   		}
   	}
	
				//	var frommobile=document.getElementById("mob").value;
					document.getElementById('otptable').style.display="block";
				    var purpose='Fund Transfer';
					var ran=parseInt(Math.random()*9999);
					var url="/TransactionAction.do?action=sendOTPAGN&DebitAccount="+Faccno+"&beneficiaryAccNo="+Taccno+"&tomobile="+AgentMobileNo+"&sessionID=<%=session.getId()%>&frommobile="+Fmobileno+"&purpose="+purpose+"&amount="+amount+"&DrCr=D&ran="+ran;
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
				if(jsonData.authorise=="success")
				{
					document.getElementById('otptable').style.display="block";		//26-09-2019
					alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
				}
				else
				{
					alert(jsonData.errorMsg);
					return false;
				}
			}
		}
	}

	function checkAmount(){
	 var ret ;
	
	
	    var amount=document.getElementById("amount").value;
	    var account=document.getElementById("accList").value;
	
	      var ran=parseInt(Math.random()*9999);
	      var url ="/AccountInfoAction.do?action=checkAmountTrn&amount="+amount+"&account="+account+"&ran="+ran;
	      // alert(url);
	      http.open("POST",url,false);
	      http.onreadystatechange= function (){ret = processdataAmount()}; 
	      http.send(null); 
	
	      return ret;
	    
	 }
	function processdataAmount(){
	 
	  if (http.readyState == 4)
	  {
	     
	      // Check that a successful server response was received
	      if (http.status == 200)
	      {
	        var resArray=http.responseText;
	        var jsonData = JSON.parse(resArray);
	  		var fst1=jsonData.split("@");
	
			if(fst1[0]=="tramt"){
				alert("Dear customer you can enter total minimum ="+fst1[2]+", maximum amount ="+fst1[3]+" and total transaction="+fst1[4]+"in  "+fst1[1]);
				return false;
			}
			if(fst1[0]=="tr"){
				alert("Dear customer you can do total transaction ="+fst1[2]+" in "+fst1[1]);
				return false;
			}
			if(fst1[0]=="amt"){
				alert("Dear customer you can enter total minimum ="+fst1[2]+" and maximum amount ="+fst1[3]+" in "+fst1[1]);
				return false;
			}
		  else{
		  	return true;
		  }
	
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
				if(jsonData.customerName!="")											//edited on 23-09-2019
				{
					document.getElementById('test').value=jsonData.customerName;
					if(id1=="bank_from_a/cno")
					{
						document.getElementById('bank_from_name').value=jsonData.customerName;
						document.getElementById('bank_from_mobno').value=jsonData.mobileNo;
						document.getElementById('bank_from_availbal').value=jsonData.accBalance;	//edited on 23-09-2019
					}else{

						document.getElementById('bank_to_name').value=jsonData.customerName;
						document.getElementById('bank_to_mobno').value=jsonData.mobileNo;
					}	

				}
				else{			//edited on 23-09-2019
					alert("Account No does not exist");
					if(id1=="bank_from_a/cno")								//added on 08-11-2019
					{
					document.getElementById('bank_from_name').value="";
					document.getElementById('bank_from_mobno').value="";
					document.getElementById('bank_from_availbal').value="";
					document.getElementById("bank_from_a/cno").value="";
					return false;
					}
					else													//added on 08-11-2019
					{
					document.getElementById("bank_to_name").value="";
					document.getElementById("bank_to_mobno").value="";
					document.getElementById("bank_to_a/cno").value="";
					return false;
					}
				}
			}
		}

}
	
	function bacck(){
			window.location.href = "/fundtransfer/agentTrn.jsp"
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
  
  function ViewRecipt()
	{
		var sDrTrdKid=document.getElementById("DrTrdKid").value;
		var sCrTrdKid=document.getElementById("CrTrdKid").value;
		var ran=parseInt(Math.random()*9999);
		if(sDrTrdKid!="" && sCrTrdKid!=""){
	    var url="/TransactionAction.do?action=AgentFundTransferDeatilReciept&sDrTrdKid="+sDrTrdKid+"&sCrTrdKid="+sCrTrdKid+"&ran="+ran;
		http.open("POST",url,false);
		http.onreadystatechange= function (){Printprocessdata()};
		http.send(null);
		}
	}
	function Printprocessdata(){
		if (http.readyState == 4)
			{
				if (http.status == 200)
				{
					     var resArray=http.responseText;
					     var jsonData = JSON.parse(resArray); 
						 	
					   if (jsonData.transactionID == "-1" ) {
					     alert("Transaction failed :"+ jsonData.Error);
					   }else { 
					   
							}
						javascript:window.open("/fundtransfer/FundTransferReciept.jsp", 'Download File', 'width=1000,height=550,left=200,top=50');
				}
			}

	}
    
	</script>
	<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
	<!-- <html:form action="/jsp/login.do"> -->
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<!--<tiles:put name="footer_jsp" value="/common/footer.jsp"/> -->
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=agentfund"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=agentfund"/>
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
	&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
	</tiles:put>
	<html:form action="/request/DDRequest">
	<body style="margin:0 0 0 0;" onload="fillData()"><br>

	<% if(((request.getParameter("tranStatus")==null)&& isHold.equals("")) || (isHold.equals("true") || (isFailed.equals("true")) || (request.getParameter("tranStatus")!=null && !request.getParameter("tranStatus").equals("Transaction is successful")))){%>
	<table align="center" class="wrapperDataTable" cellpadding="0" cellspacing="0"  >
		<tr>
			<td  class="wrapperDataTableTR" align="center" width=1000px ><H4><B>Fund Transfer HPSCB <B></H4></td>
		</tr>
		<tr>
		<td>
		<table border="" align="center">
 		<tr>
   		<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;"><B>Available Balance: </B>
		<input type=text  id="acbal" size="20" style="margin-left:65px; background-color:#EFEFEF; TEXT-ALIGN: right;"  readonly="true" tabindex="-1" />  </td>
      	</tr>
      		<tr>
		<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		<B>Acc No. From:</B>
       <select name="sUsrList1"  list="AccountNoList" listkey="custId" listValue="accountNo" style="margin-left:87px; width:198; background-color:#EFEFEF;" id="accList"  tabindex="-1" onChange="acc_bal()">					<%
					if (AccListArr != null)
					for(int i=0;i<AccListArr.length;i++){%>
					<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
					<%}%>
					</select> 
		</td>
		</tr>
		<tr>
		<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		  <p> <B>From <!--<input type="radio" name="group1" id="location" value="C" onclick="change()" >Cash--> 
		  <input type="hidden" name="group1" id="location" value="C"  >
		  <input type="radio"  name="group1" id="locationN" value="B" onclick="change()">Bank <B></p>
		</td>
		</tr>
		<tr>
		<td align="center">
		<br/>
		   <table id="detailsT" align="center" >
		   <tr>
		   <td>
		   <table>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		   <B>A/c Number</B>
		   <input type=text  id="bank_from_a/cno" style="margin-left:90px; width: 211px;" onblur="getName(this.id)" maxlength="20"  onkeypress="return isNumberKey(event)" />
		   </td></tr>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		   <B>Name</B>
		   <input type=text  id="bank_from_name" style="margin-left:132px; width: 211px;" readonly="true" tabindex="-1"/>

		   </td></tr>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		   <B>Mobile Number</B>  
		   <input type=text  id="bank_from_mobno" style="margin-left:72px; width: 211px;" readonly="true" tabindex="-1"/>

		   </td>
		   </tr>
		   <!--    edited on 23-09-2019 -->
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		   <B>Available Balance</B>  
		   <input type=text  id="bank_from_availbal" style="margin-left:58px; width: 211px;" readonly="true" tabindex="-1"/>

		   </td></tr>
		   <!--  editing complete here -->
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
		   <input type=text  id="cash_from_mobno" style="margin-left:73px;" onblur="data_from_mob_ajax()" maxlength="10" onkeypress="return isNumberKey(event)" />

		   </td></tr>
		   <tr><td>
		   Name
					<input type=text  id="cash_from_name" style="margin-left:120px;" onkeydown="return alphaOnly(event)"  maxlength="50" />
		   </td></tr>
		   <tr><td>
			PinCode
					<input type=text  id="cash_from_pincode"  style="margin-left:110px;" onblur="data_from_pin_ajax()"  maxlength="6"  onkeypress="return isNumberKey(event)" />
		   
		   </td></tr>
		   <tr><td>
			Address
					<input type=text  id="cash_from_address"  style="margin-left:106px;" onkeydown="return alphaOnly(event)"  onkeydown="return alphaOnly(event)"  maxlength="50"  />
		   
		   </td></tr>
		   <tr><td>
			City
					<input type=text  id="cash_from_city"  style="margin-left:127px;"onkeydown="return alphaOnly(event)" maxlength="20" />
		   
		   </td></tr>
		
		   <tr><td>
			State
					<input type=text  id="cash_from_state"  style="margin-left:119px;" onkeydown="return alphaOnly(event)" maxlength="20" />
		   
		   </td></tr>
		     <tr><td>
    			<input type="hidden"  id="cust_Id"  style="margin-left:119px;"/>
     		</td></tr>
		   
		   </table>
		 </td>
		</tr>
		</table>
		<tr>
		<td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		  <p> <B> To &nbsp;&nbsp;<!--<input type="radio" name="group2" id="tolocation" value="C" onclick="tochange()" >Cash -->
		  <input type="hidden" name="group2" id="tolocation" value="C">
		  <input type="radio"  name="group2" id="tolocationN" value="B" onclick="tochange()">Bank</B></p>
		</td>
		</tr>
		<tr>
		<td align="center">
		<br/>
		   <table id="todetailsT" align="center" >
		   <tr>
		   <td>
		   <table>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>A/c Number</B>
					<input type=text  id="bank_to_a/cno" style="margin-left:91px; width: 211px;" onblur="getName(this.id)" maxlength="20"  onkeypress="return isNumberKey(event)" />
		   </td></tr>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
			<B>Name</B> 
					<input type=text  id="bank_to_name" style="margin-left:133px;width: 211px;" maxlength="50" readonly="true" tabindex="-1"	 />
		   
		   </td></tr>
		   <tr>
		   <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		  <B>Mobile Number</B>  
					<input type=text  id="bank_to_mobno" style="margin-left:73px; width: 211px;" maxlength="10" onkeypress="return isNumberKey(event)"/>
		   
		   </td></tr>
  <tr id="Tr_rifsc" >
		<td>
		<label><bean:message bundle="hindi" key= "45054"/></label>
		<input type="text" name="rifsc" style="margin-left:123px;"  maxlength="11"  value=""  id="bank_to_ifsc" >
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
     	<input type=text  id="cash_to_mobno" style="margin-left:72px;"  onblur="data_to_mob_ajax()" maxlength="10" onkeypress="return isNumberKey(event)"/>
        </td></tr>
     		 
		   <tr><td>
		   Name
					<input type=text  id="cash_to_name" style="margin-left:120px;width: 211px;" onkeydown="return alphaOnly(event)" maxlength="30"/>
		   </td></tr>

		    <tr><td>
			PinCode
			<label><font size="2" color="red">*</font></label>&nbsp;
					<input type=text  id="cash_to_pincode"  style="margin-left:95px;" maxlength=6 onblur="getAgent(),data_to_pin_ajax()" onkeypress="return isNumberKey(event)" />
		   </td></tr>

		   <tr><td>
			Address
					<input type=text  id="cash_to_address"  style="margin-left:105px;" maxlength="20" onkeydown="return alphaOnly(event)" />
		   
		   </td></tr>
		   <tr><td>
			City
					<input type=text  id="cash_to_city"  style="margin-left:126px;" maxlength="20" onkeydown="return alphaOnly(event)" />
		   
		   </td></tr>
			
		   <tr><td>
			State
					<input type=text  id="cash_to_state"  style="margin-left:120px;" maxlength="20" onkeydown="return alphaOnly(event)" />
		   
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
		  <td align="left" style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		  <B>Amount</B>    
		    <input type="text" style="margin-left:122px; width: 211px; TEXT-ALIGN: right;"  Id="amount"  size="20"  maxlength="15" onblur="chargesData()" onkeypress="return Accept_Amt(this.id,2,event)" />
		    
		  </td>
  		</tr>
		<tr>
		<td align="left" style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		<B>Charges</B>   		
      	<input type="text" style="margin-left:119px; width: 211px; background-color:#EFEFEF;  TEXT-ALIGN: right;"  Id="commission"  size="20"  maxlength="15"  readonly="true" tabindex="-1"/>
	  	</td>
		</tr>
		<tr>
		 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		<B>Remarks</B>
				<input type="text" style="margin-left:116px;width: 211px;"  Id="remark"  size="20"  maxlength="15" name="remark" />
				 
		</td>
		</tr>
		</td>
		</tr>
		
		  <tr>
		  </br>
		  <BR>
		  </BR>
		<td align="center">
			<input type="button" name="ok" tabindex="22" value="Send OTP" onclick="otp_number()" class="Button" id="ok">
			<input type="button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel">
			<input type="button" name="Print" tabindex="24" value="View Recipt" onclick="ViewRecipt()" class="Button" id="Print">
			</td>
			
		</td>
		 </tr>
		<tr>
		<td>
		<table id="otptable">
		<tr>
		 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		 Enter Agent OTP: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="agotp"  style="margin-left: 116px;width: 158px;" >
		 </td>
		</tr>
		<tr>
		 <td style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">
		 Enter Sender OTP: &nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="senderotp" style="margin-left: 116px;width: 158px;" > 
		 </td>
		</tr>
		<tr>
		<td align="center">
		<input type="button" onClick="saveData()" style="width:100px" value="confirm"/>&nbsp;&nbsp;&nbsp;
		
		
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
					<input type="hidden" name="DrTrdKid" id="DrTrdKid"/>
					<input type="hidden" name="CrTrdKid" id="CrTrdKid"/>
					<input type="hidden" name="AgnDrTrdKid" id="AgnDrTrdKid"/>
					<input type="hidden" name="AgnCrTrdKid" id="AgnCrTrdKid"/>
					
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
 		
	</body>
	</html:form>

	</tiles:put>
	</html:form>


	</tiles:insert>



		 
