<%@ include file="/common/Include.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%@ page import= "java.awt.*"%>
<%@ page import= "java.awt.event.*"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>
<% 
	ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
		myList = (ArrayList<String>)session.getAttribute("resStr");
	}
	
String userInfo[][]=null;
String trnData[][]=null;
String accData[][]=null;
String usrName="";
    if(session.getAttribute("userInfo")!=null){
	   userInfo = (String[][])session.getAttribute("userInfo");
       //session.removeAttribute("userInfo");
    }
		String b_name= cprContextObj.getSbankename();

	// like 0-accno,1-brcode,2-brnstatus,3-appserver
//	System.out.println("LENGTH OF USERINFO is : "+userInfo.length);
//	l = userInfo.length;
//	java.sql.Date dt=new java.sql.Date(106,11,22);
//	Date curdate=new Date();
//	String strdate=DateTimeFunction.dateToStrFmt(curdate,"dd/mm/yyyy");


if(session.getAttribute("trnData") != null){
		trnData = (String[][])session.getAttribute("trnData");
			System.out.println("LENGTH OF trnData is111111 : "+trnData.length);
		session.removeAttribute("trnData");
    }


if(session.getAttribute("accData") != null){
		accData = (String[][])session.getAttribute("accData");
		System.out.println("LENGTH OF trnData is : "+accData.length);
		session.removeAttribute("accData");
    }
	

	if(session.getAttribute("user") != null){
		usrName = (String)session.getAttribute("user");
         //session.removeAttribute("user");
    }

	
%>





<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Accounts"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu" value="/common/user_left.jsp"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>

<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=transactionReport&src=acc"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp; </tiles:put>
<script language="JavaScript">


</script>
<html>
<body onload="showData()"> 
<!-- <body > -->
<!-- <html:form action="/accsum/acc_sum.do" > -->
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr >
		<td class="wrapperDataTableTR" align="center">
					Accounts >> Report With Echeque No.</td>
	</tr>
	<tr>
		<td align="center">

<table width="90%" border="0" bordercolor="red" align="center" cellspacing="5" cellpadding="0">
<tr><td align="left" class="normalHeadText" width="40%">
						Echeque No.
					</td>
					<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
					<td><input type="text" id="echqNo">
				</td></tr>					
		

	<tr><td align="left" class="normalHeadText" width="40%">
						Type of Statement
					</td>
					<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
					<td>	<select id="statusType">
						<option value="O">--------select---------</option>
						<option value="screen">Display On Screen</option>
						<option value="pdf">PDF</option>
						<option value="excal">Excel</option>
						</select>
				</td></tr>					
		

		

		<!--  <table id ="status" style="MARGIN-LEFT: 25%;"> -->
		
			<!-- 	</table> -->
		
	
		
				</table><br>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
				 	<input type="button" onclick="Trn_statment()" value="<bean:message bundle='<%=lang %>' key='3627'/>"> 
<!-- <hr color="#CFEDFF"> -->

				</td>
			</tr>
			
	</table>


	</table>


<%if(accData != null){
if(accData[0][1].equalsIgnoreCase("dataNOt")){%>	
<table bordercolor="" Id="trnData" align="center" width="50%" style="background-color:#EAF8FF; margin-left:485px; margin-top:-100px;">

	<TR> 
	<TD style="width: 50;height:25px;font-size: 14;font-family: serif;" class="normalHeadText" >
							Echeque No. </TD>
	<TD style="width: 100;height:25px;font-size: 14;font-family: serif;">
							<%=accData[0][0]%></TD>
    </tr>

<tr>		
	<TD style="width: 500;height:30px;font-size: 18;font-family: serif;" colspan="2" class="normalHeadText">
							Data Not Available For This Cheque No.   </TD>

	</tr>		
</table>


<%} else{%>

<table bordercolor="" Id="trnData" align="center" width="50%" style="background-color:#EAF8FF; margin-left:485px; margin-top:-100px;">
	<TR> 
	<TD style="width: 50;height:25px;font-size: 14;font-family: serif;"class="normalHeadText" >
								Echeque No. </TD>
	<TD style="width: 100;height:25px;font-size: 14;font-family: serif;"class="normalHeadText">
							<%=accData[0][0]%></TD>
    </tr>

</table>

			<table border="0" bordercolor="#ffffff" Id="trn" align="center" width="50%" cellspacing="0" cellpadding="0" style="margin-left:485px; margin-top:10px;" >
				<TR> 
				<TD style="width: 170;height:30px;padding-left: 5;font-size: 14;font-family: serif;" class="normalHeadText">
									Trn. Date
				</Td>
				<TD style="width: 170;height:20px;font-size: 11;font-family: serif;"><%=DateTimeFunction.sqlDateStrToStr(trnData[0][0])%></TD>
				
			
				<TD style="width: 170;height:30px;font-size: 14;font-family: serif;" class="normalHeadText">
									Beneficiary</TD>
				<TD style="width: 170;height:20px;font-size: 11;font-family: serif;"><%=trnData[0][8]%></TD>
				</TR>

				<TR> 
				<TD style="width: 170;height:30px; padding-left: 5; font-size: 14;font-family: serif;" class="normalHeadText">
									Amount</TD>
				<TD style="width: 170;height:20px;font-size: 11;font-family: serif;" ><%=trnData[0][1]%></TD>
				
				<TD style="width: 170;height:30px;font-size: 14;font-family: serif;" class="normalHeadText">
									Maker</TD>
				<TD style="width: 170;height:20px;font-size: 11;font-family: serif;"><%=trnData[0][6]%></TD>
				</TR>

				<TR> 
				<TD style="width: 170;height:30px; padding-left: 5; font-size: 14;font-family: serif;" class="normalHeadText">
									Authorizer</TD>
				<TD style="width: 170;height:20px;font-size: 11;font-family: serif;"><%=trnData[0][7]%></TD>
				</TR>
			
<%}%>
</table><%}%>
</html:form>
</body>
</html>

<script>
function Trn_statment() {

	var tables = document.getElementById('trnData');
	var trnTable = document.getElementById('trn');
	if(tables != null){
		var len = tables.rows.length;
		for (var i=len-1; i>=0;i-=1) {
				document.getElementById('trnData').deleteRow(i);
			}
	} 
	if(trnTable != null){
		var lenTrn = trnTable.rows.length;
		for (var i=lenTrn-1; i>=0;i-=1) {
				document.getElementById('trn').deleteRow(i);
			}
	} 
	var statusType =document.getElementById("statusType").value;
	var echkNo =document.getElementById("echqNo").value;

if(statusType=="O"){
alert("Please Select Any Type of Status");
	return false;
}

	document.forms[0].action= "<%=request.getContextPath()%>/accsum/acc_sum.do?action=EchequeStatus&echkNo="+echkNo+"&docType="+statusType+"&bnkName="+'<%=b_name%>';
	document.forms[0].method="post";
	document.forms[0].submit();

 
}


function showData() {
	
	
<%if(accData != null){%>
	
document.getElementById("echqNo").value='<%=accData[0][0]%>'; 

<%}%>
}



</script>


</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
<style>
.normalHeadText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		font-weight: bold;
}
.tableHeader{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #92610E;
        text-decoration: none;

}
.normalText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		
}
.dataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
		
        font-weight: bold;
        color: #092771;
        text-decoration: none;
		background-color:#BFBFBF;
		text-align:center;

}
.dataTableTD{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:center;


}
.dataInfoText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 7pt;
        font-weight: bold;
        color: brown;
        text-decoration: none;

}
</style>
