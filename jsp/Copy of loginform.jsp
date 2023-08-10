

<%@ include file="/common/Include.jsp" %>

<script language="JavaScript" src="/jsp/scripts/chng_pass.js">
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Login Page"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="menu" value="/common/login_leftHyperlink.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="page_header" type="String" >
	<bean:message bundle="hindi" key="7007" />
</tiles:put>
<tiles:put name="content" type="String">




<body onkeyDown="StopKeyHandler()" onload="onLoad()">

	<html:form action= "/jsp/login">
<br><br><br><br><br><br><br>
<br>
<br>
<table>
<%	if(request.getParameter("errno")!=null)
	{%>
		
		<tr>
			<td style="padding-left:80px" class="heading">
				Your Session is Expired, Please Login Again !!!
			</td>
		</tr>
<%}%>
</table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<%	if(request.getParameter("errno")!=null)
	{	%>
		<br><br>
		<tr>
			<td style="padding-left:80px" class="heading">
				<bean:message bundle='<%=lang%>' key='7419'/>!!!
			</td>
		</tr>
<%	}	%>
  <tr> 
	<td style="padding-left:85px" valign="middle" align=center>
	<div id="diverrmessage">
		<logic:messagesPresent property="Locked"><html:errors property="Locked"/></logic:messagesPresent>

		<logic:messagesPresent property="LogOut"><html:errors property="LogOut"/></logic:messagesPresent>

		<logic:messagesPresent property="Deactive"><html:errors property="Deactive"/></logic:messagesPresent>

		<logic:messagesPresent property="alreadyLogin"><html:errors property="alreadyLogin"/></logic:messagesPresent>

		<logic:messagesPresent property="WrongPass"><html:errors property="WrongPass"/></logic:messagesPresent>

		<logic:messagesPresent property="NoServer"><html:errors property="NoServer"/></logic:messagesPresent>
	</div>
<!-- 	<table  cellpadding="0" cellspacing="0" BORDER=1 width=327 bordercolor="brown" > -->
        <table  cellpadding="0" cellspacing="0" BORDER=1 width=327 bordercolor="#663399" >
		<tr> 
			<td align="center"> 
				<table cellpadding="0" cellspacing="0" width="100%" >
					<tr> 
						<td colspan="4" align="center" bgcolor="#663399">
							<font color="ffffff">Login </font> 
					    </td>
					</tr>
				    <tr> 
						<td colsapn="4">&nbsp;</td>
					</tr>
					<tr> 
						<td  style="padding-left:10px" width="450" class="simple"> <bean:message bundle="<%=lang%>" key= "603"/> : 
						</td>
						<td width="1">&nbsp;
						</td>
						<td width="2"> <html:text   property="sIbUsr_LogId" styleId="sIbUsr_LogId" size="15" tabindex="1" maxlength="15" 		onkeypress="javascript:isValidNumAlpha()"/>
						</td>
					</tr>
					<tr> 
						<td style="padding-left:10px"  class="simple" > <bean:message bundle="<%=lang%>" key= "100"/> : </td>
						<td width="1"></td>
		                <td><html:password   property="sIbUsr_LogPass" styleId="sIbUsr_LogPass" size="15"  tabindex="2" maxlength="15"/>
						</td>
                        <td width="22" rowspan="2"><input type="checkbox"  name="virtualpassword" onClick="virtualKey()" value="checkbox"></td>

					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr> 
						<td style="padding-left:120px"> 
							<input   value="   <bean:message bundle='<%=lang%>' key='86'/>    " class="Button" type="button" onclick="login_submit()"  tabindex="3"> 
						</td>
						<td width=2>&nbsp;</td>
						<td></td>
						<td width="3">&nbsp;</td>
					</tr>
				</table>
			</td>
        </tr>
	</table>

