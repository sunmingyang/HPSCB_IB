<%@ include file="/common/Include.jsp" %>
<%@ page import ="easycbs.bancmateib.fundtransfer.actionform.ABBFundTransForm,java.sql.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>


<script language="JavaScript" type="text/javascript" src="/scripts/Calendar.js"></script>
<script language="JavaScript" type="text/javascript" src="/scripts/abb.js"></script>
<script language="JavaScript" type="text/javascript" src="/scripts/common.js"></script>
<script language="JavaScript" type="text/javascript" src="/scripts/Amount.js"></script>
<link rel="stylesheet"  href="/styles/styles.css" text="text/css"  />

<%   
	  String[][] account=null; 	 
	  String[] connectedBranches = null;
	  String dt1 = "1900-01-01 00:00:00.000";
	  ABBFundTransForm abbFundTransform = null;
  	  String currDate = DateTimeFunction.dateToStrFmt(new java.util.Date(),"dd/mm/yyyy");      
    
	  if(session.getAttribute("sqlBranchDate") != null){
		  dt1 = (String)session.getAttribute("sqlBranchDate");   
		  if(dt1.length() > 10){
			dt1 = dt1.substring(0,10);
		  }
	  }

	  java.sql.Date dt =  new java.sql.Date(106,11,25);

	  String errorCode ="",loginBranch ="",uniqueTxnNo="";
      if(session.getAttribute("loginBranchCode") != null){
          loginBranch = (String)(session.getAttribute("loginBranchCode")); 
	  }	
	  if(session.getAttribute("abbFundTransForm") != null){
		   abbFundTransform = (ABBFundTransForm)session.getAttribute("abbFundTransForm");
		System.out.println("&&&&&&BRanch in JSP is   &&&&&&&&&&&!!!!!!!!!!"+abbFundTransform.getsToBranch());
		
	  }
	  
	  if(session.getAttribute("sBrnCodeExpLogin") != null){
		   String sBranchCodes = (String)session.getAttribute("sBrnCodeExpLogin");
		   connectedBranches = sBranchCodes.split(":");
	  }
	  
 %>
<script>

function loadAllData()
{
<%   if(abbFundTransform != null)
		{ 
		
		
		System.out.println("session null nahi haiiiiiiiiiiiiiiiiiiiii"+abbFundTransform.getsAmtInWords());
		System.out.println("Branch is::::::"+abbFundTransform.getsToBranch());

		%>
		//alert("session not null");	
	        document.getElementById("sToBranch").value = '<%=abbFundTransform.getsToBranch()%>';
			<%System.out.println("Branch is::::::"+abbFundTransform.getsToBranch());%>	
	        document.getElementById("sToBranchDesc").value = '<%=abbFundTransform.getsToBranchDesc()%>';
			<%System.out.println("Branch description::::::"+abbFundTransform.getsToBranchDesc());%>	
			document.getElementById("sAcnoTo").value = '<%=abbFundTransform.getsAcnoTo()%>';
<%System.out.println("T ACC::::::"+abbFundTransform.getsAcnoTo());%>	
			document.getElementById("sAcnoToType").value = '<%=abbFundTransform.getsAcnoToType()%>';
<%System.out.println("T ACC Type::::::"+abbFundTransform.getsAcnoToType());%>	
			document.getElementById("sAcnoToTypeDesc").value = '<%=abbFundTransform.getsAcnoToTypeDesc()%>';
<%System.out.println("T ACC Type Desc::::::"+abbFundTransform.getsAcnoToTypeDesc());%>	
			document.getElementById("sAccHolderName").value = '<%=abbFundTransform.getsAccHolderName()%>';
<%System.out.println("ACC Holder Name::::::"+abbFundTransform.getsAccHolderName());%>	
			<%System.out.println("Holder Name is::::::"+abbFundTransform.getsAccHolderName());%>
			document.getElementById("sDrCr").value = '<%=abbFundTransform.getsDrCr()%>';
<%System.out.println("DRCR::::::"+abbFundTransform.getsDrCr());%>	
            document.getElementById("sTransAmount").value = '<%=abbFundTransform.getsTransAmount()%>';
<%System.out.println("Amount::::::"+abbFundTransform.getsTransAmount());%>	
            document.getElementById("sTransAmount2").value = '<%=abbFundTransform.getsTransAmount2()%>';
			document.getElementById("sNarration").value = '<%=abbFundTransform.getsNarration()%>';
            document.getElementById("sAmtInWords").value = '<%=abbFundTransform.getsAmtInWords()%>';
			document.getElementById("sAmtInWords").style.color = 'red';
       <% }%>
  




	enableButton();
	setFocus();
}


