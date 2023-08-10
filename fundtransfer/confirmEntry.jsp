<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/fundtransfer/scripts/trananythis.js"></script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Login Page"/>
	<tiles:put name="menu" value="/common/user_left.jsp"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
			<bean:message bundle="<%=lang%>" key= "7022"/> 
</tiles:put>
	
<br>
<body>


<html:form action="/fundtransfer/fund.do" >
	
	
<table width="100%" >
	<tr>
	    <b><bean:message bundle="<%=lang%>" key='7017' /></b>
	</tr>
	
	<br>
	
	<tr>
	    <td width="50%">
		    <bean:message bundle="<%=lang%>" key='43'/>
			(dd/mm/yy)
	        </td>
			<td>
		    <html:text property="sDate" styleId="sDate" size="30"  />
		</td>
	</tr>
	
	<br>
	
	<tr>
	    <td width="50%">
		    <bean:message bundle="<%=lang%>" key='6430'/>
	        </td>
			<td>
		    <html:text property="transtype" size="60" readonly="true" />
		</td>
	</tr>
	
	<br>
	
	<tr>
	    <td width="50%">
		    <bean:message bundle="<%=lang%>" key='2436'/>
	        </td>
			<td>
			
		    <html:text property="sAccNoFrom" size="30" readonly="true" />
		</td>
     </tr>
	 
	<tr>
	    <td width="50%">
		    <bean:message bundle="<%=lang%>" key='2437'/>
	       </td> 
		    <td>
		     <html:text property="sAccNoTo" size="30" readonly="true"/>
		</td>
     </tr>
	
	 <tr>
	    <td width="50%">
		    <bean:message bundle="<%=lang%>" key='39'/> (INR)
	    </td>
		<td>
		    <html:text property="dAmount" size="30" readonly="true"/>
		</td>
     </tr>
	 
	 <tr>
	     <td width="50%">
		    <bean:message bundle="<%=lang%>" key='7078'/>
	      </td>
		   <td>
		       <html:text property="paynow" size="30" readonly="true"/>
		   </td>
     </tr>
	 
	 <tr>
	     <td>
		     <html:hidden property="sYstemerror"  />
		 </td>
     </tr>
	
	</table>

	<br>
	
	<table  width="100%">
	       <tr>
		       
			   <td >
                   <html:button property="cancel" styleId="cancel" styleClass="button" onclick="cancl()">
				   <bean:message bundle='hindi' key='843'/>
				  </html:button>
				 </td >
				
		   <tr>
     </table>
	
	 <table>
	      <tr>
				<td align="left" valign="bottom" ><div id ="errorhead" style="display:none;">
			<label > <u><font ><bean:message bundle= '<%= lang %>' key="7220"/>
			         </u>
			 </label>
				</div></td>
		  </tr>

     </table>
	
	 <script>
	    var errorArrayText= new Array();
		var ind = 0;
		
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
		
		alert(errorArrayText.length);
		
		if(errorArrayText.length > 0){
			
			alert("Condition is true ");
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
	    System.out.println("before session");
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