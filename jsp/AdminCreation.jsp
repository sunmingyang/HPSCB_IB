<%@ include file="/common/Include.jsp"%>

<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%String AdminName=(String)session.getAttribute("AdminName");

  String [][] sBrncode=null;
  if(session.getAttribute("sBrnCodes")!=null)
  {
  sBrncode=(String[][])session.getAttribute("sBrnCodes");
  session.removeAttribute("sBrnCodes");
  }
  %>
<script>
	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=admincreate","child", bar);
}
function savedata()
{
var pass=document.getElementById("passwd").value;
var cnfpass=document.getElementById("cnfpasswd").value;

	if(document.getElementById("adminid").value=="")
	{
		alert("Fill User Id");
		document.getElementById("adminid").focus();
		return false;
	}
	if(document.getElementById("passwd").value=="")
	{
		alert("Fill Passward");
		document.getElementById("passwd").focus();
		return false;
	}
	if(document.getElementById("cnfpasswd").value=="")
	{
		alert("Fill Confirm Passward");
		document.getElementById("cnfpasswd").value="";
		document.getElementById("cnfpasswd").focus();
		return false;
	}
    if(pass==cnfpass)
	{
	
	document.forms[0].action="/accforib/AdminCreate.do?action=adminCreation";
//	alert("Hello-->"+document.forms[0].action);
	document.forms[0].submit();
	}
	else
	{
		document.getElementById("cnfpasswd").value="";
		alert("Given Password not matches,Re-Enter Confirm Passward");
	}
}
function resetdata()
{
	document.getElementById("adminid").value="";
	document.getElementById("passwd").value="";
	document.getElementById("cnfpasswd").value="";
	document.getElementById("adminid").focus();
}
function checkPassword()
{	
	
	if(document.getElementById("passwd").value!=="" && (document.getElementById("passwd").value).length<=6)
	{
		alert("Length Of Password Should be greater than 6 Characters")
		document.getElementById("passwd").focus();
	}
}
function backpage()
{
	document.forms[0].action="/navigate.do?action=executeOpen&src=admincreate&dest=back";
	document.forms[0].submit();
}
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=zoRoMasterEntry"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=adminCreation&src=userOperation"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>
</tiles:put>
<tiles:put name="content" type="String">
<body >
<html:form action="/accforib/AdminCreate">
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > User Operation >> Admin User Creation </td>
	</tr>
	<tr>
		<td align="center">

<div id="main">
<table  width="500" class="miniStmtBackBorder" >
	<tr class="miniStmtBack" >
		<td align="center">
		
<table border="0" align="center">
	<tr>
		<td class="normalText" align="left">
			Admin Id
		</td>
		<td align="left">
			:&nbsp;<html:text property="adminid" maxlength="10" tabindex="1"/>
		</td>
	</tr>
    <tr>
		<td class="normalText" align="left">
			Branch-Code
		</td>
		<td align="left">
		 :&nbsp;<html:select  property="sbrncode"  tabindex="4">
                <%if(sBrncode!=null){
			 for(int i=0;i<sBrncode.length;i++){
			  String sbrn=sBrncode[i][0];
			  
		   %>
                <html:option value='<%=sbrn%>'></html:option>
            <%}}%>
                </html:select>
			</td>
	</tr>
	<tr>
		<td class="normalText" align="left">
			Password 
		</td>
		<td align="left">
			:&nbsp;<html:password property="passwd" maxlength="15" onblur="checkPassword()" tabindex="2"/>
		</td>
	</tr>
	<tr>
		<td class="normalText" align="left">
			Confirm-Password
		</td>
		<td align="left">:&nbsp;<input type="password" name="cnfpasswd" maxlength="15" tabindex="3"/></td>
	</tr>
	
	</table>
		</td>
	</tr>
	
</table><br>
<table width="500">
<tr>
		<td align="center" >
				<!-- <input type=Button name="back" value="Back"  class=button onclick="backpage()" tabindex="6" style="width:50px">		 -->
				<input type=Button name="save" value="Save"   onclick="savedata()" tabindex="4" style="width:50px">		
				&nbsp;&nbsp;
				<input type=Button name="reset" value="Reset"  onclick="resetdata()" tabindex="5" style="width:50px">	&nbsp;&nbsp;
				<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " type="button" tabindex="7" onclick="helpopen()"/>
			
			</td>
		</tr>
</table>
</div>
	<table>
		<tr>
			<td colspan="3">
				<div id="diverrmessage">
					<logic:messagesPresent property="Saved">
						<div>
							
						<table>
							<tr>
								<td>
								<font color="green" face="verdana">
									Admin User Created Successfully
									</font>
								</td>
							</tr>
		
						</table>
						</div>
						<script>
						document.getElementById("main").style.display="none";
						
						</script>
					</logic:messagesPresent>
					
					<logic:messagesPresent property="Fatal">
						<font color="Red" face="verdana"><html:errors property="Fatal"/></font>
					</logic:messagesPresent>

					
					<logic:messagesPresent property="exist">
						<font color="Red" face="verdana">Admin All ready Exist for This Admin Id</font>
					</logic:messagesPresent>

                    <!-- New added on 10/07/2008 -->
                    
					<logic:messagesPresent property="NoBrnCode">
						<font color="Red" face="verdana"><html:errors property="NoBrnCode"/></font>
					</logic:messagesPresent>
					</font>
				</div>
			</td>
		</tr>
	</table>
</td>
</tr>
</table>
</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>

</tiles:insert>