<!--     New Added on 11/07/2008 By Ajay -->
	

		  <table width="300" border="0" cellspacing="0" cellpadding="0">
                <tr>

                  <td><table width="290" border="0" cellpadding="0" cellspacing="1" bgcolor="#ded7bd">
                      <tr>
                        <td align="left" bgcolor="#FFFFFF"><table width="300" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td style="padding-left:5px;font-family: Arial; font-size: 8pt; "><span style="font-family: Arial; font-size: 8pt; font-weight: bold; color:#a41c2b">Virtual Keyboard</span> (for entering password only)</td>
                            </tr>
                            <tr>

                              <td align="center" style="padding-top:10px;padding-bottom:5px"><table width="290" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td align="center"><table  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
              <td >
             <input type="button"  value="v" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('V');}"  disabled >
           <input type="button"  value="k" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('K');}"  disabled >
           <input type="button"  value="e" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('E');}"  disabled >
           <input type="button"  value="w" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('W');}"  disabled >

           <input type="button"  value="j" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('J');}"  disabled >
           <input type="button"  value="h" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('H');}"  disabled >
           <input type="button"  value="y" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Y');}"  disabled >
           <input type="button"  value="q" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Q');}"  disabled >
           <input type="button"  value="l" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('L');}"  disabled >
           <input type="button"  value="f" name="button1" id="button1"  class="type1d"  onkeypress="return func_spaceBarProhibit(event);"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('F');}"  disabled >
           </td><td style="width:10px"></td><td>
		   <input type="button" value="7"  name="number1" id="number1"  class="type1d"
		   onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('7');}" disabled >
          <input type="button" value="1"  name="number1" id="number1"  class="type1d"
		   onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('1');}" disabled >

          <input type="button" value="4"  name="number1" id="number1"  class="type1d"
		   onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('4');}" disabled >
          
          </td>
         </tr>
          <tr >
          <td>
        
    <input type="button"  value="b"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('B');}" disabled >
    
    <input type="button"  value="o"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('O');}" disabled >
    
    <input type="button"  value="g"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('G');}" disabled >
    
    <input type="button"  value="p"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('P');}" disabled >

    
    <input type="button"  value="x"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('X');}" disabled >
    
    <input type="button"  value="r"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('R');}" disabled >
    
    <input type="button"  value="a"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('A');}" disabled >
    
    <input type="button"  value="t"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('T');}" disabled >
    
    <input type="button"  value="u"  name="button2" id="button2" class="type1d" onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('U');}" disabled >
 </td><td style="width:10px"></td><td>
 <input type="button"  value="8"  name="number2"  id="number2" class="type1d" 
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('8');}" disabled > 

  <input type="button"  value="2"  name="number2"  id="number2" class="type1d" 
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('2');}" disabled > 

  <input type="button"  value="6"  name="number2"  id="number2" class="type1d" 
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('6');}" disabled > 

  
 </td>

 </tr>
   <tr>
  <td>
     
 <input type="button" value="z"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('Z');}" disabled >

    
 <input type="button" value="n"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('N');}" disabled >

    
 <input type="button" value="i"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('I');}" disabled >

    
 <input type="button" value="d"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('D');}" disabled >

    
 <input type="button" value="s"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('S');}" disabled >

    
 <input type="button" value="m"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('M');}" disabled >

    
 <input type="button" value="c"  name="button3" id="button3" class="type1d"  onkeypress="return func_spaceBarProhibit(event)"  onclick="func_spaceBarProhibit(event);if(isSpace){func_click('C');}" disabled >

 </td><td style="width:10px"></td><td>
  

<input type="button"  value="3"  name="number3" id="number3"  class="type1d" 
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('3');}" disabled >
 

<input type="button"  value="0"  name="number3" id="number3"  class="type1d" 
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('0');}" disabled >
 


<input type="button"  value="9"  name="number3" id="number3"  class="type1d" 
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('9');}" disabled >
 

 </td>
 </tr>
 <tr>
  <td>
    
 <input type="button"  value="$"  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('$');}" disabled >
    
 <input type="button"  value="&"  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('&');}" disabled >
    
 <input type="button"  value=":"  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(':');}" disabled >
    
 <input type="button"  value="^"  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('^');}" disabled >

    
 <input type="button"  value="{"  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('{');}" disabled >
    
 <input type="button"  value="."  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('.');}" disabled >
    
 <input type="button"  value="_"  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('_');}" disabled >
    
 <input type="button"  value="("  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('(');}" disabled >
    
 <input type="button"  value="&#34;"  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('dQuot');}" disabled >
    
 <input type="button"  value="["  name="button4" id="button4" class="type1d"  
 onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('[');}" disabled >
 </td><td style="width:10px"></td><td style="padding-left:22px">

  
