<%@ include file="/common/Include.jsp" %> 
<script language="JavaScript" src="/scripts/MD5.js"></script> 
<link rel = "stylesheet" href="/scripts/table.css"  type = "text/css"/>
<script language="JavaScript" src="corpfundtransfer/scripts/corpfund.js"></script>    
<%
String accountList="" ; 
String [] AccListArr= null ; 
String openFor="",custRole="",userid="";
userid = (String)session.getAttribute("userid");
if (session.getAttribute("allAccountlist") != null ) { 
	accountList=(String)session.getAttribute("allAccountlist");
	System.out.println("FundAccountList----------------"+accountList);
	AccListArr =accountList.split(",");
}

String  date=DateTimeFunction.getIbDateTime();
		String time[]=date.split(" ")[1].split(":");
		date=date.substring(8,10)+"/"+date.substring(5,7)+"/"+date.substring(0,4);

String mob=(String)session.getAttribute("customerMobile");
int errorcount=0; 
String usrName = "";   
String fundinfo[][] = null ;
if(request.getParameter("mode")!=null && request.getParameter("mode").equals("S"))
	fundinfo = (String[][])session.getAttribute("FUNDINFO_S");   
else if(request.getParameter("mode")!=null && request.getParameter("mode").equals("O"))
	fundinfo = (String[][])session.getAttribute("FUNDINFO_O");   
else 
	fundinfo = (String[][])session.getAttribute("FUNDINFO");   


if(session.getAttribute("user") != null)
	usrName = (String)session.getAttribute("user");

String login_id="";
if(session.getAttribute("userid")!=null){
	login_id = (String)session.getAttribute("userid");//New changes on 16/07/2008;
}
String sessionId= session.getId() ;

String res="";
if(session.getAttribute("response") != null)
{
	res= (String)session.getAttribute("response");
}
String accNo="";
if(session.getAttribute("beneaccountNo") != null)
{
	accNo= (String)session.getAttribute("beneaccountNo");
}
String mode=(String)session.getAttribute("VALUE");

System.out.println("mode is ----------------"+mode);
session.removeAttribute("VALUE");
custRole=(String)session.getAttribute("custRole");

    System.out.print("session Attribute is not null and value is ::::"+(String)session.getAttribute("openFor"));
    session.removeAttribute("openFor");
    System.out.print("session Attribute value is ::::"+(String)session.getAttribute("openFor"));
   

if(request.getParameter("jspopenFor") != null) {
	 openFor = request.getParameter("jspopenFor");
  System.out.print("PAram jspopenFor is :::"+request.getParameter("jspopenFor"));
}

//String sPendingListJson=(String)session.getAttribute("sVoucherData");
String aPendingListarr[][] =(String[][])session.getAttribute("aVoucherData");
session.removeAttribute("aVoucherData");
// set fund Transfer mode
String sfundTranMode="" ;
if(session.getAttribute("FUNDINFO_O") != null) { 
	sfundTranMode = "OtherBank";
	System.out.println("Fund Transfer Mode is  "+mode); 
	System.out.println("sfundTranMode is  "+sfundTranMode); 
	session.removeAttribute("FUNDINFO_O"); 

} 
if(session.getAttribute("FUNDINFO_S") != null) {
	sfundTranMode = "SameBank";
	System.out.println("Fund Transfer Mode is "+mode); 
	System.out.println("sfundTranMode is  "+sfundTranMode);
	session.removeAttribute("FUNDINFO_S");
}


// purpose come when Authorization data arrive at JSP and it is use  SameBank etc
if(session.getAttribute("purpose") != null) { 
	sfundTranMode = (String)session.getAttribute("purpose");
	System.out.println("purpose is "+sfundTranMode);
	session.removeAttribute("purpose"); 
}

String purp = request.getParameter("purpose");
	System.out.println("purpose is --------"+purp); 
if(sfundTranMode!=null) {
	mode=sfundTranMode ; // assign mode (P2P /P2A to sFtran and send this to Action)
	System.out.println("Mode is not null here and value is::"+sfundTranMode); 
}

String impsmode = (String)request.getParameter("mode");
System.out.println("Mode from URL for IMPS is::"+impsmode); 

String sMod = (String)request.getParameter("sMode");
System.out.println("sMode  from URL(Oper/Auth) is::"+sMod); 
// added by  geetika
if(mode!=null && mode.equals(""))
{
	mode = impsmode;
}
%>  
 
