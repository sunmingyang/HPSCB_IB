<%@ include file="/common/Include.jsp" %> 
<script language="JavaScript" src="/scripts/MD5.js"></script> 
<link rel = "stylesheet" href="/styles/table.css"  type = "text/css"/>
<script language="JavaScript" src="corpfundtransfer/scripts/corpfund.js"></script>    
<% 
String accountList="" ; 
String [] AccListArr= null ; 
String openFor="",custRole="",userid="",forPur="";
userid = (String)session.getAttribute("userid");
if (session.getAttribute("allAccountlist") != null ) { 
	accountList=(String)session.getAttribute("allAccountlist");
	System.out.println("FundAccountList----------------"+accountList);
	AccListArr =accountList.split(",");
}
if(session.getAttribute("forPur") != null) {
	forPur = (String) session.getAttribute("forPur");
	System.out.println("For delete payee---");
	session.removeAttribute("forPur");
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
var menuFor = '<%=forPur%>';
var userId = '<%=login_id%>';

function fetchdata() {
	if(menuFor == "del") {
	document.getElementById('firstOne').style.display='none';
	if(custrole == "F"){
	document.getElementById('proceed').style.display='none';
	}
	document.getElementById('createEntry').style.display='none';
	document.getElementById('back').style.display='none';
	}
}
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
<body onload='fetchdata()'>
<html:form action="/TransactionAction.do">

<div class="container">
<div class="row" style="height:300px;overflow-y: scroll;">
<table id='firstOne'>
<tr>
<td style = "padding: 3px;" align = "left">
<u style="color: blue;"> <B>Corporate Banking Fund Transfer</B></u>   
</td>
<td    style = "padding: 3px;" align = "right"> <p><u style="color: blue;"> <B><%=date%></B></td>
</tr>&nbsp;
<tr>				
<td  style = "padding: 3px;"colspan = "2">
<p align = "left" bgcolor="blue" id = "label" style="
    background-color: #cccccc;"> <b> Link below  enable you to Create transactions.</b></p>
</td>
</tr>			<tr id = "accDiv">
							<td   >
								<B>Acc No. From  </B>
							</td>
							<td  >
								<select name="sUsrList1" list="AccountNoList" listkey="custId" listValue="accountNo"   id="accList" onChange="mobileNo()">
								<%
									if (AccListArr != null)
										for(int i=0;i<AccListArr.length;i++){%>
										 <option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
										<%}%>
								</select>  
							</td> 
						</tr>
						
						<tr >
							<td  >
								<B>Customer Mobile No.  </B>
							</td>
							<td    >
								<input type="text"  size="20" readonly="true" value="<%=mob%>" id="UserMobile"/>
							</td>
						</tr>
						<tr>
							<td     >
								<B>Select Benificiary :</B>
							</td>
							<td     >
								<input type="text"  size="40" readonly="true" id="sNickName"/>
									<input type="hidden"  size="40" readonly="true" id="sNickName1"/>
							</td>
						</tr>
						<tr>
							<td    >
								<B>Benificiary Account Number : </B>
							</td>
							<td    >
								<input type="text"  size="20" readonly="true"  id="sPayeeAcc"/>
							</td>
						</tr>

						<tr>
							<td    >
								<B>IFSC Code: </B>
							</td>
							<td    >
								<input type="text"  size="20" readonly="true"  id="IFSCcode"/>
							</td>
						</tr>
						<tr>
							<td    >
								<B>Amount: </B>
							</td>
							<td    >
								<input type="text"   name="amount" id="amount" onchange="checkamt(this.value,this.id)" value=".00"> 
							</td>
						</tr>
				     	<tr>
							<td    class="normalHeadText">
								<B>Remark:</B>
							</td>
							<td    >
								<input type="text"   name="remark" id="remark" maxlength="50" > 
							</td>
						</tr>
						
						<tr>
							<td    >
								 <B>Enter Transaction Password:	</B>
							</td>
							<td    >
								<input type ="password"   name="txnpass" id="txnpass"  maxlength = "16"  value="" >
				
							</td>
						</tr>
  </table>


<!--Page Buttons --> 
   <div class="form-group">
        <div>
	    <center>
		
		<% if (custRole.equals("F") ) { %>
		<input type="button" class="btn btn-primary" onClick="otp_confirm()" id = "proceed" style="width:100px;font-size: 1.2em;background-color: #25037A;" value="Proceed"/>
		<% } else  {%>
<input type="button" class="btn btn-primary" onClick="otp_confirm()" id = "createEntry" style="width:100px;font-size: 1.2em;background-color: #25037A;" value="Create Entry"/>
<%}%>
		<html:button property="back" styleClass="btn btn-primary" styleId = "back"  onclick="bacck()" style="font-size: 1.2em;background-color: #25037A;" >
		<bean:message bundle="hindi" key='843'/>
		</html:button>
		</center>
		</div>
    </div>

<!--search block-->
<h4>Benificiaries List</h4>
	<div class="form-group pull-right">
    <input type="text" class="search form-control"  style = "height:29px" placeholder="Enter Criteria ">
</div>
<span class="counter pull-right"></span>
<table class="table table-hover table-bordered results" id="secondOne">
  <thead>
  <tr>
  	<td style = "padding: 3px;" class="col-md-4 col-xs-4"><B>Select</B></td>
    <td style = "padding: 3px;" class="col-md-4 col-xs-4"><B>Name</B></td>
    <td style = "padding: 3px;" class="col-md-4 col-xs-4"><B>Account No.</B></td>
	<td style = "padding: 3px;" class="col-md-4 col-xs-4"><B>IFSC Code</B></td>
	<td style = "padding: 3px;" class="col-md-4 col-xs-4"><B>Other/Same Bank Accout</B></td>
    
  </tr>
  <tr class="warning no-result">
      <td colspan="4"><i class="fa fa-warning"></i> No result</td>
  </thead>
   <tbody>
  <% 
  if(fundinfo!=null) {
	for(int i=0;i<fundinfo.length;i++) {
	String value=fundinfo[i][2]+"~"+fundinfo[i][7]+"~"+fundinfo[i][1]+"~"+fundinfo[i][3];
	%>
	 
  <tr>
  	<td style = "padding: 3px;" class="col-md-4 col-xs-4">
	<input style="background-color:#BFBFBF;" type="checkbox" id="checkbox<%=i%>"  name = "checkbox" class ="delPay"
	onclick="setData('<%=fundinfo[i][0]%>','<%=fundinfo[i][2]%>','<%=value%>','<%=fundinfo[i][3]%>','checkbox<%=i%>')" > 
    </td>
    <td style = "padding: 3px;" class="col-md-4 col-xs-4"><%=fundinfo[i][0]%></td>
    <td style = "padding: 3px;" class="col-md-4 col-xs-4"><%=fundinfo[i][2]%></td>
	 <td style = "padding: 3px;" class="col-md-4 col-xs-4"><%=fundinfo[i][3]%></td>
    <td style = "padding: 3px;" class="col-md-4 col-xs-4"><%=fundinfo[i][4]%></td> 
     </tr>

 <% } } else { %> <tr> <td colspan = "5" style = "padding: 3px;" class="col-md-4 col-xs-4"><B>No Payee found</B></td> </tr><% } %>
  </tbody>
</table>
<% if (forPur.equals("del")){%>
 <input type="button" class="btn btn-primary" onClick="deletEntry()" id = "delete" style="width:100px;font-size: 1.2em;background-color: #25037A;" value="Delete"/>
<%}%>
			  <input type ="hidden" name="mode" id="mode" value="<%=mode%>" >				
                <input type ="hidden" name="sessionID" id="sessionID" value= "" >
				<input type ="hidden" name="sessionID" id="sessID" value="'<%=sessionId%>'" >
				<input type ="hidden" name="payeeMob" id="payeeMob" >
				<input type ="hidden" name="IFSCcode" id="IFSCcode" >
				<input type ="hidden" name="tDate" id="tDate" value="<%=date%>" >
				<input type ="hidden" name="fundkid" id="fundkid" >
				<input type = "hidden" id = "userid" value = "<%=login_id%>">

<div id = "cbrespdiv" style="height:150px;overflow:auto">
</div>	
</div>
</div>



					</html:form>
					</tiles:put>
					</html:form>
					</body>
     				</tiles:insert>
					
<script>

$(document).ready(function() {
  $(".search").keyup(function () {
    var searchTerm = $(".search").val();
    var listItem = $('.results tbody').children('tr');
    var searchSplit = searchTerm.replace(/ /g, "'):containsi('")
    
  $.extend($.expr[':'], {'containsi': function(elem, i, match, array){
        return (elem.textContent || elem.innerText || '').toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
    }
  });
    
  $(".results tbody tr").not(":containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','false');
  });

  $(".results tbody tr:containsi('" + searchSplit + "')").each(function(e){
    $(this).attr('visible','true');
  });

  var jobCount = $('.results tbody tr[visible="true"]').length;
    $('.counter').text(jobCount + ' payee');

  if(jobCount == '0') {$('.no-result').show();}
    else {$('.no-result').hide();}
		  });
});

// the selector will match all input controls of type :checkbox
// and attach a click event handler 
$("input:checkbox").on('click', function() {
  // in the handler, 'this' refers to the box clicked on
  var $box = $(this);
  if ($box.is(":checked")) {
    // the name of the box is retrieved using the .attr() method
    // as it is assumed and expected to be immutable
    var group = "input:checkbox[name='" + $box.attr("name") + "']";
    // the checked state of the group/box on the other hand will change
    // and the current value is retrieved using .prop() method
    $(group).prop("checked", false);
    $box.prop("checked", true);
  } else {
    $box.prop("checked", false);
  }
});

</script>

<style>

.results tr[visible='false'],
.no-result{
  display:none;
}

.results tr[visible='true']{
  display:table-row;
}

.counter{
  padding:8px; 
  color:#ccc;
}
</style>
