<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/fundtransfer/scripts/IdPwdanyAcc.js"></script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Login Page"/>
	<tiles:put name="menu" value="../common/user_left.jsp"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="../common/line.html"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
			<bean:message bundle="<%=lang%>" key= "7022"/> 
	</tiles:put>
     <script>

		 function fill()
		  {
			<logic:messagesPresent property="password">
			document.getElementById("diverrmessage").style.display ="block";
			document.getElementById("errorhead").style.display = "block";
			</logic:messagesPresent>
		  
		  }
     </script>
	<br>
	<body onload="fill()">
   <html:form action="/fundtransfer/fund.do?action=performTranAny" >
   <table   width="100%" >
  
	 
	 <tr>
	    <td>
		    <bean:message bundle="<%= lang %>" key="7231"/>
		 </td>						
		 <td>
		    <html:password property="passwd" styleId="passwd"size="30" onkeypress="isValidNumAlpha()"/>
		</td>
     </tr>
	 </table>
	<br>
	<table  width="100%">
	       <tr>
		       <td >
		           <html:button property="continue" styleId="continue" styleClass="button" onclick="continu()" >
				   <bean:message bundle='hindi' key='86' />
				  </html:button>
			   </td>
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
					  <label > <u><font ><bean:message bundle= '<%= lang %>' key="1808"/></u></label>
			</div></td></tr>
     </table>
	 <table width="80%">
		<tr><td><div id="diverrmessage" style="display:none">
		<select name="errormessage"id="errormessage" size="2" style="background-color:'#800000'; COLOR:'#FFFFFF';FONT-SIZE:11px; WIDTH:700px;">
		<logic:messagesPresent property="password" >
		<option value="password">&nbsp;<html:errors property="password"/></option> </logic:messagesPresent>
		</select>
		</div>
		</td></tr>
	</table>
	 </html:form>
     
	 </tiles:put>
	 <tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="../common/footer.jsp"/>
</tiles:insert>