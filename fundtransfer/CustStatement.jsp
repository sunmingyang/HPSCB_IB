<%@ include file="/common/Include.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%@ page import ="java.io.*"%>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>
<% 
		
	String userInfo[][]=null;
	String usrName = (String)session.getAttribute("user");
	
    if(session.getAttribute("userInfo")!=null){
	   userInfo = (String[][])session.getAttribute("userInfo");
    }

	
	String appServer = BMConfig.getProperty("CBSWEBURL") ;
	String custID=userInfo[0][8];

	response.sendRedirect(appServer+"/OtherReports.do?param=1224&appSrc=TABBANKING&custID="+custID) ; 


%>


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

