<%@ include file="/common/Include.jsp" %>
<% 
     String loanAccList="";
    String [] LoanAccListArr=null;
	if (session.getAttribute("LoanAccountlist") != null ) { 
   loanAccList=(String)session.getAttribute("LoanAccountlist");
    
	}
   LoanAccListArr =loanAccList.split(",");
	for(int i=0;i<LoanAccListArr.length;i++)
{
	System.out.println(LoanAccListArr[i]);
}
	String usrName="";
	String userInfo[][] = null;
	int j; 
	usrName = (String)session.getAttribute("user");
	userInfo = (String [][])session.getAttribute("userInfo");
%>
<script>
function loanDetail(accNo)
{
	var accountNo=document.getElementById("accNo").value;
	//alert(accountNo);
	   var ran=parseInt(Math.random()*9999);
		var url="/AccountInfoAction.do?action=loanRepaymentSchedul&accNo="+accountNo;
		http.open("POST",url,false);
		http.onreadystatechange= function (){processAccountDetail()};
		http.send(null);	
}
function processAccountDetail() {
	  if((http.readyState == 4) && (http.status == 200)){
	  var res=http.responseText;
	    jsonData= JSON.parse(res);
	    jsonData=jsonData.LoanAccount;
	   //alert(jsonData.amorName);
 var sub='<table width="60%" cellpadding="0" cellspacing="" border="0"  align="center">';
    sub+='<tr>';
	sub+='<td align="left" class="normalHeadText">';
	sub+='Name:';
    sub+='</td>';
	sub+='<td class="dataTableTD">';
	sub+=jsonData.amorName;
    sub+='</td>';
	sub+='<td align="right"  class="normalHeadText">';
	sub+='Loan Amount:';
    sub+='</td>';
	sub+='<td class="dataTableTD">';
	sub+=jsonData.amorLoanAmount;
    sub+='</td>';
	sub+='</tr>';
	sub+='<tr>';
	sub+='<td align="left"  class="normalHeadText">';
	sub+='Rate of Interest:';
    sub+='</td>';
	sub+='<td class="dataTableTD">';
	sub+=jsonData.amorroi;
    sub+='</td>';
	sub+='<td align="right"  class="normalHeadText">';
	sub+='period in Months:';
    sub+='</td>';
	sub+='<td class="dataTableTD">';
	sub+=jsonData.periodInMonth;
    sub+='</td>';
	sub+='</tr>';
    sub+='<tr >';
	sub+='<td align="left"  class="normalHeadText">';
	sub+='panel Rate:';
    sub+='</td>';
	sub+='<td class="dataTableTD">';
	sub+=jsonData.panelROI;
    sub+='</td>';
	sub+='</tr>';
	sub+='</table>';
	document.getElementById("sub").innerHTML = sub;


	  var counter;
var category ='<div style="overflow:auto; height:100px;"><table border="1" bordercolor="#ffffff" align="center"  cellpadding="0" cellspacing="0">' ; 
	category+='<tr>';
	category+='<td class="dataTableTH">S.No</td>';
	category+='<td width="110" class="dataTableTH">Inst.-Int Date</td>'; 
    category+='<td class="dataTableTH">Installment Amount</td>';
    category+='<td class="dataTableTH">Int.(Approx)</td>';
	category+='<td class="dataTableTH">Principal</td>';
	category+='<td class="dataTableTH">Outstanding Principal</td>';
    category+='<td class="dataTableTH">Inst.Amt.with Penal</td>';
	category+='</tr>';
 
					
 for (var i = 0; i < jsonData.AmortisationData.length; i++) {
        counter = jsonData.AmortisationData[i];
		 category+='<div style=" position: fixed;";><tr><td class="dataTableTD">';
		 category+=counter.srNo;
		 category+='</td>';
		 category+='<td align="right">';
		 category+=counter.instDate;
         category+='</td>'
		 category+='<td align="right">';
		 category+=counter.emiAmt;
         category+='</td>'
		 category+='<td align="right">';
		 category+=counter.intAmt;
         category+='</td>'
		 category+='<td align="right">';
		 category+=counter.principleAmt;
         category+='</td>'
		 category+='<td align="right">';
		 category+=counter.remainPrinciple;
		 category+='</td>'
		 category+='<td align="right">';
		 category+=counter.installPenalroi;
		 category+='</td></tr>';
	   }
	   }
	   
	 category+='</table></div>';
				//alert(category)
				
				document.getElementById("category").innerHTML = category;
	
     }   
</script>
<script language="JavaScript" src="/accsum/scripts/accSum.js">
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
<tiles:put name="menu" value="/common/user_left.jsp?mode=loanDetails&src=acc"/>
<tiles:put name="content" type="String">
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
<tiles:put name="page_header" type="String">
 &nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp; 

</tiles:put>
<body>
<html:form action="/accsum/acc_sum.do"><br>

<table border=1  align="left" class="wrapperDataTable" cellpadding="0" cellspacing="0">
	<tr>
		<td  class="wrapperDataTableTR" align="center" > Accounts >>Loan Repayment Schedule</td>
	</tr>
	<tr >
	<td>
	<table  width="40%" border="0" bordercolor="red" align="center" cellspacing="5" cellpadding="0">
	<tr>
		<td align="left" class="normalHeadText" width="40%">
			<bean:message bundle='hindi' key='1027'/></td>
		<td align="center" width="6%"><b>:</b></td>
		 <td align="left">
			<select name="accNo" id="accNo" >
			<option value="">--Select Acc No-</option>
				<%	if(LoanAccListArr != null) 
						{ 
							for(int i=0;i<LoanAccListArr.length;i++)
							{%>
						<option value="<%=LoanAccListArr[i]%>" >
							<%=LoanAccListArr[i]%></option>	
						<%	}
						}	%>
			</select>
		</td>
		<td  align="center">
			<input type="button" onClick="loanDetail();" value="<bean:message bundle='<%=lang %>' key='3627'/>" />
         </td>
	</tr>
</table>
 <div class="panel-body" id="category"> </div>
						</div>
<br><br>

		</div>
			<div style="height: auto;">
			 <div id="shipp" class="panel-collapse collapse">
           <div class="panel-body" id="sub"> </div>
						</div>
           <div id="shipp" class="panel-collapse collapse">
          
		<div>
	
 </td>
	</tr>
		</table>
</html:form>
 </body> 
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>