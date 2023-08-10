	<%@ include file="/common/Include.jsp" %>
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

	function otp_number(){
			var id=document.getElementById("fundkid").value
			var mob=document.getElementById("mob").value;
			
			var ran=parseInt(Math.random()*9999);
			var url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+id+"&mobile="+mob+"&sessionID=12" +"&ran="+ran;
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
		   alert("Please enter OTP");
		   return false;
		}
		else if(id1=="")
		{
		   alert("Please select a Payee to confirm");
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
							alert("Dear Customer , Payee has not been confirmed due to wrong OTP");
						}else {
							alert("Dear Customer , Payee has been confirmed successfully ");
						}
						window.location.href="/fundtransfer/fund.do?action=fetchPayee";
					}
				}
	}
	</script>

	<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
	<!-- <html:form action="/jsp/login.do"> -->
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
	&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
	</tiles:put>
	<html:form action="/TransactionAction.do">
	<body style="margin:0 0 0 0;"><br>
	<%if(fundinfo!=null){%>
	<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
		<tr  >
			<td  class="wrapperDataTableTR" align="center" > Fund Transfer >> Confirm Payee</td>
			
		</tr>
		<tr >
			<td align="center"  >
				<table width=527>
					<tr>
						<td>
							<div id="diverrmessage" style="display:none">
								<logic:messagesPresent property="NoServer">
								<html:errors property="NoServer"/>
								</logic:messagesPresent>
							</div>
						</td>
					</tr>
					  <tr>
			<td>
			   Customer Mobile No.   
				<input type="text" id="mob" size="20" readonly="true" value="<%=mob%>"/>
			</td>
		</tr>
				</table>
				<br>
		
			<table border="1" bordercolor="#ffffff" align="center" style="width: 70%; table-layout: fixed;" cellpadding="0" cellspacing="0" id="table">
			
				<TR>    
						<td width="12px" style="text-align:center;"  class="dataTableTH"></td>
						<td class="dataTableTH" width="102px"><bean:message bundle="hindi" key= "7086"/></td>
						<td width="105px" class="dataTableTH"> <bean:message bundle="hindi" key= "7088"/></td>
						<td width="105px" class="dataTableTH"> <bean:message bundle="hindi" key= "7085"/></td>
						<td class="dataTableTH" width="102px"> <bean:message bundle="hindi" key= "7453"/></td>
						<td class="dataTableTH" width="102px"><bean:message bundle="hindi" key= "382"/></td>
						<td class="dataTableTH" width="102px"><bean:message bundle="hindi" key= "7448"/></td>
						<td class="dataTableTH" width="102px"><bean:message bundle="hindi" key= "1180"/></td>
						
						
				 <!-- <TH> Statement</TH> -->
				</tr>
			</thead>
			<tbody class="dataTableTH">
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
							<td><input style="background-color:#BFBFBF; width:102px; " name="sNickName<%=fundinfo[i][7]%>" id="sNickName" value="<%=fundinfo[i][0]%>"></td>
							<td><input style="background-color:#BFBFBF; width:102px; " name="mob<%=fundinfo[i][7]%>" id="mob" value="<%=fundinfo[i][1]%>"></td>
							<td><input style="background-color:#BFBFBF; width:102px; " name="sPayeeAcc<%=fundinfo[i][7]%>" id="sPayeeAcc" value="<%=fundinfo[i][2]%>"></td>
							<td><input style="background-color:#BFBFBF; width:102px; " name="IFSCcode<%=fundinfo[i][7]%>" id="IFSCcode" value="<%=fundinfo[i][3]%>"></td>
							<td><input style="background-color:#BFBFBF; width:102px; " name="select<%=fundinfo[i][7]%>" id="select" value="<%=fundinfo[i][4]%>"></td>
							<td><input style="background-color:#BFBFBF; width:102px; " name="payeeName<%=fundinfo[i][7]%>" id="payeeName" value="<%=fundinfo[i][5]%>"></td>
							<td><input style="background-color:#BFBFBF; width:102px; " name="sAccountType<%=fundinfo[i][7]%>" id="sAccountType" value="<%=fundinfo[i][6]%>">
							<input type ="hidden" name="fundkid" id="fundkid" >
							<input type ="hidden" name="sessionID" id="sessionID" value="" >
							<input type ="hidden" name="sessionID" id="sessionID" value="" >
							<td>
							</td>
							
						</tr>

						<%}}%>
					</tbody>
				</table>




	<br> <table> <tr> <td> <input type="button" onClick="otp_number()" style="width:100px" value="OTP"/></button> </td> </tr> </table><br> <div class="post"> Enter OTP: &nbsp;&nbsp;&nbsp;<input type="text" name="otp" id="otp"> <input type="button" onClick="otp_confirm()" style="width:100px" value="confirm"/> </div> </td>

		</tr>
		
	</table>	
	<%}else{%>
   	<font color="red" size="5px">No Payee to Confirm</font>
   	<%}%>		
	</body>
	</html:form>

	</tiles:put>
	</html:form>


	</tiles:insert>


	

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

		 
