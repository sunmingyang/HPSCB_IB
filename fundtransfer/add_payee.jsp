<%@ include file="/common/Include.jsp" %>
<%String usrName = (String)session.getAttribute("user");
String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
String sMode="",openFor="";
if(request.getParameter("sMode")!=null)
{
 sMode = request.getParameter("sMode");
System.out.print("sMode is:::::"+sMode);
}
if(request.getParameter("openFor")!=null)
{
openFor  = request.getParameter("openFor");
System.out.print("openFor is:::::"+openFor);
}
String custRole=(String)session.getAttribute("custRole");
%>
<script>
var url = "";
var openFor = '<%=sMode%>';
 
 var jspmode = '<%=openFor%>';
 var custrole='<%=custRole%>'; 
function helpopen()
{
	var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	window.open("/jsp/IBHelp.jsp?src=Ibtrans","child", bar);
}
function fillData(){
	document.getElementById("select1").checked=true
	selectValue();
} 
function check_Fund()
{
	 // alert(openFor+"::: "+url);
		disabledControlsOnAction(document.forms[0]);								 
		//document.forms[0].action="/fundtransfer/fund.do?action=AddPayeeAction";
	    document.forms[0].action= url; 
		document.forms[0].submit();

}
function selectValue(){
	 
	if(document.getElementById("select1").checked){
		document.getElementById("select1").value= "own"  // select
	 	if(openFor ==="CIBAuth" || openFor ==="CIBEdit")
		{
			url = "/fundtransfer/fund.do?action=AddPayeeAction&targetjsp=same&openFor="+jspmode+"&purpose=AddPayeeSB&sMode="+openFor; 
		} else {
		url = "/fundtransfer/fund.do?action=AddPayeeAction";
		} 
	} 
	else{
		document.getElementById("select2").value="other"  // select
		if(openFor ==="CIBAuth" || openFor ==="CIBEdit") 
		{
			url = "/fundtransfer/fund.do?action=AddPayeeAction&targetjsp=same&openFor="+jspmode+"&purpose=AddPayeeOB&sMode="+openFor; 
			 
		}  else {
			url = "/fundtransfer/fund.do?action=AddPayeeAction";
		}
	}

}
//function loadfun()
//{
//	alert("hello");
//	document.getElementById("cancelButton").focus();
//}
</script>
<BODY style="margin:0 0 0 0;" onload="fillData()" ><br><!-- onload="loadfun()"> -->

<tiles:insert page="../common/siteLayout.jsp" flush="true">
	<tiles:put name="title" value="Internet banking"/>
	<tiles:put name="header" value="/common/header.jsp"/>
	<tiles:put name="line" value="/common/line.html"/>
	<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
		<%if(sMode.equals("CIBAuth") || sMode.equals("CIBEdit")) {%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
		<%} else {%>
		<tiles:put name="menu" value="/common/user_left.jsp?src=fundtr"/>
		<%}%>
	<tiles:put name="page_header" type="String">
		&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
<bean:message bundle="hindi" key= "7022"/>
	</tiles:put>
	<tiles:put name="content" type="String">

<br>

 <html:form action="/fundtransfer/fund">
 <table>
	      
     <tr>
       <td width="1">
           <input type="radio" name="select" id="select1" value="own"  onclick="selectValue()">
		
			<bean:message bundle='hindi' key='7446'/>
		</td>
	 </tr>
	
	
		 <tr>
			 <td>
				 <input type="radio"  name="select" id="select2" value="other" onclick="selectValue()">
				  <bean:message bundle='hindi' key='7447'/>	  </td>
		  </tr>
	</table> 

<br><br><br>
<table>
	<tr>
	  <td>
		<input type="button" class="Button" name="cancelButton"  id="cancelButton" onclick="check_Fund()" style="width:100px"
				value='<bean:message bundle="hindi" key='844'/>'>
	   
		<input   value="   <bean:message bundle='<%=lang%>' key='33'/>    " class="Button" type="button" tabindex="5" style="width:100px"
	onclick="helpopen()"/>

	   </td>
	</tr>
</table>
 </html:form>
	
	</tiles:put>
	<tiles:put name="add" value="/Advertisement/add.jsp"/>
	<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert>
</body>