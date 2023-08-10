<%@ include file="/common/Include.jsp" %>
<% 
	String  usrName="";
	String  custID="";
	String userInfo[][] = null;
	if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");
	custID= (String)session.getAttribute("custid");
	userInfo = (String [][])session.getAttribute("userInfo");	
	String brnCode=userInfo[0][1];

%>
<script>
function branchName()
   	{	
	var brnCode =document.getElementById("brnCode").value;
if(brnCode ==""){
alert("Please enter Brn Code");
document.getElementById("brnCode").focus();
return false;
}
debugger;
    	var ran=parseInt(Math.random()*9999);
        var URL ="/AccountInfoAction.do?action=fetchBranchName&brnCode="+brnCode+"&ran="+ran;
     	http.open("POST",URL,false);
  		http.onreadystatechange= function (){processBranch()};
  		http.send(null);
   	}
	function processBranch()
   	{	
    	if (http.readyState == 4)
     	{
	      	if (http.status == 200)
	      	{
	       		var resArray=http.responseText;
	       		var jsonData = JSON.parse(resArray);
				var branchCode = jsonData;
				if((branchCode !="")&&(branchCode != null)){
	       		document.getElementById("brnName").value=branchCode ;
				}else
					{
				alert("Branch Name not find");
				document.getElementById("brnName").value = "";
      			document.getElementById("brnCode").value = "";
				document.getElementById("brnCode").focus();
				return false;
				}
	      	}
     	}
  	}

	

	function newbrn()
   	{

    	document.getElementById("brnName").value = "";
      	document.getElementById("brnCode").value = "";
	    document.getElementById("brnCode").focus();
   	}
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
<body style="margin:0 0 0 0;" onload="getResponse(),forOtp()"><br>

		<table align="left" class="wrapperDataTable" width="95%" cellpadding="0" cellspacing="0">
			<tr>
			<td  class="wrapperDataTableTR" align="center" > account summary >> Branch Name </td>
				
			</tr>
			<tr>
			<td align="center">
			<table width=527>
				<tr>
			    <td align="center" style="font-size: 12;font-family: serif;"class="normalHeadText">
				Brn Code <input type=text id="brnCode" style="margin-left:99px;"/>
				</td>
				<td>
				<input type=button value="search" onclick="branchName();"/>
				</td>
				</tr>

                <tr>
               	<td align="center"  style="font-size: 12;font-family: serif;"class="normalHeadText">
				Branch Name <input type=text id="brnName" style="margin-left:76px;" maxlength="5" readonly/>
				</td>
				</tr>
				<tr>
				<td align="center">
				</table>
				<table>
				<tr><td>
				<input type=button value="newSearch" onclick="newbrn();"/>
				</td></tr></table>
				</table>	
				
		</body>
		
</tiles:put>
</html:form>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp"/>
</tiles:insert>


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
