<%@ include file="/common/Include.jsp" %>
<% 
	String Arr= null, usrName="";
	String  custID="";
	String userInfo[][] = null;
	int j; 
	usrName = (String)session.getAttribute("user");
	custID= (String)session.getAttribute("custid");
	userInfo = (String [][])session.getAttribute("userInfo");
	
	String brnCode=userInfo[0][1];
//out.writeln(""+request.setAttribute("brnCode",brnCode));
	
	String loginTime = (String)request.getAttribute("lastLoginTime");
    String totallogin = (String)request.getAttribute("totallogin");
%>
<script>
var http=null
function savingAjax(){
	    var ran=parseInt(Math.random()*9999);
        var URL ="/AccountInfoAction.do?action=fetchCustomerAccounts&custID="+<%=userInfo[0][8]%>+"&ran="+ran; 
	    http.open("POST",URL,false);
		http.onreadystatechange= function (){processAccount()};
		http.send(null);
}
function processAccount()
{
	if((http.readyState == 4) && (http.status == 200)){
		var resArray=http.responseText;
	//alert(resArray);
		var counter;
		var category ='<div overflow:auto;min-height:100px;><table border="1" bordercolor="#ffffff" align="center"  width=200 cellpadding="0" cellspacing="0" id="table" >' ;	
     category+='<tr>';
	 category+='<td width="110" class="dataTableTH"><bean:message bundle="hindi" key= "89"/></td>'; 
	 category+='<td width="120" class="dataTableTH"> <bean:message bundle="hindi" key= "1027"/></td>';
	 category+='<td class="dataTableTH"> <bean:message bundle="hindi" key= "717"/></td>';
	 category+='<td class="dataTableTH"><bean:message bundle="hindi" key= "718"/></td>';
	 category+='<td class="dataTableTH"><bean:message bundle="hindi" key= "1180"/></td>';
	 category+='<td class="dataTableTH"><bean:message bundle="hindi" key= "217"/></td>';
	 category+='<td class="dataTableTH">Select</td>';
	 category+='</tr>';
	   var jsonData = JSON.parse(resArray);
       for (var i = 0; i < jsonData.accountInformation.length; i++) {
        counter = jsonData.accountInformation[i];
		  //  alert(counter.customerName);
		category+='<tr><td class="dataTableTD">';
		category+=counter.customerName;
        category+='</td>'
		category+='<td class="dataTableTD1">';
		category+=counter.accountNo;
		category+='</td>';
		category+='<td class="dataTableTD1">';
		category+=counter.clearBalance;
		category+='</td>';
		category+='<td class="dataTableTD1">';
		category+=counter.underClgBalance;
		category+='</td>';
		category+='<td class="dataTableTD">';
		category+=counter.actEname;
		category+='</td>';
		category+='<td class="dataTableTD">';
		category+='Rupees';
		category+='</td>';
		category+='<td class="dataTableTD">';
  		if(counter.accountType=="F"){
  			category+='<input type=button value="Detail" id="fddetail" onclick="getdetail(this)" >';
  		}
  		category+='</td></tr>';
  
		
	   }
	   }
	 category+='</table></div>';
				document.getElementById("category").innerHTML = category;
	
     }  
	function getdetail(ptaddr){
		var pttable=document.getElementById("table");
		var s=ptaddr.parentNode.parentNode;
		var t=s.rowIndex;
		var ptRowCount=pttable.rows.length;
		var accountNO = pttable.rows[t].childNodes[1].innerHTML;
		window.open("FdDetail.jsp?accountNO="+accountNO,"_self");
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
<body onkeyDown="StopKeyHandler()" onload="savingAjax()">

	<br><br>
	
	<table align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr  >
		<td  class="wrapperDataTableTR" align="center" > Accounts >> Account Summary</td>
		
	</tr>
	<tr >
		<td >
			<table>
				<tr>
					<td>
						
          
         			  <div class="panel-body" id="category"> </div>
						
					</td>
				</tr>
				
			
			</table>
		-
			<br>
						
		<!--<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    "  type="button" tabindex="5" style="width:100px"
	onclick="helpopen()"/>-->
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


<style>
.dataTableTH{
		font-family: Verdana, Arial, Helvetica, sans-;
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
