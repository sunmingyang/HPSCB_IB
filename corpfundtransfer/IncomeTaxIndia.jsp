<%@ include file="/common/Include.jsp" %> 
<script language="JavaScript" src="/scripts/MD5.js"></script> 
<link rel = "stylesheet" href="/styles/table.css"  type = "text/css"/>
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
if(request.getParameter("mode")!=null){
	fundinfo = (String[][])session.getAttribute("FUNDINFO");   
} else {
System.out.print("No PAyeee Data !!!");
}

if(session.getAttribute("user") != null)
{ 
	usrName = (String)session.getAttribute("user");
}

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

  System.out.print("session Attribute is not null and value is :"+(String)session.getAttribute("openFor"));
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
%>  
 
<script>	
var sTranMode = '<%=sfundTranMode%>'; // FUNDINFO_S -samebank ;FUNDINFO_O --> Otherbank 
var custrole='<%=custRole%>';
var jspOpenFor = '<%=openFor%>'; // A--> authorization ,then, disable some fiels; E--> Edit
var sMode='<%=sMod%>'; // operation / CIBAuth 
var pur = '<%=purp%>';  
var mytotalJsonString = '';

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

<div class="container">
<div class="row" style="height:300px;overflow:auto">

<table>
<tr>
<td style = "padding: 3px;" align = "left">
<u style="color: blue;"> <B>Income Tax</B></u>   
</td>
</tr>&nbsp;
<tr>				
<td>
<p align = "left" bgcolor="blue" id = "label" style="
    background-color: #cccccc;"> <b> Link below  redirect you to third- party site.</b></p>
</td>
</tr>	
<tr>				
<td>
<p> 
	<input type = "button" id = "iTax" onclick = "openWeblink()" value = "PROCEED">
	</p>
	<p>
	By clicking this link, user is responsible to share its information to third-party. 
	</p>
</td>
</tr>	
  </table>



  


			
</div>
</div>



					</html:form>
					</tiles:put>
					</html:form>
     				</tiles:insert>

<script>
function openWeblink()
{

		var cnf=confirm("Are you  want to open");
	 
    if (cnf)
	 {
   //   window.open("http://www.incometaxindia.gov.in");	
	 location.href = "http://www.incometaxindia.gov.in";
    } 
	
}
</script>