<!DOCTYPE HTML>
<%@ include file="/common/Include.jsp"%>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/new_ui/IB_UI/css/style-1.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/new_ui/IB_UI/common.css" />

		<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">

		<title>Internet Banking | HPSCB Bank</title>
		<script src="<%=request.getContextPath()%>/new_ui/IB_UI/js/js-image-slider.js" type="text/javascript"></script>
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
		   function Ecodepwd(){
			   var sPwd = calcMD5(document.getElementById("sIbUsr_LogPass").value);
			   var sSessionId='<%=session.getId()%>';
			   document.getElementById("password").value = sPwd;
			}
		</script>
	</head>
	<body onkeyDown="StopKeyHandler()"   >
		<div class="clearfix">
			<div id="main-container">
				<div id="sub-container">
					<div class="top-bar">
						<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/animation_new.jpg" alt="bank_Logo" style="float:left;"/>
						The H.P. STATE CO-OPERATIVE BANK LTD.
					</div>
					<p style="clear: both;">&nbsp;</p>
					<p style="clear: both;">&nbsp;</p>
					<!-- <div id="content"></div>  -->
				</div>
				<div class="middleContainer main-content clearfix" align="center">
					<div style="width: 975px; /*float: left; margin-left: -189px;*/ height: 495px;">
						<div class="news-ticker" style="margin-top: 0px; background: #fff;border:none;">
							<div class="middleContainer clearfix">
								<h4	style="line-height: 10px; font-size: 18px; color: #000; padding-left: 15px;  text-align: center;">
									Login to Internet Banking
								</h4>
							</div>
						</div>
					<div align="center"><form>
							
						<div style="width: 50%; float: left;">
							<p style="clear: both;">&nbsp;</p>
							<p class="loginrow">
							<span>
								<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/BackgroundImage_BottomShadow_1.png" alt="shadow1" title="shadow1" height="12" width="370" class="shadow1" id="Image2481247" border="0">
							</span>
							</p>
							<p>
								<span> <img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/u16_original.png"
									alt="Lock" title="Lock" height="20" width="20"
									class="lock_image" id="Image11381011" border="0">
								</span> <span class="simpletext2"> <label for=" " id="LabelForControl16117102"
									title="Login to Internet Banking" class="simpletext2">
										Login to Internet Banking </label>
								</span>
							</p>
							<% if (request.getParameter("errno") == null) {
							%>
								 <p style="clear: both;">&nbsp;</p> <%}%>
							<div id="diverrmessage" style="font-family:cursive; color:red;font-size:medium;"> 
									<logic:messagesPresent	property="Locked">
										<html:errors property="Locked" />
									</logic:messagesPresent> <logic:messagesPresent property="LogOut">
										<html:errors property="LogOut" />
									</logic:messagesPresent> <logic:messagesPresent property="Deactive">
										<html:errors property="Deactive" />
									</logic:messagesPresent> <logic:messagesPresent property="alreadyLogin">
										<html:errors property="alreadyLogin" />
									</logic:messagesPresent> <logic:messagesPresent property="WrongPass">
										<html:errors property="WrongPass" />
									</logic:messagesPresent> <logic:messagesPresent property="NoServer">
										<html:errors property="NoServer" />
									</logic:messagesPresent>
							</div> 
							<table>
									 <%
										if (request.getParameter("errno") != null) {
									%>
									<tr>
										<td style="padding-left: 80px;font-size:12px;/*color:blue;*/" class="need_help_container" >
											<%=request.getParameter("errno") %><font face="verdana"> <bean:message bundle='<%=lang%>'	key='7419' />
												!!!
											</font>
									
										</td>
									</tr>
									<%
										}
									%> 
									<tr>
										<td width="400px" align="left">
											<table style="width:100%;">
												<tr>
													<td class="tableRowText" >User ID :</td>
													<td>
														<input type="text" name="sIbUsr_LogId"	id="sIbUsr_LogId" size="30" tabindex="1" maxlength="15"
														onkeypress="javascript:isValidNumAlpha()" style="height:20px;" />
													</td>
												</tr>
												<tr>
													<td class="tableRowText">Password :</td>
													<td id="password_td">
														<input type="password" name="sIbUsr_LogPass"
														id="sIbUsr_LogPass" size="25" tabindex="2" maxlength="15" style="height:20px;" />
														<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/v-keyboard.png" alt="Virtual Key Board" title="Virtual Key Board" id="virtual_keyboard_password" border="0" onclick="virtualKey(event)" style="cursor: pointer;" tabindex="3" onkeypress="return virtualKey(event)">
														<img src="" alt="Show Password" title="Show Password" id="Show_Password" border="0" onclick="showPassword()" style="cursor: pointer;" tabindex="4" onkeypress="return showPassword(event)">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td align="left">
											<table style="width:100%">
												<tr>
													<td colspan="1">
														<input value="Login" class="ibButton" type="button" name="ok"
														onclick="login_submit()" tabindex="5">
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
								<input type="hidden" name="sMacAdd" id="sMacAdd" /> 
								<input type="hidden" name="password" id="password" />
								<div style="text-align:left;">
									<table id="vKeyboard" style="background: gray;display: none;margin:-35px 0 0 160px;border:1px solid black;width:430px;" cellspacing="0" cellpadding="0">
									<tr>
										<td class="keyPadHeading" align="center">
											Virtual Keypad(Only for Password) 
											<input type="button" name="buttonclose" id="buttonclose" onclick="disableKeyPad()"  style="cursor: pointer;width:20px;background: url(<%=request.getContextPath()%>/new_ui/IB_UI/images/delete_icon.gif) no-repeat;border:none;">
										</td>
									</tr>
									<tr>
										<td 
											style="padding-top: 5px; padding-bottom: 5px; border-top: 0">
											<table border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td >
														<table border="0" bordercolor="red" cellspacing="4"
															cellpadding="0">
															<tr>
																<td style="width:300px;"><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="v" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('V');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="k" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('K');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="e" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('E');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="w" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('W');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="j" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('J');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="h" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('H');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="y" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Y');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="q" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Q');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="l" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('L');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="f" name="button1"
																	id="button1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event);"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('F');}"
																	disabled></td>
																<td style="width: 10px"></td>
																<td style="width: 100px"><input type="button" value="7"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" name="number1"
																	id="number1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('7');}"
																	disabled> <input type="button" value="1"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" name="number1"
																	id="number1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('1');}"
																	disabled> <input type="button" value="4"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" name="number1"
																	id="number1" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('4');}"
																	disabled></td>
															</tr>
															<tr>
																<td><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="b" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('B');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="o" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('O');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="g" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('G');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="p" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('P');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="x" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('X');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="r" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('R');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="a" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('A');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="t" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('T');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="u" name="button2"
																	id="button2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('U');}"
																	disabled></td>
																<td style="width: 10px"></td>
																<td><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="8" name="number2"
																	id="number2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('8');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="2" name="number2"
																	id="number2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('2');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="6" name="number2"
																	id="number2" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('6');}"
																	disabled></td>
															</tr>
															<tr>
																<td><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="z" name="button3"
																	id="button3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Z');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="n" name="button3"
																	id="button3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('N');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="i" name="button3"
																	id="button3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('I');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="d" name="button3"
																	id="button3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('D');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="s" name="button3"
																	id="button3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('S');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="m" name="button3"
																	id="button3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('M');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="c" name="button3"
																	id="button3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('C');}"
																	disabled></td>
																<td style="width: 10px"></td>
																<td><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="3" name="number3"
																	id="number3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('3');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="0" name="number3"
																	id="number3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('0');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="9" name="number3"
																	id="number3" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('9');}"
																	disabled></td>
															</tr>
															<tr>
																<td><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="$" name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('$');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="&" name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('&');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value=":" name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click(':');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="^" name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('^');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="{" name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('{');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="." name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('.');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="_" name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('_');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="(" name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('(');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="&#34;"
																	name="button4" id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('dQuot');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="[" name="button4"
																	id="button4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('[');}"
																	disabled></td>
																<td style="width: 10px"></td>
																<td style="padding-left: 22px"><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="5" name="number4"
																	id="number4" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('5');}"
																	disabled></td>
															</tr>
															<tr>
																<td colspan="3"><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="!" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('!');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="-" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('-');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="'" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('sQuot');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="\" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('bslash');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="?" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('?');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="~" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('~');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value=")" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click(')');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value=";" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click(';');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="]" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click(']');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="<"  name="button5" id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('<');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="}" name="button5"
																	id="button5" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('}');}"
																	disabled></td>
															</tr>
															<tr>
																<td colspan="3"><input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="`"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('`');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="*"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('*');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="%"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('%');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="#"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('#');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="/"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('/');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="@"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('@');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value=">"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('>');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value=","
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click(',');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="+"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('+');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="="
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('=');}"
																	disabled> <input type="button"
																	onMouseOver="setBorder(this)"
																	onMouseOut="resetBorder(this)" value="|"
																	name="button10" id="button10" class="type1d"
																	onkeypress="return func_spaceBarProhibit(event)"
																	onclick="func_spaceBarProhibit(event);if(isSpace){func_click('|');}"
																	disabled></td>
															</tr>
															<tr>
																<td colspan="3" align="center"><input type="button"
																	onMouseOver="setBorder1(this)"
																	onMouseOut="resetBorder1(this)" name="button6"
																	id="button6" class="type2d" value="Back Space"
																	onclick="func_back()" disabled> <input
																	type="button" onMouseOver="setBorder1(this)"
																	onMouseOut="resetBorder1(this)" name="button7"
																	id="button7" class="type2d" value="Clear"
																	onclick="func_clear()" disabled> <input
																	type="button" onMouseOver="setBorder1(this)"
																	onMouseOut="resetBorder1(this)" name="button8"
																	id="button8" class="type2d" value="Caps Lock"
																	onclick="func_capslock(this)" disabled> <input
																	type="hidden" name="test" value="false"> <input
																	type="hidden" name="test" value="false"> <input
																	type="hidden" name="charFirstRowhidden"
																	value='V|K|E|W|J|H|Y|Q|L|F|'> <input
																	type="hidden" name="numFirstRowhidden" value='7|1|4|'>
																	<input type="hidden" name="charSecondRowhidden"
																	value='B|O|G|P|X|R|A|T|U|'> <input
																	type="hidden" name="numSecondRowhidden" value='8|2|6|'>
																	<input type="hidden" name="charThirdRowhidden"
																	value='Z|N|I|D|S|M|C|'> <input type="hidden"
																	name="numThirdRowhidden" value='3|0|9|'> <input
																	type="hidden" name="speFirstRowhidden"
																	value='type1d spe_dol|type1d spe_amp|type1d spe_co|type1d spe_exp|type1d spe_cob|type1d spe_fs|type1d spe_underscore|type1d spe_rob|type1d spe_dquot|type1d spe_sob|'>
																	<input type="hidden" name="numFourthRowhidden"
																	value='5|'> <input type="hidden"
																	name="speSecondRowhidden"
																	value='type1d spe_ex|type1d spe_hyphen|type1d spe_squot|type1d spe_bslash|type1d spe_qm|type1d spe_tilde|type1d spe_rcb|type1d spe_semico|type1d spe_scb|type1d spe_lt|type1d spe_ccb|'>
																	<input type="hidden" name="speThirdRowhidden"
																	value='type1d spe_ep|type1d spe_asterix|type1d spe_per|type1d spe_hash|type1d spe_fslash|type1d spe_at|type1d spe_gt|type1d spe_comma|type1d spe_plus|type1d spe_equal|type1d spe_pipe|'>
																	<!-- <input type="button"   name="button9" id="button9" class="type3 shiftl"   onclick="func_shift(this)"  disabled> -->
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											</div>
										</td>
									</tr>
								</table>
							</div>
							</form><p style="clear: both;">&nbsp;</p>
						
					<p class="loginrow" style="position:fixed;">
							<span>
								<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/BackgroundImage_BottomShadow_1.png" alt="shadow1" title="shadow1" height="12" width="370" class="shadow1" id="Image2481247" border="0">
							</span>
							</p>
						</div>
					<div class="width50percent_right_login" id="HDisplay1.Rowset3">

						<p style="clear: both;">&nbsp;</p>
						<p class="loginrow">
							<span>
								<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/BackgroundImage_BottomShadow_1.png" alt="shadow1" title="shadow1" height="12" width="370" class="shadow1" id="Image2481247" border="0">
							</span>
						</p>
						<p class="loginrow">
						<span class="need_help_container"><span
							class="need_help m_mayIHelpLoginPage" id="Caption18008857"
							title="May I help you?">May I help you?</span></span>
					</p>
					<p class="loginrow">
						<span >
							<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/new-user.png"	alt="New User" title="New User" height="22" width="22" border="0">
						</span>
						<span title="New User?">
							<a href="#" title="New User?" class="help_text" target="_self" tabindex="6">New User? </a>
						</span>
							<a href="#" title="Get User ID" class="help_text" target="_self" tabindex="7">Get UserID</a>
						</span>
					</p>
					<p class="loginrow">
						<span>
							&nbsp;&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/password.png"	alt="New User" title="New User" height="22" width="22" border="0">
						</span>
						<span title="Password?">
							<a href="#" title="Password?" class="help_text" target="_self" tabindex="8">Password? </a>
						</span>
						<span title="Get Password?">
							<a href="#" title="Get Password" class="help_text" target="_self" tabindex="9">Get Password</a>
						</span>
					</p>
					<p class="loginrow">
						<span style="font-size:large;font-weight:bolder;">
						&nbsp;&nbsp;	!&nbsp;
							<!-- <img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/password.png"	alt="New User" title="New User" height="22" width="22" border="0"> -->
						</span>
						<span title="Forgot Password?">
							<a href="#" title="Forgot Password?" class="help_text" target="_self" tabindex="10" onclick="showForm()">Forgot Password? </a>
						</span>
						<span title="Forgot Password?">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
					</p>
					
					<p style="clear: both;">&nbsp;</p>
					<p style="clear: both;">&nbsp;</p>
						
					<p class="loginrow">
						<span>
							<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/BackgroundImage_BottomShadow_1.png" alt="shadow1" title="shadow1" height="12" width="370" class="shadow1"  border="0">
						</span>
					</p>
						
					</div>
			
				</div>
			</div>
		</div>

	</div>

	<!-- style="margin-top: 1700px;font-size: small;background-color: #607D8B;color: black;" -->
	<footer>
		<div class="middleContainer" ></div>
	</footer>
