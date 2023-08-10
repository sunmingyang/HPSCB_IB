<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>
<script language=JavaScript src="/scripts/MD5.js"> </script>
<script language=JavaScript src="/scripts/Enc_Desc.js"> </script>
<script>
	function enterKey(evt) {
	evt =(evt)?evt:window.event;
    var c =(evt.which)?evt.which :evt.keyCode;
	if(c == 13)
		document.getElementById("ok").onclick();
	evt.keyCode=(!((c>=64 && c<=90) ||(c>=97 && c<=122)|| (c>=48 && c<=57) ))?0:event.keyCode;
   }
   function Ecodepwd()
	{
	  var sPwd = calcMD5(document.getElementById("sIbUsr_LogPass").value);
	  var sSessionId='<%=session.getId()%>';
	  document.getElementById("password").value=sPwd ;
	}
  
  function rest_submit() { 
		var ran=parseInt(Math.random()*9999);
		//alert(ran);
		//var url="http://117.239.0.75:8643/AccountInfoAction.do?action=userAuthenticate&userID=43860744&encPassword=bd5af1f610a12434c9128e4a399cef8a" +"&ran="+ran;
		//var url="http://192.168.1.72:8280/AccountInfoAction.do?action=getMiniStatement&accNo=4380114424" +"&ran="+ran;
		//var url="http://192.168.1.72:8280/AccountInfoAction.do?action=fetchAccountBalance&accNo=002010006515" +"&ran="+ran;
		//var url="http://117.239.0.75:8643/AccountInfoAction.do?action=fetchCustomerAccounts&custID=60744" +"&ran="+ran;
		//var url="http://192.168.1.72:8290/AccountInfoAction.do?action=getDetailStatement&accNo=002010006515&fromDate=01/02/2015&toDate=31/03/2015" +"&ran="+ran;
		//var url="http://192.168.1.72:8290/AccountInfoAction.do?action=chequeNoEnquiry&accNo=002010001445&chequeNo=145084" +"&ran="+ran;
		//var url="http://117.239.0.75:8643/TransactionAction.do?action=fetchPayee&userID=43861605&sessionID=3FE2D839B34589353899D88E3F6DD680" +"&ran="+ran;

		var url="http://117.239.0.75:8643/TransactionAction.do?action=fundTransferwithinBank&accNo=43801409&beneficiaryAccNo=43801367&transferAmt=12&OTP=123456&sessionID=<sessionIdValue>" +"&ran="+ran;


		//var url= "http://192.168.1.72:8280/TransactionAction.do?action=sendOTP&userID=43801409&beneficiaryAccNo=43801367&mobile=9314506489&sessionID=3FE2D839B34589353899D88E3F6DD680" +"&ran="+ran;

		//var url="http://192.168.1.72:8280/TransactionAction.do?action=fundTransferAddPayee&userID=43860744&nickName=vinay&payeeName=Vinay Prakash Dwivedi&payeeAcc=002010001445&payeeType=S&accountType=S&mobile=9314506489&sessionID=6493A24E2F524CCA56ECAC5EA80E05C5.redirect1" +"&ran="+ran;
		
		http.open("POST",url,false);
		http.onreadystatechange= function (){processAccount()};
		http.send(null);	
	}
   function processAccount(){
	 if (http.readyState == 4)
        {
            // Check that a successful server response was received
            if (http.status == 200)
            {
                alert("JSON Response recieved...");
                alert(http.responseText);
            }
            else
            {
                // An HTTP problem has occurred
                alert("HTTP error: " + http.status);
            }
        }
}
   
</script>

<body onkeyDown="StopKeyHandler()" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" bgcolor="#FFFFFF" link="#00AADD" vlink="#FF9933" background="" >
<!-- <body onkeyDown="StopKeyHandler()"  topmargin=0 leftmargin=0 > --><br>
	<html:form action= "/jsp/login">
