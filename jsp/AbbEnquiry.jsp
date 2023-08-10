<%@ include file="/common/Include.jsp" %>

<%
String branchlist[][]=null;
if(session.getAttribute("sBranchInfo")!=null)
	{
     branchlist=(String[][])session.getAttribute("sBranchInfo");
	}	
%>


<script language="JavaScript"src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="title" value="Login Page"/>
<tiles:put name="page_header" type="String" >
<tiles:put name="menu" value="/common/login_left.jsp"/>
<tiles:put name="line" value="/common/line1.html"/>
<font color="#99FF00"></font> &nbsp;&nbsp;&nbsp;
<bean:message bundle="hindi" key="1126" />
</tiles:put>
<tiles:put name="content" type="String">

<body onkeyDown="StopKeyHandler(),onLoad()">
<html:form action= "/jsp/enqlogin" >

<div id="diverrmessage">
	
<logic:messagesPresent property="AbbBranchfailure">
<html:errors property="AbbBranchfailure"/>
</logic:messagesPresent>

<logic:messagesPresent property="AbbinValidAccount">
<html:errors property="AbbinValidAccount"/>
</logic:messagesPresent>

<logic:messagesPresent property="AbbBranchUnavailable">
<html:errors property="AbbBranchUnavailable"/>
</logic:messagesPresent>
</div>


<br>

<table BORDER=5 width="85%" bordercolor="brown" align="center" cellpadding="0" cellspacing="0" >
<tr>
 <td>
  <table cellpadding="0" cellspacing="0" width="100%" >
	<tr> 
             <td colspan="2" align="center" bgcolor="brown">
			 <font color="ffffff" size="2" >ABB ENQUIRY VIEW</font> 
             </td>
             </tr>
	<td  style="padding-left:10px" width="450" class="simple"> 
	 <bean:message bundle="<%=lang%>" key= "425"/> 
	</td>
			<td align="left">
			  <html:select property="sBranchInfo"  style="width:200px;" tabindex="0">
			  <%if(branchlist!=null){
			  for(int i=0;i<branchlist.length;i++){%>
			  <html:option value="<%=branchlist[i][1] %>"> 
			  <%=branchlist[i][1] %>
			  </html:option>
			  <%}}%>
			  </html:select>
			</td>

						
</tr>
		<!--Second row-->	
		<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "1027"/> 
			</td>


			<td align="center" colspan="3">
			<html:text   property="sAccno" styleId="sAccno"size="37" onkeypress="javascript:isValidNumber()" tabindex="1"/>
		
				</td>
		</tr><!--end of sec row-->
	</table><!--end of inner table--->
</tr></td>
</table>
<br>

<table BORDER=1 width="85%" bordercolor="brown" align="center"  cellpadding="0" 	cellspacing="0" >
	<tr>
	<td>
		 <table cellpadding="0" cellspacing="0" width="100%" border="0">
			
			
			<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "89"/> 
			</td>
			<td>
			<html:text   property="sAccName" styleId="sAccName"size="37" readonly ="true" />
			</td>
			</tr>
				<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "717"/> 
			</td>
			<td>
			<html:text   property="sAccCurbal" styleId="sAccCurbal"size="37" readonly ="true"  />
			</td>
			</tr>
			<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "716"/> 
			</td>
			<td>
			<html:text   property="sAccStatus" styleId="sAccStatus"size="37" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
			</td>
			</tr>			
			
			<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "217"/> 
			</td>
			<td>
			<html:text   property="sAccCurency" styleId="sAccCurrency"size="37" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
			</td>
			</tr>
			
			<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "82"/> 
			</td>
			<td>
			<html:text   property="sModeOp" styleId="sModeOp"size="37" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
			</td>
			</tr>
			
			<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "356"/> 
			</td>
			<td>
			<html:text   property="sAuthSign" styleId="sAuthSign"size="37" readonly ="false" onkeypress="javascript:isValidNumAlpha()"/>
			</td>
			</tr>

			<tr>
			<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "493"/> 
			</td>
			<td>
			<html:text   property="sAccCategory" styleId="sAccCategory"size="37" readonly ="true" onkeypress="javascript:isValidNumAlpha()"/>
			</td>
			</tr>		
	 </table>
	</td>
	</tr>
</table>		
</table>

<table align="center">

<tr>
<td style="padding-left:120px" align="center">

<input   value="   <bean:message bundle='<%=lang%>' key='131'/>    " class="Button" type="button" tabindex="2" style="width:100px" onclick="view_submit()" > 
		
<input   value="   <bean:message bundle='<%=lang%>' key='3627'/>    " class="Button" type="button" tabindex="3" style="width:100px" onclick="statement_submit()" > 
			 
<input   value="   <bean:message bundle='<%=lang%>' key='7000'/>    " class="Button" type="button" tabindex="4" style="width:100px" onclick="reset_submit()" > 
</td>
</tr>
</table>

</html:form>

<script language="JavaScript">


function statement_submit()
{	
if(document.getElementById("sAccno").value=="")
	{alert("Please insert Account Number");
	document.getElementById("sAccno").focus();	
		return false;}
else if(document.getElementById("sAccName").value="")
	{alert("Please insert valid Account Number");
	document.getElementById("sAccno").focus();	
		return false;}
else{
disabledControlsOnAction(document.forms[0]);
document.forms[0].action="/openaction.do?src=abbminiStmt";
document.forms[0].method="post";
document.forms[0].submit();
}	
}

function reset_submit()
{
	document.getElementById("sAccno").value="";
	document.getElementById("sAccName").value="";
	document.getElementById("sAccStatus").value="";
	document.getElementById("sAccCurbal").value="";
	document.getElementById("sAccCurency").value="";
	document.getElementById("sModeOp").value="";
	document.getElementById("sAuthSign").value="";
	document.getElementById("sAccCategory").value="";
	document.getElementById("sBranchCode").focus();
	return false;
}


function view_submit()
{	if(document.getElementById("sAccno").value=="")
	{alert("Please insert Account Number");
	document.getElementById("sAccno").focus();	
		return false;}
else{
disabledControlsOnAction(document.forms[0]);
document.forms[0].action="/jsp/enqlogin.do?action=abbBranchUserInfo";
		document.forms[0].method="post";
		document.forms[0].submit();
}
}

</script>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>

</tiles:insert>