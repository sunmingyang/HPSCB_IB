<%@ include file="/common/Include.jsp" %>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>

<!-- <html:form action="/jsp/login.do"> -->

<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
<bean:message bundle='<%=lang%>' key='7213' />
</tiles:put>
<tiles:put name="content" type="String">
<html:form action="/accsum/acc_sum.do">
<br>
<br>
<br><br>
<body onLoad="makeScrollableTable('table','false','auto'),onLoad()">
<table width=527>
<tr><td>
<div id="diverrmessage" style="display:none">
<logic:messagesPresent property="NoServer">
<html:errors property="NoServer"/>
</logic:messagesPresent>
</div>
</td></tr>
<tr><td colspan="5" align="right">
<input type="button" onClick="back2()" class="button" value="<bean:message bundle='<%=lang%>' key='843'/>">
<!-- by Ramesh -->
<input type="button" onClick="saveMiniStatementData()" class="button" value="Print">
<!-- end -->
</td></tr>
</table>
<br>
<table border="1" bordercolor="FFFFFF" align="center" width=527 cellpadding="-1" cellspacing="-1" id="table">
	 
	<thead> <TR> 
	 
      <TH width="20"> <bean:message bundle="hindi" key= "2010"/> </TH>
	  <TH><bean:message bundle="hindi" key= "89"/></TH>
        <TH width="120"> <bean:message bundle="hindi" key= "1027"/> </TH>
          <TH> <bean:message bundle="hindi" key= "717"/>  </TH>
		    <TH><bean:message bundle="hindi" key= "718"/>   </TH>
			<TH><bean:message bundle="hindi" key= "1180"/>
			</TH>
			 <TH><bean:message bundle="hindi" key= "217"/></th> 
      
			   			   
      <!-- <TH> Statement</TH> -->
		
	</tr></thead>
	


<% 
System.out.println("BEFORE LoginForm --------------->>>>> ");
LoginForm userInfo=(LoginForm)session.getAttribute("userInfo");   
System.out.println("AFTER LoginForm --------------->>>>> ");
if(userInfo!=null)
{ 
	String[] acc_nums =userInfo.getsIbUsr_AccNums();
	String[] cur_bal=userInfo.getsIbUsr_CurBal();
	String[] clr_bal=userInfo.getsIbUsr_ClrBal();
	String curr[]= userInfo.getsIbUsr_Currency();
	String[] actetype=userInfo.getActEName();
	String[] acthtype=userInfo.getActHName();
	String[] accHolderEName=userInfo.getAccHolderEName();
	String[] accHolderHName=userInfo.getAccHolderHName();

	int j=acc_nums.length;

	if(j!=0)
	{ %>

	<%
	for(int i=0;i<j;i++)
	{ %>
	<tbody>
	<tr bgcolor="#EBDADC">
	<td width="73" align="center"><%=i+1%></td>
	<td nowrap>
		<%=accHolderHName[i]%> / <%=accHolderEName[i]%> 
	</td>
	<td width="118">
	<input type="hidden" name="sAccnum" id="sAccnum">
	<input type="hidden" name ="sCurrency" id ="sCurrency" >

	<html:hidden property="sAccnum" styleId="sAccnum" />

	<%= acc_nums[i] %></td>
	<td nowrap  align="right"><%= cur_bal[i] %></td>
	<td width="114" align="right" ><%= clr_bal[i] %></td>
	<td nowrap> <%= acthtype[i] %> <%= actetype[i] %></td>
	<td nowrap align="center"><%=curr[i]%></td>
		   <!-- <td class="heading"> 
			<% String acc_num=(String)acc_nums[i]; %>
			<a href="#"  onclick="mini_statment('<%= acc_num %>','<%=curr[i]%>')"> 
			<bean:message bundle='<%=lang %>' key='7104'/></a></td>
	 <td class="heading">
	<a href="#"  onclick="detail_stmt('<%= acc_num %>','<%=curr[i]%>')">
	<bean:message bundle='<%=lang %>' key='3609'/></a>
	</td>-->
	<% } // fr ends
	}
} // if ends
%>

</tr>
</tbody>
</table></body>
<table>
	<tr>
		<td>
			<input type="button" onClick="refreshDetails()" class="button" value="REFRESH">
		</td>
	</tr>
</table>
</html:form>

</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>


<script>

function refreshDetails(){

	document.forms[1].action="/accsum/acc_sum.do?action=forFundTransfer";
	document.forms[1].submit();
}

function mini_statment(acc_num,currency)
{
document.getElementById("sAccnum").value=acc_num;
document.getElementById("sCurrency").value=currency;
document.forms[1].action="/accsum/acc_sum.do?action=miniStmt";
document.forms[1].submit();
}
//by Ramesh

function saveAccountSummaryData()
{	
	alert("in function saveAccountSummaryData");
	document.forms[1].action="/accsum/acc_sum.do?action=saveAccountSummaryData";
	document.forms[1].submit();
}
//end
 function onLoad()
{
	<logic:messagesPresent property="NotAcc">
		document.getElementById("diverrmessage").style.display ="block";
	</logic:messagesPresent>

	<logic:messagesPresent property="NotValidAcc">
		document.getElementById("diverrmessage").style.display ="block";
	</logic:messagesPresent>

	<logic:messagesPresent property="RecordSaved">
		document.getElementById("diverrmessage").style.display ="block";
	</logic:messagesPresent>


	<logic:messagesPresent property="FailureSaved">
		document.getElementById("diverrmessage").style.display ="block";
	</logic:messagesPresent>

	<logic:messagesPresent property="NoServer">
		document.getElementById("diverrmessage").style.display ="block";
	</logic:messagesPresent>

}
</script>



</script>