</script>

<HTML>
<BODY onLoad="loadAllData()" >
<form action="/abbfundtransfer/fund" >	

<table border = "0" align="center" width="99%" height="12%" cellSpacing="0" cellPadding= "0" vspace="0" >
	<TR >
		<TD valign="top">
			<IMG  alt="Azizi Bank" height ="90" width = "99%" src="/images/azizi2.bmp"  border="0">			
		</td>			
 		<TD valign="bottom" align="left" bgcolor="#91203E">		  			
			<img src="/images/home.bmp" border="0">
	    </td>
   </tr>
   <TR >
		<TD valign="bottom" >
	   	  <IMG  alt="Azizi Bank" height ="20" width = "104%" src="/images/header_page.jpg"  border="0">
        </td>
		<td>&nbsp;</td>
   </tr>
</table>

 <br>

 <input type="hidden" name = "sFromBranch" id="sFromBranch"/>
 <input type="hidden" name = "sPurpose" id="sPurpose"/>
 <input type="hidden" name = "sMOP" id="sMOP" />

<center>

<table border="0"  cellpadding="0" cellspacing="0" bgcolor="#FDE4E3">                
	
	<thead>  
	   <th align="center" rowspan="2" colspan="2" >
		  <b><bean:message bundle="hindi" key='7441'/></b>
	   </th>
	  </tr>
	</thead>

	<tr>  		
		<td>
			&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='7432'/>&nbsp;&nbsp;&nbsp;
		</td>
		<td>
			<select  name="sToBranch" style="width:80" id="sToBranch" tabIndex="1">
			<% 
			   if(connectedBranches != null)
			   {
				   for(int index = 0 ; index < connectedBranches.length; index++)
				   {%>
						<option value ='<%=connectedBranches[index]%>'><%=connectedBranches[index]%></option>
				   <%}
			   }
			 %>
			</select>&nbsp;&nbsp;
			<input type="text"  name="sToBranchDesc" style="width:300" maxlength ="140" Id="sToBranchDesc"  tabindex="-1" class="" readOnly/> 
		</td>
	</tr>

	 <tr>		
		<td>
			 &nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='2394'/>
		</td>
		<td>		
			 <input type="text" tabindex="2" name="sAcnoTo" maxlength="20" style="width:150" Id="sAcnoTo" style="text-align:right" />
		</td>	
	</tr>

	<tr>		
		<td>
			&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='1573'/>
		</td>
		<td>
			   <input type="text" " name="sAcnoToType" style="width:100;text-align:left" Id="sAcnoToType" readOnly tabindex="-1"/>
			   &nbsp;&nbsp;
			   <input type="text" tabindex="-1" name="sAcnoToTypeDesc" style="width:300;text-align:left" Id="sAcnoToTypeDesc" style="text-align:right" readOnly/>
		</td>
	</tr>

	<tr>		
		<td>		&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='2741'/>
		</td>
		<td>
			<input type="text"  name="sAccHolderName" style="width:300" Id="sAccHolderName" tabindex="-1" readOnly />
		</td>	

	</tr>

	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='7434'/>
		</td>
		<td>
			<select tabindex="3" name="sDrCr" style="width:60" id="sDrCr">
						 <option value="D">Dr.</option> 
						<option value="C">Cr.</option>
			</select>
		</td>	
	</tr>	


 <tr>
	<td>
			&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key= "7433"/>			
	</td>
	<td>
			<input type ="text" name="sTransAmount2" ID="sTransAmount2" size="20" value = ".00" maxlength="10" style="text-align:right"  
			onKeyPress = "isValidAmount(event,this)"   tabIndex="4" />	
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			<input type ="text" name="sTransAmount" ID="sTransAmount" size="20" maxlength="10"  style="text-align:right" value = ".00"
			onKeyPress = "isValidAmount(event,this)" onFocus = "isAmountEmpty()"  tabIndex="5" onBlur = "matchAmount()" 
			 />	
    </td>
</tr>


<tr>
	<td>
		&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key= "378"/>
		
	</td>
	<td>
	    <input type="text" name="sNarration" id="sNarration"  maxlength="25" size="50" tabIndex="6" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
    </td>
</tr>	