<!--				
<%	if(request.getParameter("errno")!=null)
	{%><table>
		
		<tr>
			<td style="padding-left:80px" class="heading"><font face="verdana">
				Your Session is Expired, Please Login Again !!!</font>
			</td>
		</tr>
		</table>   
<%}%>
-->
<table width="100%" cellpadding="0" cellspacing="0" >
	<%	if(request.getParameter("errno")!=null)
	{	%>
		<br><br>
		<tr>
			<td style="padding-left:80px" class="heading"><font face="verdana">
				<bean:message bundle='<%=lang%>' key='7419'/>!!!</font>
			</td>
		</tr>
<%	}	%>
	<tr> 
		<td valign="middle" align=left>
			<div id="diverrmessage"><font face="verdana" color="red">
				<logic:messagesPresent property="Locked"><html:errors property="Locked"/></logic:messagesPresent>
				<logic:messagesPresent property="LogOut"><html:errors property="LogOut"/></logic:messagesPresent>
				<logic:messagesPresent property="Deactive"><html:errors property="Deactive"/></logic:messagesPresent>
				<logic:messagesPresent property="alreadyLogin"><html:errors property="alreadyLogin"/></logic:messagesPresent>
				<logic:messagesPresent property="WrongPass"><html:errors property="WrongPass"/></logic:messagesPresent>		 
				<logic:messagesPresent property="NoServer"><html:errors property="NoServer"/></logic:messagesPresent></font>
			</div>		
			
			 <div style="margin-top:60px;" ><img src="../mobile/img/logo.png" alt="..." class="img-responsive" style="margin:0px auto;display:block"  /></div>

			<table  cellpadding="0" cellspacing="0" BORDER=0   align=center> 
				<tr>
					<td valign="middle">
						<table  cellpadding="0" cellspacing="0" BORDER=1 width="340"   height=100%  >
							<tr> 
								<td > 
									<table cellpadding="0"cellspacing="7"  border=0  height=100% >
										<tr> 
											<td colspan="3" align="center"  class="tableHeader">
											<!--<bean:message bundle="<%=lang%>" key= "603"/> -->
											<%=BMConfig.getProperty("WELCOMEMSGMB","Login to HPSCB MobileBanking")%> 
											</td>
										</tr>
										<tr> 
											<td  class="tableRowText" width="85"> <bean:message bundle="<%=lang%>" key= "603"/> : 
											</td>
											<td width="100"> <html:text   property="sIbUsr_LogId" styleId="sIbUsr_LogId" size="20" tabindex="1" maxlength="15" 		onkeypress="javascript:isValidNumAlpha()"/>
											</td>
											<td>&nbsp;</td>
										</tr>
										<tr> 
											<td class="tableRowText"> <bean:message bundle="<%=lang%>" key= "100"/> : 
											</td>
											<td><html:password   property="sIbUsr_LogPass" styleId="sIbUsr_LogPass" size="20"  tabindex="2" maxlength="15" />
											</td>
											<td style="line-height:1">
											
												
											</td>
											<html:hidden   property="sMacAdd" styleId="sMacAdd"/>
											<html:hidden  property="password" styleId ="password"/>

										</tr>
										

										<tr> 
											<td colspan=3 align="center"> 
												<input   value="Login" class="ibButton" type="button" name="ok" onclick="login_submit()"  tabindex="3" > 
											</td>
										</tr>
										
										<tr id="invisible" style="display:none;">
											<td colspan="3" align="center">
												<span onClick="showForgotPassword()"  class="rowLink4">Forgot Password ?</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
					<td width="10">&nbsp;</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<br><br><br>
</html:form>


<script language="JavaScript">

function setBorder(o){

o.className = "setborder";

} 
function resetBorder(o){
o.className = "resetborder";
}
function setBorder1(o){

o.className = "setborder1";

} 
function resetBorder1(o){
o.className = "resetborder1";
}
function showKeyPadBenifit(){
//alert("under progress !!!");
window.open("/common/Virtual_KB_Benefit.html","Knowmore","toolbar=0,location=0,directories=0,status=1,menubars=0,scrollbars=1,resizable=1,width=780,height=550,valign=top");
}

function showForgotPassword(){
//alert("under progress !!!");
}
//var bankAppUrl = "https://10.15.1.129:8080/";
//var flag=true;
//function MM_openBrWindow(theURL,winName,features) { //v2.0

//window.open(theURL,winName,features);

//}
	function onLoad()
	{
		document.getElementById("sIbUsr_LogId").focus();
		<logic:messagesPresent property="Deactive">
		document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

		<logic:messagesPresent property="Locked">
		document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

		<logic:messagesPresent property="alreadyLogin">
		document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>


		<logic:messagesPresent property="WrongPass">
		document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

		<logic:messagesPresent property="NoServer">
		document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>

		<logic:messagesPresent property="LogOut">
		document.getElementById("diverrmessage").style.display ="block";
		</logic:messagesPresent>
	}
