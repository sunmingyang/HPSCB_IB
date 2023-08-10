<%@ include file="/common/Include.jsp" %>
<%
	String accountList="" ; 
	String [] AccListArr= null ; 
	if (session.getAttribute("allAccountlist") != null ) { 
	   accountList=(String)session.getAttribute("allAccountlist");
	   System.out.println("FundAccountList----------------"+accountList);
	   AccListArr =accountList.split(",");
	}
	// agent Mobile , it is being  set in session at the time of login , no need to remove it 
	String mob=(String)session.getAttribute("customerMobile");
 	int errorcount=0;
	String usrName = "";
	String AccINFO[][] = (String[][])session.getAttribute("AccINFO"); 
	System.out.println(AccINFO);
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
	
	String login_id="";
	if(session.getAttribute("userid")!=null){
		login_id = (String)session.getAttribute("userid");
	}
	String userInfo[][] = null;
	userInfo = (String [][])session.getAttribute("userInfo");
%>
<script>
function fillData()
{

		document.getElementById('otptable').style.display="none";
		
}
function getData()
{
	 var Rmobile1=document.getElementById('cash_to_mobno').value;
	 if(Rmobile1.length<10)
							{
								alert("please enter 10 digit reciever mobile number");
								return false;
							}
	    var ran=parseInt(Math.random()*9999);  
	    var url ="/AccountInfoAction.do?action=agentCustomerAccountsForFailure&mobileNo="+Rmobile1+"&AgentCustID="+<%=userInfo[0][8]%>+"&ran="+ran;
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
				  document.getElementById('cname').options.length=1;
				  document.getElementById("webData").value='';
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
function selData(val){
	var resArray=document.getElementById("webData").value;
	  var jsonData = JSON.parse(resArray);
 for(var i=0;i<jsonData.length;i++){
					 var amount=jsonData[i].amount;
					  var kid=jsonData[i].agntrn_kid;
					  var name=jsonData[i].to_name;
					 // alert(kid);
		if(kid==val){
			document.getElementById("cash_to_amount").value=amount;
			document.getElementById("cash_to_name").value=name;
			document.getElementById("kid").value=kid;
		
		}
	}
}
 function sendOTP(){
var agmobile=document.getElementById("mob").value;
 var Rmobile=document.getElementById('cash_to_mobno').value;
						if(Rmobile=="")
							{
								alert("please enter reciever mobile number");
								return false;
							}
				
	 document.getElementById('otptable').style.display="block";
	    var purpose='Fund Refund';
	    var userid=document.getElementById('userid').value;
		var ran=parseInt(Math.random()*9999);
		var url="/TransactionAction.do?action=sendOTPPayment&userID="+userid+"&mobile="+Rmobile+"&agmobile="+agmobile+"&sessionID=<%=session.getId()%>&purpose="+purpose+"&ran="+ran;
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
</script>
<script>
function saveData()
	{
	  var mobileno=document.getElementById("cash_to_mobno").value;
	  var agnkid=document.getElementById("kid").value;
	  var userID=document.getElementById("userid").value;
	  var agOTP=document.getElementById("agotp").value;
	  var beneOTP=document.getElementById("beneotp").value;
	  var agmobile=document.getElementById("mob").value;
	   var ran=parseInt(Math.random()*9999);
	var url="/TransactionAction.do?action=postAgentFailureCashPayment&SenderMobile="+mobileno+"&agmobile="+agmobile+"&tranKid="+agnkid+"&userID="+userID+"&sessionID=<%=session.getId()%>&agOTP="+agOTP+"&beneOTP="+beneOTP+"&agmobile="+agmobile+"&ran="+ran;
		http.open("POST",url,false);
		http.onreadystatechange= function (){processdata1()};
		http.send(null);
	}

	function processdata1()
		{
			if (http.readyState == 4)
			{
				if (http.status == 200)
				{
					   var resArray=http.responseText;
					   var jsonData = JSON.parse(resArray);
					   
					   if(jsonData=="-1"){
							alert("Dear Customer your Transaction has failed ");
							window.location.href = "/fundtransfer/cashreversal.jsp";
					   
					   	}else if(jsonData=="-4"){
							alert("Dear Customer your Transaction has already been reversed");
							window.location.href = "/fundtransfer/cashreversal.jsp";
					   
						}else if(jsonData=="-2"){
							alert("Dear Customer your OTP do not match");
							return false ; 
						}
						else if(jsonData=="-3"){
							alert("Dear Customer your OTP is expired");
							return false ; 
						}
						else{
							
							alert("Dear Customer your Transaction has been successfully and Transaction Id: "+jsonData);
							window.location.href = "/fundtransfer/cashreversal.jsp"	;
							
						}
				}
						else
					{
						alert("HTTP error: " + http.status);
					}
			}
	}

function bacck(){
		window.location.href = "/fundtransfer/agentTrn.jsp"
		}

</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=agentfund"/>
<tiles:put name="menu" value="/common/user_left.jsp?src=agentfund"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<html:form action="/request/DDRequest">
<body style="margin:0 0 0 0;" onload="fillData()"><br>

<table align="center" class="wrapperDataTable" cellpadding="0" cellspacing="0"  >
	<tr>
		<td  class="wrapperDataTableTR" align="center" width=950px > Agent Fund Transfer >> Cash Reversal</td>
	</tr>
	<tr>
	<td>
	<table border="" align="center">
	   <tr><td>
	 Sender's Mobile Number
				<input type=text  id="cash_to_mobno" style="margin-left:15px;" maxlength=10 onblur="getData()"/>
	   </td></tr>
	    <tr><td> select Payee
				<select style="margin-left:85px; " property="name" id="cname" onchange="selData(this.value)">
				<option value="">Select</option>
					
				</select>
	   </td></tr>
	    <tr><td>
	   Name
				<input type=text  id="cash_to_name" style="margin-left:120px;" readonly/>
	   </td></tr>
	    <tr><td>
	   Amount
				<input type=text  id="cash_to_amount" style="margin-left:110px;" readonly/>
	   </td></tr>
	     
	    <tr>
	  </br>
	<td align="center">
		<input type="button" name="ok" tabindex="22" value="Send OTP" onclick="sendOTP()" class="Button" id="ok">
		<input type="button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel"></td>
    </td>
	 </tr>
	
	<tr>
	<td>
	<table id="otptable">
	<tr>
	<td>
	 Enter Agent OTP: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="agotp">
	 </td>
	</tr>
	<tr>
	<td>
	 Enter Reciever's OTP: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="beneotp">
	 </td>
	</tr>
	<tr>
	<td align="center">
	 <input type="button" onClick="saveData()" style="width:100px" value="confirm"/>
	 </td>
	</tr>
			</table>
			 </table>
	 </td>
	</tr>

</table>
	<input type="hidden" name="webData" id="webData"/>
	<input type="hidden" name="kid" id="kid"/>
	<input type="hidden" name="kid" id="mob" value="<%=mob%>" />
	<input type="hidden"  style="margin-left: px;" maxlength="35"  value="<%=login_id%>" size="40" id="userid">
</body>
</html:form>
</tiles:put>
</html:form>
</tiles:insert>
<script type="text/javascript">

			<%if(session.getAttribute("error")!=null) {
				String result=(String)session.getAttribute("error");
				session.removeAttribute("error");
				if(result.equalsIgnoreCase("success")){%>
						//alert('<bean:message bundle ="<%=lang%>" key="7455"/>');
					<%}
					else 
					{%>
					//alert('<bean:message bundle ="<%=lang%>" key="7456"/>');
					<%}}%>
				</script>


<style>
.dataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
		
        font-weight: bold;
        color: #092771;
        text-decoration: none;
		background-color:#BFBFBF;
		text-align:center;

}
.dataTableTD{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:center;


}
</style>

	 
