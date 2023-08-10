
<%@ include file="/common/Include.jsp" %>
 <script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>
<%
	String userName = (String)session.getAttribute("user");
	
	System.out.println("+++++++userName++++++++++"+userName);
	System.out.println("++++++++user+++++++++"+(String)session.getAttribute("user"));
%>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Login Page"/>
<tiles:put name="header" value="/common/header.jsp"/>

<tiles:put name="page_header" type="String">
		<font color="#99FF00"><b><%if(userName!=null) out.print(userName);%>!</b></font> &nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key= "2289"/> 
</tiles:put>


<tiles:put name="content" type="String">


<html:form action= "/jsp/login">






<% 
	if(request.getParameter("process")!=null) 
	{
%>
		<table align="center">
			<tr>
				<td style="padding-left:65px" width="60%">
					<div style="padding-left:85px" class="heading">Password is invalid ! </div>
				</td>
			</tr>
		</table>
<%	} %>

<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center" >
	<tr>
		<td style="padding-left:85px"> 
			<table cellpadding="0" cellspacing="0" border=1 width="60%">
				<tr> 
					<td >
					   <table cellpadding="0" cellspacing="0" width="100%" align="center">
							<tr class="tbl_heading"> 
								<td  colspan="3" align="center">					
									<bean:message bundle="<%=lang%>" key="7005"/>  
								</td>
							</tr>
							<tr> 
								<td colsapn="3">&nbsp;</td>
							</tr>
							<tr> 
								<td style="padding-left:20px" class="simple">
									<% 
									if(request.getParameter("process")!=null){
										if ( request.getParameter("process").equalsIgnoreCase("login"))
										{	%>
											<font color="#ff0000">
									<%	}
									 } %>
									<bean:message bundle="<%=lang%>" key= "2579"/>  :
								</td>
								<td width="20"></td>
								<td>
									<html:password property="sOld_Pass" styleId="sOld_Pass" size="15" /> 
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr> 
								<td style="padding-left:20px"  class="simple">
									<bean:message bundle="<%=lang%>" key="2580"/> : 
								</td>
								<td width="20"></td>
								<td>
									<html:password property="sNew_Pass" styleId="sNew_Pass" size="15"  />
								</td>
							</tr>
							
							<tr> 
								<td style="padding-left:20px"  class="simple">
									<bean:message bundle="<%=lang%>" key="713" /> :
								</td>
								<td width="20"></td>
								<td>
									<html:password property="sCon_Pass" styleId="sCon_Pass" size="15"  />
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr> 
								<td colspan="3" align="center">&nbsp; </td>
							</tr>
					</table>
				</td>
			</tr>
		</table>
	  </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="padding-left:85px">
			<!-- <table  cellpadding="0" cellspacing="0" border=1 width="60%" >
				<tr> 
					<td > 
						<table cellpadding="0" cellspacing="0" width="100%" align="center">
							<!-- <tr> 
								<td class="tbl_heading" colspan="3" align="center">
									**********<bean:message bundle="<%=lang%>" key= "7006"/>  </td>
							</tr>
							<tr> 
								<td  colsapn="3">&nbsp;</td>
							</tr>
							<tr> 
								<td style="padding-left:20px"  class="simple">
									<%
									if(request.getParameter("process")!=null)
									{
										if ( request.getParameter("process").equalsIgnoreCase("trans"))
										{	%>
											<font color="#ff0000">               
									<%	}

									 } %>
									 <bean:message bundle="<%=lang%>" key= "2579"/>  :
								</td>
								<td width="20">&nbsp;</td>
								<td > 
									<html:password property="sTra_Old_Pass" styleId="sTra_Old_Pass" size="15" /> 
								</td>
							</tr>
							<tr> 
								<td  width="20">&nbsp;</td>
							</tr>
							<tr> 
								<td style="padding-left:20px"  class="simple">
									<bean:message bundle="<%=lang%>" key= "2580"/>   :
								</td>
								<td  width="20">&nbsp;</td>
								<td>
									<html:password property="sTra_New_Pass" styleId="sTra_New_Pass" size="15"  onchange="return pswdnotsame()"/>
								</td>
							</tr>
							
							<tr> 
								<td style="padding-left:20px"  class="simple">
									<bean:message bundle="<%=lang%>" key= "713"/>     : 
								</td>
								<td width="20">&nbsp;</td>
								<td>
									<html:password property="sTra_Con_Pass" styleId="sTra_Con_Pass" size="15" />
								</td>
							</tr>
							<tr> 
								<td  width="20">&nbsp;</td>
							</tr>
							</table> 
							
						
					</td>
				</tr>
			</table>--->
				<!-- <a style = "cursor:hand" onclick="passpolicy()">Password Policy</a> -->
									<input name="button" type="button" class="Button" onClick=" pass_submit_form()" value="<bean:message bundle='<%=lang%>' key='86'/>"  size="10"> 
									<html:button property="reset" onclick="reset_chgPass_form()" styleClass="button">
									<bean:message bundle="<%= lang %>" key="7000"/>
									</html:button>
								
								
									
								
		</td>
	</tr>
</table>
</html:form>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>

<script>
function passpolicy()
{
	var bar = "width=600,height=250,left=150, top=220, scrollbars=no";
	window.open("/jsp/PasswdPolicy.jsp","child", bar);
}
//nEW FUNCTION FOR NOT SAME PSWD
function pswdnotsame()
{
  var login=document.getElementById("sNew_Pass").value;
  var trnspwd=document.getElementById("sTra_New_Pass").value;

  if(login==trnspwd){
    alert("TRANSACTION PASSWORD AND LOGIN PASSWORD CANNOT BE SAME");
    document.getElementById("sTra_New_Pass").value="";
    document.getElementById("sTra_New_Pass").focus();
    return false
  }
    else 
        return true;
}
</script>


