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
		  dt1 = (String)session.getAttribute("sqlBranchDate");    /* Set At LoginWinAction,'2006-12-26 11:23:15.156' */
		  if(dt1.length() > 10){
			dt1 = dt1.substring(0,10);
		  }
	  }

	  java.sql.Date dt =  new java.sql.Date(106,11,25);

	  String errorCode ="",loginBranch ="";
      if(session.getAttribute("loginBranchCode") != null){
          loginBranch = (String)(session.getAttribute("loginBranchCode"));  //set At LoginWinAction class
	  }	
	  if(session.getAttribute("abbFundTransForm") != null){
		   abbFundTransform = (ABBFundTransForm)session.getAttribute("abbFundTransForm");
	  }
	  if(session.getAttribute("ConnectedBranches") != null){
		   String sBranchCodes = (String)session.getAttribute("ConnectedBranches");
		   connectedBranches = sBranchCodes.split(":");
	  }
	  
 %>
<HTML>
<BODY onLoad="enableButton(),loadAllData()" >

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
      <b><bean:message bundle="hindi" key='7440'/></b>
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
		<input type="text"  name="sToBranchDesc" style="width:300" maxlength ="140" Id="sToBranchDesc"  class="" readOnly/> 
	</td>
</tr>
 <tr>		
 	<td>
		 &nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='2394'/>
    </td>
	<td>		
		 <input type="text" tabindex="2" name="sAcnoTo" maxlength="10" style="width:150" Id="sAcnoTo" style="text-align:right" />
	</td>	
</tr>
<tr>		
	<td>
		&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='1573'/>
 	</td>
	<td>
		   <input type="text" " name="sAcnoToType" style="width:100;text-align:left" Id="sAcnoToType" readOnly />
 		   &nbsp;&nbsp;
		   <input type="text" tabindex="-1" name="sAcnoToTypeDesc" style="width:300;text-align:left" Id="sAcnoToTypeDesc" style="text-align:right" readOnly/>
	</td>
</tr>
<tr>		
	<td>		&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='2741'/>
	</td>
	<td>
		<input type="text"  name="sAccHolderName" style="width:300" Id="sAccHolderName" readOnly />
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
			<input type ="text" name="sTransAmount" ID="sTransAmount" size="20" maxlength="10"  style="text-align:right" 
			onKeyPress = "isValidAmount(event,sTransAmount)"  onblur="amtInWords()" tabIndex="4" 
			 />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			
			<input type ="text" name="sTransAmount2" ID="sTransAmount2" size="20" maxlength="10" style="text-align:right" 
			onKeyPress = "isValidAmount(event,sTransAmount2)" tabIndex="5" />		
    </td>
</tr>
<tr>
	<td>
		&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key= "378"/>
		
	</td>
	<td>
	    <input type="text" name="sNarration" id="sNarration"  maxlength="140" size="50" tabIndex="6" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
    </td>
