<%@ include file="/common/Include.jsp" %>
<%@ page import = "easycbs.bancmateib.fundtransfer.actionform.ABBTransferForm"%>
<% 
  
  ABBTransferForm abbForm = null;
  String errorCode ="";
  String loginBranch="",uniqueTxnNo="";
  String[][] sABBConnectedBranchInfo=null;
  
%>

<script language="JavaScript" src="/scripts/Amount1.js"></script>
<script>

var btnNameArr = new Array(5);
    btnNameArr[0] = "validate";
	btnNameArr[1] = "ok";
	btnNameArr[2] = "cancel";
	btnNameArr[3] = "signAndPhoto";
	btnNameArr[4] = "help";


function bodyOnLoad()
{	
   
<%
	if(session.getAttribute("ABBConnectedBranchInfo")!=null)
	{
		sABBConnectedBranchInfo=(String[][])session.getAttribute("ABBConnectedBranchInfo");
		System.out.println("____NO. OF CONNECTED BRANCHES________"+sABBConnectedBranchInfo.length);
			
	}

	if(session.getAttribute("loginBranchCode")!=null)
	{
		loginBranch =(String)session.getAttribute("loginBranchCode");
	}

	%>
	for(var i = 0; i<5;i++)
	{		
		document.getElementById(btnNameArr[i]).enabled = true;		
	}
	document.getElementById("sAcnoFrom").focus();

	
<%
	if(session.getAttribute("ABBTransferForm")!=null) {
		abbForm=(ABBTransferForm)session.getAttribute("ABBTransferForm");
%>
		
		


		document.getElementById("sFromBranch").value = '<%= abbForm.getsFromBranch()%>';
		document.getElementById("sToBranch").value = '<%= abbForm.getsToBranch()%>';
		
		document.getElementById("sFromBranchHidden").value = '<%= abbForm.getsFromBranch()%>';
		document.getElementById("sToBranchHidden").value = '<%= abbForm.getsToBranch()%>';

		document.getElementById("SABBBranchNameFrom").value = '<%= abbForm.getsABBBranchNameFrom()%>';
		document.getElementById("sABBAccNameFrom").value = '<%= abbForm.getsABBAccNameFrom()%>';
		document.getElementById("sABBActNameFrom").value = '<%= abbForm.getsABBActNameFrom()%>';
		document.getElementById("sAcnoFrom").value = '<%= abbForm.getsAcnoFrom()%>';
		
		
		
		document.forms[0].sAmtInWords.style.color="#FF0000";
		document.getElementById("sAcnoTo").value = '<%= abbForm.getsAcnoTo()%>';
		document.getElementById("sABBBranchNameTo").value = '<%= abbForm.getsABBBranchNameTo()%>';
		document.getElementById("sABBAccNameTo").value = '<%= abbForm.getsABBAccNameTo()%>';
		document.getElementById("sABBActNameTo").value = '<%= abbForm.getsABBActNameTo()%>';

		document.getElementById("sAmount2").value = '<%= abbForm.getsAmount2()%>';
		document.getElementById("sAmtInWords").value = '<%= abbForm.getsAmtInWords()%>';

		//document.getElementById("sABBDocType").value = '<%= abbForm.getsABBDocType()%>';
		document.getElementById("sNarration").value = '<%= abbForm.getsNarration()%>';
		//document.getElementById("sABBDocSeries").value = '<%= abbForm.getsABBDocSeries()%>';
		//document.getElementById("sABBDocDate").value = '<%= abbForm.getsABBDocDate()%>';
		//document.getElementById("sABBDocNo").value = '<%= abbForm.getsABBDocNo()%>';

		document.getElementById("sABBAccCurIdFrom").value = '<%= abbForm.getsABBAccCurIdFrom()%>';
		document.getElementById("sABBAccCurIdTo").value = '<%= abbForm.getsABBAccCurIdTo()%>';
		
		
	<%
		//session.removeAttribute("ABBTransferForm");
	}

	%>


}


</script>



<BODY onLoad="bodyOnLoad()" topmargin="0">

<html:form action="/abbtransfer">	

<input type = "hidden" name="sABBAccCurIdFrom" id="sABBAccCurIdFrom">
<input type = "hidden" name="sABBAccCurIdTo" id="sABBAccCurIdTo">

<center>

