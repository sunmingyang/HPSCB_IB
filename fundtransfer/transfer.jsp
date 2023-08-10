

<%@ include file="/common/Include.jsp" %>
<%@ page import ="easycbs.bancmateib.fundtransfer.actionform.FundForm" %>

<%! String[] str2;%>
<%
if(session!=null)
{	
	System.out.println("hi ashish ");
	String str1=(String)session.getAttribute("forvalueonjsp");
	if(str1!=null)
	{
	System.out.println("value of str1="+str1);
	str2=str1.split(",");
    System.out.println("hi from "+str2[0]);
    System.out.println("hi to "+str2[1]);
    session.removeAttribute("forvalueonjsp");
	}
} 
  
%>



<% 
  
  String[][] account=null;
 
 %>

<script>

//alert("Msg__"+'<bean:message bundle="<%=lang%>" key = "7235"/>');
var labelArray = new Array(2);	
//labelArray = split('<bean:message bundle="<%=lang%>" key = "7235"/>',' ');
labelArray = ('<bean:message bundle="<%=lang%>" key = "7235"/>').split(' ');
//alert("1___"+labelArray);
//alert("2___"+labelArray[0]);
//alert("3___"+labelArray[1]);

function check_transfer()
{

	var fromIndex=document.getElementById("sUsrList1").selectedIndex;
	var toIndex=document.getElementById("sUsrList").selectedIndex;
	
	if(document.getElementById("isAmount").value=="")
	{
		alert("Entries Incomplete");
		return;
	}
	if(document.getElementById("sUsrList").options[toIndex].id != document.getElementById("sUsrList1").options[fromIndex].id)
	{
			alert("Both Currency Should Be Same");
			return;
	}
	if(document.getElementById("sUsrList").value == document.getElementById("sUsrList1").value)
	{
			alert("Can't Transfer in Same Account");
			return;
	}
	if(document.getElementById("isPassword").value=="")
	{
		alert("Entries Incomplete");
		return;
	}
	if(document.getElementById("isEnglishDescription").value=="")
	{
		alert("Entries Incomplete");
		return;
	}
	if(document.getElementById("isAmount").value!="" &&
		document.getElementById("isPassword").value!="")
	{
		//disabledControlsOnAction(document.forms[0]);
	    document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=pay" ;
	    document.forms[0].submit();
	}
	
}

	
	
function fillOnLoadData()
{

	//alert("on load")
	
	

	<logic:messagesPresent property="password">
		document.getElementById("diverrmessage").style.display ="block";
		document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>
	

	//var labelArray = new Array();
	//labelArray = ('<bean:message bundle="<%= lang %>" key = "7235"/>').split(" ");
	//document.getElementById("nameH").innerHTML = labelArray[0];
	//document.getElementById("nameE").innerHTML = labelArray[1];
	
	

	<%
		FundForm form =(FundForm)session.getAttribute("Form");
		if(form != null){
	%>
		document.getElementById("sUsrList1").value = "<%=form.getIsHiddenAccFrom()%>";
		document.getElementById("sUsrList").value = "<%=form.getIsHiddenAccTo()%>";

	<%
			session.removeAttribute("Form");
				
		}

		 if(session.getAttribute("account")!=null)
		 {
			account=(String[][])session.getAttribute("account");
			System.out.println(" no of accounts "+account.length);
			//session.removeAttribute("account");
		 }

	 for(int i1=0 ;i1<account.length;i1++)
	{for(int j1=0 ;j1<account[i1].length;j1++)
	{System.out.println(" Data is 5555 "+account[i1][j1]);}
System.out.println("2@@@@@@@@@@@@@@@@@@@@@ ");
	}

	%>
	

 document.getElementById("isEnglishDescription").value="";
    document.getElementById("isPassWord").value="";
	document.getElementById("isAmount").focus();
	//document.getElementById("sUsrList1").focus(); 

}//________FUNCTION ENDS HERE__________
	

