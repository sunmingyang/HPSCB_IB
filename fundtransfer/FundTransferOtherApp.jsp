<%@ include file="/common/Include.jsp" %>
<%
 int errorcount=0;
	String usrName = "",CustomerAcc="";   
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
	
	String login_id="";
	if(session.getAttribute("userid")!=null){
		login_id = (String)session.getAttribute("userid");//New changes on 16/07/2008;
	}
	String otpmatch[]=null;
	 if(session.getAttribute("OtpNot") != null){
	  	otpmatch = (String[])session.getAttribute("OtpNot");
	  	session.removeAttribute("OtpNot");
	 }	
	String mob="",refNo="",Account="",AccountName="",Amount="";
	if(session.getAttribute("refNo") != null){
		refNo = (String)session.getAttribute("refNo");
	//	session.removeAttribute("refNo");
	}
	if(session.getAttribute("CrAccountNo") != null){
		Account = (String)session.getAttribute("CrAccountNo");
	//	session.removeAttribute("CrAccountNo");
	}
	if(session.getAttribute("CrAccountName") != null){
		AccountName = (String)session.getAttribute("CrAccountName");
	//	session.removeAttribute("CrAccountName");
	}
	if(session.getAttribute("Amount") != null){
		Amount = (String)session.getAttribute("Amount");
	//	session.removeAttribute("Amount");
	}
	
	if(session.getAttribute("customerMobile") != null){
		mob = (String)session.getAttribute("customerMobile");
	}
	
	if(session.getAttribute("customerAcc") != null){
		CustomerAcc = (String)session.getAttribute("customerAcc");
	}
	
	System.out.println("Customer Acc in JSP:" + CustomerAcc);
%>

<script language="JavaScript" >
var userid='<%=login_id%>' ;

function fillData()
{
<%if(otpmatch!=null){
if(otpmatch[1].equals("OtpNot")){%>
document.getElementById("remark").value='<%=otpmatch[0]%>';
document.getElementById("otp").focus();
alert("otp miss match");
return false;
<%}}%>
}
function otp_number(){
		var id=document.getElementById("fundkid").value;
		var mobile=document.getElementById("mob").value;

		var ran=parseInt(Math.random()*9999);
		var url="/TransactionAction.do?action=sendOTP&userID="+userid+"&beneficiaryAccNo="+id+"&mobile="+mobile+"&sessionID=12&purpose=Fund Transfer" +"&ran="+ran;

		http.open("POST",url,false);
		http.send(null);	
	
}

function setUserId(id)
{
		document.getElementById("fundkid").value=id;
}


function otp_confirm()
{

   	var id=document.getElementById("otp").value;
	var id1=document.getElementById("fundkid").value;
	var acc='<%=CustomerAcc%>';
	var amount=document.getElementById("amount").value;
	var beneficiaryAccNo=document.getElementById("sPayeeAcc").value;
	var remark=document.getElementById("remark").value;
	var sessionID=document.getElementById("sessID").value;
	document.forms[0].action="/OtherAppLogin.do?action=doFundTransfer&OTP="+id+"&userID="+userid+"&beneficiaryAccNo="+beneficiaryAccNo+"&accNo="+acc+"&transferAmt="+amount+"&sessionID=1455615&Remark="+remark ;

	document.forms[0].submit();
}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>

<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<html:form action="/TransactionAction.do">
<body style="margin:0 0 0 0;" onLoad="fillData()"><br>

<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr  >
		<td  class="wrapperDataTableTR" align="center" > Fund Transfer >> With in Bank</td>
		
	</tr>
	<tr >
		<td align="center"  >
				
		<table border="1" bordercolor="#ffffff" align="center" style="width: 70%; table-layout: fixed;" cellpadding="0" cellspacing="0" id="table">
			<TR>    
                    		<td class="dataTableTH" ><bean:message bundle="hindi" key= "6701"/></td> 
				<td><input style="background-color:#BFBFBF;" name="refNo" id="refNo" value="<%=refNo%>"></td>
			</tr>
			<TR>    
					<td class="dataTableTH"> <bean:message bundle="hindi" key= "7088"/></td>
					<td><input class="dataTableTH" name="mob" id="mob" value="<%=mob%>"></td>
			</tr>
			<TR>
					<td class="dataTableTH"> <bean:message bundle="hindi" key= "7085"/></td>
					<td><input class="dataTableTH" name="sPayeeAcc" id="sPayeeAcc" value="<%=Account%>"></td>
			</tr>
			<TR>
			
					<td class="dataTableTH" > <bean:message bundle="hindi" key= "39"/></td>
					<td><input class="dataTableTH" name="amount" id="amount" value="<%=Amount%>"></td>
		     </tr><TR>
			
					<td class="dataTableTH" ><bean:message bundle="hindi" key= "40"/></td>
					<td><input class="dataTableTH" name="payeeName" id="payeeName" value="<%=AccountName%>"></td>
					
		     </tr><TR>
				<td class="dataTableTH" > Remark:</td>
				<td> <input type="text" name="remark" id="remark"  >  </td>


						<input type ="hidden" name="fundkid" id="fundkid" value="<%=Account%>">
						<input type ="hidden" name="sessionID" id="sessionID" value="" >
						<input type ="hidden" name="sessionID" id="sessID" value="" >
					
			 <!-- <TH> Statement</TH> -->
			</tr>
		</thead>
		
			</table>

		<br> <table> <tr> <td> <input type="button" onClick="otp_number()" style="width:100px" value="Pay"/> </td> </tr> </table><br> 
		<div class="post"> Enter OTP: &nbsp;&nbsp;&nbsp;
			<input type="text" name="otp" id="otp"> 
			<input type="button" onClick="otp_confirm()" style="width:100px" value="confirm"/> 
		</div> 
		</td>

	</tr>
	
</table>	
		
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
						alert('<bean:message bundle ="<%=lang%>" key="7455"/>');
					<%}
					else 
					{%>
					alert('<bean:message bundle ="<%=lang%>" key="7456"/>');
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

	 
