<%@ include file="/common/Include.jsp" %>
<%@ page info="Programmer Vinay Singh Tomar" %>

<script language="javascript">
function fillOnLoadData()
{
	alert("Body On Load");
}


function completeTransaction()
{    
	if(document.getElementById("passwd").value=="")
	{
		alert("<bean:message bundle="<%=errorLang%>" key='53'/>");
		return;
	}
	if(document.getElementById("passwd").value!="")
	{
		disabledControlsOnAction(document.forms[0]);
		document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=ok"
		document.forms[0].submit();
	}
}

function closeWindow()
{    

	window.location.href="/fundtransfer/transfer.jsp";
}

function onLoad(){

	 <logic:messagesPresent property="password">
		document.getElementById("diverrmessage").style.display ="block";
		document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>
}

</script>

<script language="JavaScript"src="/fundtransfer/scripts/fund.js">
</script>


<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Login Page"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="menu" value="/common/user_left.jsp"/>
	<tiles:put name="page_header" type="String"><bean:message bundle="<%=lang%>" key= "7022"/></tiles:put>
	<tiles:put name="content" type="String">

	
<body onLoad="onLoad()">
<br>

<html:form action="/fundtransfer/fund.do" >

  <table width=527 align="center">
  <tr><td>
  <table>
   <tr>
	    <td>
		    <bean:message bundle="<%= lang %>" key="7231"/>
		 </td>						
		 <td>
		    <html:password property="isPassWord" styleId="isPassWord" size="30" onkeypress="isValidNumAlpha()"/>
		</td>
   </tr>
 </table>
</td></tr>

<tr><td>
	<table>
	       <tr>
		       <td> <!-- ok button -->
		          <input type="button" name="continue" id="continue" class="button" 
				  onclick="completeTransaction()" value='<bean:message bundle="<%=lang%>" key="86" />'>
			   </td>
			   
			   <td><!-- back button -->
                   <input  type="button" name="cancel" id="cancel" class="button" onclick="closeWindow()"
				   value='<bean:message bundle="<%=lang%>" key="843"/>'>
				</td>
				
		   </tr>
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
	</td></tr>
</table>

</td></tr></table>
	

</html:form>


</body>
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

<script>
	<logic:messagesPresent property="password">
			document.getElementById("diverrmessage").style.display ="block";
			document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>
</script>

