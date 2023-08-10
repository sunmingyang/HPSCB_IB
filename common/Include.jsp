<%@ page language ="java" contentType = "text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%@ page import ="javax.servlet.http.HttpSession" %>
<%@ page import="easycbs.bancmateib.common.parameter.LoginParameter"%>
<%@ page import="easycbs.bancmateib.common.parameter.BancmateibParameter"%>
<%@ page import="easycbs.bancmateib.login.dto.LoginFormDTO"%>
<%@ page import="easycbs.bancmateib.login.actionform.LoginForm"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
<!-- <link href="/styles/styleBlue.css" rel="stylesheet" type="text/css">  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<% String stmtInputBackColor = "#CFEDFF";%>
<% java.sql.Date bancDate=null;%>
<% String lang="hindi";%>
<% String errorLang ="hindierror";%>
<% String errorColor = "red" ;%>
<% String branchCode="1000";%>
<%BancmateibParameter cprContextObj =null;%>
<%
	Date sysdate=new Date();
	String systemDate=DateTimeFunction.dateToStrFmt(sysdate,"dd/mm/yyyy");
	
	LoginParameter loginSessionObj=null;
	cprContextObj=(BancmateibParameter)config.getServletContext().getAttribute("CommonParameter");
	String cprlockopen=cprContextObj.getIsLockOpenAuto();
	String cprlockDayDiff=cprContextObj.getIsLockOpenDayDiff();
	System.out.println("is autounlock "+cprlockopen);
	System.out.println("is cprlockDayDiff "+cprlockDayDiff);
	%>
	
	<% String brnType="H";/* Retail Lending it would be added Later*/%>
	<%String headColor="#003399";%>
	<%String headerColor="#6699FF";%>
	<%String warnColor="#7799FF";%>
	<script>
window.history.forward(1);  


	</script>
<script language="JavaScript" src="/scripts/common.js"></script>
<script language="JavaScript" src="/scripts/Conversion.js"></script>
<script language="JavaScript" src="/scripts/json.js"></script>
<script language=JavaScript src="/scripts/ScrollableTable.js"></script>
<script language=JavaScript src="/scripts/Calendar.js"></script>
<script language=JavaScript src="/scripts/autoMask.js"></script><!-- New added on 17/07/2008 by ajay -->
<!-- Latest compiled and minified CSS -->

<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/BTScss/httpmaxcdn.bootstrapcdn.combootstrap3.3.4cssbootstrap.min.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/Bootstrap5/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/styles/commonUse.css">

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="<%=request.getContextPath()%>/BTSjs/httpsajax.googleapis.comajaxlibsjquery1.11.1jquery.min.js"></script> -->
<!-- <script src="<%=request.getContextPath()%>/BTSjs/httpmaxcdn.bootstrapcdn.combootstrap3.3.4jsbootstrap.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> -->
<script src="<%=request.getContextPath()%>/Bootstrap5/bootstrap.min.js"></script>
<!-- <script src="<%=request.getContextPath()%>/BTSjs/httpajax.googleapis.comajaxlibsjquery1.11.2jquery.min.js"></script> -->


<script>
//disableRightClick();
</script>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>	
