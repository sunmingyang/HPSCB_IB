<%@ include file="/common/Include.jsp" %>

<html>
  <head>
	<title>
	  <tiles:getAsString name="title" ignore="true"/>
	</title>
	<script language="JavaScript" src="/scripts/common.js" type="text/javascript"></script> 
	
	<%@ page import="javax.servlet.*"%>
  </head>
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" onkeyDown="StopKeyHandler()">
	<table width="60%" border="0" cellpading="0" cellspacing="0" height="100%">
	  <tr>
	    <td colspan="3" height="20%">
		  
		  <tiles:insert attribute="header" ignore="true" />
		</td>
		</tr>
		<tr>
		<td colspan="3" height="2%">
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 >  
		<tr>
			  
          <td colspan="3"  bgcolor="#EBDADC" align="center"> <font color=brown> 
          <B> <tiles:insert attribute="page_header" ignore="true" /> </B> </font></td>
          </tr>
		 </TABLE>
		 </td>
		</tr>
	<tr>
	<td colspan="3"></td>
  </tr>
	<tr>
	<td valign="top" align="center" height="70%" >
	<tiles:insert attribute="content" ignore="true"/>
	</td>
	</tr>
	<tr>
		<td colspan="4" align="right" >
			<tiles:insert attribute="footer" ignore="true"/>
		</td>
	 </tr>
	</table>
	</body>
	</html>
