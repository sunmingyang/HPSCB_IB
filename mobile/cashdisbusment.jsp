<%@ include file="/common/Include.jsp" %>
<%
	String accountList="" ; 
	String [] AccListArr= null ; 
	if (session.getAttribute("allAccountlist") != null ) { 
	   accountList=(String)session.getAttribute("allAccountlist");
	   System.out.println("FundAccountList----------------"+accountList);
	   AccListArr =accountList.split(",");
	}
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
		document.getElementById("ok").disabled = true;
		
}
function verifysender()
{

	var userID=document.getElementById("userid").value;
	var benemobile=document.getElementById("recmobno").value;
	var senderac=document.getElementById("senderac").value;
	var amount=document.getElementById("senderamt").value;
	var trandate=document.getElementById("trdate").value;
	var array = new Array();
	array = trandate.split('/');
	var trandate1=(array[2] + "-" + array[1] + "-" + array[0])
	//alert(trandate1);
	var ran=parseInt(Math.random()*9999);
	var url="/TransactionAction.do?action=verifySenderDeposit&userID="+userID+"&mobileNo="+benemobile+"&senderAcc="+senderac+"&depositAmt="+amount+"&tranDate="+trandate1+"&ran="+ran;
//	var url="http://192.168.1.72:8290/TransactionAction.do?action=verifySenderDeposit&userID=43860744&beneMobile=9314506489&senderAcc=0012011234&depositAmount=5000.00&tranDate=2015-01-01" +"&ran="+ran;"
	//alert(url);
	http.open("POST",url,false);
	http.onreadystatechange= function (){processdataverify()};
	http.send(null);
}
function processdataverify()
	{
		 if (http.readyState == 4)
        {
            if (http.status == 200)
            {
				   var resArray=http.responseText;
				 // alert(resArray);
				  var jsonData = JSON.parse(resArray);
				 var senderName=jsonData.depositorName;
				  if(senderName=="")
				{
					  alert("There is no transaction with the information provided by you.Please recheck the entry and try again.");
				}
				else
				{
					alert("Your information is verified, Please proceed");
					document.getElementById("ok").disabled = false;
				}
			  
				 
			 }
				 
			
		}
	}

 function sendOTP(){
	
  var recmobile=document.getElementById('recmobno').value;					
 // var agmobile="7891500010";
	var agmobile=document.getElementById('mob').value;
	 document.getElementById('otptable').style.display="block";
	    var purpose='Cash Disbusment';
	    var userid=document.getElementById('userid').value;
		var ran=parseInt(Math.random()*9999);
		var url="/TransactionAction.do?action=sendOTPdisbus&userID="+userid+"&agmobile="+agmobile+"&recmobile="+recmobile+"&sessionID=<%=session.getId()%>&purpose="+purpose+"&ran="+ran;
		//alert(url);
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
	var userID=document.getElementById("userid").value;
	var benemobile=document.getElementById("recmobno").value;
	var senderac=document.getElementById("senderac").value;
	var amount=document.getElementById("senderamt").value;
	var trandate=document.getElementById("trdate").value;
	var otp=document.getElementById("recotp").value;
	var ran=parseInt(Math.random()*9999);
	var url="/TransactionAction.do?action=cashDisbuseFromSplAcc&userID="+userID+"&beneMobile="+benemobile+"&senderAcc="+senderac+"&sessionID=<%=session.getId()%>&depositAmount="+amount+"&OTP="+otp+"&tranDate="+trandate+"&ran="+ran;
//	var url=http://192.168.1.72:8290/TransactionAction.do?action=cashDisbuseFromSplAcc&userID=43860744&beneMobile=9314506489&senderAcc=0012011234&depositAmount=5000.00&OTP=345123&tranDate=2015-01-01" +"&ran="+ran;
		//alert(url);
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
							alert("Dear Customer your Transaction has been Failed");
							window.location.href = "/fundtransfer/cashdisbusment.jsp"	;
					   
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
							window.location.href = "/fundtransfer/cashdisbusment.jsp"	;
							
						}
				}
						else
					{
						alert("HTTP error: " + http.status);
					}
			}
	}

function bacck(){
	window.location.href = "/mobile/Agent_fund_transfer.html"
}

</script>

<body style="margin:0 0 0 0;" onload="fillData()"><br>

<table align="center" class="wrapperDataTable" cellpadding="0" cellspacing="0"  >
	<tr>
		<td  class="wrapperDataTableTR" align="center" width=950px > Agent Fund Transfer >> Cash Disbursement </td>
	</tr>
	<tr>
	<td>
	<table border="" align="center">
	   <tr><td>
	  Sender a/c Number
				<input type=text  id="senderac" style="margin-left:88px;" maxlength=20/>
	   </td></tr>
	    <tr><td>
	   Transaction Date (DD/MM/YYYY)
				<input type=text   id="trdate" style="margin-left:20px;" />
	   </td></tr>
	    <tr><td>
	   Amount
				<input type=text  id="senderamt" style="margin-left:149px;" />
	   </td></tr>
	  
	    <tr><td>
	  Receiver Name
				<input type=text  id="recname" style="margin-left:113px;" />
	   </td></tr>
	    <tr><td>
	  Receiver Mobile Number
				<input type=text  id="recmobno" style="margin-left:66px;" maxlength=10/>
	   </td></tr>
	   
	     
	    <tr>
	  </br>
	<td align="center">
	<input type="button" name="verify" tabindex="22" value="Verify" onclick="verifysender()" class="Button" id="verify">
		<input type="button" name="ok" tabindex="22" value="Send OTP" onclick="sendOTP()" class="Button" id="ok">
		<input type="button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel"></td>
    </td>
	 </tr>
	
	<tr>
	<td>
	<table id="otptable">
	<tr>
	<td>
	 Enter Agent OTP: &nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="agnotp" style="margin-left:89px;"> 
	 </td>
	</tr>
	<tr>
	<td>
	 Enter Reciever OTP: &nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="recotp" style="margin-left:77px;">
	 </td>
	</tr>
	<tr>
	<td align="center">
	 <input type="button" onClick="saveData()" style="width:100px" value="confirm" tabindex="22"/>
	 </td>
	</tr>
			</table>
			 </table>
	 </td>
	</tr>

</table>
	<input type="hidden" name="webData" id="webData"/>
	<input type="hidden" name="kid" id="mob" value="<%=mob%>" />
	<input type="hidden"  style="margin-left: px;" maxlength="35"  value="<%=login_id%>" size="40" id="userid">
</form>
	
</body>
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

	 
