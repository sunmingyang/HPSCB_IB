<%@ include file='/common/Include.jsp' %>
<%
String usrName = (String)session.getAttribute("user");
String accountList="" ; 
String [] AccListArr= null ;
String sAgentAccno="";
String login_id="";
		if(session.getAttribute("userid")!=null){
			login_id = (String)session.getAttribute("userid");
			
		}
 
		if (session.getAttribute("allAccountlist") != null ) { 
		   accountList=(String)session.getAttribute("allAccountlist");
		   AccListArr =accountList.split(",");
		   if(AccListArr!=null){
			sAgentAccno=AccListArr[0];
		   }
		}
%>
<style>
.required {
	color: red;
	
}

.ipfile{
	font-family: none !important;
	font-size: 20px !important;
}
</style>
<script>
var vAgentAccno='<%=sAgentAccno%>';
var vlogin_id='<%=login_id%>';
function helpopen()
{
	//var bar = "width=600,height=250,left=0, top=0, scrollbars=yes,resizable=no";
	//window.open("/jsp/IBHelp.jsp?src=CBEnquiry","child", bar);
}
</script>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Request"/>
<tiles:put name="menu" value="/common/user_left.jsp?src=request"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>

<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=chkStatus&src=request"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=req"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>
</tiles:put>
<tiles:put name="content" type="String">
<body>
<html:form action="/abbfundtransfer/fund"  >
<br>
<table width="70%">
	<tr>
		<td align="center" >
			<center  style="background:#BEDEEB;color: white; height:35px;padding-top:1px;"> 
				<span  style="font-size:20px;;line-height:33px; color: rgb(6, 14, 99);" class = "label ipfile">
					 Account Open </span>
			</center>
		</td>	 
	</tr>
</table> 
<center> 
<div class="col-md-10" style="clear:both;float: none; text-align:left;padding-top:2%;margin-left: 15%;">
	<div  class="col-md-10" style="border: 1px solid #3143df; padding: 3px;border-radius: 4px;margin-top:1px;">
		<div class="form-group" style="clear:both;">
			<div class="form-group">
				<label class="col-md-3" style="margin-top: 5px;color: rgb(6, 14, 99);font-size: 13px;">SGL Code<span class="required">*</span>&nbsp;:</label> 
				<div class="col-md-3" style="width:50%;">
						<select Class="form-control ipfile" name='scustTTL' id='scustTTL' style="color: #0e010f;" tabindex="1">
								<option value="9">SAVING BANK(IND) </option>
								<option value="5">HIMPUNERNIVESH DEPOSITS</option>
						  
					</select>
			  </div>
				
			</div>
		
		<div class="form-group" style="clear:both;">
				<div class="form-group">
				<label class="col-md-3" style="margin-top: 12px;color: rgb(6, 14, 99);font-size: 13px;">Customer ID&nbsp;:</label> 
				<div class="col-md-8">
				<input type="text" name='CustID'  maxlength="10" id='CustID' autocomplete="off" placeholder="Enter Customer ID" tabindex="2"  style="margin-top:5px;color:#0e010f;width: 365px;" class = "form-control  ipfile adharnumber" onchange = "AadharLengthCheck()"  />	
				</div>
			</div>				
		
		<div class="form-group" style="clear:both;">
			<div class="form-group">
				<label class="col-md-3" style="margin-top: 12px;color: rgb(6, 14, 99);font-size: 13px;">Customer Name &nbsp;:</label> 
				<div class="col-md-8">
					<input type="text" name='CustomerName'  maxlength="100" id='CustomerName' autocomplete="off" placeholder="Customer Name" tabindex="-1"  readonly="true"  style="margin-top:5px;color:#0e010f;width: 365px;" class = "form-control ipfile validName" />
				</div>
			</div>
		</div>
		
		<div class="form-group" style="clear:both;">
			<div class="form-group">
				<label class="col-md-3" style="margin-top: 12px;color: rgb(6, 14, 99);font-size: 13px;">Father's Name &nbsp;:</label> 
				<div class="col-md-8">
					<input type="text" name='FatherName'  maxlength="100" id='FatherName' autocomplete="off" placeholder="Father Name " tabindex="-1"  readonly="true"  style="margin-top:5px;color:#0e010f;width: 365px;" class = "form-control ipfile validName" />
				</div>
			</div>
		</div>
		
		<div class="form-group" style="clear:both;">
			<div class="form-group">
				<label class="col-md-3" style="margin-top: 12px;color: rgb(6, 14, 99);font-size: 13px;">Mobile No. &nbsp;:</label> 	
				<div class="col-md-8">
				<input type="text" name='mobileNo'   maxlength="12" id='mobileNo' autocomplete="off" placeholder="Mobile No" tabindex="-1"  readonly="true"  style="margin-top:5px;color:#0e010f;width: 365px;" class = "form-control ipfile mobileNo" onchange = "mobileLengthCheck()" />		
				</div>
			</div>			
			
		</div>
		


	</div>
</div>

<div class="col-md-10" style="float:none;">
	<div class="col-md-6" >
		<html:button styleId="save" property="save" styleClass="btn btn-md ipfile" tabindex="5" onclick="return saveData();"
		 style="background-color: #040878;color: white;margin-top:16px;float: right;width: 50%;" >Save
		</html:button>
	</div>
	<div class="col-md-6" >
		<html:button property="cancel" styleId="cancel"   tabindex="7" onclick = "goToMenu()" styleClass="btn btn-md ipfile" 
		style="background-color: #040878;color: white;margin-top:16px;margin-left: 25%;width: 50%;" > Cancel
		</html:button>
	</div>
