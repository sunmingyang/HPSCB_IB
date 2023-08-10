<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<%String usrName = (String)session.getAttribute("user");
String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
String accountNo=usrInfo[0][0];
String appServer = BMConfig.getProperty("CBSWEBURL") ;
String isLmk=(String)session.getAttribute("vleLogin");
%>
<script>

function onload()
{ 
	<% if(session.getAttribute("mobileNo")!=null){%>
		var msg='<%=session.getAttribute("mobileNo")%>';
		
		confirm("OTP send to mobile:   ******"+msg.substring(6));
		document.getElementById('if').src="<%=appServer%>/assetMaster.do?action=getSupplierItem&menu=feeCollection&param=26076&"+
		"accountNo=<%=accountNo%>&mode=IB&mobileNo="+msg+"&source=tabBanking&custID=ACC&custRole=C&isLMK=<%=isLmk%>";
		<%
		session.removeAttribute("mobileNo");
		}%>

}
</script>
<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Fee Collection"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=recharge_billPayment&mode=feeCollect"/>
 	<tiles:put name="menu" value="/common/user_left.jsp?src=recharge_billPayment&mode=feeCollect"/>
 	<tiles:put name="page_header" type="String">
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
<bean:message bundle="hindi" key= "7022"/>
	</tiles:put>
	<tiles:put name="content" type="String">

<br>
<body onload='onload()'>
<iframe  name='if' id="if" width="100%" height="400">
 
</iframe>

</body>	
	
	</tiles:put>
	 <tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/> 
</tiles:insert>
