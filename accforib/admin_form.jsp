kjj<%@ include file="/common/Include.jsp" %>
<% 
		Hashtable user_inform=null;
		Hashtable user_info=null;
		ArrayList all_accs=null;
		ArrayList chk_accs=null;
		boolean flag=false;
		String h_addr=null;
		String e_addr=null;	
		int i=0,j=0,k=0;
		String sErr = "";
		int b=0;
String acc_num="0";
String br_code="";
String user_Info[][]=null;
String existUserInfo[][]=null;
if(session.getAttribute("user_Info")!=null)
	{
		user_Info=(String[][])session.getAttribute("user_Info");
		System.out.println("lenth---------  "+user_Info.length);
	}
if (session.getAttribute("acc_num")!=null)
	acc_num=(String)session.getAttribute("acc_num");
if (session.getAttribute("br_code")!=null)
	 br_code=(String)session.getAttribute("br_code");
if (session.getAttribute("AllAccNums")!=null)
	all_accs=(ArrayList)session.getAttribute("AllAccNums");  
if (session.getAttribute("IbAccNums")!=null)
	 chk_accs=(ArrayList)session.getAttribute("IbAccNums");  
if(session.getAttribute("existUserIbInfo")!=null)
	existUserInfo=(String[][])session.getAttribute("existUserIbInfo");  
String AdminName=(String)session.getAttribute("AdminName");

%>

 
<script language="JavaScript" src="/accforib/scripts/AccForIB.js"></script>
<script language="JavaScript">

	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=UserCreate","child", bar);
}

function Print() {
	//disabledControlsOnAction(document.forms[0]);
	var bar = "width=400,height=400,left=1000, top=1000, scrollbars=no";
	var win = open("/jsp/PrintUSerNamePassword.jsp","child", bar);
	//window.location.href="/jsp/PrintUSerNamePassword.jsp";
}

function SaveEnableDisable(){
	var cnt=0;
	var disableCnt=0;
<%	int length=0;
	if(chk_accs!=null) {
		length=chk_accs.size();
%>
		disableCnt='<%=length%>';
<%	}
	if(all_accs!=null){ 
	j = all_accs.size();
	if(j!=0) {
		for(i=0;i<j;i++) {  
		
%>
			if(document.getElementById("check<%=i%>").checked==true) {
				cnt++;
			}
	<%	}
	  }
	}
%>
	
	if(cnt > 0 ) {
		alert("enable block");
		document.getElementById("save").disabled=false;
	}
	else {
		alert("else block");
		document.getElementById("save").disabled=true;
	}
}
</script>
 
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>
</tiles:put>
<!-- <tiles:put name="menu" value="/common/left.jsp"/> -->
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=zoRoMasterEntry"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=userCreation&src=userOperation"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<html:form action= "/accforib/user_info">

<body onLoad="onLoad()" onkeyDown="StopKeyHandler()">
 <br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > User Operation >> User Creation </td>
	</tr>
	<tr>
		<td align="center">
<br>
  <table  cellpadding="0" cellspacing="0" width=491 >
		<tr>
         <td width="100%" height="59"> 
		 <br>
		<div id="maindiv">
		<table width="100%" class="miniStmtBackBorder"><tr class="miniStmtBack"><td>
			<table width="100%">
			  <tr>
			      <td class="normalText" align="left" width="100"> 
					<bean:message bundle="hindi"  key="425"/><font color="brown">*</font> </td>
				  <td colspan="2" align="left"> 
					:&nbsp;<Input type="text" name="sBrnCde" id="sBrnCde" value='<%=(br_code).toString() %>' size="10" maxlength="5"></td>
		      </tr>
			  <html:hidden property="loginId" styleId="loginId" value='<%=AdminName%>'/>
			  <tr> 
				   <td class="normalText" align="left">
					<bean:message bundle="hindi"  key="1027"/><font color="brown">*</font></td>
			       <td align="left">
					 :&nbsp;<input  type="text" name="sAcc_Num" id="sAcc_Num" size="20" maxlength="20" value='<%=(acc_num).toString() %>'> 
			        </td>
				    <td align="left" Detail>
						<input name="button" type="button"
						onClick="check_existUser()" value='<bean:message bundle="<%=lang%>" key="940"/>'></td>
			  </tr>
          </table></td></tr></table>

