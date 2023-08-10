<%@ include file="/common/Include.jsp" %>
<% 
	String  usrName="";
	String  custID="";
	String userInfo[][] = null;
	String tdsData[]= null;
	if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");
	//custID= (String)session.getAttribute("custid");
	
	userInfo = (String [][])session.getAttribute("userInfo");	
    custID=userInfo[0][8];
  // custID="9080";
    System.out.println("custID=================="+custID);
	String brnCode=userInfo[0][1];
	java.util.Date utilDate = new java.util.Date();
	int year = utilDate.getYear() + 1900;
	  System.out.println("utilDate=================="+year);


String b_name= cprContextObj.getSbankename();

  System.out.println("bnkName=================="+b_name);



if(session.getAttribute("dataNot") != null){
	tdsData = (String[])session.getAttribute("dataNot");
	session.removeAttribute("dataNot");
}

%>
<script>
	

</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=accSummary&src=acc"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
<body style="margin:0 0 0 0;" onload="fillData()"><br>

<style>

.tdformenu1 {
    background: transparent !important;
}

 .tdformenu {
		background-color: transparent !important;
		    border: transparent !important;
	}

</style>
			<table  width="527px">
			<tr>
			<td  class="wrapperDataTableTR" align="center" >  TDS CERTIFICATE </td>	
			</tr>
			
			</table>
	<table >
				 <tr><td style ="font-size:14;font-family: serif; height :75PX" > Select Period</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<select style="margin-left:0px; "  id="docDate">
					<option value="O">--------select---------</option>
					<% for(int i = year-3;i<year;i++){%>						
					<!-- 	<option value='<%=i%>-<%=i+1%>'><%=i%>-<%=i+1%></option> -->

						<option value='<%=i%>-<%=i+1%>'><%=i%>-<%=i+1%></option> 
					<%}%> 
						</select>
				</td></tr>	
				<tr ><td></td>
				<td  >&nbsp;&nbsp;&nbsp;&nbsp;<input type=button value="Download Statement" onclick="downLoadSTMT();"style="width: 138PX; COLOR :#171c76"/></td>
				<!-- <td><input type=button value="Cancel" onclick="bacck();" /></td> -->
			</tr>
				</table>


			

		</body>

		
</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp"/>
</tiles:insert>

<script>


function fillData(){

<%if(tdsData != null){
	if(tdsData[0].equalsIgnoreCase("Not")){%>
alert("Record Not Available According To  " +'<%=tdsData[2]%>' );
<%	}}%>
	
}

function downLoadSTMT()
   	{
	
		  var selectDate = document.getElementById("docDate").value;
		  if(selectDate=="O"){
		  alert("Please Select Year");
		  return false;
		  }
		  var time =selectDate.split("-");
		  var tim =time[1].substring(2,4);
		  var selDate=time[0]+"-"+tim;

		  document.forms[0].action="<%=request.getContextPath()%>/accsum/acc_sum.do?action=downloadTdsStmt&selectDate="+selDate+"&custID="+<%=custID%>+"&bnkName="+'<%=b_name%>';
			document.forms[0].method="post";
			document.forms[0].submit();
	
	}
	
</script>


<style>
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
.dataTableTD1{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:3;
		padding-right:3;
        text-decoration: none;
		background-color:#EFEFEF;
		text-align:right;


}
</style>
