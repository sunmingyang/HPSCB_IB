<%@ include file="../common/Include.jsp" %>
	
	<%@ page import="easycbs.bancmateib.fundtransfer.actionform.FundForm"%>
		
<% 
  String Error ="";
  String[][] account=null;
  String[] acc_curr=null;
  String[] acc_name=null;
  String[][] accnnicke=null;
  String[][] accountinfo=null;
  
  FundForm addpayeeform=new FundForm();
  int i=0;
     if(request.getSession().getAttribute("account")!=null)
     {
    account=(String[][])request.getSession().getAttribute("account");
	System.out.println(" no of accounts "+account.length);
	 }
	 if(request.getSession().getAttribute("acc_cur")!=null)
     {
     acc_curr=(String[])request.getSession().getAttribute("acc_cur");
	 System.out.println(" no of cur "+ acc_curr.length);
     }
	 if(request.getSession().getAttribute("accsname")!=null)
     {
    acc_name=(String[])request.getSession().getAttribute("accsname");
	System.out.println(" no of snames "+acc_name.length);
     }
	 if(request.getSession().getAttribute("Accinfoo")!=null)
	 {
	   accountinfo=(String[][])request.getSession().getAttribute("Accinfoo");
	   System.out.println(" no of accountinfo "+accountinfo.length);
	 }
	/*if(request.getSession().getAttribute("AccnNicname")!=null)
	 {
    accnnicke=(String[][])request.getSession().getAttribute("AccnNicname");
	System.out.println(" no of AccnNicname "+accnnicke.length);
	 }*/
	 
	 if(request.getSession().getAttribute("AddpayeeForm")!=null)
     {
    addpayeeform=(FundForm)request.getSession().getAttribute("AddpayeeForm");
	 Error=addpayeeform.getsErrorcode();
	System.out.println(" errorcode on jsp is "+ Error);
	 
	
		addpayeeform.setsErrorcode("");
		
		//session.removeAttribute("AddpayeeForm");
        //session.removeAttribute("AccnNicname");
		//session.removeAttribute("Accinfo");
	 }
	 %>
 
 <script>
function fill()
	{
	document.getElementById("sUsrList1").options.length=0;
					
<%
			for( i=0;i<account.length;i++)
		{
	%>
				newOpt = document.createElement("OPTION");
				newOpt.text='<%=account[i][0]%>'+ ' '+'<%=acc_curr[i]%>'+ ' ' +'<%=acc_name[i]%>' ;
				newOpt.value='<%=account[i][0]%>';
				document.getElementById("sUsrList1").options.add(newOpt);
	<%
		} 
	%>
		document.getElementById("select").checked=true;
	}  
 function fill1()
 {   
	 <%
	 	if(!Error.equals(""))  { %>

			alert("<bean:message bundle="error" key='<%=Error%>'/> ");
	          
    <% }
	

		  if(request.getSession().getAttribute("Accinfoo")!=null)
	  {    
		  System.out.println(" else successull");
		  %> 
		  
	     document.getElementById("sUsrList").options.length=0;
		<%	for( i=0;i<accountinfo.length;i++)
		    {%>
				newOpt1 = document.createElement("OPTION");
				newOpt1.text='<%=accountinfo[i][0]%>'+ ' '+'<%=accountinfo[i][1]%>'  ;
				newOpt1.value='<%=accountinfo[i][0]%>';
	            document.getElementById("sUsrList").options.add(newOpt1);
	      <%}
	  } 
	
	%>
	alert("at function end");	
  }  

</script>	

