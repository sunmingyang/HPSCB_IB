
<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>
 <script language="JavaScript" src="/jsp/scripts/city_help.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Forgrt password"/>
<tiles:put name="header" value="/common/header.jsp"/>

<tiles:put name="content" type="String">

<html:form action= "/jsp/forpass.do">
<% 
if( request.getParameter("process")!=null )
{
 if (request.getParameter("process").equalsIgnoreCase("invalid"))
{ %>
  <table>
  <tr><td class="heading">Incorrect Loginid or Account number!!!</td></tr>
  
  
  </table>
<% } 
 } %>
 
<table  width="93%" >
<tr>
<td align="right"><a href="loginform.jsp">
<input type="button" class="Button" value="<bean:message bundle='<%=lang%>' key='843'/>" onclick="to_login()" ></a>
 </td>
</tr>

</table>
<table border="1" align="left"  width="527" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
	<tr>
	<td  width="527">
	<table  cellpadding="0" cellspacing="0" width="100%" align="center">
		<tr>
			<td align="center">

				<table cellpadding="0" cellspacing="0" width="100%" align="center">
              <tr> 
                <td align="left" colspan="3" class="tbl_heading"> Forget Password:</td>
              </tr>
              <tr> 
                <td colspan="3">&nbsp;</td>
              </tr>
              <tr> 
                <td width="211" align="left"  style="padding-left:10px"> <bean:message bundle="<%=lang%>" key= "603"/> 
                  :</td>
                <td width="11">&nbsp;</td>
                <td width="293" style="padding-left:50px"><input class="formField" maxlength="10" type="text" id="sIbUsr_LogId" name="sIbUsr_LogId" size="15"  tabindex=1> 
                </td>
              </tr>
              <tr> 
                <td align="left"  style="padding-left:10px"> Product Linked To 
                  the User ID :</td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"> <select class="formField"  name="sIbUsr_Prod" id="sIbUsr_Prod" tabindex=2 >
                    <option>Bank Account</option>
                    <option>Credit Card</option>
                    <option>Demat</option>
                    <option>Draft</option>
                  </select> </td>
              </tr>
              <tr> 
                <td align="left"  style="padding-left:10px"> <bean:message bundle='<%=lang %>' key='1027'/></td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"> <input class="formField" maxlength="19" onKeyPress="isValidNumAlpha()"  type="text" name="sIbUsr_AccNum" id="sName"size="15" tabindex=2> 
                </td>
              </tr>
              <tr> 
                <td align="left"  style="padding-left:10px"> <bean:message bundle='<%=lang %>' key='1059'/> 
                  :</font> </td>
                <td>&nbsp;</td>
                <td style="padding-left:50px"> <input type=text name="sIbUsr_Dob" size="15" class="formField"  id="sIbUsr_Dob" tabindex=6 onKeyPress="isValidDatechar()" > 
                </td>
              </tr>
              <tr> 
                <td align="left"  style="padding-left:10px"> <bean:message bundle="hindi" key="1877"/> 
                  :</td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"><input type="text"name="sIbUsr_Email" id="sIbUsr_Email" size="15" class="formField"  tabindex=7></td>
              </tr>
              <tr> 
                <td colspan="3">&nbsp; </td>
              </tr>
              <tr> 
                <td align="left"  style="padding-left:10px"> <script>
			Arr=splitString('<bean:message bundle="hindi" key="292"/>','/');
			document.write(Arr[0]);
			document.write("  :" );
			</script></td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"><input type="text" name="sIbUsr_HAddr1" id="sIbUsr_HAddr1" size="30" class="formField"  tabindex="9" ></td>
              </tr>
              <tr> 
                <td align="left">&nbsp; </td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"><input type="text" name="sIbUsr_HAddr2" id="sIbUsr_HAddr2" size="30" class="formField" tabindex=11 ></td>
              </tr>
              <tr> 
                <td colspan="3">&nbsp; </td>
              </tr>
              <tr> 
                <td align="left"  style="padding-left:10px"> Address : </td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"><input type="text" name="sIbUsr_EAddr1" maxlength="100" id="IbUsr_EAddr1" size="30" class="formField"  tabindex="8" onblur="javascript:sIbUsr_HAddr1.value=region(this.value,'hindi');document.getElementById('sIbUsr_HAddr1').focus();" ></td>
              </tr>
              <tr> 
                <td align="left">&nbsp; </td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"><input type="text" name="sIbUsr_EAddr2" maxlength="100" id="sIbUsr_EAddr2" size="30" class="formField" tabindex=10 onblur="javascript:sIbUsr_HAddr2.value=region(this.value,'hindi');document.getElementById('sIbUsr_HAddr2').focus();"  ></td>
              </tr>
              <tr> 
                <td colspan="3">&nbsp; </td>
              </tr>
              <tr> 
                <td align="left"  style="padding-left:10px"> <bean:message bundle='<%=lang %>' key='137' /> 
                  :</td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"><input type="text" value="0" name="sCity_Code" id="sCity_Code"size="15" class="formField" readonly="true"> 
                  <a href="#" onclick="javascript:city_help()"> <img src="../images/help.BMP" height="15" width="15"  tabindex=14 ></a></td>
              </tr>
              <tr> 
                <td align="left"  style="padding-left:10px"> <bean:message bundle="hindi" key="1096"/> 
                  :</td>
                <td width="11">&nbsp;</td>
                <td style="padding-left:50px"><input onkeypress="javascript:isValidNumber()"   maxlength="6"  type="text"name="sIbUsr_PinCode" id="sIbUsr_PinCode" size="15" class="formField" tabindex=15 ></td>
              </tr>
              <tr> 
                <td colspan="3" align="center">&nbsp; </td>
              </tr>
              <tr> 
                <td colspan="3" align="center"> 
				<input value="submit"  class="button" type="button" onclick="return submit_forpass()"  size="20" tabindex=16 > 
                </td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
            </table>
</td></tr></table>
</td></tr></table>
</html:form>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
