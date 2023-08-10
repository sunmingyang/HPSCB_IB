<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
<%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>

<% 
String sStatus = "";
if(session.getAttribute("vleLogin") != null)
{
	sStatus = (String)session.getAttribute("vleLogin");
	if(sStatus.equals("N"))
		sStatus="Authentication Failed";
	else
		sStatus="";
	session.removeAttribute("vleLogin");
}
%>
<script>  
 function fieldValidation(){
    // var branch = document.getElementById("sBranch").value;
     var user = document.getElementById("sUserCode").value;
     var pass = document.getElementById("sPass").value;

  

     if(user == null || user == ""){
		alert("Please enter User code");
		return false;
     }

     if(pass == null || pass == ""){
		alert("Please enter Password");
		return false;
     }
	 var txnpass=calcMD5(pass);
	 document.getElementById("encryptPass").value=txnpass;
	// var url="/jsp/login.do?actin=vleLogin&userCode="+user+"&branchCode="+&branch+"&pass="+pass2;
 }	
 function logout(){
	document.forms[0].action="/jsp/login.do?action=ibUsrLogout&from=vleLogin" ;
	document.forms[0].submit();
 }
</script>
<style>
.button1{
	cursor:pointer;height:25px;width:80px;border:none;font-size:12pt;
}
</style>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>VLE Login</title>
		<script language=JavaScript src="/scripts/MD5.js"> </script>
	</head>
	<body>
		<div style="text-align:center;width:100%;height:100%">
			<div style="text-align:center;width:100%">
				<img src="/images/MWBLogo.JPG" border=0 name=image width="60%" alt="Logo" />
			</div><br /><br />
			<div style="width:100%;height:20px;    background: rgb(19, 114, 195);">
				
			</div>
			<div style="width:100%;height:70%;text-align:center">
				<br /><br /><br />
				<form action ="/jsp/login.do?action=vleLogin" method="post">
					<table align="center" cellpadding = 2 width="30%"  height="50%" style="BORDER-TOP-STYLE: double; BORDER-RIGHT-STYLE: double;
					BORDER-LEFT-STYLE: double;BORDER-BOTTOM-STYLE: double; BORDER-TOP-COLOR: navy; BORDER-RIGHT-COLOR: navy; BORDER-LEFT-COLOR: navy; BORDER-BOTTOM-COLOR: navy;">
				
					<tr>
						<td colspan = 2 align="center" style="font-weight:bold;font-size:x-large;">
							LOGIN<br />
						</td>
					</tr>
						<tr>
						<td colspan = 2 align="center">
							<div id="diverrmessage" style="text-align:center"><font face="verdana" color="red">
							<center>	<logic:messagesPresent property="LogOut"><html:errors property="LogOut"/></logic:messagesPresent>
							</center></div>	
						</td>
					</tr>
					<tr>
						<td class="headerTD" align="right" style="font-weight: bold;font-size: 13px;">User Code: </td>
						<td align="center">
							<input type="text" name="sUserCode" id="sUserCode" maxlength="50">
						</td>
					</tr>
					<tr>
						<td class="headerTD" align="right" style="font-weight: bold;font-size: 13px;">Password: </td>
						<td align="center">
							<input type="password" name="sPass" id="sPass" maxlength="50">
							<input type="hidden" name="encryptPass" id="encryptPass" maxlength="50">
						</td>
					</tr>
					<tr><td></td></tr>
					<tr>
						<td colspan = 2 align="center">
							<input type="submit" value="Login Me" onClick="fieldValidation()" class="button1">
							
						</td>
					</tr>
					<tr>
						<td colspan =2 align="center" style="color:red"><%=sStatus%></td>
					</tr>
					</table>
				</form>
			</div>
			<div style="width:100%;height:20px;background:blue;">
			
			</div>
			<img src="/images/foot.gif"  name=image  alt="footer" height="30px" width="80px"/>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<img src="/images/foot.gif"  name=image  alt="footer" height="30px" width="80px"/>
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<img src="/images/foot.gif"  name=image  alt="footer" height="30px" width="80px"/>
		</div>
<!-- <table width="100%"><tr><td align="center"><INPUT type=image src="/images/MWBLogo.JPG" border=0 name=image width="60%"></td></tr></table>
<table width="100%" height="10%"><tr><td align="center"></td></tr></table>
<center><h2>Login</h2>
<form action ="/vle/vleData.do?action=Login" method="post">
<table cellpadding = 2 width="25%" align="center">
<tr>
	<td align="left">Branch Code: </td><td align="right"><input type="text" name="sBranch" id="sBranch" maxlength="10"></td>	
</tr>
<tr>
	<td align="left">User Code: </td><td align="right"><input type="text" name="sUserCode" id="sUserCode" maxlength="50"></td>
</tr>
<tr>
	<td align="left">Password: </td><td align="right"><input type="password" name="sPass" id="sPass" maxlength="50"></td>
</tr>
<tr><td></td></tr>
<tr>
	<td colspan = 2 align="center"><input type="submit" value="Login Me" onClick="fieldValidation()"></td>
</tr>
<tr>
	<td colspan =2 align="center"><%=sStatus%></td>
</tr>
</table>
<table height = "10%"><tr><td></td></tr></table>
<table  width="100%"><tr><td><INPUT type=image src="/images/lokMitra.jpg" border=0 name=image width="100%"></td></tr></table>
</form>
</center> -->
</body>
</html>