<br>


<% 
if(all_accs!=null && user_Info!=null )
{ 
	j=all_accs.size();
%>
<%	if(j!=0)
	{
		for(i=0;i<j;i++)
		{ 
			if(i==0){
%>
<table border="2" bordercolor="#ffffff" align="center" width=491 cellpadding="0" cellspacing="0">
    <TR > 
      <TD class="dataTableTH"><bean:message bundle="hindi" key= "2010"/></TD>
        <TD class="dataTableTH"><bean:message bundle="hindi" key= "1027"/></TD>
		<TD class="dataTableTH">User Name </TD>
        <TD class="dataTableTH">IB Status </TD>
	</tr>
	<%}%>
		<tbody>
		<tr>
			<td class="dataTableTD" align="center"><%=i+1%></td>
			<td class="dataTableTD"><%= all_accs.get(i)%>
			<input type="text" value='<%= all_accs.get(i)%>' name="acc_num" id = "acc_num"></td>
			<td class="dataTableTD"><%=user_Info[i][2]%></td>
			<td align="center" class="dataTableTD">
<%
		if(chk_accs!=null)
		{
			System.out.println("checked size:::" + chk_accs.size());

			 for(b=0;b<chk_accs.size();b++)
			{
				System.out.println("checked is:::" + (String)chk_accs.get(b));
				if(((String)chk_accs.get(b)).equalsIgnoreCase((String)all_accs.get(i)))
				{
				flag=true;
				System.out.println("flag is:::" + flag);
				
				break;
				}
				System.out.println("flag is:::" + flag);
				continue;
			}
		}

	if(flag==true)
	{
 %>
		<input type="checkbox" name="check"  id="check<%=i%>" checked disabled></td>

		<%if(existUserInfo!=null){
			if(existUserInfo[b][4].equals("C"))
				 out.println("  Created");
			if(existUserInfo[b][4].equals("A"))
				 out.println("  Activated");
			if(existUserInfo[b][4].equals("L"))
				 out.println("  Activated(Locked)");
			if(existUserInfo[b][4].equals("D"))
				 out.println("  Deactivated");
		 }%>
		
<%
		flag=false;
	 }
	else
	{
%>
		<input type="checkbox" name="check" id="check<%=i%>" onClick="SaveEnableDisable()"></td>
		<td>&nbsp;&nbsp;&nbsp;</td>
<%  } %>
</tr>
  <tr>
				  <td colspan="4"><br><hr ></td>
	          </tr>
</tbody>
<% if(i==j-1){%>
</table>
	<%}
  } // end of for loop
  }
}// end of if %>
 </div>


<input type="hidden" name="sAll_chk_acc_num" id="all_chk_acc_num" />
<input type="hidden" name="sChk_accs" id="chk_acc" />
<center>
<div id="diverrmessage" style="display:block">
	<logic:messagesPresent property="NotValidAcc">
	<font color="Red" face="verdana">
		<html:errors property="NotValidAcc"  /></font>
	<% session.removeAttribute("acc_num");
	session.removeAttribute("br_code");
	session.removeAttribute("AllAccNums");
	session.removeAttribute("IbAccNums");
	session.removeAttribute("UsrId"); 
	session.removeAttribute("UsrPassword");%>
	</logic:messagesPresent>
	<logic:messagesPresent property="NotAcc">
		<font color="Red" face="verdana"><html:errors property="NotAcc"/></font>
	<% session.removeAttribute("acc_num");
	session.removeAttribute("br_code");
	session.removeAttribute("AllAccNums");
	session.removeAttribute("IbAccNums");
	session.removeAttribute("UsrId"); 
	session.removeAttribute("UsrPassword");%>
	</logic:messagesPresent>
	</font>
	<logic:messagesPresent property="RecordSaved">
	<font color="green" face="verdana">
		User is Created Successfully
	</font>
		 <script>
		disabledControlsOnAction(document.forms[0]);
		</script>
	</logic:messagesPresent>
	<logic:messagesPresent property="FailureSaved">
	<font color="Red" face="verdana">
		<html:errors property="FailureSaved"/></font>
	</logic:messagesPresent>
	<logic:messagesPresent property="NoServer">
		<font color="Red" face="verdana">Invalid Branch Code</font>
	</logic:messagesPresent>
	<logic:messagesPresent property="NotConnect">
		<font color="Red" face="verdana">Specified Branch Not Connected</font>
	</logic:messagesPresent>

	</center>