<!-- <tr>
    <td>
		&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='2001'/>
     </td>
	 <td>
		<select  name="sDocType" style="width:80" id="sDocType" tabIndex="7" onBlur="disableEnableDocFields()" >
				<option value="DD">DD</option>
				<option value="CHQ">CHQ</option>
				<option value="Voucher">VOUCHER</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 		   

         <bean:message bundle="hindi" key='6718'/>&nbsp;&nbsp;
		<input type="text" name="sDocSeries" id="sDocSeries"  maxlength="6" size="12" style="text-align:right" onKeyPress="isAlphaNumeric(event)" tabIndex="8" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
		 <bean:message bundle="hindi" key='6878'/>&nbsp;&nbsp;&nbsp;
		<input type="text" name="sDocNo" id="sDocNo"  maxlength="10" size="12" style="text-align:right"	onKeyPress="isValidNumber()"
		tabIndex="9" />
  </td>
 </tr>
 -->


<tr>		
	<td nowrap colspan="2">&nbsp 
		<bean:message bundle="hindi" key='1115'/>&nbsp &nbsp 
		<input type="label" name="sAmtInWords" id="sAmtInWords" size ="100" maxlength="150" 		
			tabindex="-1" class=LabelText	 readOnly />
	</td>	    
</tr>   
</table>
<br><br>	
<center>
<table cellpadding = "20" bgcolor="#FDE4E3">
    <tr >
		<td>		
		    <input type="button" name="validate" id="validate" class="Button"  onclick="disableRestButtons('validate'),validateData('validate')" 
				value='<bean:message bundle="hindi" key="6738"/>'	style="width:100px" tabIndex="11"> 
			<input type="button" name="ok" id="ok" class="Button"  onclick="disableRestButtons('ok'),submitForm()"
				value='<bean:message bundle="hindi" key="86"/>'	style="width:100px" tabIndex="12"> 
			<input type="button" name="cancel" id="cancel" class="Button"  onclick="Back()"
				value='<bean:message bundle="hindi" key="87"/>' style="width:100px" tabIndex="13" onClick="Back()">
			<input type="button" name="signAndPhoto" id="signAndPhoto" class="Button"  onclick="disableRestButtons('signAndPhoto'),viewSignPhoto()" 
				value='<bean:message bundle="hindi" key="200"/>' style="width:100px" tabIndex="14"> 
			<input type="button" name="help"  id = "help" class="Button"  onclick="helpopen()"
				value='<bean:message bundle="hindi" key="33"/>' style="width:100px" tabIndex="15">
		</td>
	</tr>
</table>
</center>
</form>
</BODY>
</HTML>

<script>

var btnNameArr = new Array(5);
    btnNameArr[0] = "validate";
	btnNameArr[1] = "ok";
	btnNameArr[2] = "cancel";
	btnNameArr[3] = "signAndPhoto";
	btnNameArr[4] = "help";

function disableRestButtons(btnName){
	var buttonName = btnName;
	  
    for(var i = 0; i<5;i++){
		if(!(btnNameArr[i] == btnName)){
			document.getElementById(btnNameArr[i]).style.background = "#FDB5B7";     
			document.getElementById(btnNameArr[i]).disabled = true;
		}
	}
}

function enableButton(){	
    for(var i = 0; i<5;i++){		
		document.getElementById(btnNameArr[i]).style.background = "brown";     
		document.getElementById(btnNameArr[i]).enabled = true;	
		document.getElementById(btnNameArr[i]).disabled = false;
	}
}
function setFocus(){
//alert("what");

	document.getElementById("sToBranch").focus();
	//disableEnableDocFields();

}


 
function validateData(purpose)
{	
	var sTransAmount = document.getElementById("sTransAmount").value;
    var sTransAmount2 = document.getElementById("sTransAmount2").value;
	var sAcnoTo = document.getElementById("sAcnoTo").value;
    var flag = true;
	var sPurpose ="";
	
    var popup = null;
	var popupBody = null;

    if(sAcnoTo ==""){
        alert("Account Number Can't Be Blank !! ");
		flag = false;
	}

    
	if(!flag){
		 enableButton();
		return false;
	}
    sPurpose = purpose; 
    if(sPurpose == "validate"){
		

		document.getElementById("sFromBranch").value = '<%=loginBranch%>';
		document.getElementById("sMOP").value = "CS";
		document.getElementById("sPurpose").value = "validate";

document.forms[0].action="../abbfundtransfer/fund.do?action=validationABBFundTransfer";
		document.forms[0].method = "POST";
		document.forms[0].submit();
	}
	return flag;
}