<table width="100%" height="12%" border="0" cellpadding="0" cellspacing="0">
	<TR colspan="2">
		<TD valign="top">
			<IMG  alt="Azizi Bank" height ="90" width = "99%" src="/images/azizi2.bmp" 
						border="0">	
					
		</td>	
		<!-- 
 		<TD valign="bottom" align="left" bgcolor="#91203E">		  			
			<img src="/images/home.bmp" border="0">
	    </td>
		-->
   </tr>

</table>

<BR>

<table border="0" width="100%" cellpadding="0" cellspacing="0" bgcolor="#FDE4E3">                

	<thead>  
	   <th align="center" rowspan="2" colspan="2" >
		  <b>Fund Transfer</b>
	   </th>
	  </tr>
	</thead>

       

<tr align="center">
<td>Debit</td>
<td>Credit</td>
<tr>



<tr> 
 <td align="center">&nbsp
	<bean:message bundle="hindi" key='7431'/>&nbsp;&nbsp;&nbsp;
			
		
		
		<select tabindex="1" name="sFromBranch" style="width:80" id="sFromBranch">
			<% if(sABBConnectedBranchInfo!=null)
					 {
						for (int j=0;j<sABBConnectedBranchInfo.length;j++)
							{%>

								<option  id="<%=sABBConnectedBranchInfo[j][1]%>"  value = '<%= sABBConnectedBranchInfo[j][1] %>'>
									<%=sABBConnectedBranchInfo[j][1]%>
								</option>

					<%}}%>

			</select>


			<input type="text"  tabindex="-1" name="sABBBranchNameFrom" style="width:115"
					id="sABBBranchNameFrom" readonly="true" /> 

			<input type = "hidden" Name = "sFromBranchHidden" id = "sFromBranchHidden">
		</td>


		<td >&nbsp
			<bean:message bundle="hindi" key='7432'/>&nbsp;&nbsp;&nbsp;
			<select tabindex="3" name="sToBranch" style="width:80" id="sToBranch">
						<% if(sABBConnectedBranchInfo!=null)
							   {
								for (int j=0;j<sABBConnectedBranchInfo.length;j++)
									{%>

										<option  id="<%=sABBConnectedBranchInfo[j][1]%>"  value = '<%= sABBConnectedBranchInfo[j][1] %>'>
											<%=sABBConnectedBranchInfo[j][1]%>
										</option>

					<%}}%>
			</select>&nbsp;
			<input type="text" tabindex="-1" name="sABBBranchNameTo"
					style="width:113" id="sABBBranchNameTo" readonly="true"/> 

			<input type="hidden" Name = "sToBranchHidden" id = "sToBranchHidden">
		</td>
	</tr>
	<tr>
		<td align="center">&nbsp
			<bean:message bundle="hindi" key='2393'/>&nbsp;
			<input type="text" tabindex="2" name="sAcnoFrom" style="text-align:right" 
					style="width:200"  Id="sAcnoFrom" maxlength="14" onkeypress="isValidNumber(event,this)"/>
		</td>
		<td>&nbsp
			<bean:message bundle="hindi" key='2394'/>&nbsp
			<input type="text" tabindex="4" name="sAcnoTo" style="text-align:right" 
					style="width:200" Id="sAcnoTo" maxlength="14" onkeypress="isValidNumber(event,this)" />
		</td>			
	</tr>
		
	<tr>
		<td align="center">&nbsp
			<bean:message bundle="hindi" key='1573'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" tabindex="-1" name="sABBActNameFrom" readonly="true" 
					style="width:200" Id="sABBActNameFrom"/>
		</td>
		<td>&nbsp
			<bean:message bundle="hindi" key='1573'/>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" tabindex="-1" name="sABBActNameTo" readonly="true" 
					style="width:200" Id="sABBActNameTo"/>
		</td>			
	</tr>
	<tr>
		<td align="center">&nbsp
			<bean:message bundle="hindi" key='9'/>
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;
			<input type="text" tabindex="-1" name="sABBAccNameFrom" style="width:200" 
					id="sABBAccNameFrom" readonly="true"/>
		</td>
		<td >&nbsp
			<bean:message bundle="hindi" key='9'/>
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" tabindex="-1" name="sABBAccNameTo" style="width:200" 
					id="sABBAccNameTo" readonly="true"/>
		</td>			
	</tr>

	<tr>
		<td>
			<br>
		</td>
		<td>
			<br>
		</td>
		<td>
			<br>
		</td>
		<td>
			<br>
		</td>

	</tr>

	<tr>
	</tr>


	<tr>
	<!--  by ashish varma
		<td>
			<bean:message bundle="hindi" key='7434'/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="text" value='Dr.' tabindex="5" name="sCrDr" style="width:30" id="sCrDr" readonly="true"/>
						
			</select>
		</td>	
   -->
		<td>
			
		</td>	
	</tr>

	<tr>
	    
		<td align='right'>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp  &nbsp &nbsp &nbsp &nbsp &nbsp
		    
			<bean:message bundle="hindi" key= "7433"/> &nbsp 			
			<input type ="text" NAME = "sAmount1" id = "sAmount1" 
				size="25" maxlength="15" tabindex="6"
				onkeypress="isValidAmount(event,this)"
				value = ".00" style="text-align:right"/>
			&nbsp;&nbsp;&nbsp
		</td>
		<td >
			<input type ="text" NAME = "sAmount2" id = "sAmount2" size="25" 
				onkeypress="isValidAmount(event, this)" value = ".00" style="text-align:right" 
				onFocus = "isAmountEmpty()" maxlength="15"	tabindex="7"
				onBlur = "matchAmount()"/>
		</td>
	
		
	</tr>
	
	<tr align="center">
		<td colspan='2' align="center" >
			<bean:message bundle="hindi" key= "378"/>&nbsp;&nbsp
			<input type="text" name="sNarration" id="sNarration"  maxlength="25" size="56" tabindex="9"/>
         
		    <!-- <bean:message bundle="hindi" key='2001'/>&nbsp;&nbsp;&nbsp;&nbsp;  by ashish varma-->
				
		</td>
		<!--
		<td>
		     <bean:message bundle="hindi" key='6718'/>	
			<input type="text" name="sABBDocSeries" id="sABBDocSeries"  maxlength="10" size="12"/>&nbsp;&nbsp;&nbsp;&nbsp;
	    </td>
		-->
	</tr>	     
	
	<!--
	<tr>
		<td>
			<bean:message bundle="hindi" key='872'/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="sABBDocDate" id="sABBDocDate"  maxlength="10" size="18"/>
		</td>	
		
		
		<td>
			<bean:message bundle="hindi" key='6878'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
			<input type="text" name="sABBDocNo" id="sABBDocNo" onkeypress="isValidNumber()"  maxlength="10" size="12"/>
		</td>	
		
	</tr>
	-->
	
	<tr>		
		<td colspan="2" align="center">
			<bean:message bundle="hindi" key='1115'/>&nbsp;
			<input type="label"  name="sAmtInWords" id="sAmtInWords"  maxlength="60"
			size ="53"  class="LabelText"	tabindex="-1"	readOnly/>
           
		</td>
		
		
        
	</tr>

	<input type="hidden" value='Voucher'tabindex="8" name="sABBDocType" style="width:80" id="sABBDocType"readonly="true"/>