</tr>	     
<tr>
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
<tr>		
	<td>
		&nbsp;&nbsp;&nbsp;<bean:message bundle="hindi" key='1115'/>	
    </td>
	<td>
		<input type="text" name="sAmtInWords" id="sAmtInWords"  size ="50" maxlength="150" style="width:265" onMouseOver="showAmount()" onMouseOut = "hideAmount()" readOnly />
		<bean:message bundle="hindi" key='2621'/>&nbsp;&nbsp;
		<input type="text" name="sDocDate" id="sDocDate"  maxlength="10" size="12" style="text-align:right" readOnly/>&nbsp;&nbsp;&nbsp; 
        
		<input	align ="left" type="button" tabIndex ='10' name="btnsDocDate" id="btnsDocDate" 
		value=" " onClick="showhide('ABBIBsDocDate')"				style="background-image:url('/images/Calendar.gif');width:20px;height:18px"  /> 

		       <div	id="cal_sDocDate_display_year" style="display:none;position:absolute;top:346;left:730;"> 
 	    			<input	type="text" class="fancy" id="sDocDate_year"  value="" maxLength="4" size="5" tabIndex ='10' />
			   </div>	
			   <div id="cal_sDocDate_display" style="display:none;position:absolute;top:346;left:780;"> 
			    
			   <script type="text/javascript">	
			   var d = new Date(); //dd/mm/yyyy

			   <%
					if(dt!=null){
						String str = dt.toString();               // 1900-01-01 00:00:00.000
						String dd = str.substring(8);
						//	dd="5";
						String mm = str.substring(5,7);						
						//	mm="6";
						String yyyy = str.substring(0,4);
						//	yyyy="2005";				
				%>
						d.setMonth(<%=mm%>-1); //0-11				         
						d.setDate(<%=dd%>);
						d.setYear(<%=yyyy%>);
				<%
					}
				%>
				if(document.getElementById("sDocDate").value != ""){
					d = changeStrToDate(document.getElementById("sDocDate").value);
				}
				ABBIBsDocDate = new Calendar ("ABBIBsDocDate", "sDocDate",d);
				renderCalendar(ABBIBsDocDate);

			 </script>
		   </div>&nbsp;&nbsp;&nbsp; 

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
			<input type="button" name="help"  id = "help" class="Button"  onclick="Back()"
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
	}
}
function setFocus(){


	document.getElementById("sToBranch").focus();
	disableEnableDocFields();

}
function loadAllData(){
    
	<%
		if(abbFundTransform != null)
		{ %>
			
	        document.getElementById("sToBranch").value = '<%=abbFundTransform.getsToBranch()%>';
	        document.getElementById("sToBranchDesc").value = '<%=abbFundTransform.getsToBranchDesc()%>';
			document.getElementById("sAcnoTo").value = '<%=abbFundTransform.getsAcnoTo()%>';
			document.getElementById("sAcnoToType").value = '<%=abbFundTransform.getsAcnoToType()%>';
			document.getElementById("sAcnoToTypeDesc").value = '<%=abbFundTransform.getsAcnoToTypeDesc()%>';
			document.getElementById("sAccHolderName").value = '<%=abbFundTransform.getsAccHolderName()%>';

			document.getElementById("sDrCr").value = '<%=abbFundTransform.getsDrCr()%>';
            
            document.getElementById("sTransAmount").value = '<%=abbFundTransform.getsTransAmount()%>';
            document.getElementById("sTransAmount2").value = '<%=abbFundTransform.getsTransAmount()%>';
			document.getElementById("sNarration").value = '<%=abbFundTransform.getsNarration()%>';
            
			document.getElementById("sDocType").value = '<%=abbFundTransform.getsDocType()%>';
			document.getElementById("sDocSeries").value = '<%=abbFundTransform.getsDocSeries()%>';
			document.getElementById("sDocNo").value = '<%=abbFundTransform.getsDocNo()%>';
			document.getElementById("sDocDate").value = '<%=abbFundTransform.getsDocDate()%>';

			document.getElementById("sAmtInWords").value = '<%=abbFundTransform.getsAmtInWords()%>';
			document.getElementById("sAmtInWords").style.color = 'red';
       <% }
  %>

	setFocus();
}


