	<%@ include file="/common/Include.jsp" %>
	<%@ page import="java.util.GregorianCalendar" %>
<%
		String accountList="" ; 
		String [] AccListArr= null ; 
		if (session.getAttribute("allAccountlist") != null ) { 
		   accountList=(String)session.getAttribute("allAccountlist");
		   AccListArr =accountList.split(",");
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
		 String[][] sData=(String[][])session.getAttribute("failedTrn");
	%>	
	<script>
	function checkEmptyFields(){
	/*	var mobNo=document.getElementById("mobileNo").value;
		var failedData=document.getElementById("failedData").style.display;
		alert(failedData);
		if(mobNo=="")
		{
			alert("Please enter Mobile Number");
			return false;
		}
		else if(document.getElementById("toAccountCell").style.display=="block")
		{
			var toAcc=document.getElementById("toAccount").value;
			if(toAcc=="")
			{
				alert("Please enter to account");
				return false;
			}
		}
		var toMobile=document.getElementById("toMobile").value;
		var amount=document.getElementById("amount").value;
		var chrg=document.getElementById("chrg").value;
		if(toMobile=="" && failedData=="block")
		{
				alert("Please enter to mobile");
				return false;
		}
		else if(amount=="" && failedData=="block")
		{
				alert("Please enter Amount");
				return false;
		}
		else if(chrg=="" && failedData=="block")
		{
				alert("Please enter Charges");
				return false;
		}
		else if(document.getElementById("otptable").style.display=="block")
		{
			var senderOTP=document.getElementById("senderotp");
			var recOTP=document.getElementById("agotp");
			if(senderOTP=="")
			{
				alert("Please enter sender OTP");
				return false;
			}
			else if(recOTP=="")
			{
				alert("Please enter Agent OTP");
				return false;
			}
		}*/
		return true;
	}
	function bacck(){
			window.location.href = "/fundtransfer/refundFailed.jsp"
	}
	function saveData(){
		var mobNo=document.getElementById("mobileNo").value;
		var accNo=document.getElementById("accList").value;
		var type="";
		var fromAcc=document.getElementById("fromAcc").value;
		if(mobNo=="")
		{
			alert("Please enter mobile number");
			return false;
		}
		if(document.getElementById("Cash").checked==true)
			type=document.getElementById("Cash").value;
		else if(document.getElementById("Bank").checked==true)
			type=document.getElementById("Bank").value;
		else
		{
			alert("Please select Transaction Type");
			return false;
		}
		if(fromAcc==""&& type=="B")
		{
			alert("Please enter Account Number");
			return false;
		}
		var url="/TransactionAction.do?action=getFailedTransaction&mobileNo="+mobNo+"&accountNo="+accNo+"&type="+type+"&fromAcc="+fromAcc;
		//alert(url);
		http.open("post",url,false);
		http.onreadystatechange= function (){ isFailedTran()};
		http.send(null);
	
	}
	function checkIfAlready(i)
		{
			var table = document.getElementById("failedTrnTable");
			var rowCount = table.rows.length;
			for(var j=0;j<rowCount-1;j++)
			{
				if(document.getElementById("failedTrn["+j+"]").checked==true && i!=j)
					 document.getElementById("failedTrn["+j+"]").checked=false;
			}
		}
	function isFailedTran()
	{
		if(http.readyState==4){
			if(http.status==200){
				var resArray1=http.responseText;
				//alert("resArray1=  "+resArray1);
				var jsonData1=JSON.parse(resArray1);
				//alert("jsonData="+jsonData1);
				if(jsonData1=="failedTran")
				{
					window.location.href = "/fundtransfer/refundFailed.jsp?isFailed=true";
				}
				else
				{
					window.location.href = "/fundtransfer/refundFailed.jsp?message=No failed Transaction";
				}
			}
		}
	}
	function sendOTP()
	{
		var table=document.getElementById("failedTrnTable");
		var rowCount=table.rows.length;
		//alert(rowCount);
		var flag=false;
		<% if(sData!=null)
			for(int i=0;i<sData.length;i++){
		%>
			var chk=document.getElementById("failedTrn[<%=i%>]").checked;
			if(chk==true)
			{
				flag=true;
				var mobNo="<%=sData[i][7]%>";
				var accNo="<%=sData[i][0]%>";
				var tomobNo="<%=sData[i][13]%>";
				var toaccNo="<%=sData[i][14]%>";
				var purpose="ReFund Transfer";
				var ran=parseInt(Math.random()*9999);
				var url="/TransactionAction.do?action=sendOTPAGN&DebitAccount="+accNo+"&beneficiaryAccNo="+toaccNo+"&tomobile="+tomobNo+"&sessionID=<%=session.getId()%>&frommobile="+mobNo+"&purpose="+purpose+"&ran="+ran;
				//alert(url);
				http.open("POST",url,false);
				http.onreadystatechange= function (){processResOTP("<%=i%>",accNo,mobNo,toaccNo,tomobNo,"<%=sData[i][21]%>","<%=sData[i][17]%>","<%=sData[i][18]%>")};
				http.send(null);
			}
		<%}%>
		if(flag==false)
		{
			alert("Please select a checkbox");
			return false;
		}
	}
	function processResOTP(trnid,fromaccNo,frommobNo,toaccNo,tomobNo,toAgent,amount,chrg){
		 if (http.readyState == 4)
		 {
			// Check that a successful server response was received
			if (http.status == 200)
			{
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				alert("Dear Customer your OTP has been sent on Mobile: "+jsonData.mobileNo);
				<%if(sData!=null){%>
					/*document.getElementById("fromAccount").value=fromaccNo;
					document.getElementById("fromMobile").value=frommobNo;
					if(toaccNo=="")
						document.getElementById("toAccountCell").style.display="none";
					else
						document.getElementById("toAccount").value=toaccNo;
					document.getElementById("toMobile").value=tomobNo;
					if(toAgent=="")
						document.getElementById("toAgentCell").style.display="none";
					else
						document.getElementById("toAgent").value=toAgent;
					document.getElementById("amount").value=amount;
					document.getElementById("chrg").value=chrg;
					
					document.getElementById("failedTrnData").style.display="none";
					document.getElementById('otptable').style.display="block";*/
					window.location.href="/fundtransfer/agentTrn.jsp?isFailed=true&tranid="+trnid;
				<%}%>    
			}
		 }
	}
	function refundTransaction(){
		if(checkEmptyFields())
		{
			var mobNo=document.getElementById("mobileNo").value;
			var accNo=document.getElementById("accList").value;
			var tomobNo=document.getElementById("toMobile").value;
			var toaccNo=document.getElementById("toAccount").value;
			var senderOTP=document.getElementById("senderotp").value;
			var recOTP=document.getElementById("agotp").value;
			var purpose="ReFund Transfer";
			var ran=parseInt(Math.random()*9999);
			<% if(sData!=null){%>
				var url="/TransactionAction.do?action=refundFailedTransaction&DebitAccount="+accNo+"&beneficiaryAccNo="+toaccNo+"&tomobile="+tomobNo+"&sessionID=<%=session.getId()%>&frommobile="+mobNo+"&agOTP="+recOTP+"&senderOTP="+senderOTP+"&purpose="+purpose+"&ran="+ran+"&trankid=<%=sData[0][22]%>";
			<%}%>
				//alert(url);
			http.open("POST",url,false);
			http.onreadystatechange= function (){
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				if(jsonData=="-1")
				{
					alert("Your transaction is alresdy refunded");
					//return false;
				}
				else if(jsonData=="-2")
				{
					alert("Dear Customer your OTP did not match.");
					//return false ; 
				}
				else  if(jsonData=="-3")
				{
					alert("Dear Customer your OTP has been expired ");
					//return false ; 
				}
				else
				{
					alert("Dear customer your failed transaction is successfully refunded and Your id is"+jsonData);
					//return false;
				}
				window.location.href="/fundtransfer/refundFailed.jsp";
			};
			http.send(null);
				
		}
	}
	function tochange(){
		if(document.getElementById("Bank").checked==true)
		{
			document.getElementById("fromAccCell").style.display="block";
			document.getElementById("fromAcc").focus();
		}
		else if(document.getElementById("Cash").checked==true)
			document.getElementById("fromAccCell").style.display="none";
			
	}
	function fillData(){
	/*	document.getElementById("otptable").style.display="block";
		document.getElementById("toAccountCell").style.display="block";
		document.getElementById("failedData").style.display="block";*/
		document.getElementById("mobileNo").focus();
		<%if(request.getParameter("isFailed")!=null)
	    {%>
   			document.getElementById("detailTable").style.display="none";
   			setFailedTran();
  		<%}%>
		
	}
	function setFailedTran()
 {
  var sub="<table border='' style='width:100%;' id='failedTrnTable'><tr style='text-align:center;text-size:5px;font-weight:bold;'><td>&nbsp</td>";
     sub+="<td>Transaction Date</td><td>Sender Account</td><td>Sender Mobile</td>";
     sub+="<td>Reciever Account</td><td>Reciever Mobile</td><td>Agent Name</td>";
     sub+="<td>Amount</td><td>Charges</td></tr>";
     <%
     
      if(sData!=null){
       for(int i=0;i<sData.length;i++)
       {
     %>
        sub+="<tr><td>";
        sub+="<input type='checkbox' id='failedTrn[<%=i%>]' name='failedTrn[<%=i%>]' onchange='checkIfAlready(<%=i%>)'/></td>";
        sub+="<td><%=sData[i][23].substring(0,sData[i][23].lastIndexOf('-')+3)%></td>";
        sub+="<td><%=sData[i][0]%></td>";
        sub+="<td><%=sData[i][7]%></td>";
        sub+="<td>";
        sub+="<%=sData[i][14]%>";
        sub+="</td>";
        sub+="<td>";
        sub+="<%=sData[i][13]%>";
        sub+="</td>";
        sub+="<td>";
        sub+="<%=sData[i][21]%>";
        sub+="</td>";
        sub+="<td>";
        sub+="<%=sData[i][17]%>";
        sub+="</td>";
        sub+="<td>";
        sub+="<%=sData[i][18]%>";
        sub+="</td>";
        sub+="</tr>";
        
      <%}}%>
     sub+="</table>";
     sub+="<center><input type='button' value='Send OTP' onclick='sendOTP()' class='button'/>";
     sub+="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
     sub+="<input type='button' value='Cancel' onclick='bacck()' class='button'/></center>";
     document.getElementById("detailTable").style.display="none";
     //alert(sub);
     document.getElementById("failedTrnData").innerHTML=sub;
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
	<br/><br/>
	<% if(request.getParameter("message")!=null){%>
		<font style="font-weight:bold;font-size:medium;color:Red;">
			<%=request.getParameter("message")%>
		</font>
	<%}else{%>
		<div>
		<table border="" id="detailTable">
			<tr>
				<td>
					Account No.
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo"  id="accList" onChange="mobileNo()" style="width:135px;">
						<%
							if (AccListArr != null)
								for(int i=0;i<AccListArr.length;i++){%>
									<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
								<%}
						%>
					</select> 
				</td>
			</tr>
			<tr>
				<td>
					Mobile No.
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="mobileNo"  maxlength=10/>
				</td>
			</tr>
			<tr>
				<td align="center">
					<p> Transaction Type: <input type="radio" name="group2" id="Cash" value="C" onclick="tochange()" >Cash 
					&nbsp;&nbsp;&nbsp;&nbsp; 
					<input type="radio"  name="group2" id="Bank" value="B" onclick="tochange()">Bank </p>
				</td>
			</tr>
			<tr>
				<td id="fromAccCell" style="display:none;">
					Sender Account:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="fromAcc" />
				</td>
			</tr>
			<tr>
				<td align="center">
				<br/>
					<input type="button" value="  View  " onclick="saveData()" class="Button" />
				</td>
			</tr>
		</table>
		</div>
		<div class="panel-body" id="failedTrnData"> </div>
		<div>
		<table id="otptable" border="" style="display:none;">
			<tr>
				<td>
					From Account:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="fromAccount"  />
				</td>
			</tr>
			<tr>
				<td>
					From Mobile:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="fromMobile"  maxlength=10/>
				</td>
			</tr>
			<tr>
				<td id="toAccountCell">
					To Account:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="toAccount"  />
				</td>
			</tr>
			<tr>
				<td>
					To Mobile:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="toMobile"  />
				</td>
			</tr>
			<tr>
				<td id="toAgentCell">
					Agent Name:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="toAgent"  />
				</td>
			</tr>
			<tr>
				<td>
					Amount:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="amount"  />
				</td>
			</tr>
			<tr>
				<td>
					Charges:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type=text  id="chrg"  />
				</td>
			</tr>
			
			<tr>
				<td>
					Enter Agent OTP:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="otp" id="agotp">
				</td>
			</tr>
			<tr>
				<td>
					Enter Sender OTP:
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name="otp" id="senderotp"> 
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="button" onClick="refundTransaction()" style="width:100px" value="confirm" class="Button"/>
				</td>
			</tr>
		</table>
		</div>
	<%}%>
	
	</body>
	</html:form>

	</tiles:put>
	</html:form>


	</tiles:insert>


		 
