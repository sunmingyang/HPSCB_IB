<%@ include file="/common/Include.jsp" %>

<%
String AdminName=(String)session.getAttribute("AdminName");
String data[][]=null;
if(session.getAttribute("errdata")!=null)
{
	data=(String[][])session.getAttribute("errdata");
}

%>
<script>

function loadfun()
{

		<% 
		String editval=(String)request.getAttribute("editval");
		System.out.println("32333333333333"+editval);
		if(editval!=null)
			{
			if(editval.equals("Add"))
				{
	%>
				document.getElementById("error").value="Add";
				document.getElementById("errcode1").checked="true";
				

				<%}else{%>
				document.getElementById("error").value="Show";
				document.getElementById("errcode2").checked="true";
				<%}
				}%>

//	if(document.getElementById("error").value=="Add")
//		document.getElementById("errcode1").checked;	
//	if(document.getElementById("error").value=="Show")
//		document.getElementById("errcode2").checked;	

	if(document.getElementById("errcode2").checked)
	{		
		document.getElementById("showdiv").style.display="block";
		document.getElementById("adddiv").style.display="none";
		document.getElementById("ok").disabled=true;	//document.forms[0].action="/reports/StatusLogAction.do?action=showMassages";
	//	document.forms[0].submit();
	}
	else if(document.getElementById("errcode1").checked)
	{
	//	alert("222222222222"+document.getElementById("error").value);
		document.getElementById("showdiv").style.display="none";
		document.getElementById("adddiv").style.display="block";
		document.getElementById("ok").disabled=false;	
	}

}
function backpage()
{
	document.forms[0].action="/navigate.do?action=executeOpen&src=addbranch&dest=back";
	document.forms[0].submit();
}
function setval(val)
{
	if(val=="Show")
	{
		document.getElementById("showdiv").style.display="block";
		document.getElementById("adddiv").style.display="none";
		document.getElementById("ok").disabled=true;
		document.getElementById("error").value="Show";
		document.forms[0].action="/reports/StatusLogAction.do?action=showMessages";
		document.forms[0].submit();
	}
	else if(val=="Add")
	{
		document.getElementById("showdiv").style.display="none";
		document.getElementById("adddiv").style.display="block";
		document.getElementById("ok").disabled=false;	
		document.getElementById("error").value="Add";
	}
}
function submitpage()
{
	if(document.getElementById("errcode").value!="")
	{
		document.forms[0].action="/reports/StatusLogAction.do?action=showMessages";
		document.forms[0].submit();
	}
}

</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>

<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b>
</font>&nbsp;&nbsp;&nbsp;Error Add & Edit
</tiles:put>

<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=showerror"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<html>
<body onload="loadfun()">
<html:form action="/reports/StatusLogAction">
<br><br><br>

<table width="90%" height="200" cellpadding="0" cellspacing="0"  class="miniStmtBackBorder" align="left">
	<tr >
	<td class="showErrorBack" width="100">&nbsp;</td>
	
		<td  align="center"> 
			<table>
				<tr>
					<td class="normalText">
						Add Error</td>
					<td>
						<html:radio property="error" styleId="errcode1" value="Add" onfocus="setval('Add')"/>
					</td>
					<td class="normalText">
						Show Error
					</td>
					<td>
						<html:radio property="error"  styleId="errcode2" value="Show"  onfocus="setval('Show')"/>
					</td>
				</tr>
			</table>
			
			<div id="adddiv">
				<table>
					<tr>
						<td class="normalText">
							Error code</td>
						<td>
							:&nbsp;<html:text property="errcode"/>	</td>
					</tr>
					<tr>
						<td class="normalText">
							Error Massage</td>
						<td>
							:&nbsp;<html:text property="errmassage"/></td>
					</tr>
				</table>
			</div>
			
			<div id="showdiv" style="display:none;"> 
				<%if(data!=null)
				{
					for(int i=0;i<data.length;i++)
					{
						if(i==0)
						{%>
							<table border="2" bordercolor="#ffffff" align="center" width="90%" cellpadding="0" cellspacing="0" id="table">
								<tr> 
									<td class="dataTableTH">
										Sr.No.</td>
									<td nowrap class="dataTableTH">
										Error Code</td>
									<td class="dataTableTH">
										Error Massage</td>
								</tr>
						<%}%>
								<tr>
									<td class="dataTableTD">
										<%=i+1%></td>
									<td class="dataTableTD">
										<%=data[i][1]%></td>
									<td nowrap class="dataTableTD">
										<%=data[i][2]%></td>
								</tr>	
						<%
						if(i==data.length-1){%>
							</table>
						<%
						}
					}
				}%>
			</div>
			
			<table>
				<tr>
					<!-- <td>
						<input type="button" name="back"  value=" Back " onclick="backpage()" class="button"/> 
					</td> -->
					<td>
						<input type="button" name="ok"  value=" ADD " onclick="submitpage()"/> 
					</td>
				</tr>
			</table>
		
			<div id="diverrmessage">
				<logic:messagesPresent property="errorExist">
					<font color="Red" face="verdana">Error Already Exist With This Error Code</font>
				</logic:messagesPresent>
			</div>
		</td>
	</tr>
</table>

</body>
</html>
</html:form>
</tiles:put>
</tiles:insert>