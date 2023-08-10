<%@ include file="/common/Include.jsp" %>
<%@ page import="org.apache.struts.action.ActionErrors,org.apache.struts.action.ActionError, org.apache.struts.Globals, org.apache.struts.util.RequestUtils, java.util.Iterator, java.util.AbstractList" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>
<script language="JavaScript" src="/scripts/MD5.js"></script>  
<script language="JavaScript" src = "/usrlimit/addnewusr.js"></script>  
<script language="JavaScript" src = "/usrlimit/CmmAddressJS.js"></script>    
<script>
var accountinfo;
var accountType; 
var jsoncbusrdata = ''; 
<%String userInfo1=(String)session.getAttribute("validToken");  
String usrName = (String)session.getAttribute("user");
String acsuserId[][] =null;
String parentCIBUserData[][] =null;
String login_id="",mobNO="",accountInfo="";
String userInfofromlogin[][]=null; 
if(session.getAttribute("userid")!=null){  
	login_id = (String)session.getAttribute("userid");
	System.out.println("snxw--------------------------"+login_id);
}
String  custRole=(String)session.getAttribute("custRole");
if(session.getAttribute("userInfo")!=null){
	userInfofromlogin = (String[][])session.getAttribute("userInfo");
	System.out.println("User Info Customer Id of Corporate Banking------>"+userInfofromlogin[0][8]);  
}
if(session.getAttribute("parentCIB")!=null)
{
	parentCIBUserData= (String[][])session.getAttribute("parentCIB");
	System.out.println("Corporate banking User Info------>"+parentCIBUserData[0][2]);  
}

String  date=DateTimeFunction.getIbDateTime();
		String time[]=date.split(" ")[1].split(":");
		//date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

String mode = "";
if(request.getParameter("menu")!=null)
{
mode = request.getParameter("menu");
}
%>

</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>
<%if(request.getParameter("row")==null){ %>
<tiles:put name="menu" value="/common/user_left.jsp?mode=&src=corporatebanking"/>
<%}%>
<tiles:put name="menu" value="/common/user_left.jsp?mode=&src=corporatebanking"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/> 
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=corporatebanking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>
</tiles:put> 
<tiles:put name="content" type="String">

<body> 
<html:form action="/corporatebanking/AddNewUserAction"><br>
<div border="10 px:solid" style="
    border: 1px solid black;
    border-radius: 20px;
">

<%if(mode.equals("manage")) {%>
<table width = "100%"><tr><td align = "left">
<p  id = "label" ><u style="
    color: blue;
"> <B>Manage Transactions</B></u>
</td><td align = "right"> <p><u style="
    color: blue;
"> <B><%=date%></B></td></tr>
</br>
<table width ="98%" border = "10 px:solid">
<tr>				
<td>
<p align = "left" bgcolor="blue" style="
    background-color: #cccccc;"> <b> Link in the Manage Transactions enable you to edit transactions voucher of all form based as well as file based transactions.  </b></p>

					<ul>
					<li><a href="/TransactionAction.do?action=getACSList"> View Pending Transaction </a>
					<li><a href="/fundtransfer/qerybyRefNo.jsp"> Search By Transaction Number</a>    
					<li><a href="/fundtransfer/qerybyRefNo.jsp?purpose=echkcancelreportdata">View Canceled E-cheque</a>
					 <%if(custRole.equals("E")|| custRole.equals("S")){ %> 
					<!--  <li> <a href="/bulktransfer/upload.jsp">Bulk Transfer Upload</a> -->
					   <li> <a href="/BulkAccountFundTransferAction.do?action=autheriseBulkAmountTransfer&openFor=E&sMode=CIBEdit&purpose=SHOW"> Bulk Transfer Inbox</a>
						<li><a href="/TransactionAction.do?action=getPendingListforIFTAuthorization&neftopenFor=E&sMode=CIBEdit&purpose=NEFTREQ">Manage NEFT Request</a>
					   <li>  <a href="/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=E&purpose=SameBank&sMode=CIBEdit">Manage Same Bank Transactions</a> 
				       <li> <a href="/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=E&purpose=OtherBank&sMode=CIBEdit">Manage Other Bank Transactions</a>   
				        <li>  <a href="/fundtransfer/fund.do?action=performAddPayee&openFor=E&purpose=same&sMode=CIBAuth"> Manage Payee </a> 
				   	   <li> <a href="/BulkAccountFundTransferAction.do?action=autheriseBulkAmountTransfer&openFor=E&sMode=CIBEdit&purpose=SHOW"> Bulk Transfer Inbox</a>
				 

					 <%}%>
					</ul>
				</td>
				</tr>
</table>
</table>
<%} %>
<%if(mode.equals("auth")) {%>

<table width = "100%"><tr><td align = "left">
<p  id = "label" ><u style="
    color: blue;
"> <B>Authorize Transactions</B></u>
</td><td align = "right"> <p><u style="
    color: blue;
"> <B><%=date%></B></td></tr>
</br>
<table width ="98%" border = "10 px:solid">
<tr>				
<td>
<p align = "left" bgcolor="blue" style="
    background-color: #cccccc;"> <b> Link in the Authorise  Transactions enable you to authorise transactions voucher of all form based as well as file based transactions.  </b></p>

					<ul>
					<li><a href="/fundtransfer/fund.do?action=performAddPayee&openFor=A&purpose=same&sMode=CIBAuth"> Add payee Authorization </a> 
					<li><a href="/TransactionAction.do?action=getPendingListforIFTAuthorization&neftopenFor=A&sMode=CIBAuth&purpose=NEFTREQ">Neft Authorization</a>     
					<li>   <a href="/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=A&purpose=SameBank&sMode=CIBAuth">Fund Transfer WithIn Bank Authorization</a>   
					<!--OB <a href="/TransactionAction.do?action=getPendingListforIFTAuthorization&jspopenFor=A&purpose=OtherBank&sMode=CIBAuth">Fund Transfer Authorization</a>  -->
					<li><a href="/BulkAccountFundTransferAction.do?action=autheriseBulkAmountTransfer&purpose=SHOW&openFor=A&sMode=CIBAuth">Authorize Bulk Transfer</a> 
					
					</ul>
				</td>
				</tr>
</table>
</table>
<%}%>

