<%@ include file="/common/Include.jsp" %>

	<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Login Page"/>
	<tiles:put name="menu" value="../common/user_left.jsp"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="../common/line.html"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
			<bean:message bundle="<%=lang%>" key= "7022"/> 
	</tiles:put>
	
	<script language="JavaScript" src="/fundtransfer/scripts/viewpayee.js"></script>

<%  
    String[][] accnnicke=null;
    if(request.getSession().getAttribute("Accinfoo")!=null)
	 {
    accnnicke=(String[][])request.getSession().getAttribute("Accinfoo");
	System.out.println(" no of Accinfoo "+accnnicke.length);
	 }
    String[][] usrinfo=null;
	if(request.getSession().getAttribute("UserInfo")!=null)
	 {
    usrinfo=(String[][])request.getSession().getAttribute("UserInfo");
	System.out.println(" no of usrinfo "+usrinfo.length);
	 }
	 session.removeAttribute("UserInfo");
%>
	<script>
	function fill()
	{
	<%	if(request.getSession().getAttribute("Accinfoo")!=null)
	 {
	 %>
	 document.getElementById("sUsrList").options.length=0;
	 <%     int i;
			for( i=0;i<accnnicke.length;i++)
		{
	%>
		newOpt1 = document.createElement("OPTION");
				newOpt1.text='<%=accnnicke[i][0]%>'+ ' '+'<%=accnnicke[i][1]%>'  ;
				newOpt1.value='<%=accnnicke[i][0]%>';
				document.getElementById("sUsrList").options.add(newOpt1);
	<%
		} 
	 }
	%>
	 <%	if(usrinfo!=null)
	   {
	 %> 
       document.getElementById("ename").value='<%=usrinfo[0][1]%>';
	   document.getElementById("hname").value='<%=usrinfo[0][2]%>';
	   document.getElementById("sPayeeAcc").value='<%=usrinfo[0][0]%>';
	   document.getElementById("status").value="Registered"; 
     <%
	   }
	 %>
	   
	}

	</script>

	<BODY onLoad="fill()">
	<html:form action="/fundtransfer/fund.do">
	<br><br>
	<table border="1" bordercolor="brown" style="border-left:none;border-right:none;border-top:none;border-bottom:none">
	<tr>
	<td valign="middle" colspan="3">
	
	<table>
	
	
	<tr>
	<td class="simple" colspan="3" align="center">
		<b><bean:message bundle="<%=lang%>" key='7446'/> </b>
	</td>
	</tr>
  
	 <tr>
	  <td colspan="2" >
		  <select  name="sUsrList" id = "sUsrList"  style="WIDTH: 150px"  >
		   <option value = ""></option>
	      </select>
		  </td>
		  <td>
	  <html:button  property="view" styleClass="Button" onclick="retrive()" >
	  <bean:message bundle="<%=lang%>" key='7108'/></html:button> 
		</td>
	 </tr>
	 <tr><td colspan="3">&nbsp;</td></tr>
	 
	<tr>
	    <td> <bean:message bundle="<%=lang%>" key='40'/></td>
		<td><input  type="text" name="hname" id="hname"  size="15" readonly="true" ></td>
		<td><input type="text" name="ename" id="ename"  size="15" readonly="true" ></td>
       
	</tr>
	
	<tr>
	   <td>
	       <bean:message bundle="<%=lang%>" key='7448'/>  </td>
		<td>
	        <input type="text" id="sPayeeAcc" name="sPayeeAcc" readonly="true" size="15">
		</td>
  
    </tr>
	<tr>
	   <td>
	       <bean:message bundle="<%=lang%>" key='7107'/>
	     </td>
		<td>
	      <input type="text" name="status" id="status" readonly="true" size="15">
       </td> 
    </tr>
	
	<tr>
	   <td colspan="3" align="center">
	        <html:button property="back" styleClass="Button" onclick="bacck()" >
			<bean:message bundle="<%=lang%>" key='843'/></html:button>
			 <html:hidden property="viewpayee" styleId="viewpayee" />
       </td>
     </tr>
	 </table>
	 
 </td>
 </tr>
 </table>
	 </html:form>
</BODY>

</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="../common/footer.jsp"/>
</tiles:insert>







