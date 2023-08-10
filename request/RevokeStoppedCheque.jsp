<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.io.*" %>

<%
	ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
		myList = (ArrayList<String>)session.getAttribute("resStr");
	}

	int len = 0;
	String arr = null,curCode="",usrName="";
	Date todate = new Date(); 
	String strdate = todate.toString();
	System.out.println("date is----------------"+strdate);
	String nstrdate = strdate.substring(0,19);
	String nstrdate1 = strdate.substring(24,28);
	String data[] = (String[])session.getAttribute("accDetail");
	session.removeAttribute("accDetail");
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");	//	0-accNo,1-brnCode,2-brnStatus,3-appserver
	String[] acc_nums = null;
	String[] acc_curr = null;
	if(session.getAttribute("currency") != null)
		curCode = (String)session.getAttribute("currency");
	if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
	if(usrInfo != null)
	{
		System.out.println("ACC NO is : "+usrInfo[0][0]);
		len = usrInfo.length;
	}
	else{
		System.out.println("ACC NO is null : ");
	}
%>
<script>
function saveData()
	{ 	
			var accNoo=document.getElementById("sAccnum").value;
			var chqno=document.getElementById("cheqno").value;
			var obj=  {"accno" :accNoo ,"chqno" :chqno};
			var jsonStr = JSON.stringify(obj);
			alert(jsonStr);
			var url="/AccountInfoAction.do?action=revokeStoppedCheque&JSONString="+jsonStr;
			http.open("POST",url,false);
			http.onreadystatechange= function (){ message(http) };	
			http.send(null);
	}
function  message(http){
    if(http.readyState==4 && http.status==200){
	      var res=http.responseText;
		  alert(res);
		  document.getElementById("cheqno").value="";
	      
	      //window.location.href="";
    	}
   	}

</script>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
<script language="JavaScript\" src="/scripts/common.js\"></script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Account summary"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=accDetails&src=acc"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp; </tiles:put>
<body>
<br>
<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr >
		<td class="wrapperDataTableTR" align="center">
					Accounts >> Account Details</td>
	</tr>
	<tr>
		<td align="center"><br>
						
					<html:form action="/accsum/acc_sum.do">
					<table align="center">
					<tr>
							<td class="normalHeadText">
								Account No&nbsp;&nbsp;:&nbsp;
							</td>
							<td>
							<Select property="sAccnum" id="sAccnum" onchange="fillaccno()" >
							<%	if(myList.size() != 0) 
							{ 
								String accNo="";
								for(int i=0; i<myList.size(); i++)
								{
										accNo = myList.get(i);
									%>
								<option value="<%=accNo%>" >
								<%=myList.get(i)%></option>	
								<%	}
							}	%>
							</Select>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
						     <td class="normalHeadText">
								Cheque No&nbsp;&nbsp;&nbsp;:&nbsp;
							 </td>
							 <td>
							 <input type="text" property="cheqno" size="15" maxlength="8" id="cheqno" />
							 </td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td></td>
							<td>
							<input type="button" value="Submit" onclick="saveData()">
							</td>
						</tr>
					</table>
			</td>
		</tr>
	</table>
</html:form>
</body>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>



<style>
.dataInfoText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 7pt;
        font-weight: bold;
        color: brown;
        text-decoration: none;

}
.tableHeader{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #92610E;
        text-decoration: none;

}
.normalHeadText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		font-weight: bold;
}
.normalText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;

}

.dataTableInfoTH{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:5;
		padding-right:3;
		font-weight: bold;
     /*   color: #092771; */
		color:white;
        text-decoration: none;
		background-color:#3892FE;
		text-align:center;

}
.dataTableInfoTD{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:5;
		padding-right:3;
        text-decoration: none;
		background-color:#DDEFFD;
		text-align:left;


}
.dataTableInfoTDAlt{
	font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		padding-left:5;
		padding-right:3;
        text-decoration: none;
		background-color:white;
		text-align:left;
}
</style>