<%if(mode.equals("rep")) {%>

<table width = "100%"><tr><td align = "left">
<p  id = "label" ><u style="
    color: blue;
"> <B>View Transaction Status</B></u>
</td><td align = "right"> <p><u style="
    color: blue;
"> <B><%=date%></B></td></tr>
</br>
<table width ="98%" border = "10 px:solid">
<tr>				
<td>
<p align = "left" bgcolor="blue" style="
    background-color: #cccccc;"> <b> Link in the View  Transactions enable you to watch retports of transactions voucher of all form based as well as file based transactions.  </b></p>

					<ul>
					<li><a href="/TransactionAction.do?action=getACSList"> View Pending Transaction </a>
					<li><a href="/fundtransfer/qerybyRefNo.jsp"> Search By Transaction Number</a>    
					<li><a href="/fundtransfer/qerybyRefNo.jsp?purpose=echkcancelreportdata">View Canceled E-cheque</a>
				    </ul>
				</td>
				</tr>
</table>
</table>
<%}%>

<%if(mode.equals("home")) {%>

<table width = "100%"><tr><td align = "left">
<p  id = "label" ><u style="
    color: blue;
"> <B>Settings</B></u>
</td><td align = "right"> <p><u style="
    color: blue;
"> <B><%=date%></B></td></tr>
</br>
<% if (!custRole.equals("E")) {%>
<table width ="98%" border = "10 px:solid">
<tr>				
<td>
<p align = "left" bgcolor="blue" style="
    background-color: #cccccc;"> <b> Link below  enable you to add /block or change password setting for users.  </b></p>

					<ul>
					<li>  <a href="/corporatebanking/AddNewUserAction.do?action=getParentCIBUsr&purpose=add">Add New User</a>     
					<li>  <a href="/corporatebanking/AddNewUserAction.do?action=getParentCIBUsr&purpose=dactive">Block User</a>   
					<li>  <a href="/jsp/login.do?action=passWordChange&sMode=CorpBanking">PassWord Change</a>  
				    </ul>
				</td>
				</tr> 
</table>
</table>

<%} else { %>
<script>
	document.getElementById("label").innerHTML = '';
	document.getElementById("label").innerHTML = '<u style="color: blue;"> <B>Dear user , you are authorised only for creating and managing entries.</B></u>';
	</script>
<%} }%>

<%if(mode.equals("bill")) {%>

<table width = "100%"><tr><td align = "left">
<p  id = "label" ><u style="
    color: blue;
"> <B>Pay Bill and Tax</B></u>
</td><td align = "right"> <p><u style="
    color: blue;
"> <B><%=date%></B></td></tr>
</br>
<table width ="98%" border = "10 px:solid">
<tr>				
<td>
<p align = "left" bgcolor="blue" style="
    background-color: #cccccc;"> <b> Link below  enable you to pay bills and deposit tax.  </b></p>

					<ul>
					<li>    <a href="/payment/billPay.jsp?mode=<%=mode%>">Bill Payment_Recharge</a>    
					<li>  	<a href="www.incometaxindiaefiling.gov.in">Tax Deposit</a>  
				    </ul>
				</td>
				</tr> 
</table>
</table>

<%}%>
</div>

</html:form>
	</body> 
		</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
	</tiles:insert>  