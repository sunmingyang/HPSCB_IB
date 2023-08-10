<%@ page import="easycbs.bancmateib.common.dto.BMConfig" %>
<%
String src="1";
String src1="1";
String menumode = "";
if(request.getParameter("src")!=null){
	src=(String)request.getParameter("src");
}
if(request.getParameter("src1")!=null){
	src1=(String)request.getParameter("src1");
}

String chatUrl= (String)BMConfig.getProperty("CHATURL");
String userId = (String)session.getAttribute("userid");

if(request.getParameter("menumode")!=null){
	menumode=(String)request.getParameter("menumode");
	System.out.println("menu mode in menu_tab.jsp is this -->"+menumode);
}
String usrInfo[][] = (String[][])session.getAttribute("userInfo");//0-accNo,1-brnCode,2-brnStatus,3-appserver
	String brnCode="";
	if(usrInfo!=null)
	if(usrInfo[0][1]!=null)
brnCode=usrInfo[0][1];
	request.setAttribute("brnCode",brnCode);
	String url="" , pcurl="" ; 

url = easycbs.bancmateib.common.dto.BMConfig.getProperty("PROMPTMEURL"); 
url = url+"?App=IB&client=700&Token="+easycbs.bancmateib.common.util.ApplicationToken.getTokenNo()+"&userId="+userId;  
pcurl = easycbs.bancmateib.common.dto.BMConfig.getProperty("PRECISECART","http://198.38.85.31:8290/PreciseCart/");
 
pcurl = pcurl+"otherAppLogin.action?App=IB&client=700&Token="+easycbs.bancmateib.common.util.ApplicationToken.getTokenNo()+"&userId="+userId; 

String newMenu= easycbs.bancmateib.common.dto.BMConfig.getProperty("NewMenu");
StringBuilder cssMenu=(StringBuilder)session.getAttribute("newMenu");
System.out.println("cssMenu="+cssMenu);
String custRole=(String)session.getAttribute("custRole");
if(custRole==null)
custRole="";
 	
%>
<style>
.tabMenu{
    padding-right: 0px ;
}
</style>
 <!-- "sm-blue" menu theme -->
 <link href="<%=request.getContextPath()%>/menu/css/sm-blue.css"
 rel="stylesheet" type="text/css" />
<script type="text/javascript"
 src="<%=request.getContextPath()%>/menu/js/jquery.js"></script>
 <script type="text/javascript"
 src="<%=request.getContextPath()%>/menu/js/jquery.smartmenus.js"></script>
 <script type="text/javascript"
 src="<%=request.getContextPath()%>/menu/js/jquery.smartmenus.keyboard.js"></script>
<link href="<%=request.getContextPath()%>/menu/css/sm-core-css.css"
 rel="stylesheet" type="text/css" />

