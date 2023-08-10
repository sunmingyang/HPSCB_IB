<%@ include file="/common/Include.jsp" %>
	<%@ page import="easycbs.bancmateib.fundtransfer.actionform.AddpayeeForm"%>
	<%
	String Error="";
	AddpayeeForm addpayeeform=new AddpayeeForm();
if(request.getSession().getAttribute("AddpayeeForm")!=null)
  {
    addpayeeform=(AddpayeeForm)request.getSession().getAttribute("AddpayeeForm");
	 Error=addpayeeform.getsErrorcode();
	System.out.println(" errorcode on jsp is "+ Error);
}
		addpayeeform.setsErrorcode("");
		
		//session.removeAttribute("AddpayeeForm");
		//addpayeeform.setMob("");
	%>
	 <script>
	 function fill()
      {
	       <% if(!Error.equals(""))  
		      { %>
       
			alert("<bean:message bundle="error" key='<%=Error%>'/> ");
             <% }%>
      }
	 </script>
	 <script language="JavaScript" src="/fundtransfer/scripts/addpayee.js"></script>

	
	<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Login Page"/>
	<tiles:put name="menu" value="../common/user_left.jsp"/>
	<tiles:put name="line" value="../common/line.html"/>
	<tiles:put name="header" value="../common/header.jsp"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
			<bean:message bundle="hindi" key= "7022"/> 
	</tiles:put>
	
<BODY onLoad="fill()" >
    <html:form action="/fundtransfer/fund.do">
	<table>
	<tr><td>&nbsp;</td></tr>
	<tr class="heading">
	    <bean:message bundle="hindi" key='7084' />
	</tr>
	<tr>
	  <td>
	       <select name="selectpayee" id="selectpayee" style="WIDTH: 200px">
				<option value="Select a Transaction" >Select a Transaction</option>
				<option value="AddPayee" ><bean:message bundle="hindi" key='7084'/></option>
				<option value="ViewPayee" ><bean:message bundle="hindi" key='7094'/></option>
				<option value="DeletePayee"><bean:message bundle="hindi" key='7095'/></option>
		   </select>
      </td>
	<td>
		  <html:button  property="ok" styleClass="Button" onclick="selectPayee()">
	      <bean:message bundle="hindi" key='86'/></html:button> 
	</td>
		<td>
	       <html:hidden property="addpayee" styleId="addpayee"/>      
	    </td>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
	    <td>
	       <bean:message bundle="hindi" key='7086'/>
		   </td>  <td width="2">&nbsp;</td>
		<td>  
		  <html:text property="sNickName" styleId="sNickName" />
		</td>
 </tr>
	<tr>
	   <td>
	      <bean:message bundle="hindi" key='7085'/>
       </td>
  <td width="2"></td>
	    <td>

		  <html:text  property="sPayeeAcc" styleId="sPayeeAcc" onblur="attach()" />
		</td>
	</tr>

	
 
 
 	<tr>
	    <td><bean:message bundle="hindi" key='425'/>  </td> 
		  <td width="2">&nbsp;</td>
		<td> 
		<html:text property="sBranchCode" styleId="sBranchCode" size="12" maxlength="6" onblur="FindAccType()" />
		</td>
 </tr>
 
 
  	<tr>
	    <td><bean:message bundle="hindi" key='1180'/>  </td> 
		  <td width="2">&nbsp;</td>
		<td>
		<select name="sAccountType">
		</select>
		</td>
 </tr>
 
 
 
	<tr>
	    <td colspan="3">
	       <b><u><bean:message bundle="hindi" key='7087'/>
	    </td>
</tr>

	<tr>
	    <td>
	       <bean:message bundle="hindi" key='7088'/></td>
		   <td width="2"></td>
		   <td>     
		    <html:text property="mob" size="30" readonly="true"/>
		</td>
    </tr>
	<tr>
	    <td>
	       <bean:message bundle="hindi" key='1877'/>
	      </td> 
		   <td width="2"></td>
		  <td>
		    <html:text property="email" size="30" readonly="true"/>
		</td>
	</tr>
	
	
	<tr>
	    <td>
		    <html:button property="continue" styleClass="Button" onclick="continu()" >
			<bean:message bundle="hindi" key='7089'/></html:button></td>
		    
			<td width="2"></td>
		
		<td>
	    <html:button property="back" styleClass="Button" onclick="bacck()" >
			<bean:message bundle="hindi" key='843'/></html:button>
		    
         </td>
    </tr>
	</table>
	
	    

   </html:form>
   </body>
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="../common/footer.jsp"/>
</tiles:insert></em>