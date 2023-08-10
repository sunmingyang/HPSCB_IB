<%@ include file="/common/Include.jsp" %>

<%
//System.out.println("usr_left.jsp se ");
String src="1";
String mode="1";
String userInfo[][]=null;
if(request.getParameter("src")!=null){
src=(String)request.getParameter("src");
}
if(request.getParameter("mode")!=null){
mode=(String)request.getParameter("mode");
}
 if(session.getAttribute("userInfo")!=null){
	   userInfo = (String[][])session.getAttribute("userInfo");
       System.out.println("LENGTH OF USERINFO is : "+userInfo.length);
    }
%>
<script>
function disp()
{
}
function dispbgcolor(str)
{
}
function hidebgcolor()
{

}
</script><body >
<div style="position:static;vertical-align:top;width:100%;height:100%;border:Solid 0 green">
<br>

<!--<br>
<br>
<br>
		<table class="leftTreemenu" cellspacing="0" cellpadding="0">
				<tr >
					<td <%out.println(src.equals("acc")?"class='clicktdleft'":"class='navMenu'");%>>
						<a href="/accsum/AccountsMain.jsp">Accounts </a>
					</td>
				</tr>
				<tr  >
					<td <%out.println(src.equals("fundtr")?"class='clicktdleft'":"class='navMenu'");%>>
						<a href="/fundtransfer/fund.jsp">Fund Transfer</a>
					</td>
				</tr>
				<tr  >
					<td <%out.println(src.equals("request")?"class='clicktdleft'":"class='navMenu'");%>>
						<a href="/request/reqChk.jsp">Request</a>
					</td>
				</tr>
				<tr  >
					<td <%out.println(src.equals("usridch")?"class='clicktdleft'":"class='navMenu'");%>>
						<a href="/openaction.do?src=usridchange">User Id Change</a>
					</td>
				</tr> -->
				<!-- <tr   <%out.println(src.equals("mail")?"class='clicktdleft'":"class='tdforleft1'");%>>
				<td >
				<a href="/mail/mailInBoxAction.do?action=executeonLoad" > 
				Write to A/c Manager</a>
				</td></tr> -->
				<!-- <tr   >
					<td <%out.println(src.equals("faq")?"class='clicktdleft'":"class='navMenu'");%>>
						<a href="/accsum/FAQ.jsp" > 	FAQ</a>
					</td>
				</tr> -->
				<!-- <tr>
					<td  class="simple" onmouseover="hidectr()">
					<a href="/hotkey/HotKey.jsp" class=nav > 
					Calculators</a>
					</td>
				</tr>
				 -->
				<!-- <tr>
					<td  class="simple">&nbsp;</td>
				</tr>
				<tr>
					<td  class="simple">&nbsp;</td>
				</tr>
				<tr>
					<td  class="simple">&nbsp;</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr> -->