</div>
</Center>
</body>
<script>

function goToMenu(){
			window.location.href = "/request/NewCustIDCreation.jsp"
			}

	function mobileLengthCheck(){
	var regexPattern=new RegExp(/^[0-9-+]+$/); // regular expression patter
	var phoneNo =$.trim($('#mobileNo').val());
	
	if(regexPattern.test(phoneNo)) {
		if(phoneNo.length == 10){
			return ;
		}else{
			alert("Mobile No must be 10 digit");
			document.getElementById("mobileNo").focus();
			return false;
		}	
	}else {
		alert('Not a valid Mobile Number');
		return false;
	}
}

function AadharLengthCheck(){
	var regexPattern=new RegExp(/^[0-9-+]+$/); // regular expression patter
	var phoneNo =$.trim($('#adharnumber').val());
	
	if(regexPattern.test(phoneNo)) {
		if(phoneNo.length == 12){
			return ;
		}else{
			alert("Aadhar No must be 12 digit");
			document.getElementById("adharnumber").focus();
			return false;
		}	
	}else {
		alert('Not a valid Aadhar Number');
		return false;
	}
}

$(document).ready(function(){
	$('.mobileNo').keypress(function (event) {
    var keycode = event.which;
		if (!(event.shiftKey == false && (keycode == 46 || keycode == 8 || keycode == 37 || keycode == 39 || (keycode >= 48 && keycode <= 57)))) {
			event.preventDefault();
		}
	});
})
$(document).ready(function(){
	$('.adharnumber').keypress(function (event) {
    var keycode = event.which;
		if (!(event.shiftKey == false && (keycode == 46 || keycode == 8 || keycode == 37 || keycode == 39 || (keycode >= 48 && keycode <= 57)))) {
			event.preventDefault();
		}
	});
})

$(function(){
 
 $('.validName').keyup(function()
 {
	 var yourInput = $(this).val();
	 re = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi;
	 var isSplChar = re.test(yourInput);
	 if(isSplChar)
	 {
		 var no_spl_char = yourInput.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');
		 $(this).val(no_spl_char);
	 }
 });

});

function saveData()
	{

 var custName    = document.getElementById("custName").value;
 var fatherName  = document.getElementById("fatherName").value;
 var mobileNo    = document.getElementById("mobileNo").value;
 var adharnumber = document.getElementById("adharnumber").value;
 var Address     = document.getElementById("address").value;
 var scustTTL     = document.getElementById("scustTTL").value;
 var sFatherTTL     = document.getElementById("sFatherTTL").value;
		
 if(custName=="")
	{
		alert("Please Enter Customer Name");
		return false;
	}
	else if(fatherName=="")
	{
		alert("Please Enter Customer Father Name");
		return false;
	}
	else if(mobileNo=="")
	{
		alert("please enter mobile number");
		return false;
	}
	else if(mobileNo.length<10)
	{
		alert("please enter 10 digit  mobile number");
		return false;
	}
	else if(adharnumber.length>0){
	 if(adharnumber.length<12)
	{
		alert("please Enter 12 digit  Aadhar Number");
		return false;
	}
	}
	
	var ran=parseInt(Math.random()*9999);

	var surl= "/abbfundtransfer/fund.do?action=SaveCustomerData&mob_no="+mobileNo+"&cust_name="+custName+"&fatherName="+fatherName+
			"&adharnumber="+adharnumber+"&Address="+Address+"&scustTTL="+scustTTL+"&sFatherTTL="+sFatherTTL+"&vAgentAccno="+vAgentAccno+
			"&login_id="+vlogin_id+"&ran="+ran;
	     http.open("POST",surl,false);
		 document.getElementById("save").disabled=true;
	     http.onreadystatechange= function (){processRescustData()};
	     http.send(null); 

	}

 function processRescustData()
   {
	document.getElementById("save").disabled=false;
     if (http.readyState == 4)
     {
   
      if (http.status == 200)
      {
       var resArray=http.responseText;
	   var sresArray = new Array();
  if(resArray=="respon")
   {
    document.getElementById("custName").value="";
 	document.getElementById("fatherName").value="";
 	document.getElementById("mobileNo").value="";
 	document.getElementById("adharnumber").value="";
 	document.getElementById("address").value="";
 	document.getElementById("scustTTL").value="MR.";
 	document.getElementById("sFatherTTL").value="MR.";
 	document.getElementById("url").disabled=false;
   }
   else
   {
	sresArray=resArray.split("~");
	if(sresArray[1]=="X"){
      alert("Dear customer your customer_ID = "+sresArray[0]+" is successfully generated ");
	}else {
		alert(sresArray[1] + "" + sresArray[0]);
	}
   	document.getElementById("custName").value="";
 	document.getElementById("fatherName").value="";
 	document.getElementById("mobileNo").value="";
 	document.getElementById("adharnumber").value="";
 	document.getElementById("address").value="";
 	document.getElementById("scustTTL").value="MR.";
 	document.getElementById("sFatherTTL").value="MR.";
 	document.getElementById("url").disabled=false;
    window.open(exactUrlBank);  
  }
  
      }
     }
  }


	</script>
</html:form>
</tiles:put>
<tiles:put name="add" value="/Advertisement/add.jsp"/>
<tiles:put name="footer" value="/common/footer.jsp"/>
</tiles:insert >