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


	String benInfo[][] = null;
	if(session.getAttribute("benInfo") != null)
	{
	benInfo = (String [][])session.getAttribute("benInfo");	
	}

	 String benNamel="",benNicl="",AccountNOl="";
	 benNamel = request.getParameter("benName");
	 benNicl = request.getParameter("benNic");
	 AccountNOl = request.getParameter("AccountNO");

	 String b_name= cprContextObj.getSbankename();
%>

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
<body style="margin:0 0 0 0;" onload="show()"><br>
			<table  width="527px">
			<tr>
			<td  class="wrapperDataTableTR" align="center" > Account Summary >> DownLoad Benificiary List </td>	
			</tr>
			</table>


			<table  width="510px">

			 <tr><td style="height:30px;padding-left: 5;font-size: 11;font-family: serif;">
				Name  	<input type="text" id="benName" style="margin-left:67px;" onchange="findBan()" value="" />
			 </td></tr>
			
			 <tr><td style="height:30px;padding-left: 6;font-size: 11;font-family: serif;">
				NicName	 <input type="text" id="benNic"  style="margin-left:50px;" onchange="findBan()" value="" />
			</td></tr>

			 <tr><td style="height:30px;padding-left: 5;font-size: 11;font-family: serif;">
				Account No. <input type="text" id="AccountNO"  style="margin-left:35px;" onchange="findBan()" value=""/>
			</td></tr>

			
			<%if(benInfo!=null){%>
			<table  width="527" class="panel-collapse collapse" >
			<tr bgcolor="gray">
			<td width="140px" style="height:20px;font-size: 14;font-family: serif;">
				Account NO. </td>
			<td width="140px" style="height:20px;font-size: 14;font-family: serif;">Nic. Name</td>	
			<td width="140px" style="height:20px;font-size: 14;font-family: serif;">Name</td>	
			<td style="height:20px;font-size: 14;font-family: serif;">Status</td>	
			</tr>

			</table>
			<div  style="overflow-x:auto;height:176PX;width:527px">
			<table  width="510px" border="5">
            <% for( int i=0; benInfo.length>i; i++){%>
			 <tr >
			<td align="left">
			<input type="text" id="sbAccnt" style="margin-left:0px;border: none;" value='<%=benInfo[i][0]%>' readonly  />
			 </td>

			 <td>    
			 <input type="text" id="sbNic"  style="margin-left:0px;border: none;" value='<%=benInfo[i][1]%>' readonly />
			</td>

			 <td>
			 <input type="text" id="sbName"  style="margin-left:0px;border: none;" value='<%=benInfo[i][2]%>' readonly />
			</td>

<%if(benInfo[i][3].equalsIgnoreCase("N")){%>
		        	
		     <td>
			 <input type="text" id="status"  style="margin-left:0px;border: none;" value="Pending" readonly />
			</td>
				<%}else{%>
				<td>
			 <input type="text" id="status"  style="margin-left:0px;border: none;" value="Confirm" readonly/>
			</td>
			 <%}%>
			
			</tr>
			<%}%>
	
              </tr>
			</table> </div>
			<%}else{%>
	<H2>You do not have any record oF Beneficiary <H2>
<%}%>
<table >
 <tr><td> Document Type
		<select style="margin-left:95px; "  id="doctype" onchange="selData(this.value)">
		<option value="O">--------select---------</option>
		<option value="pdf">PDF</option>
		<option value="Excal">EXCEL</option>
		</select>
</td></tr>					
</table>
			<table>
			<tr>
			<td>
			<input type=button value="DownLoad Beneficiary" onclick="loadData();"/>
			</td>
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

function findBan()
	{
	debugger;

	var benName = document.getElementById("benName").value;
	var benNic = document.getElementById("benNic").value;
	var AccountNO = document.getElementById("AccountNO").value;
    document.forms[0].action= "<%=request.getContextPath()%>/accsum/acc_sum.do?action=findBan&benName="+benName+"&benNic="+benNic+"&AccountNO="+AccountNO;
			document.forms[0].method="post";
			document.forms[0].submit();
	}

	
function show()
{
	debugger;
var b_Name = '<%=benNamel%>';
var b_Nic = '<%=benNicl%>';
var b_Acc = '<%=AccountNOl%>';

if(b_Name !="null"){
document.getElementById("benName").value='<%=benNamel%>';
}
if(b_Nic !="null"){
 document.getElementById("benNic").value='<%=benNicl%>';
}
if(b_Acc !="null"){
 document.getElementById("AccountNO").value='<%=AccountNOl%>';
}

}



function loadData()
{
//debugger;
var ran=parseInt(Math.random()*9999);

<%	if(session.getAttribute("benInfo") == null)	{%>
	alert("Benificiary detail not available");
	return false;
	<%}%>
	var doctype =document.getElementById("doctype").value;
if(doctype=="O"){
	alert("please select any document type");
	return false;
}




    document.forms[0].action= "<%=request.getContextPath()%>/accsum/acc_sum.do?action=downloadBen&fileType="+doctype+"&bnkName="+'<%=b_name%>'+"&ran="+ran;
			document.forms[0].method="post";
			document.forms[0].submit();

	
}


function processfav()   	{
		//	debugger;
		if (http.readyState == 4)
    	{
	      	if (http.status == 200)
	      	{
	       		var resArray=http.responseText;
	       		var jsonData = JSON.parse(resArray);
				if(jsonData=="suc")
				{
					alert("Succcessfully DownLoad Benificiary data ");
					return false;
				}
		
			}
     	}
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
