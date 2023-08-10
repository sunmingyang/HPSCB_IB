<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
<%
	boolean mobileUserAgent  = SessionHandler.mobileUserAgent(request.getHeader("User-Agent").toLowerCase()); 
	if (mobileUserAgent)	{
		response.sendRedirect("/mobile/loginform.jsp");   
		System.out.println("GO TO ANDROID TABLET mobilemenu");
	} 
%>

<script language="JavaScript" src="/jsp/scripts/chng_pass.js"></script>
<script language=JavaScript src="/scripts/MD5.js"> </script>
<script language=JavaScript src="/scripts/Enc_Desc.js"> </script>



<script>
   var isOpen="c";
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
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<!-- tiles:put name="title" value="Login Page"/ -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu" value="/common/login_leftHyperlink.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>


<tiles:put name="page_header" type="String" >							
				<bean:message bundle="hindi" key="7007" />
</tiles:put> 
<tiles:put name="content" type="String">


<body onkeyDown="StopKeyHandler()" marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" bgcolor="#FFFFFF" link="#00AADD" vlink="#FF9933" background=""  >
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
			<table  cellpadding="0" cellspacing="0" BORDER=0  bordercolor="#E0E0E0" align=left> 
				<tr>
					<td valign="middle">
						<table  cellpadding="0" cellspacing="0" BORDER=1 width="340"  bordercolor="#E0E0E0" height=100%  >
							<tr> 
								<td > 
									<table cellpadding="0"cellspacing="7"  bgcolor="rgb(235,235,235)"  border=0  height=100% >
										<tr> 
											<td colspan="3" align="center"  class="tableHeader">
											<!--<bean:message bundle="<%=lang%>" key= "603"/> -->
											<%=BMConfig.getProperty("WELCOMEMSG","Login to HPSCB Net Banking")%> 
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
											
														<span onClick="virtualKey()"  class="rowLink1">Click here</span>
														<span class="rowLink2">to use virtual keypad</span>
												
											</td>
											<html:hidden   property="sMacAdd" styleId="sMacAdd"/>
											<html:hidden  property="password" styleId ="password"/>

										</tr>
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>
												<span onClick="showKeyPadBenifit()"  class="rowLink3">Know Benefit !!</span></td>
										</tr>
										<!-- <tr>
											<td  colspan="5" align=center>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click to Use virtual keyboard 
												<span style="color:#a41c2b; font-weight:bold">&nbsp;&nbsp;(Recommended) </span> 
												<input type="checkbox"  name="virtualpassword" onClick="virtualKey()" value="checkbox">
											</td>
										</tr> -->
										<tr> 
											<td colspan=3 align="center"> 
												<input   value="Login" class="ibButton" type="button" name="ok" onclick="login_submit()"  tabindex="3" > 
											</td>
										</tr>
										
										
										
										<!--	
										<tr> 
											<td colspan=3 align="center"> 
												<input   value="restTest" class="ibButton" type="button" name="restok" onclick="rest_submit()"  tabindex="3" > 
											</td>
										</tr>
											-->
										
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
					<!--     New Added on 11/07/2008 By Ajay -->
						<table width="300" border="1" bordercolor="black" cellspacing="0" cellpadding="0">
							<tr>
								<td class="keyPadHeading" align="center">
									Virtual Keypad (Only for Password)
									<input type="button"  value="X" name="buttonclose" id="buttonclose"  class="type4d"  onclick="disableKeyPad()"  disabled >
								</td>
							</tr>
							<tr>
								<td align="center" style="padding-top:5px;padding-bottom:5px;border-top:0">
									<table width="300" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="center">
												<table  border="0" bordercolor="red" cellspacing="4" cellpadding="0">
													<tr>
														<td>
															<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="v" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('V');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="k" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('K');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="e" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('E');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="w" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('W');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="j" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('J');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="h" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('H');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="y" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Y');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="q" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Q');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="l" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('L');}"  disabled >
															<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="f" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('F');}"  disabled >
														</td>
														<td style="width:10px">
																				</td>
																				<td>
																					<input type="button" value="7" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   name="number1" id="number1"  class="type1d"
																					   onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('7');}" disabled >
																					<input type="button" value="1" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   name="number1" id="number1"  class="type1d"
																					   onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('1');}" disabled >
																					<input type="button" value="4" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   name="number1" id="number1"  class="type1d"
																					   onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('4');}" disabled >
				  
																				</td>
																			</tr>
																			<tr >	
																				<td>
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="b"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('B');}" disabled >
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="o"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('O');}" disabled >
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="g"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('G');}" disabled >
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="p"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('P');}" disabled >
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="x"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('X');}" disabled >
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="r"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('R');}" disabled >
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="a"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('A');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="t"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('T');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="u"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('U');}" disabled >
																				</td>
																				<td style="width:10px">
																				</td>
																				<td>
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="8"  name="number2"  id="number2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('8');}" disabled > 
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="2"  name="number2"  id="number2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('2');}" disabled > 
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="6"  name="number2"  id="number2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('6');}" disabled > 
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="z"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Z');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="n"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('N');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="i"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('I');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="d"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('D');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="s"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('S');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="m"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('M');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="c"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('C');}" disabled >
																				</td>
																				<td style="width:10px">
																				</td>
																				<td>
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="3"  name="number3" id="number3"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('3');}" disabled >
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="0"  name="number3" id="number3"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('0');}" disabled >
																					<input type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="9"  name="number3" id="number3"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('9');}" disabled >
																				</td>
																			</tr>
																			<tr>
																				<td>
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="$"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('$');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="&"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('&');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value=":"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(':');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="^"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('^');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="{"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('{');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="."  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('.');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="_"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('_');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="("  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('(');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="&#34;"  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('dQuot');}" disabled >
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="["  name="button4" id="button4" class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('[');}" disabled >
																				</td>
																				<td style="width:10px">
																				</td>
																				<td style="padding-left:22px">
																					<input type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="5"  name="number4" id="number4"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('5');}" disabled >  
																				</td>
																			</tr>
																			<tr>
																				<td colspan="3">
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="!"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('!');}" disabled >
																					<input  type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="-"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('-');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="'"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('sQuot');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="\"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('bslash');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="?"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('?');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"   value="~"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('~');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"    value=")"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(')');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value=";"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(';');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"     value="]"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(']');}" disabled >
																					<input  type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="<"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('<');}" disabled >
																					<input  type="button"  onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="}"  name="button5" id="button5"  class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('}');}" disabled >
																				</td>
																			</tr>
																			<tr>
																				<td colspan="3">
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="`"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('`');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="*"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('*');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="%"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('%');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="#"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('#');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="/"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('/');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="@"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('@');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value=">"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('>');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value=","  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(',');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="+"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('+');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="="  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('=');}" disabled >
																					<input  type="button" onMouseOver="setBorder(this)" onMouseOut="resetBorder(this)"  value="|"  name="button10" id="button10"  class="type1d"  onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('|');}" disabled >
																				</td>
																			</tr>
																			<tr>
																				<td colspan="3">
																					<input type="button" onMouseOver="setBorder1(this)" onMouseOut="resetBorder1(this)"   name="button6" id="button6"  class="type2d" value="Back Space"  onclick="func_back()" disabled>
																					<input type="button" onMouseOver="setBorder1(this)" onMouseOut="resetBorder1(this)"   name="button7" id="button7"  class="type2d" value="Clear" onclick="func_clear()"  disabled >
																					<input type="button" onMouseOver="setBorder1(this)" onMouseOut="resetBorder1(this)"    name="button8" id="button8" class="type2d" value="Caps Lock" onclick="func_capslock(this)" disabled>
																					<input type="hidden" name="test" value="false" >
																					<input type="hidden" name="test" value="false" >
																					<input type="hidden" name="charFirstRowhidden" value='V|K|E|W|J|H|Y|Q|L|F|'>
																					<input type="hidden" name="numFirstRowhidden" value='7|1|4|'>
																					<input type="hidden" name="charSecondRowhidden" value='B|O|G|P|X|R|A|T|U|'>
																					<input type="hidden" name="numSecondRowhidden" value='8|2|6|'>
																					<input type="hidden" name="charThirdRowhidden" value='Z|N|I|D|S|M|C|'>
																					<input type="hidden" name="numThirdRowhidden" value='3|0|9|'>
																					<input type="hidden" name="speFirstRowhidden" value='type1d spe_dol|type1d spe_amp|type1d spe_co|type1d spe_exp|type1d spe_cob|type1d spe_fs|type1d spe_underscore|type1d spe_rob|type1d spe_dquot|type1d spe_sob|'>
																					<input type="hidden" name="numFourthRowhidden" value='5|'>
																					<input type="hidden" name="speSecondRowhidden" value='type1d spe_ex|type1d spe_hyphen|type1d spe_squot|type1d spe_bslash|type1d spe_qm|type1d spe_tilde|type1d spe_rcb|type1d spe_semico|type1d spe_scb|type1d spe_lt|type1d spe_ccb|'>
																					<input type="hidden" name="speThirdRowhidden" value='type1d spe_ep|type1d spe_asterix|type1d spe_per|type1d spe_hash|type1d spe_fslash|type1d spe_at|type1d spe_gt|type1d spe_comma|type1d spe_plus|type1d spe_equal|type1d spe_pipe|'>
																					<!-- <input type="button"   name="button9" id="button9" class="type3 shiftl"   onclick="func_shift(this)"  disabled> -->
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												
									
							
						</table>
					</td>
				</tr>
			</table>
	<!--		<iframe src="<%=request.getContextPath()%>/FullscreenSlitSlider/index.jsp" style="height: 280px;width: 395px;"></iframe> -->
			
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
// alert("aaya");



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

</tiles:put>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<!--  -->
</tiles:insert>
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