function checkDate(){    
		 var sDate = document.getElementById("sDocDate").value;        // 22/12/2006
		 var fDate = '<%=currDate%>';

		 var Month1 = fDate.substring(3,5);
		 var Day1 =   fDate.substring(0,2);
		 var Year1 =  fDate.substring(6,10);
		
		 var Month2 = sDate.substring(3,5);
		 var Day2 =   sDate.substring(0,2);
		 var Year2 =  sDate.substring(6,10);
     
	 alert(" Year1 ="+Year1+"   Month 1  = "+Month1+"    Day1 ="+Day1);
	 	 alert(" Year2 ="+Year2+"   Month 2  = "+Month2+"    Day2 ="+Day2);
	 if((Year1>Year2)||((Year1==Year2) && (Month1 > Month2)) || (((Year1==Year2) && (Month1 == Month2) &&  Day1 >  Day2))){
	 		return true;
	 }
	 else{
		alert("The Document Date should be less than or equals to Current Date ");
		return false;	
	 }
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
	else if((sTransAmount == "") || (sTransAmount2 == "")){
		alert("Amount Can't Be Blank !! ");
		flag = false;
	}else if((sTransAmount == ".") || (sTransAmount2 == ".")){
        alert("Invalid Input !! ");
		flag = false;
	}else if((sTransAmount == ".00") || (sTransAmount2 == ".00")){
        alert("Amount Can't be Zero !! ");
		flag = false;
	}
	
	 var iAmount = 0;
	 var iAmount2 = 0;
	 try{
		 iAmount = parseInt(sTransAmount);
		 iAmount2 = parseInt(sTransAmount2);
	 	 if(iAmount == 0 || iAmount2 ==0){
			 alert("Amount Can't be Zero");			
			 flag = false;
		 }
	 }catch(Error){
		 alert("Error occured :"+Error);
	 } 
    
	if(document.getElementById("sDocType").value == "CHQ"){
		flag = checkDate();
	}
    if(!(sTransAmount == sTransAmount2)){
        alert("Both the Amounts Entered Are Not Same !! ");
		flag = false;	
	}
   
    
	if(!flag){
		 enableButton();
		return false;
	}
    sPurpose = purpose; 
    if(sPurpose == "validate"){
		alert("loginBranch "+'<%=loginBranch%>');

		document.getElementById("sFromBranch").value = '<%=loginBranch%>';
		document.getElementById("sMOP").value = "CS";
		document.getElementById("sPurpose").value = "validate";

		document.forms[0].action="../abbfundtransfer/fund.do?action=performABBFundTransfer";
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

	alert("--------->>"+accno);
	alert("--------->>"+brncode);
	var bar = "width=450,height=270,left=150,top=220,scrollbars=no";
	window.open("/signPhoto/SignPhoto.do?accno="+accno+"&brncode="+brncode,"child", bar);
}

function disableEnableDocFields(){
	var docType = document.getElementById("sDocType").value;
	if(!(docType == "CHQ")){
        document.getElementById("sDocSeries").readOnly = true;
		document.getElementById("sDocNo").readOnly = true;
		document.getElementById("sDocDate").readOnly = true;
		document.getElementById("btnsDocDate").readOnly = true;
	}else{
		document.getElementById("sDocSeries").readOnly = false;
		document.getElementById("sDocNo").readOnly = false;
		document.getElementById("sDocDate").readOnly = false;
		document.getElementById("btnsDocDate").readOnly = false;
	}
}

function showAmount(){
	var sAmount  = document.getElementById("sAmtInWords").value;
   
	popup = window.createPopup();
	popupBody = popup.document.body;
	
	popupBody.style.border = 'solid 2px black';
	popupBody.style.valign = 'top';
	popupBody.style.background = '#F5F8C2';
	popupBody.style.padding = '5px';
	popupBody.innerHTML = sAmount;
    if(sAmount != ""){
		popup.show(314,350, 400, 26, document.body);
	}
}

function hideAmount(){
   if(popup != null){
		popup.hide();
   }
}

function Back(){
	document.forms[0].action="/CommonCancelAction.do?reqForm=TrOperations"
	document.forms[0].method="post";
	document.forms[0].submit();
}
</script>

<br><br><br><br><br><br>


<script>

<%      

    if(session.getAttribute("abbCashErrorCode") != null){
		 errorCode = (String)session.getAttribute("abbCashErrorCode");
 	 	 System.out.println("Removing Session Data....................111"); 	
		 session.removeAttribute("abbCashErrorCode");
   }

   if(errorCode!=null && (!errorCode.trim().equals("")))
   { %> 

			document.write("<br>");
			document.write("<TABLE width=\"100%\" id = \"ErrorTab\" >");
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



