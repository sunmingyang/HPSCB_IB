
 <%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
 <%@ page import="java.util.*" %>
 <%@ include file="/common/Include.jsp" %>  

<%

		String Error="",openFor="",sMode="";
		 String custRole=(String)session.getAttribute("custRole");

 if(request.getParameter("openFor")!=null){
            openFor=(String)request.getParameter("openFor");
			System.out.println("openFor----------------"+openFor);
            }
  if(request.getParameter("sMode")!=null){
            sMode=(String)request.getParameter("sMode");
			System.out.println("sMode----------------"+openFor);
            }
		 String mob=(String)session.getAttribute("customerMobile");
		 System.out.println("Mobile Number----------------"+mob);
          String purp = (String)request.getParameter("purpose");
		 %>


   <head>
      
      <%-- <link rel="stylesheet" href="css/custom.css"> --%>
	  
		<script language="JavaScript" src= "/scripts/MD5.js"></script> 
<script language="JavaScript" src= "/scripts/common.js"></script> 		
    <script language="JavaScript" src="/fundtransfer/scripts/addpayee.js"></script> 
	<link rel = "stylesheet" href="/styles/table.css"  type = "text/css">
	<%@ page import="easycbs.bancmateib.fundtransfer.actionform.AddpayeeForm"%>
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %> 
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>
      <title>HPSCB INTERNET BANKING</title>
   </head>
   <style>
   .payments-and-transfer-inner.add-benifacriye .selection-button span.ifsc-with-search span.ifsc-box span.inner p {
    color: #000;
    font-size: 14px;
    font-weight: 500;
}

section.brad-log-time .bradcums li a{
   font-size: 14px !important;
}
section.brad-log-time .bradcums ul li strong{
   font-size: 14px !important;
}
label{
   font-size:14px;
}
.select-payee-bank select{
   padding: 7px !important;
}
.payments-and-transfer-inner.add-benifacriye .selection-button input{
   height: 35px !important;
}

