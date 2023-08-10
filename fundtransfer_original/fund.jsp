<%@ include file="../common/Include.jsp" %>
<script language="JavaScript" src="scripts/fund.js" >
</script>

<tiles:insert page="../common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="page_header" type="String">
<bean:message bundle="hindi" key= "7022"/> 
</tiles:put>
<tiles:put name="content" type="String">
<br>
 <html:form action="/fundtransfer/fund.do">
 <table>
     <tr>
       <td width="1">
           <input type="radio" name="select" id="select" value="own"></td>
		   <td>   <bean:message bundle='hindi' key='7015'/>
			 </td>
		   </tr>
     <tr>
	     <td>
             <input type="radio"  name="select" id="select" value="other" ></td>
			 <td> <bean:message bundle='hindi' key='7016'/>	  </td>
	  </tr>

	  <tr>
	      <td>
<input type="button" class="Button" onclick="check_Fund()" value='<bean:message bundle="hindi" key='844'/>'>
		   </td>
	  </tr>
	 
	 </table>
	 </html:form>
	 
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
