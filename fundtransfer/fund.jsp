<%@ include file="/common/Include.jsp" %>
<%String usrName = (String)session.getAttribute("user");
String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
	
%>
<script>

	function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=Ibtrans","child", bar);
}
function check_Fund()
{
	
	if(document.getElementById("select").checked=true)
	{
		disabledControlsOnAction(document.forms[0]);								 
		document.forms[0].action="/fundtransfer/fund.do?action=performFundAction";
		document.forms[0].submit();
	}
	
}
//function loadfun()
//{
//	alert("hello");
//	document.getElementById("cancelButton").focus();
//}
</script>
<BODY ><!-- onload="loadfun()"> -->

<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Internet banking"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
	<tiles:put name="page_header" type="String">
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
<bean:message bundle="hindi" key= "7022"/>
	</tiles:put>
	<tiles:put name="content" type="String">

<br>
<%
if(usrInfo.length>1){%>
 <html:form action="/fundtransfer/fund">
 <table>        
     <!--
	<tr>
       <td width="1">
           <input type="radio" name="select" id="select" value="own" checked="true">
		</td>
		<td>
			<bean:message bundle='hindi' key='7014'/>
		</td>
	 </tr>
	
	
		 <tr>
			 <td>
				 <input type="radio"  name="select" id="select" value="other" ></td>
				 <td> <bean:message bundle='hindi' key='7016'/>	  </td>
		  </tr>
	-->	
		
</table>

<br><br><br>
<table>
<!--	<tr>
	  <td>
		<input type="button" class="Button" name="cancelButton"  id="cancelButton" onclick="check_Fund()" style="width:100px"
				value='<bean:message bundle="hindi" key='844'/>'>
	   
		<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" tabindex="5" style="width:100px"
	onclick="helpopen()"/>

	   </td>
	</tr>

-->
</table>
 </html:form>
	 <%}else
	 {%>
	 <table>
		 <tr>
			<td class="tdforconfirmMsg">
			 </td>
		 </tr>
	</table>
	 <%}%>
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
</body>