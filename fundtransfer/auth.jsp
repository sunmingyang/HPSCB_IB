<%@ include file="/common/Include.jsp" %>


<script>



function cancl()
{    
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=baak"
	document.forms[0].submit();
}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Login Page"/>
	<tiles:put name="menu" value="/common/user_left.jsp"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
	<bean:message bundle="hindi" key= "7022"/></tiles:put>
	<br>

<body>


<html:form action="/fundtransfer/fund" >
	<table   width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<b><bean:message bundle="hindi" key='7426'/></b>
		</tr>
		
		<br>
		
		<tr>
			<td width="50%"><bean:message bundle="hindi" key='43'/></td>
			<td><html:text property="sDate" styleId="sDate" size="30" readonly="true"/></td>
		</tr>
		
		<br>
	
		<tr>
			<!--
			<td width="50%"><bean:message bundle="hindi" key='6430'/></td>
			 <td><html:text property="transtype" size="60" readonly="true" /></td> -->

			<td> English Desc.</td>
			<td><html:text property="isEnglishDescription" styleId="isEnglishDescription" 
				style="text-align:right" size="60" readonly="true" /></td>
		</tr>
		
		<br>
		
		<tr>
			<td width="50%"><bean:message bundle="hindi" key='2436'/></td>
			<td><html:text property="sAccNoFrom" size="30" readonly="true" /></td>
		</tr>
	 
		<tr>
			<td width="50%"><logic:messagesPresent property ="AccNoTo"></logic:messagesPresent>
				<LABEL><bean:message bundle="<%= lang %>" key="2437"/></LABEL>
				<logic:messagesPresent property ="AccNoTo"></logic:messagesPresent>
			</td> 
			<td><html:text property="sAccNoTo" size="30" readonly="true"/></td>
		</tr>

		
		<tr>
			<td width="50%"><bean:message bundle="hindi" key='39'/></td>
			<td><html:text property="dAmount" size="30" readonly="true"/></td>                     
		 </tr>

		 <tr>
			<td><html:hidden property="sYstemerror"/></td>
		 </tr>
	 
	 
	</table>

	<br>
	
	<table width="100%">
		<tr>
			<td align="center">
				<input type="button" value='<bean:message bundle="hindi" key="843"/>'
					name="cancel" id="cancel" onclick="cancl()"  class="Button" style="width:100px">
					
			</td>
			<td></td>
		<tr>
	</table>
	
	<table>
		<tr>
			<td align="left" valign="bottom" >
				<div id ="errorhead" style="display:none;">
					<label > <u><font ><bean:message bundle= '<%= lang %>' key="7220"/></u></label>
				</div>
			</td>
		 </tr>
	</table>



	 <script>
		var ind = 0;
		var errorArrayText= new Array();
		//alert("errors");
		<html:messages id = "Errors" property = "sAccNoTo" bundle='<%=errorLang%>'>
			errorArrayValue[ind] = "sAccNoTo";
			errorArrayText[ind] = '<bean:write name = "Errors" />'
			ind = ind + 1;
		</html:messages>
		
		<html:messages id = "Errors" property = "sAccNoFrom" bundle='<%=errorLang%>'>
			errorArrayValue[ind] = "sAccNoFrom";
			errorArrayText[ind] = '<bean:write name = "Errors" />'
			ind = ind + 1;
		</html:messages>
		
		<html:messages id = "Errors" property = "sAmount1" bundle='<%=errorLang%>'>
			errorArrayValue[ind] = "dAmount";
			errorArrayText[ind] = '<bean:write name = "Errors" />'
			ind = ind + 1;
		</html:messages>
		
		<html:messages id = "Errors" property = "sYstemerror" bundle='<%=errorLang%>'>
			errorArrayValue[ind] = "sYstemerror";
			errorArrayText[ind] = '<bean:write name = "Errors" />'
			ind = ind + 1;
		</html:messages>
		
		//alert(errorArrayText.length);
		
		if(errorArrayText.length > 0){
			
			//alert("Condition is true ");
			
			document.write("<TABLE id = \"ErrorTab\" >");
			document.write("<TR>");
			document.write("<font color='RED'>");
			document.write("<TD style=\"WIDTH:750px;\" rowspan = 2 align = top class = ErrorTab>");
			document.write("<A id = 'ErrorId' class = \"ErrorLink\" "
			+ " onClick = \"javascript:goToErrorControl()\">1. " 
				+ errorArrayText[0] + "</A>");
			
			document.write("<input type = 'hidden' name = 'hiddenIndex' value = 0>");
			document.write("</font>");
			document.write("</TD>");
			document.write("<TD style=\"WIDTH:10px\" nowrap>");
			document.write("<img class = 'Image' src='/images/down.gif'"
				+ " onclick = 'goToPrevious()'>");
			document.write("</TD>");
			document.write("<TD rowspan = 2>");
			document.write("<input type = text name = sCount readonly size = 7"
				+ " value = \"1 OF " + errorArrayText.length + "\">");
			document.write("</TD>");
			document.write("</TR>");
			document.write("<TR>");
			document.write("<TD>");
			document.write("<img class = 'Image' src='/images/up.gif'"
				+ " onclick = 'goToNext()'>");
			document.write("</TD>");
			document.write("</TR>");
			document.write("</TABLE>");
		}
	</script>

	</html:form>


	<%   
		String correct="";
	    if(request.getSession().getAttribute("success")!=null)
        {  
			correct=(String)request.getSession().getAttribute("success") ; 
	%>
		<script>
			document.getElementById("errorhead").style.display = "block";
		</script>
	          
    <% }   
		    session.removeAttribute("success");
		  %>


	</body>
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>