function Back()
{    
	disabledControlsOnAction(document.forms[0]);
	document.forms[0].action="../fundtransfer/fund.do?action=performTransAction&&button=back";
	document.forms[0].submit();
}
</script>

 <BODY onLoad="fillOnLoadData()"> 

<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Internet banking"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line1.html"/>
	<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
	<tiles:put name="page_header" type="String">
		<bean:message bundle="hindi" key= "7022"/>
	</tiles:put>
	<tiles:put name="content" type="String">
<br>   

<html:form action="/fundtransfer/fund.do">
	

<input type="hidden"  id="isHiddenAccFrom" name="isHiddenAccFrom" />
<input type="hidden"  id="isHiddenAccTo" name="isHiddenAccTo" />

	<table border="1" cellpadding="0" cellspacing="0" bgcolor=#FDE4E3 id="first">        
		<tr>
			<td>
			 <bean:message bundle="hindi" key='2393'/>

				<html:select  property="sUsrList1" style="width:200" styleId="sUsrList1">
						<% if(account!=null)
							   {
								for (int j=0;j<account.length;j++)
									{%>

										<html:option  styleId="<%=account[j][1]%>"  value = '<%= account[j][4] %>'>
											<%=account[j][7]%>
										</html:option>

							<%}}%>
								
							</html:select> 
			</td>

			<td>
				<bean:message bundle="hindi" key='2394'/>&nbsp
				<html:select tabindex="" property="sUsrList" style="width:200" styleId="sUsrList">
						<% if(account!=null)
							   {
								for (int j=0;j<account.length;j++)
									{%>

										<html:option styleId="<%=account[j][1]%>"  value = '<%=account[j][4]%>' >
											<%=account[j][7]%>
										</html:option>

							<%}}%>
								
				</html:select> 
			</td>
			
		  </tr>
		  
		

		<tr>
			<td>
				<bean:message bundle="hindi" key= "39"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<html:text property="isAmount" styleId="isAmount" size="20"
				 maxlength="9"  value=".00" style="text-align:right" onkeypress="isValidNumber()"/>
			</td>
		</tr>	

		<tr>
			<td>
			 	English Desc.
				<html:text property="isEnglishDescription" styleId="isEnglishDescription"  maxlength="35" size="50"/>

			</td>
			
		</tr>	


		<tr>
			<!-- <td><bean:message bundle="<%= lang %>" key="7235"/> -->

			<td>
				<!-- <label id="nameH"></label> -->
				<script>document.write(labelArray[0])</script>
				<br>
				<!-- <label id="nameE"></label> -->
				<script>document.write(labelArray[1])</script>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<html:password property="isPassWord" styleId="isPassWord" size="30" 
					onkeypress="isValidNumAlpha()"/>
			</td>
		 </tr>
	    
	</table>

	<br><br>	
	
	<table>
	    <tr>
			<td>						
				<input type="button" name="pay" id="pay" class="Button"  onclick="check_transfer()" 
						value='<bean:message bundle="hindi" key="7021"/>' style="width:100px"> 

				<input type="button" name="back" class="Button"  onclick="Back()"
					value='<bean:message bundle="hindi" key="843"/>' style="width:100px">
			</td>
		</tr>

	</table>

<br><br><br>
<table>
<tr>
<td><font color="#6600CC"><h4>FUND TRANSFFER STATUS </h2></font> </td>
<td> </td>
</tr>
</table>


  <table border="1" bordercolor="#33CCFF" width="40%">
  <tr>
  <td> From Account Transaction id :</td>
  <td>
  <%
  if(str2!=null)
  {
  %>
<%=str2[0]%>
<%
  }
%>

  </td>
  </tr>
<br>
  <tr>
  <td> To Account Transaction id :</td>
  <td>
  <%
  if(str2!=null)
  {
  %>
<%=str2[1]%>
<%
  }
