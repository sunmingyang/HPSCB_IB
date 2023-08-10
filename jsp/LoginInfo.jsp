<%@ include file="/common/Include.jsp"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%
//	String userlist[][]=(String[][])session.getAttribute("Userlist");	
	String userlog[][]=(String[][])session.getAttribute("Userlist");	
	//session.removeAttribute("Userlist");
	session.removeAttribute("Userlist");
	Date curdate=new Date();
	String strdate=DateTimeFunction.dateToStrFmt(curdate,"dd/mm/yyyy");
	System.out.println("datei is "+strdate);
	String AdminName=(String)session.getAttribute("AdminName");
%>

<script>
function backpage()
{
document.forms[0].action="<%=request.getContextPath()%>/navigate.do?action=executeOpen&src=userStatuslog&dest=back";
		document.forms[0].submit();

}
function changeDateFormat(ddate)
{

	var year=ddate.substring(6,10);
	var month=ddate.substring(3,5);
	var day=ddate.substring(0,2);
	comdate=day+"/"+month+"/"+year;
	return comdate;
}
function forusercode()
{
	var curdate=changeDateFormat('<%=strdate%>');
	var todt=document.getElementById("todate").value;	
	var fromdt=document.getElementById("fromdate").value;	
	if(fromdt=="")
	{
		alert("Fill From Date");
		document.getElementById("fromdate").focus();
		return false;
	}
	if(todt=="")
	{
		alert("Fill To Date");
		document.getElementById("todate").focus();
		return false;
	}
	
	if(document.getElementById("radio1").checked)
	{
		if(document.getElementById("branchcode").value=="")
		{
			alert("Fill Branch Code");
			document.getElementById("branchcode").focus();
			return false;
		}
	}
	else if(document.getElementById("radio2").checked)
	{
		if(document.getElementById("usercode").value=="")
		{
			alert("Fill User Code");
			document.getElementById("usercode").focus();
			return false;
		}
	}
	if(isValidDateFormat("todate")==false)
	{
		alert("Invalid Todate");
		document.getElementById("todate").value="";
		document.getElementById("todate").focus();
		return false;
	}
	if(isValidDateFormat("fromdate")==false)
	{
		alert("Invalid Fromdate");
		document.getElementById("fromdate").value="";
		document.getElementById("fromdate").focus();
		return false;
	}
	if(todt!=fromdt)
	{
		if(dateCompare("todate",fromdt)==false)
		{
			document.getElementById("todate").value="";
			alert("To Date should Greater Than From Date");
			return false;
		}
	}
	if(dateCompare("todate",curdate))
	{
		document.getElementById("todate").value="";
		alert("To Date should not Greated than Current Date");
		return false;
	} 
/*	alert("Difference is "+daysDifference("todate","fromdate"));
	if(!isNaN(daysDifference("todate","fromdate")))
	{
		if(parseInt(daysDifference("todate","fromdate"))>30)
		{
			alert("Difference must not Greater then One Month");
			return false;
		}
	}*/
	if(document.getElementById("radio1").checked==true)
	{
	document.forms[0].action="<%=request.getContextPath()%>/UserInfoForAdmin.do?action=getLogByBranch";
	}
	else if(document.getElementById("radio2").checked==true)
	{
		document.forms[0].action="/UserInfoForAdmin.do?action=getLogByUser";
	}
	else
	{
	document.forms[0].action="<%=request.getContextPath()%>/UserInfoForAdmin.do?action=getLogByDate";
	}
//	alert("Hello-->"+document.forms[0].action);
	document.forms[0].submit();
}

function disusr()
{	
	document.getElementById("flag").value="usr";
	document.getElementById("branchcode").value="";
	document.getElementById("branchcode").disabled=true;
	document.getElementById("usercode").disabled=false;
}
function disbrn()
{
	document.getElementById("usercode").value="";
	document.getElementById("branchcode").disabled=false;
	document.getElementById("usercode").disabled=true;
}
function disdt()
{
	document.getElementById("flag").value="dt";
	document.getElementById("usercode").value="";	
	document.getElementById("branchcode").value="";
	document.getElementById("usercode").disabled=true;
	document.getElementById("branchcode").disabled=true;
}
function first()
{		
	//	alert("flag is 111"+document.getElementById("radio1").checked)
	//	alert("flag is 222"+document.getElementById("radio2").checked)

		if(document.getElementById("radio1").checked==true)
		{
	//		alert("11111");
			document.getElementById("usercode").disabled=true;
			document.getElementById("branchcode").disabled=false;
		}
		if(document.getElementById("radio2").checked==true)
		{	
	//		alert("22222");
			document.getElementById("usercode").disabled=false;
			document.getElementById("branchcode").disabled=true;
		}
<%if(userlog!=null){%>
//	makeScrollableTable('tableFirst','false','100')
	<%}%>
}

</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=reports"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=LoginLogOutHistory&src=reports"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>
</tiles:put>
<tiles:put name="content" type="String">
<body onload="first()">
<html:form action="/UserInfoForAdmin">
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > Reports  >>  Login Logout History </td>
	</tr>
	<tr>
		<td align="center">




 <table  cellpadding="0" cellspacing="0"  width=520 class="miniStmtBackBorder">
		<tr class="miniStmtBack">
	         <td width="100%" ><br>

