<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
<% 
	String Arr= null, usrName="";
	String userInfo[][] = null;
	int j; 
	usrName = (String)session.getAttribute("user");
	userInfo = (String [][])session.getAttribute("userInfo");
	String brnCode=userInfo[0][1];
//out.writeln(""+request.setAttribute("brnCode",brnCode));
	System.out.println("Branch Code is this -->"+brnCode);
	String loginTime = (String)request.getAttribute("lastLoginTime");
    String totallogin = (String)request.getAttribute("totallogin");

	boolean mobileUserAgent  = SessionHandler.mobileUserAgent(request.getHeader("User-Agent").toLowerCase()); 
	if (mobileUserAgent)	{
		response.sendRedirect("/mobile/mobilemenu.jsp");   
		System.out.println("GO TO ANDROID TABLET mobilemenu");
	} 
					
					
%>
<script>
function openPromptme(userid) {
	document.form[0].action="http://59.90.202.177/remind_me?App=IB&Token=123456&userId="+userid ;
	document.form[0].method="post"; 
	document.form[0].submit() ;
}
function callAction()
{
	document.forms[0].action = "/IECLogin.do";
	//alert("IEC :"+document.forms[0].action);
	document.forms[0].method="post";
	document.forms[0].submit();
}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Welocome User......"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<html:form action="/jsp/login.do">
<tiles:put name="line" value="/common/line.html"/>

<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="page_header" type="String">
&nbsp;Welcome&nbsp;&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<tiles:put name="content" type="String">
<head>
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   <meta name="description" content="">
   <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body onkeyDown="StopKeyHandler()" >

	<br><br>
	<table width="61%" align="left" border=0 bordercolor="#0270CF" cellspacing=0 cellpadding=0>
	<tr class="welcome">
	<td style="padding-right:10;" align="right" >
	<input type="button" value="LoginToEFiling" onClick="callAction()" background="red"/>
	<table style="background-left:1px" background="orange" border=0 bordercolor="red">
		<tr>	<td valign="top" align="right" colspan=2>
				<% if(userInfo!=null){ %>
					<font color="#000000" face="verdana">
						<script language="JavaScript">
							Arr = splitString('<bean:message bundle="<%= lang %>" key="7058"/>','/');
							document.write(Arr[0]);
						</script>
						<br>
						<b><font color="blue"><%= cprContextObj.getSbankename() %>  Bank Welcome's</font></b>  &nbsp;&nbsp;&nbsp;<b><font face="verdana" color="GREEN"><%=usrName%></b> !!!
					</font><br>
			<% } %>
			</td>
			</tr>

			<% if(request.getAttribute("lastLoginTime")!=null){	%>
						<tr><td>
					<font color="#000000" face="verdana">
						Last Login On</font></td><td align=center><b><font color="#000000" face="verdana"><%=loginTime%></font></b>
						</td></tr>
						<%}%>

            <% if(request.getAttribute("totallogin")!=null){	%>
			<tr><td>
                    <font color="#000000" face="verdana">
                       Total Last Login(s)</font></td><td align=center> <font color="#000000" face="verdana"><%=totallogin%></font>
					</td></tr>
					<%}%>

			</td>
		</tr>
	</table><br><br><br>
	<table width="200px" cellpadding="0" cellspacing="0" border=0 bordercolor="#E0E0E0">
		<TR > 
			<TH class="weldataTableTH" >
				<bean:message bundle="hindi" key= "1027"/>
			</TH>
			<TH class="weldataTableTH" >
				<bean:message bundle="hindi" key= "7430"/> 
			</TH>
		</tr>
		<tr>
			<td colspan=2 >
			<%	if(userInfo != null)
				{ 
				//	String[] acc_nums = userInfo.getsIbUsr_AccNums();
				//	j = acc_nums.length;
					j = userInfo.length;
					System.out.print("array length is : "+j);
					if(j != 0)
					{ %>
				<div style="display:block;width:100%;height:60px;overflow:auto;border:Solid 0 black">
					<table width="100%"  border="2" cellpadding="0" cellspacing="0" bordercolor="#E0E0E0">
						<%	for(int i=0;i<j;i++)
							{	%>
								<tr  bgcolor="#ffffff" height="30">
									<td width="135" align="CENTER"><font face="verdana">
									<%= userInfo[i][0] %></font>
									</td>
									<td width="120" align="center"><font face="verdana">
									<%if ( userInfo[i][2].trim().equalsIgnoreCase("C") ){%>
									Live 
									<%}else{ %>
									Live
									<% }%>
									</font>
									</td>
						<%	} // fr ends
						}
					} // if ends
						%>
								</tr>
							</table>
						</div>
			</td>
		</tr>
		</table>
	
	</td>
</tr>
</table>
</body>

</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp"/>
</tiles:insert>


<style>
.weldataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		height: 20;
        font-weight: bold;
        color: #EBD172;
        text-decoration: none;
		background-color: #686868;

}

</style>


