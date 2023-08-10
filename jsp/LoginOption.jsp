<%@ include file="/common/Include.jsp" %>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="page_header" type="String">
<tiles:put name="menu" value="/jsp/LoginOption_left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>

&nbsp;
	<b>
Login Mode
	</b>

</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
<tiles:put name="content" type="String">
<html:form action= "/jsp/login">

<body>
<br>
<br>
<table>
<%	if(request.getParameter("errno")!=null)
	{%>
		
		<tr>
			<td style="padding-left:80px" class="heading">
				Your Session is Expired, Please Login Again !!!
			</td>
		</tr>
<%}%>
</table>
<table width="600px" height="300px" border="1" bordercolor="brown" style="border-left:none;border-top:none;border-right:none;border-bottom:none;">
<tr><th>Agreement</th></tr>
<tr>
<td align="center">
<table width="100%" height="100%">
	<tr height=10px>
		<td>
		Internet Banking &nbsp;&nbsp;&nbsp;
		<INPUT TYPE="radio" NAME="logintype" value="admin" checked/>
		</td>
	</tr>
<tr  height="200px" align=center>
	<td  align=center>
	<textarea  cols="80"  rows="20" readonly style="font-weight:bold">
	
		      ARIA AFGHAN BANK ONLINE BANKING SERVICE

	
Maintaining Your Accounts

You agree to properly maintain you Bank Accounts, to comply with the rules governing your Bank Accounts, and to pay any fees associated with the use or maintenance of your Bank Accounts.  Any issue to a  Bank Account, or Service with Bank, or any Bank affiliate which you access through Bank Online Banking shall be governed by the law(s) specified in this agreement for that  Bank Account or service.

Your Bank Accounts can be viewed and accessed in Bank Online Banking.  The Terms and Conditions of your Account Agreements will govern the excerpt which it is noted in this Agreement.  This Agreement will control if there is a conflict with other agreements and this Agreement for Bank N.A. Online Banking.  In addition, each Bank Account and  Bank N.A. Online Banking service is subject to the following: 
Terms of instructions appearing on a screen when using Bank Online Banking; 
Bank’s rules, procedures and policies applicable to  Bank Accounts; 
Rules and regulations of any funds transfers system used in connection with  Bank Online Banking; and 
Applicable state and federal laws and regulations 
 



ELECTRONIC FUNDS TRANFERS 

Bank Online Banking enables you to transfer funds to or from your  Bank Accounts.  The Electronic Funds Transfer Act provides you with certain rights and responsibilities with respect to certain transfers, called “Electronic Funds Transfers” (“EFT”) Your Rights and Responsibilities are fully described in our Electronic Funds Transfers disclosures that have been separately provided for you.  Please refer to your Electronic Funds Transfer Disclosure.

Password and User code

You will be given a PASSWORD and USER CODE that will give you access to  Bank Online Banking.  During your first logon session you are required to change your password.  Going forward, your password can be changed online at any time for  Bank Online Banking.  Your online password is case sensitive, and must be at least 8 characters long with at least 2 alpha characters and 2 numeric characters (with at least 1 alpha character being a capital letter).  We recommend that you change your password regularly.

We are entitled to act on instructions received under your PASSWORD.  For security purposes we recommend that you memorize the PASSWORD and do NOT write it down.  You are responsible for keeping your PASSWORD and USER CODE confidential.

 






    </textArea>
	</td>
</tr>
	<tr>
	<td colspan="2" align="center">
	<INPUT TYPE="button" value="  I Accept  " name="ok" class="button" onclick="goToLogin()"/>	
	<INPUT TYPE="button" value="  I Don't Accept  " name="ok" class="button" onclick="goToLogin()"/>	
	</td>
	</tr>
</table>
</td>
</tr>
</table>
</body>
</html:form>
</tiles:put>
</tiles:insert>
<script>
function goToLogin()
{
	document.forms[0].action="/jsp/login.do?action=getLoginMode";
	document.forms[0].submit();

}
</script>