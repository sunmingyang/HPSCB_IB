	<%@ include file="/common/Include.jsp" %>
	<%@ page import="java.io.*"%>
	<%@ page import="java.util.ArrayList" %>
	<% 
         String fdAccList="" ; 
		String [] fdAccListArr= null ;
		if (session.getAttribute("fdAccountList") != null ) {
		fdAccList=(String)session.getAttribute("fdAccountList");
		System.out.println("list------------------"+fdAccList);
		}
		 fdAccListArr =fdAccList.split(",");
		for(int i=0;i<fdAccListArr.length;i++){
		//System.out.println(fdAccListArr[i]);
		}

		ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
	myList = (ArrayList<String>)session.getAttribute("resStr");
	System.out.println(myList.size());
	}
	String arr = null,curCode="",usrName="";
	String usrInfo[][] = (String[][])session.getAttribute("userInfo");
	if(session.getAttribute("user") != null)
			usrName = (String)session.getAttribute("user");
		
	%>
	<script language="JavaScript">
	function createAjax()
	{

	  if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  return new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	   return new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  return false;
	}

	function sendAjaxRequest(url)
	{
		xhr = createAjax();
		xhr.open('POST',url,false);
		xhr.onreadystatechange=myResponseHandler ;
		xhr.send();
	}
	function myResponseHandler()
	{
	  if (xhr.readyState==4 && xhr.status==200)
	  {
		  document.getElementById("body").innerHTML=xhr.responseText;
	  }
	}

	function FdFunction(accNo)
	{  

		var ran=parseInt(Math.random()*9999);
		var URL="/AccountInfoAction.do?action=fetchFDDetail&accNo="+accNo+"&ran="+ran;
	   http.open("POST",URL,false);
	   http.onreadystatechange= function (){processFd(accNo)};
		http.send(null);
	}
	function TDSFunction(accNo)
	{  
	  var ran=parseInt(Math.random()*9999);
	  var URL="/AccountInfoAction.do?action=fetchTdsDetail&accNo="+accNo+"&ran="+ran;
	    http.open("POST",URL,false);
	    http.onreadystatechange= function (){processTDS(accNo)};
	  http.send(null);
	}
	function processFd(accNo)
	{
	   if((http.readyState == 4) && (http.status == 200)){
			var fddata=http.responseText;
			var fdstatement;
		// alert(fddata);
			var fdcategory ='<table border="1" bordercolor="#000000 "> ' ;
			 fdcategory+='<tr>';
			 fdcategory+='<th class="weldataTableTH">Scheme Code </th>';
			 fdcategory+='<th class="weldataTableTH"> Serial No</th>';
			 fdcategory+='<th class="weldataTableTH">Series  </th>';
			 fdcategory+='<th class="weldataTableTH">No. </th>';
			 fdcategory+='<th class="weldataTableTH">Date</th>';
			 fdcategory+='<th class="weldataTableTH">Amount</th>';
			 fdcategory+='<th class="weldataTableTH"> ROI </th>';
			 fdcategory+='<th class="weldataTableTH">Y M D</th>';
			 fdcategory+='<th class="weldataTableTH">Maturity Date </th>'; 
			 fdcategory+='<th class="weldataTableTH">Maturity Amount </th>';
			 fdcategory+='<th class="weldataTableTH"> Int. Paid Amt.</th>';
			 fdcategory+='<th class="weldataTableTH">TDS </th>';
			 fdcategory+='<th class="weldataTableTH">Status  </th>';
			 fdcategory+='</tr>';
			  var json = JSON.parse(fddata);
		 
			for(var i = 0; i < json.length; i++){	
			fdstatement=json[i];
	//		 alert(fdstatement.code);
			//alert(fdDetailList[i]);
			var str=fdstatement.date;
			var res=str.substr(0,10);
			fdcategory+='<tr><td align="center">';
			fdcategory+=fdstatement.code;
			fdcategory+='</td>';
			fdcategory+='<td>';
			fdcategory+=fdstatement.strsrno;
			fdcategory+='</td>';
			fdcategory+='<td>';
			fdcategory+=fdstatement.series;
			fdcategory+='</td>';
			fdcategory+='<td >';
			fdcategory+=fdstatement.number;
			fdcategory+='</td>';
			fdcategory+='<td align="right">';
			fdcategory+=res;
			fdcategory+='</td>';
			fdcategory+='<td>';
			fdcategory+=fdstatement.amount;
			fdcategory+='</td>';
			fdcategory+='<td>';
			fdcategory+=fdstatement.fdi_int;
			fdcategory+='</td>';
			fdcategory+='<td>';
			fdcategory+=fdstatement.year;
			fdcategory+=' &nbsp';
			fdcategory+=fdstatement.month;
			fdcategory+=' &nbsp';
			fdcategory+=fdstatement.days;
			fdcategory+='</td>';
			fdcategory+='<td>';
			var str1=fdstatement.mdate;
			var res1=str1.substr(0,10); 
			fdcategory+=res1;
			fdcategory+='</td>';
			fdcategory+='<td align="right">';
			fdcategory+=fdstatement.mamount;
			fdcategory+='</td>';
			fdcategory+='<td align="right">';
			fdcategory+=fdstatement.intpaid;
			fdcategory+='</td>';
			fdcategory+='<td>';
			fdcategory+=fdstatement.tdsamt;
			fdcategory+='</td>';
			fdcategory+='<td align="center">';
			fdcategory+=fdstatement.status
			fdcategory+='</td></tr>';

		 }
		}
		document.getElementById("fdcategory").innerHTML = fdcategory;
		document.getElementById("tdsstatement").display="none";
	}

