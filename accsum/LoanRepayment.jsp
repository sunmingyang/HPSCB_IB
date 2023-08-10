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

alert("heyuu")
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
var category ='<div style="overflow:auto; height:500px;"><table border="1" bordercolor="#ffffff" align="center"  cellpadding="0" cellspacing="0">' ; 
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

<style>
	.box-sec{
	-webkit-box-shadow: 0px 0px 12px -5px rgba(0,0,0,0.75);
-moz-box-shadow: 0px 0px 12px -5px rgba(0,0,0,0.75);
box-shadow: 0px 0px 12px -5px rgba(0,0,0,0.75);

}
.normalHeadText{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
		font-weight: bold;
}
</style>

<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body>
<html:form action="/accsum/acc_sum.do"><br>

<table  align="left" class="wrapperDataTable"  width="95%" cellpadding="0" cellspacing="0">
	<!-- <tr>
		<td  class="wrapperDataTableTR" align="center" > Accounts >>Loan Repayment Schedule</td>
	</tr> -->

	<div class="container text-center">
		<h2 class="wrapperDataTableTR  badge bg-primary p-2 fs-6 ">Loan Repayment Schedule</h2>
	</div>
	<tr >
	<td>
	<!-- <table   border="0" bordercolor="red" align="center" cellspacing="5" cellpadding="0">
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
</table> -->

<div class="container d-flex justify-content-center ">
	<div class="row justify-content-center row align-items-center box-sec  mt-5 p-4 " style="width: 100%; margin-left: 30px;">
	  <div class="col-md-2">
		<label class="normalHeadText"><bean:message bundle='hindi' key='1027'/></label>
	  </div>
	  
	  <div class="col-md-6">
		<select name="accNo" id="accNo"  class="form-select">
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
	  </div>
	  <div class="col-md-4 text-center ">
		<!-- <input type="button" onClick="FdFunction(document.getElementById('sAccnum').value);" value="Your Button Text" /> -->
		<!-- <button type="button" onclick="FdFunction(document.getElementById('sAccnum').value);" class="btn btn-primary">Your Button Text</button> -->
		<input type="button" class="btn btn-primary " onClick="loanDetail();" value="<bean:message bundle='<%=lang %>' key='3627'/>" />

	  </div>
	</div>
  </div>
 <div class="panel-body" id="category"> </div>
						</div>


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