<script>    
  $(function() {
  	var lvlno='<%=session.getAttribute("lvlNo_Menu")%>';
  	var lvlno1='<%=session.getAttribute("lvlNo_subMenu")%>';
 	if(lvlno!="null")
  		document.getElementById(lvlno+"_menu").className="tabMenu1";
 		if(lvlno1!="null")
  			document.getElementById(lvlno1+"_subMenu").className="tdformenu";
   	});
   
   function getClassName(id){
	    var table=document.getElementById("menuTab");
	    var rowCount=table.rows.length;
	    var colCount=table.rows[0].cells;
	    for(var i=0;i<colCount.length;i++)
    	{
	     var td=table.rows[0].cells[i];
	     td.className="tabMenu";
	  	}
	  document.getElementById(id+"_menu").className="tabMenu1";
   }
    
    function formopen(menunext,src) {
	    var url = "/IBMenu.do?action=openServlet&menuNext="+menunext+"&lvlno="+src;
	    document.forms[0].action=""+url;
	    document.forms[0].method="post";
	    document.forms[0].submit();
	    return ;
   }
    function callUrl(link) {
  	link+="?App=IB&client=700&Token=<%=easycbs.bancmateib.common.util.ApplicationToken.getTokenNo()%>&userId=<%=userId%>";
  	thirdPartyUrl(link);
    //window.location.href=src;
   }
   </script>
   
   	<%
	if(newMenu.equals("Y")){%>
    <%=cssMenu%>

 <%} else  { %>
 	
<table width=100% height=100% cellspacing=0 cellpadding=0>
<tr style="bgcolor:transparent">
<td>
<table height="100%" cellspacing=0 cellpadding=0 >
	<tr >
	<%
	if(newMenu!=null && newMenu.equals("Y")){%>
  <td>
    <%=cssMenu%>
   </td>
 <%}
 else if(custRole.equals("A")){%>
   <td
   <% out.println(src.equals("recharge_billPayment")? "class='tabMenu1'":"class='tabMenu'");%>>
   <a href="/TransactionAction.do?action=feeCollection">Fee Collection</a>
  </td>
  <%}
 else
	if(menumode.equals("su"))
	{%>
		<td 
		 <% out.println(src1.equals("zoRoMasterEntry")? "class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/openaction.do?src=create">User Operation</a>
		</td>
		<td  <%out.println(src1.equals("userReqStatus")?"class='tabMenu1'":"class='tabMenu'");%>>
			 <a href="/IBReqProcess/ibreqProcess.do?action=fetchRequests&flag=first" > 
			<!-- <a href="/IBReqProcess/IbreqProcess.jsp"> -->User Request Status</a>
		</td>
		<!--
		<td class=nav>
			<a href="/UserInfoForAdmin.do?action=firstExecute"  >Login/Logout History</a>
		</td>
		<td  class=nav><font size="3px">
			<a href="/mail/mailComposeAction.do?action=executeOnLoad" >Mailing Services</a></font>
		</td><!-- Write Mail To User
	 -->
		<td  <%out.println(src1.equals("reports")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/openaction.do?src=statuslog">Reports</a>
		</td>
		<td  <%out.println(src1.equals("addbranch")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/openaction.do?src=addeditbranch"  >Add Branch</a>
		</td>
		<td  <%out.println(src1.equals("showerror")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/openaction.do?src=showerror">Add-Show Errors</a>
		</td>

		<td  <%out.println(src1.equals("mailbox")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/Mail/inbox.jsp?menumode=<%=menumode %>&src1=<%=src1 %>&src=<%=src %>">Mail Box</a>
		</td>
	<!-- 	<td <%out.println(src1.equals("showerror")?"class='tabMenu1'":"class='tabMenu'");%>>
			&nbsp;		&nbsp;		&nbsp;		&nbsp;
		</td>
		<td <%out.println(src1.equals("showerror")?"class='tabMenu1'":"class='tabMenu'");%>>
			&nbsp;		&nbsp;		&nbsp;		&nbsp;&nbsp;
		</td> -->
		
		<!--<td class=nav><font size="3px">
			<a href="/openaction.do?src=toptentransaction">Last-Ten Transaction</a>
			</font>
		</td>
		<td class=nav><font size="3px">
			<a href="/openaction.do?src=dayendoperation"> Day End Operation</a>
			</font>
		</td>
		<td class=nav>
			<a href="/jsp/AdminCreation.jsp">Account </a>
		</td>-->
		
		<%}else{%>
		<td  <%out.println(src.equals("acc")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/accsum/accSum.jsp">
			Accounts Summary </a>
<!-- New Added By Abhishek Acharya -->
			
		</td>
		 <td class="tabMenu">
			<a href="/fundtransfer/fund.jsp">Fund Transfer</a>
		</td> 
		 <td class="tabMenu">
			<a href="/fundtransfer/agentTrn.jsp">Agent Fund Transfer</a>
		</td>
		
		<td  <%out.println(src.equals("req")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/openaction.do?src=debCard">Request</a>

		</td>
		<td  <%out.println(src.equals("accOpen")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/request/accOpen.jsp">Account Open</a>
		</td>
		<td  <%out.println(src.equals("application")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/request/LoanInterview.jsp">Loan Apply</a>

		</td>
		<td  <%out.println(src.equals("set")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/openaction.do?src=usridchange">Settings</a>

		</td>
		<!-- <td  <%out.println(src.equals("usridchange")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/openaction.do?src=usridchange">User Id Change</a>
<!-- 			/accsum/UseridChange.jsp 
		</td> -->
		<td  <%out.println(src.equals("corporatebanking")?"class='tabMenu1'":"class='tabMenu'");%>>
       		<a href="/bulktransfer/upload.jsp" >Corporate Banking</a>
     	</td>
		<td  <%out.println(src1.equals("mailbox")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="/Mail/inbox.jsp?menumode=<%=menumode %>&src1=<%=src1 %>&src=<%=src %>">Mail Box</a>
		</td>
		<td  <%out.println(src.equals("recharge_billPayment")?"class='tabMenu1'":"class='tabMenu'");%>>
     		<a href="/payment/billPay.jsp" >Bill Payment_Recharge</a>
    	</td>
		<td  <%out.println(src.equals("faq")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="javascript:thirdPartyUrl('<%=url%>')" >PromptMe</a>
		</td>
			<td  <%out.println(src.equals("faq")?"class='tabMenu1'":"class='tabMenu'");%>>
			<a href="javascript:thirdPartyUrl('<%=pcurl%>')" >PreciseCart</a>
		</td>
		<td  <%out.println(src.equals("adharUpdate")?"class='tabMenu1'":"class='tabMenu'");%>>
	     <a href="/AccountInfoAction.do?action=fetchAdharDetails" >Aadhar Update</a>
	    </td>
  		<td  <%out.println(src.equals("chat")?"class='tabMenu1'":"class='tabMenu'");%>> 
   			<a onclick=window.open('<%=chatUrl%>')>Live Chat</a>  
    	</td>
    	<td  <%out.println(src1.equals("reports")?"class='tabMenu1'":"class='tabMenu'");%>>
   			<a href='<%=BMConfig.getProperty("CBSWEBURL")%>/OtherReports.do?appSrc=TABBANKING&param=25086&custID=<%=userId%>'>Reports</a>
  		</td>
		<%}%>
	</tr>

</table>
</td>


</tr>

</table>
<%  } %>

