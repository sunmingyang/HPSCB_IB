	<%@ include file="/common/Include.jsp" %>
	<%
		
		
	    int errorcount=0;
		String usrName = "";
		 String AccINFO[][] = (String[][])session.getAttribute("AccINFO"); 
		 System.out.println(AccINFO);
		
		if(session.getAttribute("user") != null)
		usrName = (String)session.getAttribute("user");
		
		String login_id="";
		if(session.getAttribute("userid")!=null){
			login_id = (String)session.getAttribute("userid");
			System.out.println("loginid------------------------"+login_id);
		}



			String mobileNum = "";
			if(session.getAttribute("mobileNo")!=null){ 
			mobileNum = (String)session.getAttribute("mobileNo");
			System.out.println("jai--------------------------"+mobileNum);
		}



			String resData[][] = null;
			if(session.getAttribute("resdata")!=null){ 
			resData = (String [][])session.getAttribute("resdata");
			System.out.println("jai--------------------------"+resData[0][1]);
		}
		

			String bankurl[][] = null;
 		if (session.getAttribute("bnkurl") != null ) {
 			bankurl = (String [][])session.getAttribute("bnkurl");
 		}


String urlComplete="";
String bankNamee[]=null;
	%>


	
	<script>
	var exactUrlBank;
	var login_id =<%=login_id%>;
	function bacck(){
			window.location.href = "/fundtransfer/agentTrn.jsp"
			}



	function saveData()
	{

 var mob_no =	 document.getElementById("mobno").value;
 var cust_name = document.getElementById("cust_name").value;
 var acc_no =	 document.getElementById("acc_no").value;
 var url =		 document.getElementById("url").value;
			 var index=url.indexOf("~@");
			 var exactUrl=url.substring(0,index);
				var exactBank=url.substring(index+2);
				exactUrlBank=exactUrl;

	if(mob_no=="")
	{
		alert("please enter mobile number");
		return false;
	}

	if(mob_no.length<10)
	{
		alert("please enter 10 digit  mobile number");
		return false;
	}
	if(cust_name=="")
	{
		alert("please enter customer name");
		return false;
	}
if(acc_no=="")
	{
		alert("please enter account number");
		return false;
	}

	var ran=parseInt(Math.random()*9999);//bancmateib.fundtransfer.action.ABBFundTransAction
	var surl= "/abbfundtransfer/fund.do?action=datasave&mob_no="+mob_no+"&cust_name="+cust_name+"&acc_no="+acc_no+"&exactBank="+exactBank+"&login_id="+login_id+"&ran="+ran;

	     http.open("POST",surl,false);
	     http.onreadystatechange= function (){processRescustData()};
	     http.send(null); 

	}

 function processRescustData()
   {
     if (http.readyState == 4)
     {
   
      if (http.status == 200)
      {
       var resArray=http.responseText;
  
  if(resArray=="respon")
   {
    document.getElementById("mobno").value="";
    document.getElementById("cust_name").value="";
    document.getElementById("acc_no").value="";
       document.getElementById("url").disabled=false;
    window.open(exactUrlBank);
   }
   else
   {
   alert("Dear customer your customer_ID = "+resArray+"is successfully generated ");
    document.getElementById("mobno").value="";
    document.getElementById("cust_name").value="";
    document.getElementById("acc_no").value="";
    document.getElementById("url").disabled=false;
    window.open(exactUrlBank);  
  }
  
      }
     }
  }


  	function getFrommobile()
	{

 var mob_no = document.getElementById("mobno").value;
 
	if(mob_no=="")
	{
		alert("please enter mobile number");
		return false;
	}

	if(mob_no.length<10)
	{
		alert("please enter 10 digit  mobile number");
		return false;
	}

	
	document.forms[0].action=  "<%=request.getContextPath()%>/abbfundtransfer/fund.do?mob_no="+mob_no+"&action=getdataFrommobile";
	        document.forms[0].method="post";     
	        document.forms[0].submit();

	}

	function editData()
	{
		 document.getElementById("cust_name").readOnly=false;
		 document.getElementById("acc_no").readOnly=false;
		 document.getElementById("url").disabled=false;
    	 document.getElementById("mobno").disabled=true;
		 document.getElementById("AllButton").style.display="none";
		 document.getElementById('updateButton').style.display="block";

	}
	var exactUrlBankedit="";
	function forupdate()
	{		
 var mob_no =	 document.getElementById("mobno").value;
 var cust_name = document.getElementById("cust_name").value;
 var acc_no =	 document.getElementById("acc_no").value;
 var url =		 document.getElementById("url").value;
			 var index=url.indexOf("~@");
			 var exactUrl=url.substring(0,index);
				var exactBank=url.substring(index+2);
				exactUrlBankedit=exactUrl;

	if(mob_no=="")
	{
		alert("please enter mobile number");
		return false;
	}

	if(mob_no.length<10)
	{
		alert("please enter 10 digit  mobile number");
		return false;
	}
	if(cust_name=="")
	{
		alert("please enter customer name");
		return false;
	}
	if(acc_no=="")
	{
		alert("please enter account number");
		return false;
	}

	var ran=parseInt(Math.random()*9999);//bancmateib.fundtransfer.action.ABBFundTransAction
		var	surl="/abbfundtransfer/fund.do?action=dataupdate&mob_no="+mob_no+"&cust_name="+cust_name+"&acc_no="+acc_no+"&exactBank="+exactBank+"&login_id="+login_id+"&ran="+ran;


	     http.open("POST",surl,false);
	     http.onreadystatechange= function (){processResupdData()};
	     http.send(null); 

	}

  function processResupdData()
   {

     if (http.readyState == 4)
     {
      // Check that a successful server response was received
      if (http.status == 200)
      {
      	var resArray=http.responseText;
		if(resArray=="updateres")
			{
		alert("update your information");
			 document.getElementById("mobno").value="";
			 document.getElementById("mobno").disabled=false;
			 document.getElementById("cust_name").value="";
			 document.getElementById("acc_no").value="";
	window.open(exactUrlBankedit);
//	window.location.href=exactUrlBankedit;
	
			}
		
      }
     }
  }



