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
			System.out.println("LENGTH OF trnData is : "+trnData.length);
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
					Accounts >> TransAction Report</td>
	</tr>
	<tr>
		<td align="center">

<table width="90%" border="0" bordercolor="red" align="center" cellspacing="5" cellpadding="0">
	<tr>
		<td align="left" class="normalHeadText" width="40%">
			<bean:message bundle='hindi' key='1027'/></td>
		<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
		<td align="left" class="normalHeadText">
		<select   id="sAccnum" onchange="">
						<%	if(myList.size() != 0) 
						{ 
						String accNo = "";
						for(int i=0; i<myList.size(); i++)
						{
					//	accNo = userInfo[0][1]+"-"+myList.get(i);

						%>
		<option value="<%=myList.get(i)%>"><%=myList.get(i)%></option>
		<%	}
						}	%>
		</select>
		</td>
	</tr>
	
	<tr>
		<td align="left" class="normalHeadText" width="40%">
		<bean:message bundle='<%=lang%>' key='7096'/> </td>
		<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
		<td class="normalHeadText">
			<html:bmdate styleId="frdate" property="frdate" size="15" onkeypress="isValidDatechar()" maxlength="10"/>	
			<b>&nbsp;&nbsp;To&nbsp;:&nbsp; </b>
			<html:bmdate styleId="todate" property="todate" size="15" onkeypress="isValidDatechar()" maxlength="10"/>	
			<font color="black" size="-2">(dd/mm/yyyy)</font>
			</td>
		</tr>
		<tr>
			<td align="left" class="normalHeadText" width="40%">
				<bean:message bundle='<%=lang%>' key='7097'/>
			<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
			<td>
			
				<html:select property="sTrans" styleId="sTrans" size="1" >
					<html:option value="5"></html:option>
					<html:option value="10"></html:option>
					<html:option value="25"></html:option>
					<html:option value="50"></html:option>
					<html:option value="100"></html:option>
					<html:option value="200"></html:option>
				</html:select>
			</td>
		</tr>
		
	<tr id="invisible" style="display:none;">
			<td align="left" class="normalHeadText" width="40%">
	<bean:message bundle='<%=lang%>' key='117'/>&nbsp;:&nbsp;
				<bean:message bundle='<%=lang%>' key='7098'/></td> 
				<td align="center" class="normalHeadText" width="6%">:</td>
			<td class="normalHeadText">
				<input type="radio" name="sTran_type" id="sTran_type" value="a"/><bean:message bundle='<%=lang%>' key='7100'/>
				<input type="radio" name="sTran_type" id="sTran_type" value="d" checked="true"/><bean:message bundle='<%=lang%>' key='7101'/> 
			</td>
		</tr>
		<tr>
			<td align="center" colspan="3" ><br> 
			 <table class="miniStmtBackBorder">
					<tr class="miniStmtBack">
						<td>
							<table cellspacing="5" >
								<tr style="padding-left:30;padding-right:30;">
									<td class="tableHeader" align="center" colspan="3" >
									<br>
									<u>Select a format for statement and click on "Statement" button</u></td>
								</tr>
								<tr >
									<td width="40%">&nbsp;</td>
									<td align="left" class="normalText">
										<input type="radio" id="sOut_req1" name="sOut_req" value="screen" checked="true"><bean:message bundle='<%=lang %>' key='7102'/>
									</td>
									<td >&nbsp;</td>
								</tr>  
								
								<tr >
									<td width="40%">&nbsp;</td>
									<td align="left" class="normalText">
										<input type="radio" name="sOut_req" id="sOut_req2" value="pdf">Display in pdf File
									</td>
									<td >&nbsp;</td>
								</tr>  
								<tr >
									<td width="40%">&nbsp;</td>
									<td align="left" class="normalText">
										<input type="radio" name="sOut_req" id="sOut_req3" value="excal">Display in MS Excel File
									</td>
									<td >&nbsp;</td>
								</tr>
							</table>
	
				 
				<!--  <table id ="docType" style="MARGIN-LEFT: 25%;">
				 <tr><td> Document Type
						<select style="margin-left:95px; "  id="doctype" onchange="selData(this.value)">
						<option value="O">--------select---------</option>
						<option value="pdf">PDF</option>
						<option value="pdf">PDF</option>
						<option value="Excal">EXCEL</option>
						</select>
				</td></tr>					
				</table> -->
				 
				 
				 
				 
				 
					</td> 
					</tr>
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
if(accData[0][3].equalsIgnoreCase("dataNOt")){%>	
<table bordercolor="" Id="trnData" align="center" width="50%" style="background-color:#EAF8FF;">
	<TR> 
	<TD style="width: 50;height:25px;font-size: 14;font-family: serif;"bordercolor="" >
							Account No. </TD>
	<TD style="width: 100;height:25px;font-size: 14;font-family: serif;"bordercolor="">
							<%=accData[0][2]%></TD>

	</tr>		
	<TD style="width: 130;height:25px;font-size: 14;font-family: serif;" bordercolor="">
							Date Of Record	</TD>
	<TD style="width: 100;height:25px;font-size: 14;font-family: serif" >
							<%=accData[0][0]%> To <%=accData[0][1]%>	</TD>
	</tr>				


</tr>		
	<TD style="width: 500;height:30px;font-size: 18;font-family: serif;" colspan="2">
							Data Not Available For This Account No.   </TD>
	
	</tr>		
</table>


<%} else{%>

<table bordercolor="" Id="trnData" align="center" width="50%" style="background-color:#EAF8FF;">
	<TR> 
	<TD style="width: 50;height:25px;font-size: 14;font-family: serif;"bordercolor="" >
							Account No. </TD>
	<TD style="width: 100;height:25px;font-size: 14;font-family: serif;"bordercolor="">
							<%=accData[0][2]%></TD>

	</tr>		
	<TD style="width: 130;height:25px;font-size: 14;font-family: serif;" bordercolor="">
							Date Of Record	</TD>
	<TD style="width: 100;height:25px;font-size: 14;font-family: serif;" >
							<%=accData[0][0]%> To <%=accData[0][1]%>	</TD>
	</tr>				


</tr>	
</table>

			<table border="1" bordercolor="#ffffff" Id="trn" align="center" width="90%">
				<TR> 
				<TD style="width: 170;height:30px;padding-left: 5;font-size: 14;font-family: serif;background-color:gray;" >
									TRN. DATE</TD>
				
					<TD style="width: 170;height:30px;font-size: 14;font-family: serif;background-color:gray;">
									BENEFICIARY</TD>
					<TD style="width: 170;height:30px;font-size: 14;font-family: serif;background-color:gray;">
									AMOUNT</TD>
					<TD style="width: 150;height:30px;font-size: 14;font-family: serif;background-color:gray;" >
									TRANSACTION STATUS</TD>
						<TD style="width: 170;height:30px;font-size: 14;font-family: serif;background-color:gray;">
									MAKER</TD>
					<TD style="width: 170;height:30px;font-size: 14;font-family: serif;background-color:gray;">
									AUTHORIZER</TD>
				</TR>
			
<%if(trnData != null){
	for(int i=0;i<trnData.length;i++){%>
				<TR> 	
					<TD style="width: 170;height:20px;font-size: 11;font-family: serif;"><%=DateTimeFunction.sqlDateStrToStr(trnData[i][0])%></TD>		
					<TD style="width: 170;height:20px;font-size: 11;font-family: serif;"><%=trnData[i][8]%></TD>
					<TD style="width: 170;height:20px;font-size: 11;font-family: serif;" align ="right"><%=trnData[i][1]%></TD>
				<%if(trnData[i][2].equalsIgnoreCase("N")){%>   
					<TD style="width: 170;height:30px;padding-left: 5;font-size: 14;font-family: serif;">Pending	</TD>
				<%} else if(trnData[i][2].equalsIgnoreCase("R")){%>	
					<TD style="width: 170;height:30px;padding-left: 5;font-size: 14;font-family: serif;">Rejected		</TD>
					<%} else if(trnData[i][2].equalsIgnoreCase("D")){ %>
					<TD style="width: 170;height:30px;padding-left: 5;font-size: 14;font-family: serif;">Deleted 	</TD>

			<%} else if(trnData[i][2].equalsIgnoreCase("F")){ %>
					<TD style="width: 170;height:30px;padding-left: 5;font-size: 14;font-family: serif;">Fail    </TD>

			<%} else{ %>
					<TD style="width: 170;height:30px;padding-left: 5;font-size: 14;font-family: serif;">Confirm   </TD>
					<%}%>
					<TD style="width: 170;height:20px;font-size: 11;font-family: serif;"><%=trnData[i][6]%></TD>
					<TD style="width: 170;height:20px;font-size: 11;font-family: serif;"><%=trnData[i][7]%></TD>
				</TR>



				
<%}
}}%>
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
	var docType = "";
	if(document.getElementById("sOut_req1").checked == true){
		docType=document.getElementById("sOut_req1").value;
	}
	else if(document.getElementById("sOut_req2").checked == true){
		docType=document.getElementById("sOut_req2").value;
	}
	else if(document.getElementById("sOut_req3").checked == true){
		docType=document.getElementById("sOut_req3").value;
	}
	var trnNo =document.getElementById("sTrans").value;
	var fdate =document.getElementById("frdate").value;	
	var tdate =document.getElementById("todate").value;
	var sAccNum =document.getElementById("sAccnum").value;

	if(fdate=="") {
		alert("Please Enter From Date");
		document.getElementById("frdate").focus();	
		return false;
	}
	if(tdate=="") {
		alert("Please Enter To Date");
		document.getElementById("frdate").focus();
		return false;
	}
	document.forms[0].action= "<%=request.getContextPath()%>/accsum/acc_sum.do?action=trnRpt&trnNo="+trnNo+"&docType="+docType+"&sAccNum="+sAccNum+"&fdate="+fdate+"&tdate="+tdate+"&bnkName="+'<%=b_name%>';
	document.forms[0].method="post";
	document.forms[0].submit();
//sAccNum="000022000001";

//document.getElementById('trnData').style.display="none";
//document.getElementById('trn').style.display="none";
     
 
}


function showData() {

	
<%if(accData != null){%>


		
		

document.getElementById("frdate").value='<%=accData[0][0]%>'; 

document.getElementById("todate").value='<%=accData[0][1]%>';	


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