function disableKeyPad(){


var test=confirm("Virtual keyboard is recommended to protect your password. Are you sure you want to use normal keyboard?");
    if(test)
	{


			 var firstNewRowSplit   = document.forms[0].charFirstRowhidden.value;
	         var secondNewRowSplit  = document.forms[0].charSecondRowhidden.value;
	         var thirdNewRowSplit   = document.forms[0].charThirdRowhidden.value;
             var fourthNewRowSplit  = document.forms[0].numFirstRowhidden.value;
			 var fifthNewRowSplit   = document.forms[0].numSecondRowhidden.value;
			 var sixthNewRowSplit   = document.forms[0].numThirdRowhidden.value;
			 var seventhNewRowSplit = document.forms[0].speFirstRowhidden.value;
			 var eigthNewRowSplit   = document.forms[0].numFourthRowhidden.value;
			 var ninthNewRowSplit   = document.forms[0].speSecondRowhidden.value;
             var tenthNewRowSplit   = document.forms[0].speThirdRowhidden.value;

			 document.forms[0].sIbUsr_LogPass.value="";
			 document.forms[0].sIbUsr_LogPass.readOnly=false;

			 flag='false';
			 firstNewRow=firstNewRowSplit.split("|");

				document.forms[0].buttonclose.disabled=true;			 
		      for(var i=0;i<10;i++)
			  {
           	     document.forms[0].button1[i].disabled=true;
			  }
			  for(var i=0;i<9;i++){
                 document.forms[0].button2[i].disabled=true;
			  }

			   for(var i=0;i<7;i++){
                 document.forms[0].button3[i].disabled=true;
			  }

		      for(var i=0;i<3; i++)
			  {
                document.forms[0].number1[i].disabled=true;

			  }
		      for(var i=0;i<3;i++)
			  {
                document.forms[0].number2[i].disabled=true;
			  }
		      for(var i=0;i<3;i++)
			  {
                document.forms[0].number3[i].disabled=true;
		  	  }
              for(var i=0;i<10;i++)
			  {
               document.forms[0].button4[i].disabled=true;

			 }
              for(var i=0;i<11;i++)
			 {
                 document.forms[0].button5[i].disabled=true;

			 }
               for(var i=0;i<11;i++)
			 {

				 document.forms[0].button10[i].disabled=true;

			 }

               document.forms[0].number4.disabled=true;
               document.forms[0].button6.disabled=true;
			   document.forms[0].button7.disabled=true;
               document.forms[0].button8.disabled=true;
		       //document.forms[0].button9.disabled=true;
		  }else{

               document.forms[0].virtualpassword.checked=true;

	      }


}
 function virtualKey(){

			 var firstNewRowSplit   = document.forms[0].charFirstRowhidden.value;
	         var secondNewRowSplit  = document.forms[0].charSecondRowhidden.value;
	         var thirdNewRowSplit   = document.forms[0].charThirdRowhidden.value;
             var fourthNewRowSplit  = document.forms[0].numFirstRowhidden.value;
			 var fifthNewRowSplit   = document.forms[0].numSecondRowhidden.value;
			 var sixthNewRowSplit   = document.forms[0].numThirdRowhidden.value;
			 var seventhNewRowSplit = document.forms[0].speFirstRowhidden.value;
			 var eigthNewRowSplit   = document.forms[0].numFourthRowhidden.value;

			 var ninthNewRowSplit   = document.forms[0].speSecondRowhidden.value;
             var tenthNewRowSplit   = document.forms[0].speThirdRowhidden.value;


			 document.forms[0].sIbUsr_LogPass.readOnly=true;
		 	 document.forms[0].sIbUsr_LogPass.value="";

			 firstNewRow=firstNewRowSplit.split("|");

				document.forms[0].buttonclose.disabled=false;			 
			  for(var i=0;i<10;i++)
			  { 
				  document.forms[0].button1[i].disabled=false;


			  }

			  for(var i=0;i<9;i++)
			  {
				  document.forms[0].button2[i].disabled=false;
			  }

			  for(var i=0;i<7;i++)
			  {
				 document.forms[0].button3[i].disabled=false;
			  }

			  for(var i=0;i<3;i++)
			  {
                 document.forms[0].number1[i].disabled=false;

			  }
		 	  for(var i=0;i<3;i++)
			  {
                document.forms[0].number2[i].disabled=false;

			  }
		      for(var i=0;i<3;i++)
			  {
                document.forms[0].number3[i].disabled=false;

			  }

			  for(var i=0;i<10;i++)
			 {

                document.forms[0].button4[i].disabled=false;
		 	 }
              for(var i=0;i<11;i++)
			 {

                document.forms[0].button5[i].disabled=false;
			 }
             for(var i=0;i<11;i++)
			 {

				document.forms[0].button10[i].disabled=false;
			 }



            document.forms[0].number4.disabled=false;
		    document.forms[0].button6.disabled=false;
			document.forms[0].button7.disabled=false;
            document.forms[0].button8.disabled=false;
            //document.forms[0].button9.disabled=false;




}
var isSpace=true;
function func_spaceBarProhibit(event)
{

	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
    
	if((keyCode=="32") || (keyCode=="13"))
	{
			alert("Please use mouse only for virtual keybord!!!");
			 isSpace=false;
			 return false;
	}
		isSpace=true;
		return true;
}
 var flag ='false';
   function func_clear()
   {
       document.forms[0].sIbUsr_LogPass.value="";
   }

   function func_capslock(obj)
  {

		var firstRowSplit  = document.forms[0].charFirstRowhidden.value;
		var secondRowSplit = document.forms[0].charSecondRowhidden.value;
		var thirdRowSplit = document.forms[0].charThirdRowhidden.value;

		if( flag=='true' ){
	        flag='false';
	       obj.className ='type2d';
			firstRow = firstRowSplit.split("|");

			for(i=0;i<firstRow.length-1;i++){
	       	   document.forms[0].button1[i].value=firstRow[i].toLowerCase();
	        }
	   	    secondRow =secondRowSplit.split("|");
		      for(i=0;i<secondRow.length-1;i++){
	       		   document.forms[0].button2[i].value=secondRow[i].toLowerCase();
	          }
			thirdRow =thirdRowSplit.split("|");
		    for(i=0;i<thirdRow.length-1;i++){
	       		   document.forms[0].button3[i].value=thirdRow[i].toLowerCase();
	         }
	}else{

			  flag='true';

	          obj.className='type2d';

			  firstRow = firstRowSplit.split("|");
	          for(i=0;i<firstRow.length-1;i++){
	       		   document.forms[0].button1[i].value=firstRow[i];
	          }

			  secondRow =secondRowSplit.split("|");
		      for(i=0;i<secondRow.length-1;i++){
	       		   document.forms[0].button2[i].value=secondRow[i];
	          }

			  thirdRow =thirdRowSplit.split("|");
		      for(i=0;i<thirdRow.length-1;i++){
	       		   document.forms[0].button3[i].value=thirdRow[i];
	          }

           }

  }

 function func_back(){
     var j=document.forms[0].sIbUsr_LogPass.value;
     document.forms[0].sIbUsr_LogPass.value=j.substring(0,j.length-1);

}
function func_click(obj)
{
	if(obj=='sQuot'){
       obj=obj.replace(/sQuot/,'\'');
	}
	if(obj=='dQuot'){
       obj=obj.replace(/dQuot/,'\"');
	}
	if(obj=='bslash'){
       obj=obj.replace(/bslash/,'\\');

	}


    var i= obj;
	
	if(flag=='true' ){
	   var j = document.forms[0].sIbUsr_LogPass.value+i.toUpperCase();
       document.forms[0].sIbUsr_LogPass.value=j;


		


	}else{

	   var j = document.forms[0].sIbUsr_LogPass.value+i.toLowerCase();
       document.forms[0].sIbUsr_LogPass.value=j;

	 }

}