function fillData()
 {
  document.getElementById("edit").disabled=true;
 <%if(session.getAttribute("mobileNo")!=null){ %>
    document.getElementById("mobno").value='<%=mobileNum%>';
 <%}session.removeAttribute("mobileNo");%>

 <%if(session.getAttribute("resdata")!=null)
 {%>
    document.getElementById("cust_name").readOnly=true;
      document.getElementById("acc_no").readOnly=true;
    document.getElementById("edit").disabled=false;
     document.getElementById("url").disabled=true;
   document.getElementById("cust_name").value='<%=resData[0][0]%>';
   document.getElementById("acc_no").value='<%=resData[0][2]%>';
   <% for (int i=0;i <bankurl.length ;i++ ){ %>
   <%if(bankurl[i][2].equals(resData[0][3])) {%>
  document.getElementById("url").value='<%=bankurl[i][1]+"~@"+bankurl[i][2]%>';  
  <%  break;}} }session.removeAttribute("resdata");%>
 }
 
	</script>
	
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<!-- <html:form action="/jsp/login.do"> -->
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=agentfund"/>
<tiles:put name="menu" value="/common/user_left.jsp?src=agentfund"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
<tiles:put name="content" type="String">
<tiles:put name="page_header" type="String">
&nbsp;<font color="#99FF00"><b><%if(usrName!=null) out.print(usrName);%>!</b></font>&nbsp;&nbsp;&nbsp;
</tiles:put>

<html:form action="/abbfundtransfer/fund">
<body onload="fillData()">

<table align="center" class="wrapperDataTable" cellpadding="0" cellspacing="0"  >
	<tr>
	 	<td  class="wrapperDataTableTR" align="center" width=950px >Customer Registration</td>
	</tr>
	<tr>
	<td>
	<table border="" align="center">

		   <tr><td>

	   </td></tr>

	   <tr><td>
	  
Customer Mobile No
	 <label><font size="2" color="red">*</font></label>
				<input type=text  id="mobno" property="mobno" style="margin-left:15px;" maxlength=12 onblur="getFrommobile()"/>
	   </td></tr>

   <tr><td> 
Customer Name					
				<input type=text  id="cust_name" property="cust_name" style="margin-left:47px;" maxlength=25 />
	   </td></tr>
	
   
   <tr><td>
Account NO
				<input type=text  id="acc_no" property="acc_no" style="margin-left:65px;" maxlength=15 />
	   </td></tr>
	   

	    <tr><td> select BANK
				<select style="margin-left:95px; " property="url" id="url" onchange="selData(this.value)">
				<%	for(int i=0;i<bankurl.length;i++)
				{ %>
			<option value="<%=bankurl[i][1]+"~@"+bankurl[i][2]%>"><%=bankurl[i][0]%></option>
				<%}%>
				</select>
	   </td></tr>
	    <tr>
	 
	<td align="center"  id="AllButton">
		<input type="button" name="ok" tabindex="22" value="ok" onclick="saveData()" class="Button" id="ok">
		<input type="button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel">
    	<input type="button" name="edit" tabindex="23" value="edit" onclick="editData()" class="Button" id="edit">
		
		</td><td align="center" style="display:none" id="updateButton">
       <input type="button" name="update" tabindex="23" value="ok" onclick="forupdate()" class="Button" id="update" >
	   <input type="button" name="cancel" tabindex="23" value="Cancel" onclick="bacck()" class="Button" id="cancel">
	</td>
	
	 </tr>
	
	<tr>
	<td>

			 </table>
	 </td>
	</tr>

</table>
	<input type="hidden" name="webData" id="webData"/>
	<input type="hidden" name="kid" id="kid"/>
	<input type="hidden"  style="margin-left: px;" maxlength="35"  value="<%=login_id%>" size="40" id="userid">
</body>
</html:form>
</tiles:put>
</html:form>
</tiles:insert>
