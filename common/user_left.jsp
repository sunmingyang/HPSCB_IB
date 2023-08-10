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
   
    String custRole=(String)session.getAttribute("custRole");
	if(custRole==null) {
  		custRole="C" ;
  	}
   	String newMenu=easycbs.bancmateib.common.dto.BMConfig.getProperty("NewMenu");
  	if(newMenu==null)
 		newMenu="N";
 	StringBuilder cssMenu=(StringBuilder)session.getAttribute("subMenu");
 
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
<div style="position:static;vertical-align:top;width:100%;height:100%;border:Solid 0 green" >
<br>
<% if(newMenu.equals("Y") && cssMenu!=null){%>
 <%=cssMenu%>
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
<% }else{
	if(src.equals("acc")){%>
	<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:12">
		<tr>
			<td class="accountImage"></td>
		</tr>
	</table>
	<table align="left" width="70%" cellspacing="0" cellpadding="0" border=1  style="margin-left:5">
			
			
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
			<tr align="center">
			    <td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
			     <a href="/accsum/acc_sum.do?action=benList">DownLoad Beneficiary List</a>
			    </td>
			</tr>
  			<tr align="center">
			    <td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
			     <a href="/accsum/acc_sum.do?action=favAccount">Favourite Accounts</a>
			    </td>
			</tr>
  			<tr align="center">
			    <td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
			    <a href="/accsum/showBranch.jsp">Search Branch</a>
			    </td>
			</tr>
			<tr align="center">
			    <td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
			     <a href="/accsum/acc_sum.do?action=getmnuList">SiteMap</a>
			    </td>
			</tr>
			<tr align="center">
				<td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
					<a href="/accsum/tds_Certificat.jsp">TDS Certificate </a>
				</td>
			</tr>
			<tr align="center">
    			<td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
    				<a href="/accsum/depositInt.jsp">DEPOSIT INTEREST CERTIFICATE </a>
    			</td>
   			</tr>
   			<tr align="center">
    			<td wrap <%out.println(mode.equals("accDetails")?"class='tdformenu'":"class='tdformenu1'");%>>
    				<a href="/accsum/loanInt.jsp">LoanInterestCertificate </a>
    			</td>
   			</tr>
   						  
	</table>
	<%}
	if(src.equals("request")){%>
	<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:12">
		<tr>
			<td class="requestImage"></td>
		</tr>
	</table>
	<table align="left" border="1" width="70%" cellspacing="0" cellpadding=0 style="margin-left:5" >
			<tr >
				<%if(mode.equals("newChk")){%>
				<td class="tdformenuUp" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("apforDbtCrd")?"class='tdformenu'":"class='tdformenuUp2'");%>  wrap>
				<%}%>
				<a href="/openaction.do?src=debCard" ><bean:message bundle='<%=lang%>' key='7457'/> </a>
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
			<tr >
			    <td <%out.println(mode.equals("MBReq")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
			    <a href="/request/MBRequest.do?action=sendMBRequest">Mobile Banking Request</a>
			    </td>
			</tr>			
			<tr>
       			<td <%out.println(mode.equals("ATMReq")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
     			  <a href="/request/deactiveAtm.jsp">Deactivate ATM</a>
      			 </td>
  			</tr>
			<tr>
			   <td <%out.println(mode.equals("deactivateEBanking")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
			      <a href="/request/deactive_EBanking.jsp">Deactivate E-Banking Account</a>
			   </td>
			</tr>
		</table>
	<%}
		
		
		if(src.equals("userOperation")){%>
		
		<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:12">
			<tr>
				<td class="requestImage"></td>
			</tr>
		</table>
		
		<table align="left" border="0" width="70%" cellspacing="0" cellpadding=0  >
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
		<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="left" border="0" width="70%" cellspacing="0" cellpadding=0  >
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
<%
	if(src.equals("Productlaunch")){%>
		<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="left" border="0" width="70%" cellspacing="0" cellpadding=0  >
			<tr align="center">
				<%if(mode.equals("LoginLogOutHistory")){%>
				<td class="tdformenuUp" wrap>
				<%}else{%>
				<td <%out.println(mode.equals("StatusLogReport")?"class='tdformenu'":"class='tdformenuUp2'");%>>
				<%}%>
					<a href="/openaction.do?src=productRelease">New Product Launch</a>
				</td>
			</tr>
			
			
		</table>
<%}%>
					
	<% if(src.equals("Mail")){%>
		<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="left" border="0" width="70%" cellspacing="0" cellpadding=0  >
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
	
	<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:12">
		<tr>
			<td class="accountImage"></td>
		</tr>
	</table>
	<table align="left" width="70%" cellspacing="0" cellpadding="0" border=1  style="margin-left:5">		
			
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
    				<a href="/TransactionAction.do?action=PayeeWithinBank&mode=S&purpose=withIn" >Fund Transfer with in Bank</a>
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
			<tr align="center">
				<td wrap <%out.println(mode.equals("InsFundTransfer")?"class='tdformenu'":"class='tdformenu1'");%>>
				<a href="/fundtransfer/fund_transfer.jsp">Instant Fund Transfer</a>
				</td>
			</tr>
			<tr align="center">
			    <td wrap <%out.println(mode.equals("standingIns")?"class='tdformenu'":"class='tdformenu1'");%>>
			    <a href="/fundtransfer/standingIns.jsp">Standing Instructions</a>
			    </td>
   			</tr>
   			<%  if ( custRole.equals("B")) { %>
			<tr align="center">
				<td wrap <%out.println(mode.equals("bulkUpload")?"class='tdformenu'":"class='tdformenu1'");%>>
				<a href="/fundtransfer/new.jsp">Transfer Batch</a>
				</td>
			</tr>
			<tr align="center">
				<td wrap <%out.println(mode.equals("bulkUpload")?"class='tdformenu'":"class='tdformenu1'");%>>
				<a href="/fundtransfer/authrise_excelData.jsp">Autherise Batch</a>
				</td>
			</tr>
			<% } %>
			
			
			
	</table>
	<% }
	  if(src.equals("accOpen")){%>
		<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="left" border="0" width="70%" cellspacing="0" cellpadding=0  >
			<tr>
				<td <%out.println(mode.equals("custId")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/NewCustIDCreation.jsp">Customer Id Creation</a>
				</td>
	        </tr>
	        <!--<tr>
				<td <%out.println(mode.equals("SaAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
				<a href="/request/SavingAccopen.jsp?atpType=S">Saving Account  </a>
				</td>
		</tr> -->
		<tr>
		<td <%out.println(mode.equals("CaseAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
			<a href="/request/AccountOpen.jsp">Account Open(SB/FD)</a>
		</td>
			</tr>
			<tr>
				<td <%out.println(mode.equals("rdAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/SavingAccopen.jsp?atpType=E">RD Account </a>
				</td>
	        </tr>
			<tr>
				<td <%out.println(mode.equals("fdAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/FdRequest.do?action=saveFdReqest">FD Account Request </a>
				</td>
			</tr>
			<tr>
				<td <%out.println(mode.equals("currentAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/SavingAccopen.jsp?atpType=A">Current Account </a>
				</td>
	        </tr>
			<tr>
				<td <%out.println(mode.equals("CaseAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/SavingAccopen.jsp?atpType=C">CC/OD Account </a>
				</td>
	        </tr>
			<tr>
				<td <%out.println(mode.equals("CaseAccount")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/request/SavingAccopen.jsp?atpType=T">Loan Account</a>
				</td>
	        </tr>
			

		</table>	
		<% }
	  if(src.equals("agentfund")){%>
		<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="left" border="0" width="70%" cellspacing="0" cellpadding=0  >
			<tr>
				<td <%out.println(mode.equals("agent")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/fundtransfer/agentTrn.jsp">Agent Fund transfer </a>
				</td>
			</tr>
			<tr>
  			  <td <%out.println(mode.equals("dep")?"class='tdformenu'":"class='tdformenuUp2'");%>>
     			<a href="/abbfundtransfer/fund.do?action=getBankDetailandUrl">Registration</a>  
    		  </td>
   			</tr>
  
			<tr>
				<td <%out.println(mode.equals("cash")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/fundtransfer/cashpayment.jsp">Cash Payment </a>
				</td>
	        </tr>
			<tr>
				<td <%out.println(mode.equals("dep")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/fundtransfer/cashDeposit.jsp">Cash Deposit\Withdrawal </a>
				</td>
			</tr>
			<tr>
				<td <%out.println(mode.equals("disbursement")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/fundtransfer/cashdisbusment.jsp">Agent Cash Disbursement   </a>
				</td>
			</tr>
			<tr>
			    <td <%out.println(mode.equals("agent")?"class='tdformenu'":"class='tdformenuUp2'");%>>
			     <a href="/TransactionAction.do?action=getHoldTransaction">Re-Post Hold Transaction</a>
			    </td>
			</tr>
			<tr>
			    <td <%out.println(mode.equals("knowyouragent")?"class='tdformenu'":"class='tdformenuUp2'");%>>
			     <a href="/fundtransfer/refundFailed.jsp">Refund Failed Transaction </a>
			    </td>
			</tr>			
			<tr>
			    <td <%out.println(mode.equals("agent")?"class='tdformenu'":"class='tdformenuUp2'");%>>
			     <a href="/fundtransfer/CustBalance.jsp">Customer A/c Balance</a>
			    </td>
			</tr>
			<tr>
			    <td <%out.println(mode.equals("agent")?"class='tdformenu'":"class='tdformenuUp2'");%>>
			     <a href="/fundtransfer/CustStatement.jsp">Customer Statement</a>
			    </td>
			</tr>
			
			<tr>
				<td <%out.println(mode.equals("knowyouragent")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/fundtransfer/knowyouragent.jsp">Find Agent </a>
				</td>
			</tr>
		
			<tr>
				<td <%out.println(mode.equals("cardTran")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/qrCode/MYCamera.html">QR Card Reader</a>
				</td>
			</tr>

		</table>
		<% }
	  if(src.equals("set")){%>
		<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="left" border="0" width="70%" cellspacing="0" cellpadding=0  >
			<tr>
				<td <%out.println(mode.equals("usridchange")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/openaction.do?src=usridchange">User Id Change </a>
				</td>
			</tr>
			<tr>
				<td <%out.println(mode.equals("passWordChange")?"class='tdformenu'":"class='tdformenuUp2'");%>>
					<a href="/accsum/PassWordChange.jsp">PassWord Change </a>
				</td>
	        </tr>

		</table>	
		<% }
	  if(src.equals("application")){%>
		<table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
			<tr>
				<td class="reportsImage"></td>
			</tr>
		</table>
		
		<table align="left" border="0" width="70%" cellspacing="0" cellpadding=0  >
			<tr >
				<td <%out.println(mode.equals("LoanReq")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
				<a href="/request/LoanInterview.jsp">Loan Request</a>
				</td>
			</tr>
			<tr >
				<td <%out.println(mode.equals("businessReq")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
				<a href="/request/BusinessCard.jsp">Business Card</a>
				</td>
			</tr>

		</table>	
	<%}
	if(src.equals("recharge_billPayment")){%>
   <table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
    <tr>
     <td class="reportsImage"></td>
    </tr>
   </table>
 <table align="left" border="1" width="70%" cellspacing="0" cellpadding=0 style="margin-left:5" >
   <tr>
          <td <%out.println(mode.equals("recharge_billPayment")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
          <a href="/payment/billPay.jsp?mode=<%=mode%>">Bill Payment_Recharge</a>
          </td>
     </tr>
    <tr >
	    <td <%out.println(mode.equals("feeCollect")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
	    <a href="/TransactionAction.do?action=feeCollection">Fee Collection</a>
	    </td>
	   </tr>
	
  </table>
 <%}
 	if(src.equals("adharUpdate")){%>
   <table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
    <tr>
     <td class="reportsImage"></td>
    </tr>
   </table>
 <table align="left" border="1" width="70%" cellspacing="0" cellpadding=0 style="margin-left:5" >
   <tr>
          <td <%out.println(mode.equals("adharUpdate")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
          <a href="/AccountInfoAction.do?action=fetchAdharDetails">Aadhar Update</a>
          </td>
     </tr>
   
  </table>
 <%}
  if(src.equals("corporatebanking")){%>
   <table  width="70%" cellspacing="0" cellpadding="0"  style="margin-left:10">
    <tr>
     <td class="reportsImage"></td>
    </tr>
   </table>
 <table align="left" border="1" width="70%" cellspacing="0" cellpadding=0 style="margin-left:5" >
   <tr>
          <td <%out.println(mode.equals("corporatebanking")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
          <a href="/menu/AddFavoriteClass.do">Menu</a>
          </td>
</tr>
	<tr>
	<td <%out.println(mode.equals("corporatebanking")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
          <a href="/bulktransfer/upload.jsp">Bulk Transfer</a>
          </td>
</tr>
	<tr>
	<td <%out.println(mode.equals("corporatebanking")?"class='tdformenu'":"class='tdformenu1'");%> wrap>
          <a href="/BulkAccountFundTransferAction.do?action=autheriseBulkAmountTransfer&openFor=E&sMode=CIBEdit&purpose=SHOW">Authorize Bulk Transfer</a>
          </td>
     </tr>
   
    <tr align="center">
  <td wrap <%out.println(mode.equals("CBFundTr")?"class='tdformenu'":"class='tdformenu1'");%>>
   <a href="/TransactionAction.do?action=getBenificiaryAccountList">Third Party Transfer</a>
  </td>
 </tr>
 <tr align="center">
  <td wrap <%out.println(mode.equals("CBFundTr_ReSch")?"class='tdformenu'":"class='tdformenu1'");%>>
   <a href="/TransactionAction.do?action=getMultipleTransactionList&purpose=BULKTRN">Re-Schedule Third Party Transfer</a>
  </td>
 </tr>
 <% if(custRole.equals("C")){%>
 <tr align="center">
  <td wrap <%out.println(mode.equals("CBFundTrAuth")?"class='tdformenu'":"class='tdformenu1'");%>>
   <a href="/TransactionAction.do?action=getMultipleTransactionList&isAuth=true&purpose=BULKTRN">Third Party Transfer Authoization</a>
  </td>
 </tr>
 <%}%>
 <tr align="center">
  <td wrap <%out.println(mode.equals("failReport")?"class='tdformenu'":"class='tdformenu1'");%>>
   <a href="/TransactionAction.do?action=getACSList&reportFor=F">Credit Failure Report</a>    
  </td>
 </tr>
  </table>
 <%} }%>
  
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
