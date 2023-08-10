<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/fundtransfer/scripts/fund.js">
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Login Page"/>
	<tiles:put name="menu" value="/common/user_left.jsp"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
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
	
   <html:form action="/fundtransfer/fund.do" >
   <body onload="fill()">
  <table width=527 align="center">
  <tr><td>
  <table>
   <tr>
	    <td>
		    <bean:message bundle="<%= lang %>" key="7231"/>
		 </td>						
		 <td>
		    <html:password property="passwd" styleId="passwd"size="30" onkeypress="isValidNumAlpha()"/>
		</td>
   </tr>
 </table>
</td></tr>

<tr><td>
	<table >
	       <tr>
		       <td >
		          <input type="button" name="continue" id="continue" class="button" 
				  onclick="continu()" value='<bean:message bundle="<%=lang%>" key="86" />'>
			   </td>
			   <td >
                   <input  type="button" name="cancel" id="cancel" class="button" onclick="cancl()"
				   value='<bean:message bundle="<%=lang%>" key="843"/>'>
			</td>
				
		   </tr >
     </table>
</td></tr>
<tr><td>
	 <table>
	 <tr>
<td align="left" valign="bottom" >
<div id ="errorhead" style="display:none;">
          <label > <u><font ><bean:message bundle= '<%= lang %>' key="1808"/></u></label>
</div>
</td></tr>

</table>
<table width="80%" align="center">
<tr><td>
<div id="diverrmessage" style="display:none">
<select name="errormessage"id="errormessage" size="2" style="background-color:'#800000'; COLOR:'#FFFFFF';FONT-SIZE:11px; WIDTH:400px;">
<logic:messagesPresent property="password" >
<option value="password">&nbsp;<html:errors property="password"/></option> </logic:messagesPresent>
</select>
</div>
</td></tr></table>

</td></tr></table>
	 </body>	 </html:form>

     <%   
	        String correct="";
	      if(request.getSession().getAttribute("successs")!=null)
             {  
			 correct=(String)request.getSession().getAttribute("successs") ; 
			  %>
			  <script>
             alert("<bean:message bundle="error" key='<%=correct%>'/>");
			  </script>
	          
          <% }   
		    session.removeAttribute("successs");
		  %>
	 </tiles:put>
	 <tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="../common/footer.jsp"/>
</tiles:insert>