.payments-and-transfer-inner.add-benifacriye .selection-button select{
   height: 35px !important;
   padding: 0px !important;
}
   </style>
   
   <%@ include file="/header/headerbar.jsp"%>
  	<body>
	<script>
	function isNumberKey(evt) {

  var charCode = (evt.which) ? evt.which : evt.keyCode;  
  if (charCode > 31 && (charCode < 48 || charCode > 57))
    return false;
  return true;
}
	</script>
   <jsp:include page="/dashBoard/dashboardNew.jsp" />
		<html:form action="/fundtransfer/fund.do">
      

      
      <div class="breadcrumb-container">
         <div class="row">
             <div class="col">
                 <div class="breadcrumb">
                     <div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
                     <div class="breadcrumb-item">    <a href="..\..\fundTransferNeftNew\fund_Transfer.jsp">Fund Transfer</a></div>
                     <div class="breadcrumb-item"><a href="/addPayee/addManagePayee.jsp"> Add & Manage Beneficiary</a></div>
                     
                     <div class="breadcrumb-item"><a> Add Beneficiary</a></div>
                 </div>
             </div>
         </div>
     </div>
      <!-- header-end -->


      <section class="PAYMENTS-TRANSFER-main  funds-tra">
         <div class="container-fluid">
            <div class="payments-and-transfer-inner add-benifacriye">
               <div class="row">
                  <div class="select-payee-bank m-0">
                     <label for="">Select Payee Bank</label>
                     <select name="" id="selectList">
                        <option value="">Select Bank</option>
                       <option value="S">Own Bank</option>
                        <option value="O">Other Bank</option>
                     </select>
                  </div>


                  <div class="pay-heading">
                     <h6>
                        
                       
                        Enter Payee Details
                        
                     </h6>
                  </div>

                  <div class="selection-button p-3">
                   <span class="Beneficiary-inner-selection">
                     <label for="">
                        Account Number
                     </label>
                      <html:password  property="sPayeeAcc" styleId="sPayeeAcc"  maxlength="16"
					         onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))"
					      />
                      
                   </span>
                   

                   <span class="Beneficiary-inner-selection">
                     <label for="">
                          Confirm A/C Number
                     </label>
                   
                      <html:text property="confirmPayeeAccNo" styleId="confirmPayeeAccNo" maxlength="16" 
					           onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))"
					          onchange="return fetchAccTypeNew()"/>
                   </span>

                   
                    <span class="Beneficiary-inner-selection">
                     <label for="">
                        Account Type
                     </label>
                    	<html:select property="sAccountType" styleId="sAccountType">
                        <html:option  value=''>--select--</html:option>
                        <html:option  value='S'>Saving</html:option>
                        <html:option  value='A'>Current</html:option>
                        <html:option  value='C'>Cash Credit/Overdraft</html:option>
                        <html:option  value='E'>RD Account</html:option>
                        <html:option  value='T'>Loan Account</html:option>
			            </html:select>
                    </span>

                     <span class="Beneficiary-inner-selection">
                        <label for="">
                           Beneficiary Name
                        </label>                    
				            <html:text property="payeeName" styleId="payeeName" maxlength="100" /> 
                     </span>

                     <span class="Beneficiary-inner-selection">
                        <label for="">
                        Nick Name
                        </label>                 
				            <html:text property="sNickName" styleId="sNickName" maxlength="15"/>
                     </span>
					   <span class="Beneficiary-inner-selection">
                     <label for="">
                         Payee Mobile No
                     </label>
                   <html:text property="payeeMob" styleId="payeemob"  maxlength="10" 
				             onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))" />
                  </span>
                 
                 <span class="Beneficiary-inner-selection">
                        <label for="">
                          Payee Email
                        </label>                    
				            <html:text property="email" styleId="email" /> 
                 </span>

                 <span class="Beneficiary-inner-selection">
                        <label for="">
                          Payee Limit
                        </label>                    
				            <html:text property="payeelimit" styleId="payeelimit" />                         
                 </span>
                
                 
                 

                    <input type = "hidden" id = "mob" value="<%=mob%>" >
                    <input type = "hidden" id ="payeeBnkBrnCode" value="">
                    
                    <span id="ifsc" class="Beneficiary-inner-selection" style="display:none">
                     <span class="ifsc-with-search">
                        <label for="">
                           IFSC
                        </label>
                     <html:text property="IFSCcode" styleId="IFSCcode"  maxlength="11" onblur="ifscTable()" />
                        <img src="/styles/images/icon _search_.jpg" alt="" class="open-ifsc-box">
                        <span class="ifsc-box">
                           <span class="inner"> <span class="lable">Bank Name:</span> <p id="name" class="name"></p></span>
                            <span class="inner"><span class="lable">Branch Code:</span>  <p id="code"
						            class="code"></p></span>
                            <span class="inner"><span class="lable">Address:</span> <p id="address" class="address"></p></span>
                           
                        </span>
                    </span>
                    </span>         

                    
                  </div>

                 
                  <div class="buttons">
                     <button type="button" onclick="continueTransferNew()" class="submit-button" ><img src="/styles/images/submit.png" alt=""> SUBMIT</button>
                     <button type="button" onclick="window.location.href = '/fundTransferNeftNew/fund_Transfer.jsp'"><img src="/styles/images/cancle.png" alt=""> CANCEL</button>
                  </div>
               </div>
            </div>
         </div>
      </section>


      <!-- footer-start -->
     
      <!-- Footer End -->
	 <%@ include file="/header/footer.jsp"%>

      <!-- =-===================================================== -->
      
      <script>
       function continueTransferNew()
		{    var obj
		var IFSCcode="";
		 var sPwd ;
		   	 // Retail Data 
			  
			if( document.getElementById("selectList").value=="O" && document.getElementById("IFSCcode").value =="")
			 {
			    alert("please enter IFSC Code ");
			    document.getElementById("payeeName").focus();
			    return false;
			 }
	  
			if( document.getElementById("selectList").value=="O" && document.getElementById("IFSCcode").value !="")
			 {
			  IFSCcode=document.getElementById("IFSCcode").value;
			 // alert(IFSCcode)
			 }				 
			 if(document.getElementById("payeeName").value=="")
			 {
			    alert("please enter Payee Name");
			    document.getElementById("payeeName").focus();
			    return false;
			 }
			 else if(document.getElementById("sNickName").value=="")
			 {
			      	alert("please enter nickname of account holder's");
			    	document.getElementById("sNickName").focus();
			    	return false;
			 }
			 else if( document.getElementById("sNickName").value!="" && document.getElementById("sNickName").value.length>15)
			 {
			    alert("please enter nickname of account holder's name less than 15 charatcer");
			    document.getElementById("sNickName").focus();
			    return false;
			 }
			 else if(document.getElementById("sPayeeAcc").value=="" || document.getElementById("sPayeeAcc").value.length>16)
			 {
			 	 alert("please enter account number in correct format");
 			 //  	document.getElementById("sPayeeAcc").focus();
			  	return false;
			  }
			 
			  else if(document.getElementById("sAccountType").value=="")
			  {
			    alert("please select Account type");
			  	document.getElementById("sAccountType").focus();
			  	return false;
			  }
			  else if(document.getElementById("payeemob").value=="")
			  {
			    alert("please enter payee mobile number");
		  	document.getElementById("payeemob").focus();
			  	return false;
			   }
			    else if(!validatePhoneNumber(document.getElementById("payeemob").value))
			  {
			    alert("please enter mobile number in  correct format");
		  	document.getElementById("payeemob").focus();
			  	return false;
			   }
			     else if(!validAccNo(document.getElementById("sPayeeAcc").value))
			  {
			    alert("please enter account number in  correct format");
		  	document.getElementById("sPayeeAcc").focus();
			  	return false;
			   }
			   
			   
			   
			   /*if( goForSaving &&*/
			   if(
			   document.getElementById("sPayeeAcc").value!="" && document.getElementById("sNickName").value!="")
			   {
			   var sPayeeAcc=document.getElementById("sPayeeAcc").value;
			   var sNickName=document.getElementById("sNickName").value;
			   var sPayeeName=document.getElementById("payeeName").value; 
			   var sPayeeMob=document.getElementById("payeemob").value;
			   var mobNo=document.getElementById("mob").value;
			   var accType=document.getElementById("sAccountType").value;
			   var selectList=document.getElementById("selectList").value;

            var payeeEmail=document.getElementById("email").value;
            var payeeLimit=document.getElementById("payeelimit").value;

            var payeeBrnCode=document.getElementById("payeeBnkBrnCode").value;


            console.log(payeeBrnCode);
            //console.log(payeeEmail);
            //console.log(payeeLimit);

			   } 
			   obj={"sPayeeAcc":sPayeeAcc,"sNickName":sNickName,"sPayeeName":sPayeeName,"sPayeeMob":sPayeeMob,"mobNo":mobNo,"accType":accType,"IFSCcode":IFSCcode, "email":payeeEmail,"payeelimit":payeeLimit,"payeeBrnCode":payeeBrnCode};

            
			     jsonStr = JSON.stringify(obj);
				 alert(jsonStr);
  
			 if(custrole ==='E' || custrole ==='S')
			{
				/* We have custRole = C and therefore this will not work */
				 if(document.getElementById("txnpass").value === '') { 
					alert("Enter Password");
					return ;
				} else {
				  sPwd = calcMD5(document.getElementById("txnpass").value);
						  document.getElementById("txnpass").value=sPwd ;
			   }
			}
  
	 var url="/fundtransfer/fund.do?action=ownAccPayee&jsonStr="+jsonStr+"&sMode="+sMode+"&txnpass="+sPwd+"&selectOption="+selectList;
	 //alert(url+"url is")
  		 http.open("POST",url,false);
		http.onreadystatechange= function (){processentryRespNew()};
		http.send(null);
			   }
		 