<input type="button"  value="5"  name="number4" id="number4"  class="type1d" 
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('5');}" disabled >  
 

 </td>

  </tr>
   <tr>
   <td colspan="3">
    
<input  type="button"  value="!"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('!');}" disabled >
    
<input  type="button"  value="-"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('-');}" disabled >
    
<input  type="button"  value="'"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('sQuot');}" disabled >
    
<input  type="button"  value="\"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('bslash');}" disabled >
    
<input  type="button"  value="?"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('?');}" disabled >
    

<input  type="button"  value="~"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('~');}" disabled >
    
<input  type="button"  value=")"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(')');}" disabled >
    
<input  type="button"  value=";"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(';');}" disabled >
    
<input  type="button"  value="]"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(']');}" disabled >
    
<input  type="button"  value="<"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('<');}" disabled >
    
<input  type="button"  value="}"  name="button5" id="button5"  class="type1d"
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('}');}" disabled >
 

 </td>
  </tr>
 <tr>

 <td colspan="3">
    
<input  type="button" value="`"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('`');}" disabled >
    
<input  type="button" value="*"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('*');}" disabled >
    
<input  type="button" value="%"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('%');}" disabled >
    
<input  type="button" value="#"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('#');}" disabled >
    
<input  type="button" value="/"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('/');}" disabled >
    
<input  type="button" value="@"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('@');}" disabled >
    
<input  type="button" value=">"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('>');}" disabled >
    

<input  type="button" value=","  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click(',');}" disabled >
    
<input  type="button" value="+"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('+');}" disabled >
    
<input  type="button" value="="  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('=');}" disabled >
    
<input  type="button" value="|"  name="button10" id="button10"  class="type1d"  
onkeypress="return func_spaceBarProhibit(event)" onclick="func_spaceBarProhibit(event);if(isSpace){func_click('|');}" disabled >
 

 </td>
  </tr>
                                   <tr>
                                    <td colspan="3">
  
  <input type="button"  name="button6" id="button6"  class="type2d" value="Back Space"  onclick="func_back()" disabled>

  
  <input type="button"  name="button7" id="button7"  class="type3d" value="Clear" onclick="func_clear()"  disabled >
 

  <input type="button"   name="button8" id="button8" class="type2d" value="Caps Lock" onclick="func_capslock(this)" disabled>

 <input type="hidden" name="test" value="false" >

 <input type="hidden" name="test" value="false" >
 <input type="hidden" name="charFirstRowhidden" value='V|K|E|W|J|H|Y|Q|L|F|'>
 <input type="hidden" name="numFirstRowhidden" value='7|1|4|'>
 <input type="hidden" name="charSecondRowhidden" value='B|O|G|P|X|R|A|T|U|'>
 <input type="hidden" name="numSecondRowhidden" value='8|2|6|'>

 <input type="hidden" name="charThirdRowhidden" value='Z|N|I|D|S|M|C|'>
 <input type="hidden" name="numThirdRowhidden" value='3|0|9|'>
 <input type="hidden" name="speFirstRowhidden" value='type1 spe_dol|type1 spe_amp|type1 spe_co|type1 spe_exp|type1 spe_cob|type1 spe_fs|type1 spe_underscore|type1 spe_rob|type1 spe_dquot|type1 spe_sob|'>
 <input type="hidden" name="numFourthRowhidden" value='5|'>
 <input type="hidden" name="speSecondRowhidden" value='type1 spe_ex|type1 spe_hyphen|type1 spe_squot|type1 spe_bslash|type1 spe_qm|type1 spe_tilde|type1 spe_rcb|type1 spe_semico|type1 spe_scb|type1 spe_lt|type1 spe_ccb|'>
 <input type="hidden" name="speThirdRowhidden" value='type1 spe_ep|type1 spe_asterix|type1 spe_per|type1 spe_hash|type1 spe_fslash|type1 spe_at|type1 spe_gt|type1 spe_comma|type1 spe_plus|type1 spe_equal|type1 spe_pipe|'>

<!-- <input type="button"   name="button9" id="button9" class="type3 shiftl"   onclick="func_shift(this)"  disabled> -->
  </td>
                                  </tr>

                                    </table></td>
                                  </tr>
                              </table></td>
                            </tr>
                        </table></td>
                      </tr>
                  </table></td>
                </tr>