</body>
</html>
<script language="JavaScript">
	function setBorder(o) {

		o.className = "setborder";

	}
	function resetBorder(o) {
		o.className = "resetborder";
	}
	function setBorder1(o) {

		o.className = "setborder1";

	}
	function resetBorder1(o) {
		o.className = "resetborder1";
	}
	function showKeyPadBenifit() {
		//alert("under progress !!!");
		window
				.open(
						"/common/Virtual_KB_Benefit.html",
						"Knowmore",
						"toolbar=0,location=0,directories=0,status=1,menubars=0,scrollbars=1,resizable=1,width=780,height=550,valign=top");
	}

	function showForgotPassword() {
		//alert("under progress !!!");
	}
	//var bankAppUrl = "https://10.15.1.129:8080/";
	//var flag=true;
	//function MM_openBrWindow(theURL,winName,features) { //v2.0

	//window.open(theURL,winName,features);

	//}
	function onLoad() {
		document.getElementById("sIbUsr_LogId").focus();
		<logic:messagesPresent property="Deactive">
		document.getElementById("diverrmessage").style.display = "block";
		</logic:messagesPresent>

		<logic:messagesPresent property="Locked">
		document.getElementById("diverrmessage").style.display = "block";
		</logic:messagesPresent>

		<logic:messagesPresent property="alreadyLogin">
		document.getElementById("diverrmessage").style.display = "block";
		</logic:messagesPresent>

		<logic:messagesPresent property="WrongPass">
		document.getElementById("diverrmessage").style.display = "block";
		</logic:messagesPresent>

		<logic:messagesPresent property="NoServer">
		document.getElementById("diverrmessage").style.display = "block";
		</logic:messagesPresent>

		<logic:messagesPresent property="LogOut">
		document.getElementById("diverrmessage").style.display = "block";
		</logic:messagesPresent>
	}
	function disableKeyPad() {

		var test = confirm("Virtual keyboard is recommended to protect your password. Are you sure you want to use normal keyboard?");
		if (test) {
			
			var firstNewRowSplit = document.forms[0].charFirstRowhidden.value;
			var secondNewRowSplit = document.forms[0].charSecondRowhidden.value;
			var thirdNewRowSplit = document.forms[0].charThirdRowhidden.value;
			var fourthNewRowSplit = document.forms[0].numFirstRowhidden.value;
			var fifthNewRowSplit = document.forms[0].numSecondRowhidden.value;
			var sixthNewRowSplit = document.forms[0].numThirdRowhidden.value;
			var seventhNewRowSplit = document.forms[0].speFirstRowhidden.value;
			var eigthNewRowSplit = document.forms[0].numFourthRowhidden.value;
			var ninthNewRowSplit = document.forms[0].speSecondRowhidden.value;
			var tenthNewRowSplit = document.forms[0].speThirdRowhidden.value;

			document.forms[0].sIbUsr_LogPass.value = "";
			document.forms[0].sIbUsr_LogPass.readOnly = false;

			flag = 'false';
			firstNewRow = firstNewRowSplit.split("|");

			document.forms[0].buttonclose.disabled = true;
			for (var i = 0; i < 10; i++) {
				document.forms[0].button1[i].disabled = true;
			}
			for (var i = 0; i < 9; i++) {
				document.forms[0].button2[i].disabled = true;
			}

			for (var i = 0; i < 7; i++) {
				document.forms[0].button3[i].disabled = true;
			}

			for (var i = 0; i < 3; i++) {
				document.forms[0].number1[i].disabled = true;

			}
			for (var i = 0; i < 3; i++) {
				document.forms[0].number2[i].disabled = true;
			}
			for (var i = 0; i < 3; i++) {
				document.forms[0].number3[i].disabled = true;
			}
			for (var i = 0; i < 10; i++) {
				document.forms[0].button4[i].disabled = true;

			}
			for (var i = 0; i < 11; i++) {
				document.forms[0].button5[i].disabled = true;

			}
			for (var i = 0; i < 11; i++) {

				document.forms[0].button10[i].disabled = true;

			}

			document.forms[0].number4.disabled = true;
			document.forms[0].button6.disabled = true;
			document.forms[0].button7.disabled = true;
			document.forms[0].button8.disabled = true;
			//document.forms[0].button9.disabled=true;
			document.getElementById("vKeyboard").style.display="none";
		} else {

			document.forms[0].virtualpassword.checked = true;

		}

	}
	function virtualKey(event) {
		var keyCode = event.keyCode ? event.keyCode : event.which ? event.which
				: event.charCode;
		if(keyCode!=13 && (event.button!=0 && event.button!=1))
			return;
		if (document.getElementById('vKeyboard').style.display == 'block') {
			var  val=document.getElementById("sIbUsr_LogPass").value;
			disableKeyPad();
		//	document.getElementById('vKeyboard').style.display = 'none';
			document.getElementById("sIbUsr_LogPass").value=val;
			return false;
		} else if (document.getElementById('vKeyboard').style.display == 'none')
			document.getElementById('vKeyboard').style.display = 'block';
		var firstNewRowSplit = document.forms[0].charFirstRowhidden.value;
		var secondNewRowSplit = document.forms[0].charSecondRowhidden.value;
		var thirdNewRowSplit = document.forms[0].charThirdRowhidden.value;
		var fourthNewRowSplit = document.forms[0].numFirstRowhidden.value;
		var fifthNewRowSplit = document.forms[0].numSecondRowhidden.value;
		var sixthNewRowSplit = document.forms[0].numThirdRowhidden.value;
		var seventhNewRowSplit = document.forms[0].speFirstRowhidden.value;
		var eigthNewRowSplit = document.forms[0].numFourthRowhidden.value;

		var ninthNewRowSplit = document.forms[0].speSecondRowhidden.value;
		var tenthNewRowSplit = document.forms[0].speThirdRowhidden.value;

		document.forms[0].sIbUsr_LogPass.readOnly = true;
		document.forms[0].sIbUsr_LogPass.value = "";

		firstNewRow = firstNewRowSplit.split("|");

		document.forms[0].buttonclose.disabled = false;
		for (var i = 0; i < 10; i++) {
			document.forms[0].button1[i].disabled = false;

		}

		for (var i = 0; i < 9; i++) {
			document.forms[0].button2[i].disabled = false;
		}

		for (var i = 0; i < 7; i++) {
			document.forms[0].button3[i].disabled = false;
		}

		for (var i = 0; i < 3; i++) {
			document.forms[0].number1[i].disabled = false;

		}
		for (var i = 0; i < 3; i++) {
			document.forms[0].number2[i].disabled = false;

		}
		for (var i = 0; i < 3; i++) {
			document.forms[0].number3[i].disabled = false;

		}

		for (var i = 0; i < 10; i++) {

			document.forms[0].button4[i].disabled = false;
		}
		for (var i = 0; i < 11; i++) {

			document.forms[0].button5[i].disabled = false;
		}
		for (var i = 0; i < 11; i++) {

			document.forms[0].button10[i].disabled = false;
		}

		document.forms[0].number4.disabled = false;
		document.forms[0].button6.disabled = false;
		document.forms[0].button7.disabled = false;
		document.forms[0].button8.disabled = false;
		//document.forms[0].button9.disabled=false;

	}
	var isSpace = true;
	function func_spaceBarProhibit(event) {

		var keyCode = event.keyCode ? event.keyCode : event.which ? event.which
				: event.charCode;

		if ((keyCode == "32") || (keyCode == "13")) {
			alert("Please use mouse only for virtual keybord!!!");
			isSpace = false;
			return false;
		}
		isSpace = true;
		return true;
	}
	var flag = 'false';
	function func_clear() {
		document.forms[0].sIbUsr_LogPass.value = "";
	}

	function func_capslock(obj) {

		var firstRowSplit = document.forms[0].charFirstRowhidden.value;
		var secondRowSplit = document.forms[0].charSecondRowhidden.value;
		var thirdRowSplit = document.forms[0].charThirdRowhidden.value;

		if (flag == 'true') {
			flag = 'false';
			obj.className = 'type2d';
			firstRow = firstRowSplit.split("|");

			for (i = 0; i < firstRow.length - 1; i++) {
				document.forms[0].button1[i].value = firstRow[i].toLowerCase();
			}
			secondRow = secondRowSplit.split("|");
			for (i = 0; i < secondRow.length - 1; i++) {
				document.forms[0].button2[i].value = secondRow[i].toLowerCase();
			}
			thirdRow = thirdRowSplit.split("|");
			for (i = 0; i < thirdRow.length - 1; i++) {
				document.forms[0].button3[i].value = thirdRow[i].toLowerCase();
			}
		} else {

			flag = 'true';

			obj.className = 'type2d';

			firstRow = firstRowSplit.split("|");
			for (i = 0; i < firstRow.length - 1; i++) {
				document.forms[0].button1[i].value = firstRow[i];
			}

			secondRow = secondRowSplit.split("|");
			for (i = 0; i < secondRow.length - 1; i++) {
				document.forms[0].button2[i].value = secondRow[i];
			}

			thirdRow = thirdRowSplit.split("|");
			for (i = 0; i < thirdRow.length - 1; i++) {
				document.forms[0].button3[i].value = thirdRow[i];
			}

		}

	}

	function func_back() {
		var j = document.forms[0].sIbUsr_LogPass.value;
		document.forms[0].sIbUsr_LogPass.value = j.substring(0, j.length - 1);

	}
	function func_click(obj) {
		if (obj == 'sQuot') {
			obj = obj.replace(/sQuot/, '\'');
		}
		if (obj == 'dQuot') {
			obj = obj.replace(/dQuot/, '\"');
		}
		if (obj == 'bslash') {
			obj = obj.replace(/bslash/, '\\');

		}

		var i = obj;

		if (flag == 'true') {
			var j = document.forms[0].sIbUsr_LogPass.value + i.toUpperCase();
			document.forms[0].sIbUsr_LogPass.value = j;

		} else {

			var j = document.forms[0].sIbUsr_LogPass.value + i.toLowerCase();
			document.forms[0].sIbUsr_LogPass.value = j;

		}

	}
	function showPassword(){
		var pass=document.getElementById("sIbUsr_LogPass");
		var val=pass.value;
		if(val==""){
			alert("Please Enter Password");
			pass.focus();
			return false;
		}
		if(pass.type=="password"){
			sHTML="<input type=\"text\" name=\"sIbUsr_LogPass\" value='"+val+"'"+
				  "id=\"sIbUsr_LogPass\" size=\"25\" tabindex=\"2\" maxlength=\"15\" readOnly=\"true\" style=\"color:white;background-color:black;height:20px;\" />";
		}
		else{
			sHTML="<input type=\"password\" name=\"sIbUsr_LogPass\" value='"+val+"'"+
				  "id=\"sIbUsr_LogPass\" size=\"25\" tabindex=\"2\" maxlength=\"15\"  style=\"color:black;background-color:white;height:20px;\" />";
		}
		sHTML+='<img src="<%=request.getContextPath()%>/new_ui/IB_UI/images/v-keyboard.png" alt="Virtual Key Board" title="Virtual Key Board"'+
			'id="virtual_keyboard_password" border="0" onclick="virtualKey(event)" style="cursor: pointer;" tabindex="3" onkeypress="return virtualKey(event)">'+
			'<img src="" alt="Show Password" title="Show Password" id="Show_Password" border="0" onclick="showPassword()" style="cursor: pointer;" tabindex="4" '+'onkeypress="return showPassword(event)">';
		document.getElementById("password_td").innerHTML=sHTML
	}
		