function processentryRespNew()
{

			var res=http.responseText;
			// var res = '[{\"fail\":[],\"success\":[{\"account\":\"005010001088\",\"remark\":\"Success\"},{\"account\":\"005010001088\",\"remark\":\"Success\"}]}]'
			//alert(res)
			    var json=JSON.parse(res);
				console.log("-----json is"+json)
 				
				if(json =='-11') {  
					alert("Request Cancelled due to password mismatch");
		} else {
			    if(json== "-S") {
			     alert("Requested Account Added Successfully");
				 resetValue();
				} else  {
			     alert("Requested Account Already Exists");
				}
		}

}
	 var goForSaving=false;
      
       function fetchAccTypeNew()
		 {     
		 console.log(document.getElementById("sPayeeAcc").value);
		 let sPayeeAcc=document.getElementById("sPayeeAcc").value
		 let confirmPayeeAccNo=document.getElementById("confirmPayeeAccNo").value
		 console.log(document.getElementById("confirmPayeeAccNo").value);
		 
		 let res = sPayeeAcc.localeCompare(confirmPayeeAccNo);
		 if(res==-1||res==1)
			 {
			 
			 alert("confirm PayeeAccount number and account number should be same")
			 return false;
			 
			 }
			 if(document.getElementById("selectList").value== "O")
			 {
                   document.getElementById("ifsc").style.display="block";
				 
				return ; 
			 }
			
			 else{
				 document.getElementById("ifsc").style.display="none";
				 
			   if(document.getElementById("sPayeeAcc").value=="" || 
			   ( document.getElementById("sPayeeAcc").value.length<5 
			   && document.getElementById("sPayeeAcc").value.length>16))
			   {
				   alert("1 please enter account number in correct format");
				   return false;
			   }
			   else
			   {
				
				   if(document.getElementById("sPayeeAcc").value!="" &&
			       !( document.getElementById("sPayeeAcc").value.length>5 
			        && document.getElementById("sPayeeAcc").value.length<=16)  )
			   {
				   alert("2 please enter account number in correct format");
					return false;
			   }	
				   
				   
				if(document.getElementById("sPayeeAcc").value!="" &&
			   ( document.getElementById("sPayeeAcc").value.length>5 
			   && document.getElementById("sPayeeAcc").value.length<=16)  )
			   {
				   
			    var accno=document.getElementById("sPayeeAcc").value;
			    var url="/fundtransfer/fund.do?action=ownAccPayee&fetchAccType=true&accountno="+accno;             
			    http.open("post",url,false);
			    http.onreadystatechange= function (){
               console.log("1");
			     var res=http.responseText;
				 //console.log( res);
			     var json=JSON.parse(res);
				 //alert(json)
				 //console.log(json);
				 //console.log(json);

				 const array = json.split('~');
            
				// alert(array[0]);
			     if(json=="")
			     { 
			      alert("No type found for Account number:"+accno);
	//		      document.getElementBy("sPayeeAcc").focus();
			     }
			     else if(json=="--")
				 {
					  	alert("Account is closed Cannot Be add as a payee");
						document.getElementById("sPayeeAcc").value="";
						document.getElementById("sPayeeAcc").focus();
						return false ;
				 }
			     else
			     
			    	// var selectedValue = response.selectedValue;

			     // Step 3: Set the selected value of the dropdown
			     var dropdown = document.getElementById('sAccountType');
			    console.log("2");
             console.log(array[3]);
            
           
			     document.getElementById('payeeName').value=array[1];
              document.getElementById('payeeBnkBrnCode').value=array[3];
             
			     dropdown.value = array[0];
               
			     goForSaving=true;
			
			    };
			    http.send(null);
			   }
			   }
			   }
		 
		 
		 }

	   var sMode = '<%=sMode%>';
		   var custrole='<%=custRole%>';
		  var jspOpenFor = '<%=openFor%>'; 
		  var myJsonString;
		  var pur = '<%=purp%>';

         var $box = $(".box");
         
         $(".closei").each(function () {
         var color = $(this).css("backgroundColor");
         var content = $(this).html();
         $(this).click(function () {
         $box.css("backgroundColor", color);
         $box.addClass("open");
         $box.find("p").html(content);
         });
         
         $(".close").click(function () {
         $box.removeClass("open");
         $box.css("backgroundColor", "transparent");
         });
         
         
         $("body").toggleClass("overlay");
         $("#pop-toggle").click(function () {
         $(".popup").toggle();
         $("body").toggleClass("overlay");
         });
         $(".close").click(function () {
         $(".popup").toggle();
         $("body").toggleClass("overlay");
         });
         });
         
         jQuery(document).ready(function(){  
         jQuery(".close").click(function(){  
         jQuery(".popScroll").toggleClass("d-none");  
         });
         });
         
         
         
         function openCity(evt, cityName) {
         var i, tabcontent, tablinks;
         tabcontent = document.getElementsByClassName("tabcontent");
         for (i = 0; i < tabcontent.length; i++) {
         tabcontent[i].style.display = "none";
         }
         tablinks = document.getElementsByClassName("tablinks");
         for (i = 0; i < tablinks.length; i++) {
         tablinks[i].className = tablinks[i].className.replace(" active", "");
         }
         document.getElementById(cityName).style.display = "flex";
         evt.currentTarget.className += " active";
         }

         jQuery(document).ready(function(){  
         jQuery(".open-ifsc-box").click(function(){  
         jQuery(".ifsc-box").toggleClass("active");  
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".okay").click(function(){  
         jQuery(".ifsc-box").toggleClass("active");  
         });
         });

	function ifscTable()
{
 
  var ifsc=document.getElementById("IFSCcode").value;
  
   var url="/request/DDRequest.do?action=getDependentMasterNameFromCode&masterType=IFSCBranchFromCode&Code="+ifsc;
  // alert(url);
	  http.open("POST",url,false);
	  http.onreadystatechange= function (){processBranch()};
		http.send(null);
 
}
function processBranch()
{
		if (http.readyState == 4)
			{
				if (http.status == 200)
				{
				 var resArray=http.responseText;
				 var Data = JSON.parse(resArray);  
			 //console.log(Data)
			    var branch=Data[1];
				
			
				document.getElementById("name").innerHTML=Data[1];
				document.getElementById("code").innerHTML=Data[0];
				document.getElementById("address").innerHTML=Data[2];
				}
			}
}
         
         
      </script>
	  </html:form>
   </body>
</html>