</table>
   



<br><br>	
<table cellpadding = "20">
    <tr >
		<td>		
		    <input type="button" name="validate" id="validate" class="Button"  	
					onclick="callValidate()" tabindex="10"
					value='<bean:message bundle="hindi" key="6738"/>'	style="width:100px"> 

			<input type="button" name="ok" id="ok" class="Button" value='<bean:message bundle="hindi" key="86"/>'
				tabindex="11" onclick="saveData()" style="width:100px"> 

			<input type="button" name="cancel" id="cancel" class="Button"  onclick="closeWindow()"
				tabindex="12" value='<bean:message bundle="hindi" key="87"/>' style="width:100px">

			<input type="button" name="signAndPhoto" id="signAndPhoto" class="Button"  onclick="disableRestButtons('signAndPhoto'),viewSignPhoto()" 
				tabindex="13" value='<bean:message bundle="hindi" key="200"/>' style="width:100px"> 


			<input type="button" name="help"  id = "help" class="Button"  onclick="helpopen()"
				tabindex="14" value='<bean:message bundle="hindi" key="33"/>' style="width:100px">
		</td>
	</tr>
</table>
</center>
</html:form>
</BODY>




<script>

function viewSignPhoto(){
	
	var accno = document.getElementById("sAcnoFrom").value;
	var brncode = document.getElementById("sFromBranch").value;
	var bar = "width=450,height=270,left=150,top=220,scrollbars=no";
	var w = window.open("/signPhoto/SignPhoto.do?accno="+accno+"&brncode="+brncode,"child", bar);
	enableButton();
}

