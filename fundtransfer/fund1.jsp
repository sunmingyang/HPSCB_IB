<%@ include file="/common/Include.jsp" %>
<script>


function check_Fund()
{
	
	if(document.getElementById("select").checked=true)
	{
		disabledControlsOnAction(document.forms[0]);								 
		document.forms[0].action="/fundtransfer/fund.do?action=performFundAction";
		document.forms[0].submit();
	}
	
}
function loadfun()
{
//	alert("hello");
	document.getElementById("cancelButton").focus();
}
</script>
<BODY onload="loadfun()">

<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Internet banking"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
	<tiles:put name="page_header" type="String">
		<bean:message bundle="hindi" key= "7022"/>
	</tiles:put>
	<tiles:put name="content" type="String">

<br>

 <html:form action="/fundtransfer/fund">
 <table>        
     <tr>
       <td width="1">
           <input type="radio" name="select" id="select" value="own" checked="true">
		</td>
		<td>
			<bean:message bundle='hindi' key='7014'/>
		</td>
	 </tr>
	
	<!--
		 <tr>
			 <td>
				 <input type="radio"  name="select" id="select" value="other" ></td>
				 <td> <bean:message bundle='hindi' key='7016'/>	  </td>
		  </tr>
	-->	
		
</table>

<br><br><br>
<table>
	<tr>
	  <td>
		<input type="button" class="Button" name="cancelButton"  id="cancelButton" onclick="check_Fund()" style="width:100px"
				value='<bean:message bundle="hindi" key='844'/>'>
	   </td>
	</tr>
</table>

 </html:form>
	 
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
</body>