<tr>
			<td style="padding-left:190px" class="simple"><br> 
					<!-- <a href="forget_pass.jsp" class="nav">Forget password</a></td></tr> -->
			</td>
		</tr>
	</table>
</html:form>

<script language="JavaScript">
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
 function virtualKey(){

		 if(document.forms[0].virtualpassword.checked){

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

			 for(i=0;i<firstNewRow.length-1;i++){
	       	   document.forms[0].button1[i].className='type1';
	         }

			 secondNewRow =secondNewRowSplit.split("|");
		      for(i=0;i<secondNewRow.length-1;i++){
	       		   document.forms[0].button2[i].className='type1';
	          }
			 thirdNewRow =thirdNewRowSplit.split("|");
		     for(i=0;i<thirdNewRow.length-1;i++){
	       		   document.forms[0].button3[i].className='type1';
	         }
			 fourthNewRow =fourthNewRowSplit.split("|");
		     for(i=0;i<fourthNewRow.length-1;i++){
	       		   document.forms[0].number1[i].className='type1';
	         }

			 fifthNewRow =fifthNewRowSplit.split("|");
		     for(i=0;i<fifthNewRow.length-1;i++){
	       		  document.forms[0].number2[i].className='type1';
	         }

			 sixthNewRow =sixthNewRowSplit.split("|");
		     for(i=0;i<sixthNewRow.length-1;i++){
	       		   document.forms[0].number3[i].className='type1';
	         }

			 seventhNewRow =seventhNewRowSplit.split("|");
		      for(i=0;i<seventhNewRow.length-1;i++){

				document.forms[0].button4[i].className='type1';

              }
			  eigthNewRow =eigthNewRowSplit.split("|");
		      document.forms[0].number4.className='type1';

			 ninthNewRow =ninthNewRowSplit.split("|");
			 for(i=0;i<ninthNewRow.length-1;i++){

				document.forms[0].button5[i].className='type1';
	         }

			 tenthNewRow =tenthNewRowSplit.split("|");
		     for(i=0;i<tenthNewRow.length-1;i++){
	       	   document.forms[0].button10[i].className='type1';
	         }


		    document.forms[0].button6.className="type2";
			document.forms[0].button7.className="type3";
            document.forms[0].button8.className="type2";
           // document.forms[0].button9.className="type3 shift";




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


	     }else{


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

			 for(i=0;i<firstNewRow.length-1;i++){
	       	   document.forms[0].button1[i].className='type1d';
	         }

			 secondNewRow =secondNewRowSplit.split("|");
		      for(i=0;i<secondNewRow.length-1;i++){
	       		   document.forms[0].button2[i].className='type1d';
	          }
			 thirdNewRow =thirdNewRowSplit.split("|");
		     for(i=0;i<thirdNewRow.length-1;i++){
	       		   document.forms[0].button3[i].className='type1d';
	         }
			 fourthNewRow =fourthNewRowSplit.split("|");
		     for(i=0;i<fourthNewRow.length-1;i++){
	       		   document.forms[0].number1[i].className='type1d';
	         }

			 fifthNewRow =fifthNewRowSplit.split("|");
		     for(i=0;i<fifthNewRow.length-1;i++){
	       		  document.forms[0].number2[i].className='type1d';
	         }

			 sixthNewRow =sixthNewRowSplit.split("|");
		     for(i=0;i<sixthNewRow.length-1;i++){
	       		   document.forms[0].number3[i].className='type1d';
	         }

			 seventhNewRow =seventhNewRowSplit.split("|");
		      for(i=0;i<seventhNewRow.length-1;i++){

				document.forms[0].button4[i].className='type1d';

              }

			  eigthNewRow =eigthNewRowSplit.split("|");
		      document.forms[0].number4.className='type1d';


			 ninthNewRow =ninthNewRowSplit.split("|");
		     for(i=0;i<ninthNewRow.length-1;i++){
	       	    document.forms[0].button5[i].className='type1d';
	         }

			 tenthNewRow =tenthNewRowSplit.split("|");
		     for(i=0;i<tenthNewRow.length-1;i++){
	       	   document.forms[0].button10[i].className='type1d';
	         }

			document.forms[0].button6.className="type2d";
			document.forms[0].button7.className="type3d";
            document.forms[0].button8.className="type2d";
            



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
	       obj.className ='type2';
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

	          obj.className='type2caps';

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
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>







