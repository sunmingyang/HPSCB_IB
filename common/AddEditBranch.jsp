<%@ include file="/common/Include.jsp" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
%>

<script>
	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=AddBranch","child", bar);
}
function brninfo()
{
	if(document.getElementById("addedit2").checked==true)
	{
	//	alert("111  "+document.getElementById("addedit").value);
	    
		document.getElementById("ok").value="Edit Branch";
		document.forms[0].action="/accforib/activate.do?action=getBrnInfo";
		document.forms[0].submit();
		//document.getElementById("addedit2").checked="true";
		
		        
	}
	else if(document.getElementById("addedit1").checked==true)
	{
	//	alert("222 "+document.getElementById("addedit").value);
		document.getElementById("ok").value="Add Branch";
	}
}
function submitpage()
{
	if(document.getElementById("brncode").value!="")
	{
		document.forms[0].action="/accforib/activate.do?action=saveBrnInfo";
		document.forms[0].submit();
	}
}


function backpage()
{
	document.forms[0].action="/navigate.do?action=executeOpen&src=addbranch&dest=back";
	document.forms[0].submit();
}

function setval(val)
{
	if(val=="edit")
	{
		divErrAll.style.display = "block";
	}
	 if(val=="add")
	{
		divErrAll.style.display = "none";
	}

	document.getElementById("addedit").value=val;
	document.getElementById("ok").value=val+" Branch";
	document.getElementById("brncode").value="";
	document.getElementById("brnadd").value="";
	document.getElementById("brnname").value="";
	document.getElementById("brnip").value="";
	document.getElementById("brnport").value="";
    
	

}
function loadfun()
{
	//alert("in load fn");
	//alert(" add branch "+document.getElementById("addedit1").checked);
	//alert(" edit branch "+document.getElementById("addedit2").checked);
	if(document.getElementById("addedit2").checked==true)
	{
	//	alert("in if");
	divErrAll.style.display = "block";
	}
	else
	{
	//alert("in elseif");
    divErrAll.style.display = "none";
	}
	
	//divErrAll.style.display = "block";
	//alert("hello in load");
	
	
	//document.getElementById("addedit1").diabled="true";
	//document.getElementById("addedit2").checked="true";
	
  //	alert("11111111111111");
	<% 
		String editval=(String)request.getAttribute("editval");
		System.out.println("32333333333333"+editval);
		if(editval!=null){
			if(editval.equals("add")){
	%>
				document.getElementById("addedit").value="add";
				document.getElementById("addedit1").checked="true";
				

				<%}else{%>
				document.getElementById("addedit").value="edit";
				document.getElementById("addedit2").checked="true";
				<%}}%>
		//	alert(document.getElementById("addedit").value);
			if(document.getElementById("addedit2").checked==true)
			{
				document.getElementById("ok").value="Edit Branch";
			}
			else if(document.getElementById("addedit1").checked==true)
			{
				document.getElementById("ok").value="Add Branch";
			}
	}
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>

<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b>
</font>&nbsp;&nbsp;&nbsp;Branch Add & Edit
</tiles:put>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=addbranch"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<html>
<body onload="loadfun()">
<html:form action="/accforib/activate" >
<br><br><br>
<table width="95%" cellpadding="0" cellspacing="0"  class="miniStmtBackBorder" align="left">
	<tr >
	<td class="addEditBranchBack" width="150">&nbsp;</td>
	
		<td  align="center"> 
						<table align="right"  cellpadding="0" cellspacing="7" BORDER="0" width="420" bordercolor="brown">
							<tr>
								<td align="center" colspan="3" class="tableHeader">
									<u>Add / Edit Branch</u></td>
							</tr>
							<tr >
								<td colspan="3" align="center" class="normalText">
									Add Branch
									<html:radio property="addedit" styleId="addedit1" value="add" onfocus="setval('add')"/>
									&nbsp &nbsp &nbsp &nbsp
									Editing Branch
									<html:radio property="addedit" value="edit" styleId="addedit2" onfocus="setval('edit')"/></td>
							</tr>
							
							<tr width="100%">
								<td class="normalText">
									Branch Code	</td>	
								<td >
									:&nbsp;<html:text  property="brncode"  onkeypress="isValidNumber()" maxlength="5"/></td>
								<td>
									<div id="divErrAll" style="display:none;width:50px;">
										<input type="button" name="Validate"  value="Validate" onClick="brninfo()" /> 
									</div>
								</td>
								
							</tr>
							
							<tr>
								<td class="normalText">
									Branch Name</td>
								<td>
									:&nbsp;<html:text property="brnname" maxlength="15"/></td>
								<td>&nbsp;</td>
							</tr>
							
							<tr>
								<td class="normalText">
									Branch address </td>
								<td>
									:&nbsp;<html:text property="brnadd" maxlength="25"/></td>
								<td>&nbsp;</td>
							</tr>
							
							<tr>
								<td class="normalText">
									Branch IP Address</td>
								<td>
									:&nbsp;<html:text property="brnip"  maxlength="15" /></td>
								<td>&nbsp;</td>
							</tr>
							
							<tr>
								<td class="normalText">
									Branch Port No.	</td>
								<td>
									:&nbsp;<html:text property="brnport" onkeypress="isValidNumber()" maxlength="5"/>
								</td>
								<td>&nbsp;</td>
							</tr>
					<tr width="100%">
						<td colspan="3">
							<input type="button" name="ok"  value="" onclick="submitpage()"/> 
                        	<input   value="<bean:message bundle='<%=lang%>' key='33'/>" type="button" tabindex="5" onclick="helpopen()"/>	</td>
					</tr>
					
					<tr>
						<td colspan="3" align="center">
							<div id="diverrmessage">
								<logic:messagesPresent property="invalidbranch">
									<font color="Red" face="verdana">Branch Code is Invalid</font>
								</logic:messagesPresent>
								<logic:messagesPresent property="alreadyExist">
									<font color="Red" face="verdana">Branch Code Already Exist</font>
								</logic:messagesPresent>
							</div>
						</td>
					</tr>
					
				</table>
			
</td>
</tr>
</table>
								   
</html:form>
</body>
</html>
</tiles:put>
</tiles:insert>

							