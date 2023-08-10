<%@ include file="/common/Include.jsp" %>
<%@ page import="org.apache.struts.action.ActionErrors,org.apache.struts.action.ActionError, org.apache.struts.Globals, org.apache.struts.util.RequestUtils, java.util.Iterator, java.util.AbstractList" %>
<script language="JavaScript" src="/request/scripts/reqChk.js"></script>

   
<script>
var accountinfo;
var accountType; 
var jsoncbusrdata = ''; 
<%String userInfo1=(String)session.getAttribute("validToken");  
String usrName = (String)session.getAttribute("user");
String acsuserId[][] =null;
String parentCIBUserData[][] =null;
String login_id="",mobNO="",accountInfo="";
String userInfofromlogin[][]=null; 
if(session.getAttribute("userid")!=null){  
	login_id = (String)session.getAttribute("userid");
	System.out.println("snxw--------------------------"+login_id);
}
String  custRole=(String)session.getAttribute("custRole");
if(session.getAttribute("userInfo")!=null){
	userInfofromlogin = (String[][])session.getAttribute("userInfo");
	System.out.println("User Info Customer Id of Corporate Banking------>"+userInfofromlogin[0][8]);  
}
if(session.getAttribute("parentCIB")!=null)
{
	parentCIBUserData= (String[][])session.getAttribute("parentCIB");
	System.out.println("Corporate banking User Info------>"+parentCIBUserData[0][2]);  
}

if(session.getAttribute("acslist")!=null)
{
	acsuserId= (String[][])session.getAttribute("acslist");
	System.out.println("Corporate banking User Info------>"+acsuserId[0][1]);  
}

String  date=DateTimeFunction.getIbDateTime(); 
 	date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);
		
%> 
</script>
 
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>
<%if(request.getParameter("row")==null){ %>
<tiles:put name="menu" value="/common/user_left.jsp?mode=&src=corporatebanking"/>
<%}%>
<tiles:put name="menu" value="/common/user_left.jsp?mode=&src=corporatebanking"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/> 
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=corporatebanking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>
</tiles:put> 
<tiles:put name="content" type="String">

<body> 
<html:form action="/corporatebanking/AddNewUserAction"><br>
<%if(custRole.equals("F") || custRole.equals("S"))  // C - Retail user , F - Corporate user , S - Authorised Siognatory  cib auTH MENU
	{%>
<div border="10 px:solid" style="
    border: 1px solid black; 
    border-radius: 20px;
">
<table width = "100%"><tr><td align = "left">
<p  id = "label" ><u style="
    color: blue;
"> <B>Corporate Banking:Block User</B>  </td> 
</u>

</td >
<td align = "right"> <p><u style="
    color: blue;
"> <B><%=date%></B></td></tr>
</br>
<tr>
<td colspan = "2">
<p align = "left" bgcolor="blue" style="
    background-color: #cccccc;"> <b> Below form enable you to block entry user or  authorised signatories </b></p>
	</td>
	</tr>
	<tr>
<td align="center"> 
<div  style = "overflow:auto; height : 200px; ">
<table class="miniStmtBackBorder" width=527 cellspacing="0" cellpadding="0" >
<tr class="miniStmtBack">
<td align="center">
<table border="0" bordercolor="green" id="addTable" style="border-left:none;border-right:none;border-top:none;border-bottom:none;" >
<tr>
 
<%  
String userInfo[][]=(String[][])session.getAttribute("userInfo");   
if(userInfo!=null)
{  
	%>
	<tr style = "display:none">
	<td  width="105px">Corporate Banking Cust ID</td>
	<td  width="105px"><input type="text"  id="sCBUser_CustID" name="sCBUser_CustID" value = '<%=userInfofromlogin[0][8]%>'readonly></td>
	</tr>
	<tr>
	<td  width="105px"> <bean:message bundle="hindi" key= "1027"/></td>
	<td  width="105px"><input type="text"  id="sAccno" name="sAccno" readonly></td>
	</tr>
	
	<tr>
	<td width="105px"> <bean:message bundle="hindi" key= "20000"/></td>
	<td  width="105px"><input type="text"  id="sPrefCorpid" name="sPrefCorpid"  readonly ></td>
	</tr>

	<tr>
	<td width="105px"> <bean:message bundle="hindi" key= "20001"/></td>  
	<td  width="105px"><input type="text"  id="sPrefloginusrid" name="sPrefloginusrid"  readonly ></td>
	</tr>

	<tr>
	<td width="105px"> <bean:message bundle="hindi" key= "20002"/></td>
	<td  width="105px">
	<!--<input type="text" maxlength = "20"  id="suserid" name="suserid" value='' onChange = "checkUserID(this)" >-->
		<select name="suserid" Id="suserid">
			<option selected value='0'>--Select User Id--</option>
	 <% if (acsuserId != null ) {
	 for(int l=0;l<acsuserId.length;l++)	{
		String	acsId =acsuserId[l][1]; 
		String	acsName =acsuserId[l][4]; %>
	   <option value='<%=acsId%>'><%=acsName%> </option>
		<%} } else { %> 
		 <option value='--'>No user Found  </option> 
		 <% } %>
		</select>
	</td>
	</tr> 

	
	<tr id = "nametr" style = "display:none">
	<td width="105px"> <bean:message bundle="hindi" key= "20003"/></td>
	<td  width="105px"><input type="text"  id="sUserName" name="sUserName" maxlength = "30"  value='' ></td>
	</tr>
<script>
	document.getElementById("sAccno").value='<%=userInfo[0][0]%>';
	document.getElementById("sPrefloginusrid").value='<%=login_id%>';		
	document.getElementById("sPrefCorpid").value='<%=parentCIBUserData[0][2]%>';	
</script>
	

</table>
<!--ADRESS END-->

</div>
<table align="center" width=360 cellpadding="0" cellspacing="7" 
	id="tabela" border="0" bordercolor="red">
	<tr>
	
	<td>
	<input type="button"  name = "deletebtn" class = "Button" id = "delete" onClick="deleteUser()" tabindex="3" value="OK">
	</td>
	
	<td>
	<input  name = "Cancelbtn" value="<bean:message bundle='<%=lang%>' key='87'/> " id = "Cancelbtn" class = "Button" type="button" onclick="bacck()"/> 
	</td>	
  	
	</tr>
	
	</table>
	<div id="diverrmessage"><font face="verdana" color="red">
	<logic:messagesPresent property="DeactiveUser"><html:errors property="DeactiveUser"/></logic:messagesPresent> 
	<logic:messagesPresent property="insertStatus"><html:errors property="insertStatus"/></logic:messagesPresent> 
	</td></tr></table></table>
	</div>
	</table>


	<%}%>
	<%} else {%>
	No Operations found for entry user
<%	}%>
	</html:form>
	<script>
function deleteUser()
{
	    document.forms[0].action="/corporatebanking/AddNewUserAction.do?action=deleteCIBUsr";
		document.forms[0].method="Post";
		document.forms[0].submit();
	}

	function bacck()
{
	document.forms[0].action="/jsp/main_page.jsp";
	document.forms[0].submit();
}
</script>
	</body> 
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
	</tiles:insert>  