<%@ include file="/common/Include.jsp" %>


<script>

function Back()
{    
	document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=back";
	document.forms[0].submit();
}
function fillBodyOnLoad()
{

	//alert("___BODY ON LOAD______");
	

	<logic:messagesPresent property="password">
		document.getElementById("diverrmessage").style.display ="block";
		document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>

	<logic:messagesPresent property="SourceBranchNotConnected">
		document.getElementById("diverrmessage").style.display ="block";
		document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>

	<logic:messagesPresent property="TargetBranchNotConnected">
			document.getElementById("diverrmessage").style.display ="block";
			document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>

			
	
}//________FUNCTION ENDS HERE__________

function goToMainPage()
{    
	document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=back";
	document.forms[0].submit();
}

</script>


<BODY onLoad="fillBodyOnLoad()">

<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Internet banking"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="menu" value="/common/user_left.jsp"/>
	<tiles:put name="page_header" type="String"><bean:message bundle="hindi" key= "7022"/></tiles:put>
	<tiles:put name="content" type="String">

<br>   

<html:form action="/fundtransfer/fund" >

	
<table>
	<tr>
		<td align="left" valign="bottom" >
		<div id ="errorhead" style="display:none;">
			<label><u><font ><bean:message bundle='<%=lang%>' key="7429"/></u></label>
		</div>
		</td>
	</tr>
</table>

<table width="99%">
	<tr><td>
	<div id="diverrmessage" style="display:none">
	
	<select name="errormessage"id="errormessage" size="2" 
			style="background-color:'#800000'; COLOR:'#FFFFFF';FONT-SIZE:11px; WIDTH:400px;">
		
		<logic:messagesPresent property="password">
			<option value="password">&nbsp;<html:errors property="password"/></option>
		</logic:messagesPresent>

		<logic:messagesPresent property="SourceBranchNotConnected">
			<option value="SourceBranchNotConnected">&nbsp;
			<html:errors property="SourceBranchNotConnected"/></option>
		</logic:messagesPresent>

		<logic:messagesPresent property="TargetBranchNotConnected">
			<option value="TargetBranchNotConnected">&nbsp;<html:errors property="TargetBranchNotConnected"/></option>
		</logic:messagesPresent>

	</select>
	</div>
	</td></tr>
</table>

<br><br><br><br>


<table border="1" align="center">
<tr align ="right">


<input type="button" name="cancel" id="cancel" style="width:100px" class="Button"
		onclick="goToMainPage()" value='<bean:message bundle="hindi" key="843"/>' />
	
<tr>
</table>

</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>