function submitForm(){
	if(validateData("submitOk")){
        document.getElementById("sFromBranch").value = '<%=loginBranch%>';
		document.getElementById("sMOP").value = "CS";
		document.getElementById("sPurpose").value = "submitOk";
		

		document.forms[0].action="../abbfundtransfer/fund.do?action=performABBFundTransfer";
		document.forms[0].method = "POST";
		document.forms[0].submit();
	}
}
function viewSignPhoto(){
	var accno = document.getElementById("sAcnoTo").value;
	var brncode = document.getElementById("sToBranch").value;

	//alert("--------->>"+accno);
	//alert("--------->>"+brncode);
	var bar = "width=450,height=270,left=150,top=220,scrollbars=no";
	window.open("/signPhoto/SignPhoto.do?accno="+accno+"&brncode="+brncode,"child", bar);
	enableButton();
}

 function disableEnableDocFields(){
	var docType = document.getElementById("sDocType").value;
	if(!(docType == "CHQ")){
       document.getElementById("btnsDocDate").readOnly = true;
	}else{
		document.getElementById("btnsDocDate").readOnly = false;
	}
} 



function hideAmount(){
   if(popup != null){
		popup.hide();
   }
}

function Back(){
	
	document.forms[0].action="/CommonCancelAction.do?reqForm=CashOperations"
	document.forms[0].method="post";
	document.forms[0].submit();
}

function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=cashTransaction","child", bar);
}

function isAmountEmpty()
{
	var sAmount1 = document.getElementById("sTransAmount2");
	if(sAmount1.value==".00" || sAmount1.value=="0")
	{
		sAmount1.focus();
	}
	else
	{
		var sAmount2 = document.getElementById("sTransAmount2");
		if(sAmount2.readOnly)
			{
			flag = "N";
			return;
		    }
		amt_actual=sAmount1.value;
		sAmount1.value=".00";
		flag="Y";
	}
}

var amt_actual;
var flag="N";

function matchAmount()
{
	var sAmount2 = document.getElementById("sTransAmount");
	var sAmount1 = document.getElementById("sTransAmount2");
	if(sAmount2.readOnly)
		return;

	var sCrDr= document.getElementById("sCrDr");
	if(flag=="Y")
	{
		if(isNaN(amt_actual) || isNaN(sAmount2.value)){
			sAmount2.value=".00"
			sAmount1.focus();
			flag="N";
			return;
		}
		var amt1 = parseFloat(amt_actual);
		var amt2 = parseFloat(sAmount2.value);
		if(amt1==amt2)
		{
			amtInWords();
			
		}
		else
		{
			alert("Two amounts do not match");
			//showMessage(92);
			sAmount2.value=".00"
			sAmount1.focus();
			flag="N";
		}
	}

	
}




</script>




<script>

<%      

    if(session.getAttribute("abbCashErrorCode") != null){
		 errorCode = (String)session.getAttribute("abbCashErrorCode");
 	 	 System.out.println("Removing Session Data....................111"); 	
		 session.removeAttribute("abbCashErrorCode");
   }

	if(session.getAttribute("uniqueTxnNo") != null){
		 uniqueTxnNo = (String)session.getAttribute("uniqueTxnNo");
		 System.out.println("Removing Session Data....................112"); 	
		 session.removeAttribute("uniqueTxnNo");
   }
	
		



   if(errorCode!=null && (!errorCode.trim().equals("")))
   { %> 

			document.write("<br>");
			document.write("<TABLE width=\"100%\" id = \"ErrorTab\" >");
		<%
		if(uniqueTxnNo!=null && (!uniqueTxnNo.trim().equals("")))
		 { %> 
			document.write("<TR>");
			document.write("<TD style=\"background-color:brown;color:white;WIDTH:100%;\" align=top>");
			document.write("<strong>");
			document.write("Failed Transaction Number: <%=uniqueTxnNo%>");	
			document.write("</strong>");
			document.write("</TD>");
			document.write("</TR>");

			document.write("<TR>");
			document.write("</TR>");
		<%}%>
			document.write("<TR>");
			document.write("<TD style=\"background-color:brown;color:white;WIDTH:100%;\" align=top>");
			document.write("<strong>");
			document.write("'<%=errorCode%>' : "+"<bean:message bundle='errors' key='<%=errorCode%>'/>");	
			document.write("</strong>");
			document.write("</TD>");
			document.write("</TR>");
 		    document.write("</TABLE>");
   <%
	   errorCode = null;
   }
    

 %>	
</script>