</script>


</body>

<style type="text/css">
 .textbox {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 11px;
        color: #000000;
        text-decoration: none;
        border: 1px solid #999999;

}
.bodyheader1 {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 11px;
        font-weight: bold;
        color: #000000;
        text-decoration: none;
}
.bodyText {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 11px;
        color: #000000;
        text-decoration: none;
        font-weight: normal;

}
.tableHeader{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #92610E;
        text-decoration: none;

}

.tableHeaderLinkInfo{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 9pt;
        font-weight: bold;
        color: #92610E;
        text-decoration: none;

}

.tableRowText{
font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #092771;
        text-decoration: none;

}
.rowLink1{
	font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 10px;
        font-weight: bold;
        color: #A61404;
        text-decoration: none;
		cursor:hand;
}
.rowLink2{
	font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 9px;
        font-weight: normal;
        color: black;
        text-decoration: none;
}
.rowLink3{
	font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 9px;
        font-weight: normal;
        color: #092771;
        text-decoration: none;
		cursor: hand;
}
.ibButton{
	font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: normal;
        color: black;
}
.rowLink4{
	font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: black;
        text-decoration: none;
		cursor: hand;
}
.keyPadHeading{
		font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 8pt;
        font-weight: bold;
        color: #92610E;
        text-decoration: none;
		border-bottom:0;
}


</style>