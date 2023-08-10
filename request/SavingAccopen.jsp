	<%@ include file="/common/Include.jsp" %>
	<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
	<%
	String usrName = (String)session.getAttribute("user");
	String atpType = "" ; 
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
	String accountNo=usrInfo[0][0];
	String custID=usrInfo[0][8];
	System.out.println(accountNo);
	String appServer = BMConfig.getProperty("CBSWEBURL") ;

	if (request.getParameter("atpType") != null)  { 
		atpType = (String)request.getParameter("atpType");
		System.out.println("Account Type :" + atpType) ;
	}else { 
			System.out.println("Account Type is null :" ) ;
	}
	
//	response.sendRedirect(appServer + "/account/acopen/acOpen.do?action=executeOpen&param=1101&appSrc=TABBANKING&custID="+custID+"&atpType="+atpType ); 
	%>
	<script>

	function onload()
	{ 
	
	  document.getElementById('if').src="<%=appServer%>/account/acopen/acOpen.do?action=executeOpen&param=1101&appSrc=TABBANKING&custID=<%=custID%>&atpType=<%=atpType%>";
   
	}
	</script>
<tiles:insert page="../common/siteLayout.jsp" flush="true">
		<tiles:put name="title" value="Internet banking"/>
		<tiles:put name="header" value="/common/header.jsp"/>
		<tiles:put name="line" value="/common/line.html"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=accOpen"/>
		<tiles:put name="menu" value="/common/user_left.jsp?src=accOpen"/>
		<tiles:put name="page_header" type="String">
			&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
	<bean:message bundle="hindi" key= "7022"/>
		</tiles:put>
		<tiles:put name="content" type="String">

	<br>
	<body onload='onload()'>
	<iframe  name='if' id="if" width="650" height="400">
	 
	</iframe>

	</body>	
		
		</tiles:put>
		 <tiles:put name="add" value="/Advertisement/add.jsp"/>
		<tiles:put name="footer" value="/common/footer.jsp"/> 
	</tiles:insert>
