		<%@ include file="/common/Include.jsp" %>
		<link rel = "stylesheet" href="/styles/table.css"  type = "text/css"/>  
		<script language="JavaScript" src="/scripts/MD5.js"></script>   
		<script language="JavaScript" src="fundtransfer/scripts/corpbank_authorization.js"></script>   
		<%@ page import="java.lang.String" %>
		<%
		 int i=0;
         int j = 0;
		 int errorcount=0;
			String usrName = "";
			String fundinfo[][] = (String[][])session.getAttribute("excelData"); 
		//	session.removeAttribute("excelData");
			String acsData[][] = null;
String acs_name="";

if(session.getAttribute("acslist")!=null)
{ /// dont remove. This will give list of all users for corporate id 
acsData = (String[][])session.getAttribute("acslist");
System.out.println("ACS List Lenght -->" +acsData[0].length); 
}
String custRole=(String)session.getAttribute("custRole");
String userid=(String)session.getAttribute("userid");
String openFor = "",sMode = "";
	if(request.getParameter("openFor")!=null){
    openFor=(String)request.getParameter("openFor");
	System.out.println("openFor----------------"+openFor);
            }
	if(request.getParameter("sMode")!=null){
    sMode=(String)request.getParameter("sMode");
	System.out.println("sMode----------------"+sMode); 
            }

	String accountList="" ; 
		String [] AccListArr= null ; 
if (session.getAttribute("allAccountlist") != null ) { 
	   accountList=(String)session.getAttribute("allAccountlist");
	   System.out.println("FundAccountList----------------"+accountList);
	   AccListArr =accountList.split(",");
	}
		%>


		<script language="JavaScript" >	
	    var myJsonString,mytotalJsonString,tdr ;
   
// alert("sTranMode"+sTranMode);
var custrole='<%=custRole%>';
var jspOpenFor = '<%=openFor%>'; // A--> authorization ,then, disable some fiels 
var sMode=''; // operation / CIBAuth 

	</script>

		<tiles:insert page="/common/siteLayout.jsp" flush="true">
		<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
		<!-- <html:form action="/jsp/login.do"> -->
		<tiles:put name="header" value="/common/header.jsp"/>
		<tiles:put name="line" value="/common/line.html"/>
		<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=corporatebanking"/>
		<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
		<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
		<tiles:put name="content" type="String">
		<tiles:put name="page_header" type="String"> 
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
		</tiles:put>

	<html:form action="/BulkAccountFundTransferAction.do?action=autheriseBulkAmountTransfer" >
<body>
	 <div>
  	  	<center>		
		<p class = "tableHeader" id = "authlabel" align="center"></p>
		</center>
					<script>
					debugger;
					if(jspOpenFor==='A'){ 
				   	document.getElementById("authlabel").innerHTML='<u style="color: blue;"> <B>Authorise Excel  Data</B></u>';
					} else
					{
						document.getElementById("authlabel").innerHTML = '<u style="color: blue;"> <B>Manage Bulk Transfer Data</B></u>'; 
					} 
					
					</script>
					</div>
	<table id = "accDiv">
	<tr>
           	<td align="center"></br>
		 <B>    Account No.</B></td>
				<td></br>
				<select name="account"  list="AccountNoList" listkey="custId" listValue="accountNo" style="width:200; background-color:#EFEFEF;" id="accList"  readonly  tabindex="-1" >
				<% 
				if (AccListArr != null)
				for(int ii=0;ii<AccListArr.length;ii++){%>
				<option value='<%=AccListArr[ii]%>'><%=AccListArr[ii]%></option>
					<%}%>
					</select> 
				</td>
				<tr>
				<td align="center">   
				</td> 
				</tr></table>

				<script>
if(jspOpenFor === 'A')
{
document.getElementById("accDiv").style.display = "none";
}
				</script>