%>

  </td>
  </tr>
  </table>



	 

	 <script>
		var ind = 0;
		var errorArrayText= new Array();
		//alert("errors");
		<html:messages id = "Errors" property = "sAccNoTo" bundle='<%=errorLang%>'>
			errorArrayValue[ind] = "sAccNoTo";
			errorArrayText[ind] = '<bean:write name = "Errors" />'
			ind = ind + 1;
		</html:messages>
		
		<html:messages id = "Errors" property = "sAccNoFrom" bundle='<%=errorLang%>'>
			errorArrayValue[ind] = "sAccNoFrom";
			errorArrayText[ind] = '<bean:write name = "Errors" />'
			ind = ind + 1;
		</html:messages>
		
		<html:messages id = "Errors" property = "sAmount1" bundle='<%=errorLang%>'>
			errorArrayValue[ind] = "dAmount";
			errorArrayText[ind] = '<bean:write name = "Errors" />'
			ind = ind + 1;
		</html:messages>
		
		<html:messages id = "Errors" property = "sYstemerror" bundle='<%=errorLang%>'>
			errorArrayValue[ind] = "sYstemerror";
			errorArrayText[ind] = '<bean:write name = "Errors" />'
			ind = ind + 1;
		</html:messages>
		
		//alert(errorArrayText.length);
		
		if(errorArrayText.length > 0){
			
			//alert("Condition is true ");
			
			document.write("<TABLE id = \"ErrorTab\" >");
			document.write("<TR>");
			document.write("<font color='RED'>");
			document.write("<TD style=\"WIDTH:750px;\" rowspan = 2 align = top class = ErrorTab>");
			document.write("<A id = 'ErrorId' class = \"ErrorLink\" "
			+ " onClick = \"javascript:goToErrorControl()\">1. " 
				+ errorArrayText[0] + "</A>");
			
			document.write("<input type = 'hidden' name = 'hiddenIndex' value = 0>");
			document.write("</font>");
			document.write("</TD>");
			document.write("<TD style=\"WIDTH:10px\" nowrap>");
			document.write("<img class = 'Image' src='/images/down.gif'"
				+ " onclick = 'goToPrevious()'>");
			document.write("</TD>");
			document.write("<TD rowspan = 2>");
			document.write("<input type = text name = sCount readonly size = 7"
				+ " value = \"1 OF " + errorArrayText.length + "\">");
			document.write("</TD>");
			document.write("</TR>");
			document.write("<TR>");
			document.write("<TD>");
			document.write("<img class = 'Image' src='/images/up.gif'"
				+ " onclick = 'goToNext()'>");
			document.write("</TD>");
			document.write("</TR>");
			document.write("</TABLE>");
		}
	</script>





<table>
	<tr>
	<td align="left" valign="bottom" >
	<div id ="errorhead" style="display:none;">
		<label > <u><font ><bean:message bundle= '<%= lang %>' key="1808"/></u></label>
	</div>
	</td></tr>
</table>

<table width="80%" align="center">
	<tr><td>
	<div id="diverrmessage" style="display:none">
	<select name="errormessage"id="errormessage" size="2" style="background-color:'#800000'; COLOR:'#FFFFFF';FONT-SIZE:11px; WIDTH:400px;">
	<logic:messagesPresent property="password" >
		<option value="password">
		&nbsp;<html:errors property="password"/>
		</option>
	</logic:messagesPresent>
	
	</select>
	</div>
	</td></tr>
</table>


</html:form>
 </BODY>

</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>

<script>
	
	<logic:messagesPresent property="password">
			document.getElementById("diverrmessage").style.display ="block";
			document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>

	<logic:messagesPresent property="SourceBranchNotConnected">
			document.getElementById("diverrmessage").style.display ="block";
			document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>
	<logic:messagesPresent property="TargetBranchNotConnected">
			document.getElementById("diverrmessage").style.display ="block";
			document.getElementById("errorhead").style.display = "block";
	</logic:messagesPresent>
</script>