function processTDS(accNo)
 {
    if((http.readyState == 4) && (http.status == 200)){
   var tdsdata=http.responseText;
   var tdsStatement;
   var tdscategory ='<table border="1" bordercolor="#000000 "> ' ;
    tdscategory+='<tr>';
    tdscategory+='<th class="weldataTableTH"> Date</th>';
    tdscategory+='<th class="weldataTableTH"> Account No.</th>';
    tdscategory+='<th class="weldataTableTH"> FDR Series & Number </th>';
    tdscategory+='<th class="weldataTableTH"> Interest Paid </th>';
    tdscategory+='<th class="weldataTableTH"> TDS </th>';
    tdscategory+='</tr>'; 
    var json = JSON.parse(tdsdata);
   for(var i = 0; i < json.map.data[0].length; i++){ 
   tdscategory+='<tr><td align="center">';
   tdscategory+=json.map.data[0][i];
   tdscategory+='</td>';
   tdscategory+='<td>';
   tdscategory+=json.map.data[1][i];
   tdscategory+='</td>';
   tdscategory+='<td>';
   tdscategory+=json.map.data[2][i];
   tdscategory+='</td>';
   tdscategory+='<td >';
   tdscategory+=json.map.data[3][i]
   tdscategory+='</td>';
   tdscategory+='<td align="right">';
   tdscategory+=json.map.data[4][i]
   tdscategory+='</td></tr>';
   }
  }
  document.getElementById("tdscategory").innerHTML = tdscategory;
  document.getElementById("tdscategory").display="block";
  document.getElementById("statement").display="none";
 }
	</script>

	<script language="JavaScript" src="/scripts/json.js" type="text/javascript">
	</script>

	<tiles:insert page="/common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Accounts"/>
	<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
	<tiles:put name="menu" value="/common/user_left.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
	<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=acc"/>
	<tiles:put name="menu" value="/common/user_left.jsp?mode=fdDetails&src=acc"/>
	<tiles:put name="content" type="String">
	<tiles:put name="page_header" type="String">
	 &nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp; 

	</tiles:put>
	<body >

		<html:form action="/accsum/acc_sum.do"><br>


	<div>
	<table align="left"  width="95%" class="wrapperDataTable" cellpadding="0" cellspacing="0">
		<tr >
			<td class="wrapperDataTableTR" align="center">
						Accounts >>FD Account Details</td>
		</tr>
		<tr>
			<td align="center">

	<table  width="40%" border="0" bordercolor="red" align="center" cellspacing="5" cellpadding="0">
		
		<tr>
			<td align="left" class="normalHeadText" width="40%">
				<bean:message bundle='hindi' key='1027'/></td>
			<td align="center" width="6%" class="normalHeadText"><b>:</b></td>
			<td align="left">
				<select property="sAccnum" id="sAccnum" >
				<option value="">--Select Acc No-</option>
					<%	if(fdAccListArr != null) 
							{ 
								for(int i=0;i<fdAccListArr.length;i++)
								{%>
							<option value="<%=fdAccListArr[i]%>" >
								<%=fdAccListArr[i]%></option>	
							<%	}
							}	%>
				</select>
			</td>
			<td colspan="3" align="center">
					<input type="button" onClick="FdFunction(document.getElementById('sAccnum').value);" value="<bean:message bundle='<%=lang %>' key='3627'/>" />
		    </td>
			<td colspan="3" align="center">
   				  <input type="button" onClick="TDSFunction(document.getElementById('sAccnum').value);" value="<bean:message bundle='<%=lang %>' key='1439'/>" />
   			</td> 
			
		</tr>

		<br><br>
		 
				</table>
				</div>
		
				<div style="height: auto;">
			   <div id="shipp" class="panel-collapse collapse">
			   <div class="panel-body" id="fdcategory"> </div>
							</div>
							
			  </div>
			  <div id="tdsstatement" style="height: auto;display:block;">
       			<div id="shipp" class="panel-collapse collapse" style="display:block;">
     			<div class="panel-body" id="tdscategory"> </div>
       
     		    </div>
    		  </div>
    
						
		</div>
				</td>
				</tr>
		</table>
		
		</div>

	</html:form>
	 </body> 
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
	</tiles:insert>
	<style>
	.weldataTableTH{
			font-family: Verdana, Arial, Helvetica, sans-serif;
			font-size: 8pt;
			height: 20;
			font-weight: bold;
			color: #EBD172;
			text-decoration: none;
			background-color: #686868;

	}
	}

	</style>