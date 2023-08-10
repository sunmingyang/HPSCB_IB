<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Login Page"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="menu" value="/common/login_left.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
<bean:message bundle="hindi" key="7007" />
</tiles:put>
<tiles:put name="content" type="String">
<body onkeyDown="StopKeyHandler(),onLoad()">
<html:form action= "/jsp/login">
<br>
<br>
<br><br><br><br><br>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<% if(request.getParameter("errno")!=null)
{ %>
<br>
<br>
<tr><td style="padding-left:80px" class="heading">
<bean:message bundle='<%=lang%>' key='7419'/>!!!
</td></tr>
<% } %>
  <tr> 
    <td style="padding-left:85px" valign="middle">
	
<div id="diverrmessage">
	
<logic:messagesPresent property="Locked">
<html:errors property="Locked"/>
</logic:messagesPresent>

<logic:messagesPresent property="LogOut">
<html:errors property="LogOut"/>
</logic:messagesPresent>

<logic:messagesPresent property="Deactive">
<html:errors property="Deactive"/>
</logic:messagesPresent>


<logic:messagesPresent property="alreadyLogin">
<html:errors property="alreadyLogin"/>
</logic:messagesPresent>

<logic:messagesPresent property="WrongPass">
<html:errors property="WrongPass"/>
</logic:messagesPresent>

<logic:messagesPresent property="NoServer">
<html:errors property="NoServer"/>
</logic:messagesPresent>


</div>
	
	 <table  cellpadding="0" cellspacing="0" BORDER=1 width=327 bordercolor="brown" >
        <tr> 
          <td align="center"> 
		  <table cellpadding="0" cellspacing="0" width="100%" >
              <tr> 
                <td colspan="4" align="center" bgcolor="brown">
				<font color="ffffff">Login</font> 
                </td>
              </tr>
              <tr> 
                <td colsapn="4">&nbsp;</td>
              </tr>
              <tr> 
                <td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "603"/> 
                  : </td>
                <td width="1">&nbsp;</td>
                <td width="2"> <html:text   property="sIbUsr_LogId" styleId="sIbUsr_LogId"size="15" onkeypress="javascript:isValidNumAlpha()"/></td>
              </tr>
              <tr> 
                <td style="padding-left:10px"  class="simple" > <bean:message bundle="<%=lang%>" key= "100"/> 
                  : </td>
                <td width="1"></td>
                <td><html:password   property="sIbUsr_LogPass" styleId="sIbUsr_LogPass" size="15" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td style="padding-left:120px"> <input   value="   <bean:message bundle='<%=lang%>' key='86'/>    " class="Button" type="button" onclick="login_submit()" > 
                </td>
                <td width=2>&nbsp;</td>
                <td></td>
                <td width="3">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table>
  <tr>
    <td style="padding-left:190px" class="simple"><br> 
      <!-- <a href="forget_pass.jsp" class="nav">Forget password</a></td></tr> -->
    </td>
  </tr>
</table>

</html:form>
<script language="JavaScript">


function onLoad()
{

<logic:messagesPresent property="Deactive">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="Locked">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="alreadyLogin">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>


<logic:messagesPresent property="WrongPass">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="NoServer">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

<logic:messagesPresent property="LogOut">
document.getElementById("diverrmessage").style.display ="block";
</logic:messagesPresent>

}

</script>
 </body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>