<div style="height:150px;overflow:auto">
	<table border="2" bordercolor="#ffffff" align="center" width="100%" cellpadding="0" cellspacing="0" id="table">
				<TR> 
				<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "357"/></TD>  
				<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "1710"/></TD>  
					<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "1027"/></TD>
					<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "9"/></TD>
					<TD class="dataTableTH" >
						<bean:message bundle="<%= lang %>" key="7453"/></TD>
					<TD class="dataTableTH">
				<bean:message bundle="<%= lang %>" key="7409"/></TD>
						<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "345"/></TD>
						<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "1013"/></TD>
						<TD class="dataTableTH">Remitance Account</TD>
						<TD class="dataTableTH">
						<bean:message bundle="hindi" key= "216"/></TD>
				</TR>
				<tbody  class="scrolling" style="max-height:20px;">
			<%
				if(fundinfo!=null)
				{
			for(i=0;i<fundinfo.length;i++)
			{
					%>
				<td class = "dataTableTD"> 
				<% if(sMode.equals("CIBAuth")){
					if(userid.equals(fundinfo[i][6])) {%>
								<input  name="sOut_req" type="checkbox" id="checkbox<%=i%>" value="screen"  name="1" disabled > 
								<%} else {%>
								<input  name="sOut_req" type="checkbox" id="checkbox<%=i%>" value="screen"  name="1" onclick="goPlaceOrder(this)">
								<%} }%>
							
					<% if(sMode.equals("CIBEdit")){
					if(userid.equals(fundinfo[i][6])) {%>
								<input  name="sOut_req" type="checkbox" id="checkbox<%=i%>" value="screen"  name="1"  onclick="goPlaceOrder(this)" > 
								<%} else {%>
								<input  name="sOut_req" type="checkbox" id="checkbox<%=i%>" value="screen"  name="1" disabled>
								<%} }%>
					</td>
			        <td class="dataTableTD" id="text<%=i%>"><%=i+1%></td>
					<td class="dataTableTD"><%=String.valueOf(fundinfo[i][0])%></td>  
					<td class="dataTableTD"><%=String.valueOf(fundinfo[i][1])%></td>
					<td class="dataTableTD"><%=String.valueOf(fundinfo[i][2])%></td>        
					<td class="dataTableTD"><%=String.valueOf(fundinfo[i][3])%></td>
					<td class="dataTableTD"><%=String.valueOf(fundinfo[i][4])%></td>
					<td class="dataTableTD"><%=String.valueOf(fundinfo[i][6])%></td> <!--Maker Id-->
					<td style="display:none"><%=String.valueOf(fundinfo[i][5])%></td> <!--BLKTRD-->
	                <td class="dataTableTD"><%=String.valueOf(fundinfo[i][7])%></td> <!--Remit Acc-->  
					<td style="dataTableTD">
					<% if(sMode.equals("CIBAuth")){
					if(userid.equals(fundinfo[i][6])) {%>
					<img src="images/editButton.png" alt="Edit" disabled/>
						<%} else {%>
							<img src="images/editButton.png" alt="Edit" onclick = "editform(this);"/>
							<%} }%>

						<% if(sMode.equals("CIBEdit")){
					if(userid.equals(fundinfo[i][6])) {%>
					<img src="images/editButton.png" alt="Edit" onclick = "editform(this);" />
						<%} else {%>
							<img src="images/editButton.png" alt="Edit" disabled/>
							<%} }%>
					</td>   
					</tr> 
			<%}%>
</br>

</table>
</div> 
</br> 

			<%}else{%> <div id="table_message" style="display:none;color:red;font-weight:bold;font-size:15px;">
		Error ! No Data First Upload Xls File by clicking Upload Bulk Transfer Data 
		</div>
		    <%}%>


<!--EDit tble -->
<table border="2" bordercolor="#ffffff" align="center" cellpadding="0" cellspacing="0" id="edittable"  style="display:none; margin-left: 340px;">
	<tr class="dataTableTH" ><td colspan = "2"><bean:message bundle="hindi" key= "2075"/></td></tr>
	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "1027"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtaccno" ></TD> <!--Name-->
   <tr>
   
	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "9"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtname" ></TD> <!--Name-->
   <tr>

   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7453"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtifcs" ></TD> <!--Name-->
   <tr>
   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7409"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtamnt" ></TD> <!--Name-->
   <tr>

   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "345"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtremark" ></TD> <!--Name-->
   <tr>
     
	 <input type = "hidden" id = "edtblktrd" >
	<tr>
	<TD class="dataTableTH" colspan = "2" ><input type = "button" class = "button" id = "editbtn"  value = "Edit" onclick = "editInfo('<%=sMode%>');">
	<input type = "button" class = "button"  value = "Back" onclick = "editinfoback('<%=sMode%>');">
	</TD>
	</tr> 
   
</table>
<!--EDit tble -->

<div align="center">
<table id = "btntable"  align="center" style = "margin-left: 340px;"> 
<tr><td>
	
	 
Enter Transaction Password: <input type ="password" name="txnpass" id="txnpass" value = ''/ ></td></tr>


	<tr>
	<td >
	<input type="button" class = "Button" id = "authorize" value="Authorize" onClick = "saveinfo('');">
	<input type="button"  class="Button" value="Reject Entry" id = "reject" onclick="rejectEntry();" />
	<input type = "button" class = "button"  value = "Cancel" id = "back" onclick = "gotohome();">
   </td>
	 </tr>
		</table> </div>	
		<div id = "cbrespdiv" style="height:80px;overflow:auto">
</div>
		</html:form>  
		</body>

<!--</tiles:put>-->
		<!--</html:form>-->
		</tiles:insert>


		<script type="text/javascript">

					<%if(session.getAttribute("error")!=null) {
						String result=(String)session.getAttribute("error");
						session.removeAttribute("error");
						if(result.equalsIgnoreCase("success")){%>
								alert('<bean:message bundle ="<%=lang%>" key="7455"/>');
							<%}
							else 
							{%>
							alert('<bean:message bundle ="<%=lang%>" key="7456"/>');
							<%}}%>

						</script>


			 