function enableButton(){	
    for(var i = 0; i<5;i++){		
		document.getElementById(btnNameArr[i]).style.background = "brown";     
		document.getElementById(btnNameArr[i]).disabled = false;		
	}
}

function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=fundtransfer","child", bar);
}

function disableRestButtons(btnName){
	var buttonName = btnName;
	  
    for(var i = 0; i<5;i++){
		if(!(btnNameArr[i] == btnName)){
			document.getElementById(btnNameArr[i]).style.background = "#FDB5B7";     
			document.getElementById(btnNameArr[i]).disabled = true;
		}
	}
}


function saveData()
{		
	 
	
	sfromAcc = document.getElementById("sAcnoFrom").value
	sToAcc =  document.getElementById("sAcnoTo").value

	if(sfromAcc=="" || sToAcc==""){
		alert("Entries Incomplete")
		return false;
	}


	//sfromBranch = document.getElementById("sFromBranch").value
	//sToBranch =  document.getElementById("sToBranch").value

	//if(sfromBranch==sToBranch){
	//	alert("Please Choose Differnet Branches")
	//	return false;
	//}

	//if(isValidDateFormat("sABBDocDate")==false)
	//{
	//	alert("Please Enter valid date in dd/mm/yyy format")
	//	document.getElementById("sABBDocDate").value="";
	//	document.getElementById("sABBDocDate").focus();
	//	return;
	//}
	
	disableRestButtons('ok');
    document.forms[0].action="/abbtransfer.do?action=performABBFundTransfer";
    document.forms[0].method = "POST";
    document.forms[0].submit();
}


function callValidate()
{
	
	sfromBranch = document.getElementById("sFromBranch").value
	sToBranch =  document.getElementById("sToBranch").value
	sfromAcno = document.getElementById("sAcnoFrom").value
	sToAcno =  document.getElementById("sAcnoTo").value

	if(<%= loginBranch %> == sfromBranch && <%= loginBranch %> == sToBranch){
		alert("Both Branches can not be Login Branch")
		return false;
	}
	else if( (sfromBranch+sfromAcno) == (sToBranch+sToAcno) ){
		alert("Please Choose Different Account Numbers")
		return false;
	}
	else if(document.forms[0].sAcnoTo.value!="" && document.forms[0].sAcnoFrom.value!="")
	{	
		disableRestButtons('validate');
		document.forms[0].action="/abbtransfer.do?action=checkValidation";
		document.forms[0].method = "POST";
		document.forms[0].submit();

	}
	else{

		alert("Entries Incomplete");
	}


}
	
/*
	onFocus of Amount2 if Amount1 is Blank

*/
function isAmountEmpty()
{
	var sAmount1 = document.getElementById("sAmount1");
	if(sAmount1.value==".00" || sAmount1.value=="0")
	{
		sAmount1.focus();
	}
	else
	{
		var sAmount2 = document.getElementById("sAmount2");
		if(sAmount2.readOnly) {
			flag = "N";
			return;
		}
		amt_actual=sAmount1.value;
		sAmount1.value=".00";
		flag="Y";
	}
}


/*
	Checks if the amounts are same or not 
*/
var amt_actual;
var flag="N";
function matchAmount()
{
	var sAmount2 = document.getElementById("sAmount2");
	var sAmount1 = document.getElementById("sAmount1");
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





function closeWindow()
{
	

	document.forms[0].action="/CommonCancelAction.do?reqForm=TrOperations"
	document.forms[0].method="post";
	document.forms[0].submit();

}



</script>


		

<script>

<%      

    if(session.getAttribute("ABBTransferErrorCode") != null){
		 errorCode = (String)session.getAttribute("ABBTransferErrorCode");
 	 	 System.out.println("Removing Session Data....................111"); 	
		 session.removeAttribute("ABBTransferErrorCode");
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
			document.write("'<%=errorCode%>' : "+"<bean:message bundle='error' key='<%=errorCode%>'/>");	
			document.write("</strong>");
			document.write("</TD>");
			document.write("</TR>");
 		    document.write("</TABLE>");
   <%
	   errorCode = null;
   }
    

 %>	
</script>