</script>

<style type="text/css">
.textbox {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #000000;
	text-decoration: none;
	border: 1px solid #999999;
	height:200px;ke
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

.tableHeader {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 8pt;
	font-weight: bold;
	color: #92610E;
	text-decoration: none;
}

.tableHeaderLinkInfo {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9pt;
	font-weight: bold;
	color: #92610E;
	text-decoration: none;
}

.tableRowText {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 8pt;
	font-weight: bold;
	color: #092771;
	text-decoration: none;
}

.rowLink1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	font-weight: bold;
	color: #A61404;
	text-decoration: none;
	cursor:pointer;
}

.rowLink2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
	font-weight: normal;
	color: black;
	text-decoration: none;
}

.rowLink3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
	font-weight: normal;
	color: #092771;
	text-decoration: none;
	cursor:pointer;
}

.rowLink4 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 8pt;
	font-weight: bold;
	color: black;
	text-decoration: none;
	cursor:pointer;
}

.keyPadHeading {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10pt;
	font-weight: bold;
	color: white;
	text-decoration: none;
	border-bottom: 0;
}

type1d {
	cursor: pointer;
}

</style>

<script type="text/javascript">

var message="Due to security reason,Right Click is not allowed.";

function clickIE4(){
alert("clickIE4");
if (event.button==2){

alert(message);

return false;

}

}

function clickNS4(e){
alert("clickNS4");

if (document.layers||document.getElementById&&!document.all){

if (e.which==2||e.which==3){

alert(message);

return false;

}

}

}

if (document.layers){
alert("in 1");

document.captureEvents(Event.MOUSEDOWN);

document.onmousedown=clickNS4;

}

else if (document.all&&!document.getElementById){
alert("in 2");

document.onmousedown=clickIE4;

}
//document.oncontextmenu=new Function("alert(message);return false")

</script>