<script>	
var sTranMode = '<%=sfundTranMode%>'; // FUNDINFO_S -samebank ;FUNDINFO_O --> Otherbank 
// alert("sTranMode"+sTranMode);
var custrole='<%=custRole%>';
var jspOpenFor = '<%=openFor%>'; // A--> authorization ,then, disable some fiels; E--> Edit
var sMode='<%=sMod%>'; // operation / CIBAuth 
var impsMode = '<%=impsmode%>';
// alert("open for "+ '<%=openFor%>');
var pur = '<%=purp%>';  
//alert("pur:::"+ '<%=purp%>');
var mytotalJsonString = '';
// alert("open for "+ '<%=openFor%>');
</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=fundtr"/>
<tiles:put name="menu" value="/common/user_left.jsp?src=corporatebanking"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>
<html:form action="/TransactionAction.do">
<body onload = "fill()" style="margin:0 0 0 0;" ><br>
<input type = "hidden" id = "userid" value ='<%=login_id%>'>

<% if(custRole.equals("F") || custRole.equals("S")) { %>
			<table id = "acctbl">
			<tr>
							<td style="width:50%">
								Acc No. From
							</td>
							<td>
								<select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo" style="width:150" id="accList" onChange="mobileNo()">
							<% 	if (AccListArr != null)
										for(int i=0;i<AccListArr.length;i++){%>
										 <option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
										<%}%>
								</select>  
							</td> 
						</tr>
						</table>
			<% if(aPendingListarr != null) {
			 %>
		
  <div border="10 px:solid" style="
    border: 1px solid black;
    border-radius: 20px;">
<table width = "98%">
<tr>
<td align = "left">
<td>
<p  id = "label">
</td>
<td align = "right"> <p><u style="color: blue;"> <B><%=date%></B></td>
</tr>&nbsp;
<tr>				
<td colspan = "2">
<p align = "left" bgcolor="blue" id = "label" style="
    background-color: #cccccc;"> <b> Link below  enable you to edit/authorise transactions.</b></p>
</td>
</tr>
				<script>
					if(sMode==='CIBAuth'){
			    	document.getElementById("label").innerHTML='<u style="color: blue;"> <B>Authorise Fund  Transfer</B></u>';
					} else if(sMode==='CIBEdit')
					{
				   document.getElementById("label").innerHTML='<u style="color: blue;"> <B>Edit Fund  Transfer</B></u>';
					} 
					</script>
				<div style="height:1px;overflow:auto"> 
				<table  border="1" bordercolor="#ffffff" align="center" id = "table" style="width: 50%; table-layout: fixed;" cellpadding="0" cellspacing="0">	<tr>    
				<TD class="dataTableTH " width = "50px">
				<bean:message bundle="hindi" key= "357"/></TD>
				<TD class="dataTableTH" width = "50 px ">
				<bean:message bundle="hindi" key= "1710"/></TD> 
				<td class="dataTableTH" width = "105px "><bean:message bundle="hindi" key= "7086"/></td>
				<!-- <td  class="dataTableTH" width = "105px "> <bean:message bundle="hindi" key= "7088"/></td> -->
				<td class="dataTableTH" width = "105px "> <bean:message bundle="hindi" key= "7085"/></td>
				<td class="dataTableTH" width = "105px "> <bean:message bundle="hindi" key= "7453"/></td>
				<td class="dataTableTH" width = "105px "><bean:message bundle="hindi" key= "39"/></td>	
				<td class="dataTableTH" width = "105px "><bean:message bundle="hindi" key= "345"/></td>
				<td class="dataTableTH" width = "105px "><bean:message bundle="hindi" key= "1013"/></td>
				<td class="dataTableTH" width = "105px ">Remitance Account</td>
				<td class="dataTableTH" width = "25px "><bean:message bundle="hindi" key= "216"/></td>
				</tr> 	

				<% for(int i=0;i<aPendingListarr.length;i++) {%>
					<tr>
					<td class="dataTableTD">
					<input style="background-color:#BFBFBF;" name="sOut_req" type="checkbox" id="checkbox<%=i%>"  value="screen"  name="1" onclick="setUserId(this)"></td>
					<td class="dataTableTD"><%=i+1%></td>
					<td class="dataTableTD"><%=aPendingListarr[i][1]%> </td>
					<!-- <td class="dataTableTD"><%=aPendingListarr[i][9]%> </td> -->
					<td class="dataTableTD"><%=aPendingListarr[i][0]%> </td>
					<td class="dataTableTD"><%=aPendingListarr[i][2]%> </td> 
					<td class="dataTableTD"><%=aPendingListarr[i][3]%> </td>
					<td class="dataTableTD"><%=aPendingListarr[i][4]%> </td>
					<td class="dataTableTD"><%=aPendingListarr[i][6]%> </td>
					<td style ="display:none" class="dataTableTD"> <%=aPendingListarr[i][8]%> </td>
					<td class="dataTableTD"> <%=aPendingListarr[i][11]%> </td>
					<td style="dataTableTD">
					<img src="images/editButton.png" alt="Edit" onclick = "editform(this);"/>
					</td>    

					<input type ="hidden" name="sessionID" id="sessionID" value="" >
					<input type ="hidden" name="sessionID" id="sessID" value="'<%=sessionId%>'" >
											
					</tr></tbody>
					<%} %> </table>
					
					<!--Page Buttons --> 
<table id = "btntable" align="center" style=" margin-left: 340px;" >

	<tr id = "trtxn" colspan = "4">
	<TD class="dataTableTH">Enter Transaction Password</TD>
	<TD class="dataTableTH"><input type = "password" id = "txnpass" ></TD> <!--Name-->
   </tr>

<tr><td colspan = "4">
<input type="button" class = "Button"  id = "send" value="Authorize" onclick="authorizeTran();" />

<input type="button" class = "Button" value="Reject Entry" id = "reject" onclick="rejectEntry();" /> 

<html:button property="back" styleClass = "Button" styleId = "back"  onclick="bacck()" >
<bean:message bundle="hindi" key='843'/></html:button>


</td></tr> 
		</table>	

<!--EDit tble -->
<table border="2" bordercolor="#ffffff" align="center"  cellpadding="0" cellspacing="0" id="edittable"  style="display:none;margin-left: 340px;">
	<tr class="dataTableTH" ><td colspan = "2"><bean:message bundle="hindi" key= "2075"/></td></tr>
	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "1027"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtaccno"  onchange = "checkAccFormat(this.value,this.id)"></TD> <!--Name-->
	</tr>
   <tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "9"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtname" onchange = "checkWildcard(this)" ></TD> <!--Name-->
  </tr>
   <tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7453"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtifcs" maxlength = "11" onchange = "checkWildcard(this)" ></TD> <!--Name-->
</tr>
   	<tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "7409"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text" id = "edtamnt" onchange = "checkamt(this.value,this.id)" ></TD> <!--Name-->
   </tr>
   <tr>
	<TD class="dataTableTH"><bean:message bundle="hindi" key= "345"/></TD> <!--Name-->
	<TD class="dataTableTH"><input type = "text"  maxlength = "50"id = "edtremark" ></TD> <!--Name-->
   </tr>
 <TD class="dataTableTH">Enter Transaction Password</TD>
	<TD class="dataTableTH"><input type = "password" id = "etxnpass" ></TD> <!--Name-->
   <tr>
	 <input type = "hidden" id = "edtblktrd">
	 <TD class="dataTableTH" colspan = "2" >
	 <input type = "button" class = "button" id = "editbtn" value = "Edit" onclick = "editInfo('samebank');">
	 <input type = "button" class = "button"  value = "Back" onclick = "editinfoback(pur);">
	</TD>
	</tr> 
   
</table> </table>

<!--EDit tble -->
					<% } else { %> 
					<div id="table_message" style="display:none;color:red;font-weight:bold;font-size:15px;">
		            	No Transactions Pending for authorization
		</div>
					
					<%}%>
		
		<br> 
		        <input type ="hidden" name="mode" id="mode" value="<%=mode%>" >				
            	<input type ="hidden" name="sessionID" id="sessionID" value= "" >
				<input type ="hidden" name="sessionID" id="sessID" value="'<%=sessionId%>'" >
				<input type ="hidden" name="payeeMob" id="payeeMob" >
				<input type ="hidden" name="IFSCcode" id="IFSCcode" >
				<input type ="hidden" name="tDate" id="tDate" value="<%=date%>" >
				<input type ="hidden" name="fundkid" id="fundkid" >
<% if(!(aPendingListarr!=null)) { %>
		  <script>
           document.getElementById("btntable").style.display = 'none';
	      </script>
<%}%>
<div id = "cbrespdiv" style="height:150px;overflow:auto">
</div>	
<% } %>
					</body>
					</html:form>
					</tiles:put>
					</html:form>
     				</tiles:insert>


					<script>
					
					function setUserIdOld(id)
					{
						document.getElementById("fundkid").value=id;
					} 

function fill(){

	<%if(openFor.equals("A")){%>
				document.getElementById("acctbl").style.display = "none";  //accDiv
			<%} else {%>
				 document.getElementById("accDiv").style.display = "block"; 
				 document.getElementById("schTime_hr").value="<%=time[0]%>";
				 document.getElementById("schTime_min").value="<%=time[1]%>";
				// document.getElementById("schTime_sec").value="<%=time[2]%>";
		         document.getElementById("isSchedule").value="N";
			<%}%>
}
					</script>