<!-- 			</table><br><br> -->

	<%if(src.equals("acc")){%>
	<table  width="100%" cellspacing="0" cellpadding="0"  style="margin-left:12">
		<tr>
			<td class="accountImage"></td>
		</tr>
	</table>
	<table align="right" width="90%" cellspacing="0" cellpadding="0" border=1  style="margin-left:5">
			
			
			<tr>
				<%if(mode.equals("miniStmt")){%>
				<td class="tdformenuUp">
				<%}else{%>
				<td nowrap <%out.println(mode.equals("accSummary")?"class='tdformenu'":"class='tdformenuUp2'");%> >
				<%}%>
				<a href="/accsum/acc_sum.do?action=getAccSummary">Account Summary</a>
				</td>
			</tr>
			
			<tr>
				<%if(mode.equals("detailStmt")){%>
					<td class="tdformenu2" wrap>
				<%}else{%>
					<td wrap <%out.println(mode.equals("miniStmt")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
				<a href="/accsum/miniStmt.jsp?success=mini">Mini Statement</a>
				</td>
			</tr>
			
			<tr align="center">
				<%if(mode.equals("accDetails")){%>
					<td class="tdformenu2" wrap>
				<%}else{%>
				<td wrap <%out.println(mode.equals("detailStmt")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
				<a href="/accsum/acc_sum.do?action=setDetail">Detail Statement</a>
				</td>
			</tr>
			
			<tr align="center">
				<td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
				<a href="/accsum/AccountDetails1.jsp"> Account Details</a>
				</td>
			</tr>
			<tr align="center">
				<td wrap <%out.println(mode.equals("fdDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
				<a href="/accsum/FD_Detail.jsp"> FD Details</a>
				</td>
			</tr>
			
			<tr align="center">
				<td wrap <%out.println(mode.equals("loanDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
				<a href="/accsum/LoanRepayment.jsp"> Loan Repayment Schedule  </a>
				</td>
			</tr>
			
	</table>
	<%}
	if(src.equals("request")){%>
	<table  width="100%" cellspacing="0" cellpadding="0"  style="margin-left:12">
		<tr>
			<td class="requestImage"></td>
		</tr>
	</table>
	<table align="center" border="0" width="94%" cellspacing="0" cellpadding=0  >
			<tr >
				<%if(mode.equals("newChk")){%>
				<td class="tdformenuUp" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("apforDbtCrd")?"class='tdformenu'":"class='tdformenuUp2'");%>  wrap>
				<%}%>
				<a href="/openaction.do?src=debCard" ><bean:message bundle='<%=lang%>' key='7184'/> </a>
				</td>
			</tr>
			
			<tr >
				<%if(mode.equals("stopChk")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("newChk")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
				<%}%>
				<a href="/openaction.do?src=newChk"><bean:message bundle='<%=lang%>' key='7125'/> </a>
				</td>
			</tr>
			
			<tr >
				<%if(mode.equals("chkStatus")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("stopChk")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
				<%}%>
				<a href="/openaction.do?src=stopChk" ><bean:message bundle='<%=lang%>' key='7126'/></a>
				</td>
			</tr>
			
			<tr >
				<%if(mode.equals("ldebcard")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("chkStatus")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
				<%}%>
				<a href="/openaction.do?src=chkStatus"  ><bean:message bundle='<%=lang%>' key='7130'/></a>
				</td>
			</tr>
			<tr >
				<%if(mode.equals("AddrChangeReq")){%>
				<td class="tdformenuUp" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("ldebcard")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
				<%}%>
				<a href="/openaction.do?src=ldebcard"  ><bean:message bundle='<%=lang%>' key='7186'/></a>
				</td>
			</tr>
			<tr >
				<td <%out.println(mode.equals("AddrChangeReq")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
				<a href="/openaction.do?src=AddrChangeReq"  >Address Change Request</a>
				</td>
			</tr>
			<tr >
				<td <%out.println(mode.equals("RemiDocReq")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
				<a href="/request/DDRequest.do?action=saveDDRequest">Remittance Document Request</a>
				</td>
			</tr>

			
		</table>
	<%}
		
		
		if(src.equals("userOperation")){%>
		
		<table  width="100%" cellspacing="0" cellpadding="0"  style="margin-left:12">
			<tr>
				<td class="requestImage"></td>
			</tr>
		</table>
		
		<table align="center" border="0" width="94%" cellspacing="0" cellpadding=0  >
			<!-- <tr align="center">
			<%if(mode.equals("userCreation")){%>
				<td class="tdformenuUp" wrap>
				<%}else{%>
				<td   <%out.println(mode.equals("zoRoMasterEntry")?"class='tdformenu'":"class='tdformenuUp2'");%> >
				<%}%>	
					<a href="/openaction.do?src=zoro">ZO-RO Master Entry</a>
					
				</td>
			</tr> -->
			<tr align="center"> 
				<%if(mode.equals("userCreationExt")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("userCreation")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>	
					<a href="/openaction.do?src=create">User Creation</a>
				</td>
			</tr>
			<tr align="center">
				<%if(mode.equals("userActivation")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("userCreationExt")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>	
					<a href="/openaction.do?src=diffcreate">Add Account No In IB</a>
				</td>
			</tr>
			
			<tr align="center">
				<%if(mode.equals("userDeActivation")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("userActivation")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
					<a href="/openaction.do?src=activate">User Activation</a>
				</td>
			</tr>
			
			<tr align="center">
				<%if(mode.equals("autoUnLock")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("userDeActivation")?"class='tdformenu'":"class='tdformenu1'");%>
				>
				<%}%>
				 
					<a href="<%=request.getContextPath()%>/openaction.do?src=deactivate">User Deactivation</a>
				</td>
			</tr>
			
			<tr align="center">
				<%if(mode.equals("adminCreation")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("autoUnLock")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
					<a href="/openaction.do?src=AutoUnlock">Unlock Users</a>
				</td>
			</tr>
			
			<tr align="center">
				<%if(mode.equals("rejPasswdPrinting")){%>
				<td class="tdformenuUp" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("adminCreation")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
					<a href="/openaction.do?src=AdminUsr">Admin User Create</a>
				</td>
			</tr>
			<tr align="center"> 
				<%if(mode.equals("rejPasswdPrinting")){%>
				<td class="tdformenuUp" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("userBaned")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>	
					<a href="/openaction.do?src=AdminBanned">Admin User Baned</a>
				</td>
			</tr>
			
			<tr align="center">
				<td <%out.println(mode.equals("rejPasswdPrinting")?"class='tdformenu'":"class='tdformenu1'");%> nowrap>
					<a href="/openaction.do?src=reprintpass">Password Print</a>
				</td>
			</tr>
			<!-- <tr align="center">
				<td>
					<a href="/accforib/tempconfig.jsp">Different Server</a>
				</td>
			</tr>
			-->
		</table>

	<%}
	
	if(src.equals("reports")){%>
		<table  width="100%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="center" border="0" width="94%" cellspacing="0" cellpadding=0  >
			<tr align="center">
				<%if(mode.equals("LoginLogOutHistory")){%>
				<td class="tdformenuUp" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("StatusLogReport")?"class='tdformenu'":"class='tdformenuUp2'");%>>
				<%}%>
					<a href="/openaction.do?src=statuslog">User Status Change Report</a>
				</td>
			</tr>
			
			<tr align="center">
				<%if(mode.equals("BranchStatusReport")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("LoginLogOutHistory")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
					<a href="/UserInfoForAdmin.do?action=firstExecute"  >Login/Logout History</a> <!-- /jsp/LoginInfo.jsp -->
				</td>
			</tr>
			
			<tr align="center">
				<%if(mode.equals("UserStatusReport")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("BranchStatusReport")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
					<a href="/openaction.do?src=BranchStatus" >Branch Status Report</a>
				</td>
			</tr>
			
			
			<tr align="center">
				<%if(mode.equals("CreateUserByAdmin")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("UserStatusReport")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
					<a href="/openaction.do?src=UserStatus">User Status Report</a>
				</td>
			</tr>
			<tr align="center">
				<%if(mode.equals("DayWiseUserReport")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("CreateUserByAdmin")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
					<a href="/openaction.do?src=CreateUserByAdmin">Create User By Admin Report</a>
				</td>
			</tr>
			<tr align="center">
				<%if(mode.equals("ActivityReport")){%>
				<td class="tdformenu2" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("DayWiseUserReport")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
					<a href="/openaction.do?src=DayWiseUserReport">Day Wise User Report</a>
				</td>
			</tr>
			<!-- <tr align="center">
				<td >
					<a href="/openaction.do?src=trnsopr">Transaction Report</a>
				</td>
			</tr>
			
			<tr align="center">
				<td >
					<a href="/openaction.do?src=suspecttrn">Suspected Transaction Report</a>
				</td>
			</tr> -->
			
			<tr align="center">
				<td <%out.println(mode.equals("ActivityLogReport")?"class='tdformenu'":"class='tdformenu1'");%>>
					<a href="/openaction.do?src=activitylog">User Activity Report</a>
				</td>
			</tr> 			
			<!-- <tr align="center">
				<td>
					<a href="/accforib/tempconfig.jsp">Different Server</a>
				</td>
			</tr>
 -->
		</table>
<%}%> <!-- Addition by Abhishek Begins for mail work. -->
	<% if(src.equals("Mail")){%>
		<table  width="100%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="center" border="0" width="94%" cellspacing="0" cellpadding=0  >
			<tr align="center">
				<td <%out.println(mode.equals("Inbox")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/mail/mailInBoxAction.do?action=executeonLoad">Inbox</a>
				</td>
			</tr>
			<tr>
				<td <%out.println(mode.equals("OutBox")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/mail/mailOutBoxAction.do?action=executeonLoad">OutBox</a>
				</td>
	        </tr>
			<tr>
				<td <%out.println(mode.equals("Compose")?"class='tdformenu'":"class='tdformenuUp2'");%>>
			    <a href="/mail/mailComposeAction.do?action=executeOnLoad" >
					  Compose</a>
				</td>
			</tr>
			<tr>
				<td <%out.println(mode.equals("Sent")?"class='tdformenu'":"class='tdformenuUp2'");%>>			
				    <a href="/mail/mailSentFolderAction.do?action=executeonLoad" >
				  		Sent Folder
				  	</a>
				 </td>
			</tr>
		</table>	
	<%}%>
	
<%if(src.equals("fundtr")){%>
	
	<table  width="100%" cellspacing="0" cellpadding="0"  style="margin-left:12">
		<tr>
			<td class="accountImage"></td>
		</tr>
	</table>
	<table align="right" width="90%" cellspacing="0" cellpadding="0" border=1  style="margin-left:5">		
			
			<tr>
				<%if(mode.equals("confirmpayee")){%>
				<td class="tdformenuUp">
				<%}else{%>
				<td nowrap <%out.println(mode.equals("addPayee")?"class='tdformenu'":"class='tdformenuUp2'");%> >
				<%}%>
				<a href="/fundtransfer/fund.do?action=performAddPayee">Add Payee</a>
				</td>
			</tr>
			
			<tr>
				<%if(mode.equals("detailStmt")){%>
					<td class="tdformenu2" wrap>
				<%}else{%>
					<td wrap <%out.println(mode.equals("miniStmt")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>
				<a href="/fundtransfer/fund.do?action=fetchPayee">Confirm Payee</a>
				</td>
			</tr>
			
			<tr align="center">
				<%if(mode.equals("accDetails")){%>
					<td class="tdformenu2" wrap>
				<%}else{%>
				<td wrap <%out.println(mode.equals("detailStmt")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>

				<a href="/TransactionAction.do?action=PayeeWithinBank&mode=S" >Fund Transfer with in Bank</a>
				
				</td>
	
					<tr align="center">
				<%if(mode.equals("accDetails")){%>
					<td class="tdformenu2" wrap>
				<%}else{%>
				<td wrap <%out.println(mode.equals("detailStmt")?"class='tdformenu'":"class='tdformenu1'");%>>
				<%}%>

				<a href="/TransactionAction.do?action=PayeeWithinBank&mode=O" >Fund Transfer other Bank</a>
				
				</td>
			</tr>
			
			<tr align="center">
				<td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
				<a href="/sfmsneft/SaveNeft.do?action=getAccountData"> Fund Transfer with Neft</a>
				</td>
			</tr>
			<tr align="center">
				<td wrap <%out.println(mode.equals("other")?"class='tdformenu'":"class='tdformenu1'");%>>
				<a href="/fundtransfer/other.jsp"> Fund Transfer with IMPS</a>
				</td>
			</tr>
			
			
			
	</table>
	<% }
	  if(src.equals("accOpen")){%>
		<table  width="100%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="center" border="0" width="94%" cellspacing="0" cellpadding=0  >
			<tr align="center">
				<td <%out.println(mode.equals("fdAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/FdRequest.do?action=saveFdReqest">FD Account Request </a>
				</td>
			</tr>
			<tr>
				<td <%out.println(mode.equals("rdAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/RdRequest.jsp">RD Account Request </a>
				</td>
	        </tr>
			<tr>
				<td <%out.println(mode.equals("loanAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/rdDetail.jsp">Loan Account Request </a>
				</td>
	        </tr>
			
			
		</table>	
	<%}%>
	
	
</div>
</body>


<style>
.navMenu{
font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #092771;
        text-decoration: none;
		border-bottom:Solid 2 #ffffff;
		height:22px;
		padding-left:2;
		padding-right:2;
		background-image:url(../images/menu_row1.gif);
		background-position:right;
		background-repeat:no-repeat;


}
.leftTreemenu{
	border-left:Solid 7 #F1C567;
}
.clicktdleft{
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 8pt;
    font-weight: bold;
    color: #092771;
	background-color: #F1C567;
}



</style>
