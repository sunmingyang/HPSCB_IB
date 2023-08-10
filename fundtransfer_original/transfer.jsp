	<%@ include file="/common/Include.jsp" %>

<% 
  
  String[][] account=null;
  String[] acc_curr=null;
  String[] acc_name=null;
  
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
	 
	 %>
  <script>
function fill()
	{
		alert("111111");
	document.getElementById("sUsrList").options.length=0;
					
<%
			for( i=0;i<account.length;i++)
		{
	%>
				newOpt = document.createElement("OPTION");
				newOpt.text='<%=account[i][0]%>'+ ' '+'<%=acc_curr[i]%>'+ ' ' +'<%=acc_name[i]%>' ;
				newOpt.value='<%=account[i][0]%>';
				document.getElementById("sUsrList").options.add(newOpt);
	<%
		} 
	%>
	}  
	function fill1()
	{
	alert("111111");
	document.getElementById("sUsrList1").options.length=0;
					
<%
			for( i=0;i<account.length;i++)
		{
	%>
				newOpt1 = document.createElement("OPTION");
				newOpt1.text='<%=account[i][0]%>'+ ' '+'<%=acc_curr[i]%>'+ ' ' +'<%=acc_name[i]%>' ;
				newOpt1.value='<%=account[i][0]%>' ;
				document.getElementById("sUsrList1").options.add(newOpt1);
	<%
		}
	%>     
	}
	
</script>
<script language="JavaScript"src="/fundtransfer/scripts/fund.js">
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Login Page"/>
<tiles:put name="menu" value="../common/user_left.jsp"/>

<tiles:put name="line" value="../common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="page_header" type="String">
		<bean:message bundle="hindi" key= "7022"/> 
</tiles:put>
<tiles:put name="content" type="String">
 <body onLoad="fill(),fill1()">
	 <html:form action="/fundtransfer/fund">
	 <table>        
    
	        <tr>
		      
			  
		      <b><u><bean:message bundle="hindi" key='1333'/>
			 </tr>
	        <tr></tr><tr></tr><tr></tr><tr></tr>
	       <tr>
		       <td>
			       <bean:message bundle="hindi" key='2394'/>&nbsp
			   </td>
	           <td>
			   <select  name="sUsrList" id = "sUsrList"  style="WIDTH: 220px">
		       <option value = ""></option>
			   </select>
	           </td>
		  </tr>
	      <tr>
		      <td>
			      <bean:message bundle="hindi" key='2393'/>&nbsp
			  </td>
	           <td>
			   <select  name="sUsrList1" id = "sUsrList1"  style="WIDTH: 220px">
		       <option value = ""></option>
			   </select>
	           </td>
		  </tr>
	      <tr>
		      <td>
			      <bean:message bundle="hindi" key= "39"/>
			  </td>
	          <td>
			      <html:text property="amount" size="15" onkeypress="isValidNumber()"/>
			  </td>
		 </tr>
	    
	    <tr></tr><tr></tr>
	    <tr>
		<tr></tr><tr></tr>
		    <td>&nbsp
	            <input type="button" name="pay" id="pay" class="Button"  onclick="check_transfer()" value='<bean:message bundle="hindi" key="7021"/>'
				> 
	        </td>
	        <td>
		        <input type="button" name=""="back" class="Button"  onclick="Back()"
				value='<bean:message bundle="hindi" key="843"/>'>
			</td>
		</tr>
	 <tr>
	     <td>
		    
		 </td>
	</tr>
	</table>
	 
	</html:form>
	</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="../common/footer.jsp"/>
</tiles:insert>