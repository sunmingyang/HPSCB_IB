	<%@ include file="/common/Include.jsp" %>
	<%String usrName = (String)session.getAttribute("user");
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
	String openFor="",smode="";
	if(request.getParameter("openFor")!=null){
            openFor=(String)request.getParameter("openFor");
			System.out.println("openFor----------------"+openFor);
            }
	if(request.getParameter("sMode")!=null){
            smode=(String)request.getParameter("sMode");
			System.out.println("openFor----------------"+openFor);
            }	
			
			String custRole=(String)session.getAttribute("custRole");
	%>
	<script>
	 var jspOpenFor = '<%=openFor%>'; 
	 var sMode = '<%=smode%>';
	 var custrole='<%=custRole%>';

	function fillData(){
		document.getElementById("selectS").checked=true
		selectValue();
	}
	function check_Fund()
	{
			disabledControlsOnAction(document.forms[0]);	
		
			//alert(document.forms[0].selectN.value);
           if((custrole ==='C' && jspOpenFor === 'A') || (custrole ==='S' && jspOpenFor === 'E') ){
			   alert(jspOpenFor); 
		   	document.forms[0].action="/TransactionAction.do?action=getPendingListforIFTAuthorization&mode="+document.forms[0].selectN.value+"&sMode="+sMode+"&purpose="+document.forms[0].selectN.value; 
		   } else {
		   	document.forms[0].action="/TransactionAction.do?action=IMPSTransferData&mode="+document.forms[0].selectN.value;
		  } 
		  	document.forms[0].submit();
		  
	}
	function selectValue(){
		if(document.getElementById("selectS").checked){
			document.getElementById("selectS").value="P2P"
			//alert(document.getElementById("select1").value);

		}
		else{
			document.getElementById("selectO").value="P2A"
			//alert(document.getElementById("select").value)
		}

	}
	</script>
	<BODY style="margin:0 0 0 0;" onload="fillData()" ><br><!-- onload="loadfun()"> -->

	<tiles:insert page="../common/siteLayout.jsp" flush="true">
		<tiles:put name="title" value="Internet banking"/>
		<tiles:put name="header" value="/common/header.jsp"/>
		<tiles:put name="line" value="/common/line.html"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
	<%if(openFor.equals("A") || openFor.equals("E")) {%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
			<%} else {%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
				<%}%>
		<tiles:put name="page_header" type="String">
			&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
	<bean:message bundle="hindi" key= "7022"/>
		</tiles:put>
		<tiles:put name="content" type="String">

	<br>
	 <html:form action="/fundtransfer/fund">
	 <table align="center">
		   <tr>
			<td  class="wrapperDataTableTR" align="center" width=898px> Transfer >> With in IMPS TRANSACTION</td>	
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		 <tr>
		   <td align="center">
			   <input type="radio" name="selectN" id="selectS" value="P2P"  onclick="selectValue()">
					P2P	</td>
		 </tr>
			 <tr>
				 <td align="center">
					 <input type="radio"  name="selectN" id="selectO" value="P2A" onclick="selectValue()">
					  P2A </td>
			  </tr>
			
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