<table align="center">
	<tr>
		<td class="normalText">
		Branch Wise<html:radio property="flag" value="br"  styleId="radio1" onclick="disbrn()"/>
		</td>
		<td class="normalText">
		&nbsp;&nbsp;User Wise<html:radio property="flag" value="usr" onclick="disusr()" styleId="radio2"  />
		</td>
		<td class="normalText">
		&nbsp;&nbsp;Date Wise<html:radio property="flag" value="dt" onclick="disdt()" styleId="radio3"  />
		</td>
	</tr>
</table>

<table border="0" align="center">
	<tr>
		<td class="normalText">
			Branch code 
		</td class="normalText">
		<td>
			:&nbsp;<html:text property="branchcode" maxlength="5"/>
		</td>
		<td class="normalText">
			User code 
		</td>
		<td>
			:&nbsp;<html:text property="usercode" maxlength="15" />
		</td>
	</tr>
	<tr>
		<td class="normalText">
			From Date<font color="brown">*</font>
		</td>
		<td>
			:&nbsp;<html:text property="fromdate" maxlength="10" onkeypress="isValidDatechar()"/>
		</td>
		<td class="normalText">
			(dd/mm/yyyy)
		</td>
	</tr>
	<tr>
		<td class="normalText">
			To Date<font color="brown">*</font>
		</td>
		<td>
			:&nbsp;<html:text property="todate" maxlength="10" onkeypress="isValidDatechar()" />
		</td>
		<td class="normalText">
			(dd/mm/yyyy)
		</td>
		<!-- <td>
			<input type=Button name="getuser" value="Go" onclick="forusercode()">
		</td> -->
		<td>
			<input type=Button name="loginfo" value="Detail" onclick="forusercode()">		
		</td>
	</tr>
</table>
		<%
				if(userlog != null){
					int j=0;
					System.out.println("length is "+userlog.length);
					for(int i=0; i<userlog.length;i++){
						if(i==0){%>
		<table border="2" bordercolor="#ffffff" align="center" width="90%" cellpadding="0" cellspacing="0" id="table">
				<TR> 
					<TD class="dataTableTH">Sr. No.</TD>				
					<TD class="dataTableTH">User Name</TD>
						<!-- <TH>
							Status
						</TH> -->
					<TD class="dataTableTH" align="left">Login Date&nbsp;&nbsp;&nbsp; Time	</TD>
						<!-- <TH>
							Status
						</TH> -->
					<TD class="dataTableTH" align="left">Logout Date&nbsp;&nbsp;&nbsp; Time	</TD>
				</TR>
				
				<TBODY class="TableLabel">
				
						<%}
					String date=userlog[i][2];
					date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4)+"   "+ date.substring(11,19);
			%>
				<tr>
					<td  class="dataTableTD" >
						<%=++j%>
					</td>
					<td  class="dataTableTD" >
						<%=userlog[i][0]%>
					</td>
					<!-- <td width="50">
						<%=userlog[i][1]%>
					</td> -->
					<td  class="dataTableTD"  NOWRAP>
					
						<%=date%>
					</td>
			<%	
				System.out.println("i+1-->"+(i+1));
				if(i+1<userlog.length){
				if(userlog[i][0].equals(userlog[i+1][0])){
				String logOutDate=userlog[i+1][2];
			logOutDate=logOutDate.substring(8,10)+"/"+logOutDate.substring(5,7)+"/"+logOutDate.substring(0,4)+"   "+logOutDate.substring(11,19);
					
			%>		<!-- <td width="50">
						<%=userlog[i+1][1]%>
					</td> -->
					<td  class="dataTableTD" NOWRAP>
						<%=logOutDate%>
					</td>
			<%i++;}%>
				
			<%}%>	
				</tr>
			<% if(i==userlog.length-1){%>
			</TBODY>
			<tfoot><tr style="background-color:#70718F;color:#70718F"><td colspan=6 align="center" <td  class="dataTableTH" >>Login/Logout</td></tr></tfoot>
			</table>
		<%}}}%>
	<div id="diverrmessage" style="display:none">
	<font color="red">
		<logic:messagesPresent property="invalidBranch" >
			<font color="red" face="verdana"><html:errors property="invalidBranch" bundle = "error"/></font>
		</logic:messagesPresent>
		<logic:messagesPresent property="noRecord" >
						<font color="red" face="verdana">
			No Information exist for specified Criteria</font>
		</logic:messagesPresent>
		</font>
	</div>
	
	</html:form>
	<!-- <input type="button" name="back"  value="Back To Menu" onclick="backpage()" class="button"/>  -->
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="brown" face="verdana">* mandatory Field</font>
</td>
</tr>
</table>

</td>
</tr>
</table>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>

</tiles:insert>

<logic:messagesPresent property="invalidBranch">
	<script>
		document.getElementById("diverrmessage").style.display = "block";
	</script>
</logic:messagesPresent>
<logic:messagesPresent property="noRecord">
<script>
		document.getElementById("diverrmessage").style.display = "block";
</script>
</logic:messagesPresent>