<script language="JavaScript" src="/fundtransfer/scripts/trananythis.js"></script>
<script language="JavaScript" src="/scripts/common.js"></script>

	
	<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Login Page"/>
	<tiles:put name="menu" value="../common/user_left.jsp"/>
	<tiles:put name="line" value="../common/line.html"/>
	<tiles:put name="header" value="../common/header.jsp"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
			<bean:message bundle="hindi" key= "7022"/> 
	</tiles:put>

     <BODY onLoad="fill(),fill1()">

	 <html:form action="/fundtransfer/fund.do?action=performTranAny">
	<br>
	 <table >
	 <tr>
	 
		
	    <b><u><bean:message bundle="hindi" key='1333'/></u>
	 </tr>    
	 <tr>
	    <td>
		</td>
		<td>
			<select name="addpayee" id="addpayee" style="WIDTH: 300px">
				 <option value="Select a Transaction" >Select a Transaction</option>
				 <option value="AddPayee" ><bean:message bundle='<%=lang%>' key='7084'/></option>
				<option value="ViewPayee" ><bean:message bundle='<%=lang%>'key='7094'/></option>
				<option value="DeletePayee"><bean:message bundle='<%=lang%>' key='7095'/></option>
			</select>
		</td>
		<td>
		<input type="button" class="button" value="<bean:message bundle='<%=lang%>' key='86' />" onClick="selectPayee()">
		</td>
		
	 </tr>
	 <tr>
	    <td>
	      
	    </td>
	 </tr>
	 <tr> 
	    <td>
		  <bean:message bundle="hindi" key='2394'/>&nbsp
		</td>
	    <td>
		  <select  name="sUsrList" id = "sUsrList" property="sUsrList" style="WIDTH: 220px"  >
		   <option value = "Select Account"></option>
	</select>
	    </td>
	</tr>

	<tr>
	    <td>
		    <bean:message bundle="hindi" key='2393'/>&nbsp
		</td>
	    <td>
		    <select  name="sUsrList1" id = "sUsrList1" property="sUsrList1" style="WIDTH: 220px"  >
		    <option value = ""></option>
				</select>

	    </td>
	</tr>

	<tr>
	    <td>
		    <bean:message bundle="hindi" key= "39"/> 
		</td>
	    <td>
		    <html:text property="amont" styleId="amont" onkeypress="isValidNumber()" size="15" />
		</td>
	</tr>

	 <tr></tr>
	 <tr></tr>
	 <tr></tr>
	 <tr></tr>
	 <tr></tr>
	 <tr></tr>
	 <tr></tr>
	 <tr></tr>
	 
	 <tr>
	    <td>
	        <html:radio property="select" styleId="select1" value="now" onclick="schdetail(this.value)"/><bean:message bundle='hindi' key='7078'/>
		</td>
        <td>
            <html:radio property="select" styleId="select2" value="schedule" onclick="schdetail(this.value)"/><bean:message bundle='hindi' key='7079'/>
		</td>
	 </tr>
	 </table>
	
	 
	 <div id="show"  style="border:thin-ridge;display:none;">
	 <table >
	   <tr><TD>&nbsp;</TD></tr>
	   <tr>
	      <td colspan="3" align="center" class="simple">
		      Details of Schedule:
		  </td>
	   </tr>
	   <tr></tr>
	   <tr></tr>
	 <tr>
	     <td>
		     <bean:message bundle="hindi" key="1635" />&nbsp<br>Format is dd/mm/yyyy
		 </td>
		 <TD width="20"></TD>
		 <td>
		     <input type="text" name="sDate" size="15" />
		 </td>
	 </tr>
	 <tr>
	     <td>
		     <bean:message bundle="hindi" key="7082" />
		 </td>
		 		 <TD width="20"></TD>

		 <td>
		     <select name="payfreq" id="payfreq" style="WIDTH: 150px">
				 <option value="onetime" >One Time Payment</option>
				 <option value="weekly" >Weekly Payment</option>
				<option value="monthly" >Monthly Payment</option>
				
			</select>
		 </td>
	 </tr>
	 <tr>
	     <td>
		      <bean:message bundle="hindi" key="7083" />
		 </td>		 <TD width="20"></TD>

		 <td>
		     <input type="text" name="noofpay" size="15" onKeypress="isValidNumber()"/>
		 </td>
	 </tr>
	 </table>
	 </div>
	 <table>    
	 <tr>
	      <td>
	         <html:button property="pay"  styleClass="Button" onclick="check()">
	         <bean:message bundle="hindi" key="7021"/> 
	         </html:button> 
		 </td>
	     <td>
		     <html:button property="back"  styleClass="Button" onclick="Back()">
	         <bean:message bundle="hindi" key="843"/>
	         </html:button>
		 </td>
	 </tr>
	 <tr>
	     <td>
		 </td>
	 </tr>
       </table>
	 </html:form>
</BODY>

</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="../common/footer.jsp"/>
</tiles:insert>