</div>
   
<div id="subdiv">  
<table border="0" bordercolor="black" width=491 cellpadding="0" cellspacing="7">
	<%
	if(session.getAttribute("UsrId")!=null)
	{%>
	<tr>
	   <td class="tableHeader" NOWRAP colspan="2">
			<bean:message bundle="hindi"  key="7425"/> : <%=(String)session.getAttribute("UsrId") %> </td>
	</tr>
	<tr>
		<%if(session.getAttribute("alreadyUsr")==null)
		{%>
		<td class="tableHeader">
			Click on Printer Image to Print User Id and Password :
		</td>
		<td >
			<img src="../images/printer.gif" alt="Print User id and Password" style="cursor:hand"	onClick="Print()">
		</td>
		<%}
		else
		{
			System.out.println("already session is3333333333333  "+(String)session.getAttribute("alreadyUsr"));
		}%>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" name="diffBrn" value="Create IB Account From Different Branch" onclick="diffbrnfun()" style="width:250px;">
			<!-- <td>
				<input type="button" name="continue" value="Continue Creation" onclick="gocon()" class="button">
			 </td> -->
	</tr>
	<%
	}%>	  

	<tr>
		<td align="center" colspan="2" >
			 <html:button property="save" onclick="saveUser_Info()"  >Create</html:button>
		</td>
	</tr>
	
	<tr>
		<td align="center" colspan="2"><br><hr>
			<font color="brown" face="verdana">* mandatory Field</font>
			<!-- <input type="button" name="back" value="Back To Menu" onclick="goback()" > -->
			<input   value="<bean:message bundle='<%=lang%>' key='33'/>" type="button" tabindex="5"  onclick="helpopen()"/>
			
		 </td>
	 </tr>
	 
</table>
</div>

</td>
</tr>
</table>
<br>
</td>
</tr>
</table>

   </body>

</html:form>
</tiles:put>

<script language="JavaScript">
function goback()
{
	document.forms[0].action="<%=request.getContextPath()%>/navigate.do?action=executeOpen&src=usrcreation&dest=back";
	document.forms[0].submit();
}
function gocon()
{
	document.forms[0].action="/openaction.do?src=create";
	document.forms[0].submit();
}
function diffbrnfun()
{
	document.forms[0].action="/openaction.do?src=diffcreate";
	document.forms[0].submit();
}
function onLoad()
{
	
<%	if(session.getAttribute("UsrId")!=null){%>
	document.getElementById("diverrmessage").style.display ="block";
	document.getElementById("maindiv").style.display ="block";
	document.getElementById("subdiv").style.display ="block";
	

<%}%>
	//document.getElementById("subdiv").style.display ="block";
//<logic:messagesPresent property="NotAcc">
document.getElementById("diverrmessage").style.display ="block";
<% session.removeAttribute("acc_num");
session.removeAttribute("br_code");
session.removeAttribute("AllAccNums");
session.removeAttribute("IbAccNums"); %>
</logic:messagesPresent>

<logic:messagesPresent property="NotValidAcc">
document.getElementById("diverrmessage").style.display ="block";
<% session.removeAttribute("acc_num");
session.removeAttribute("br_code");
session.removeAttribute("AllAccNums");
session.removeAttribute("IbAccNums"); %>
</logic:messagesPresent>

<%if(all_accs!=null){%>
makeScrollableTable('tabela','true','50');
<%}%>
}
</script>

</tiles:insert>

