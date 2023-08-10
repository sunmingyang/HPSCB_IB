     <%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
  <%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
   <%@ page import="java.util.*" %>
<%
   String IBURL = BMConfig.getProperty("IBURL");
   System.out.println("IBURL web url from ini file is : - " + IBURL);

    String loggedInUserId = (String)session.getAttribute("AdminName");	

    String custId = (String)session.getAttribute("custIdUser");	

   System.out.println("Logged in user  ::::::" + loggedInUserId);

    System.out.println("Customer id of logged in user  ::::::" + custId);

    

%>

<!DOCTYPE html>
<html lang="en">
   <head>
    	
        
	<script language="JavaScript" src="/scripts/common.js" type="text/javascript"></script>

   </head>
   <style>
        .statement-main-shadow-div .set-limit {
            padding: 40px 0;
        }

        .statement-main-shadow-div .set-limit h2 {
            font-size: 42px;
            font-weight: 600;
            color: #0067B8;
        }

        .statement-main-shadow-div .set-limit-main {
            padding: 0 100px 70px;
        }

        .statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit {
            margin-top: 30px;
        }

        .statement-main-shadow-div .set-limit-main .set-limit-inner button.tablink {
            border: 1px solid #ccc;
            padding: 10px 50px;
            border-radius: 5px;
            font-size: 22px;
            font-weight: 500;
        }

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    border: 1px solid #ccc;
    padding: 40px;
    border-radius: 15px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form  span.inner-inpts {
    width: 49%;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 0 0 20px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form span.inner-inpts label {
    width: 100%;
    margin: 0 0 0px;
    font-weight: 500;
    font-size: 18px;
    margin: 0 0 5px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form span.inner-inpts select {
    width: 100%;
    height: 55px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    padding: 0 0px 0 5px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form span.inner-inpts input {
    width: 100%;
    height: 55px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    padding: 0 0px 0 5px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent button {
    padding: 10px 50px;
    border: 0;
    background: #0a67b5;
    font-size: 22px;
    font-weight: 600;
    color: #fff;
    border-radius: 5px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form span.inner-inpts.Transfer input {
    width: 49%;
}


   </style>


   <%@ include file="/header/headerbar.jsp"%>


   <body onload="getAccData()">
      <section class="brad-log-time">
        <div class="inner-brad-log">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="bradcums">
                            <ul>
                                <li>
                                    <a href="/dashBoard/dashboard.jsp">Dashboard</a>
                                    >
                                    <strong>Cheque Services</strong>
                                </li>
                            </ul>
                        </div>
                    </div>  
                    <div class="col-md-6">
                     <div class="log-time">
                        <span class="time">
                            <%= (new java.util.Date()).toLocaleString()%>
                        </span>
                        <span class="">
                            <strong><%=session.getAttribute("usrName") %></strong>
                        </span>
                        <span class="profile">                       
                          <i class="fa fa-user" aria-hidden="true"></i>                     
                           <img src="/styles/images/down-aroowwww.png" alt="">
                        </span>
                        <span class="profile-menu">
                           <ul>
                              <li>
                                <a href="/my_profile/my_profile.jsp">My Profile</a>
                              </li>
                              <li>
                                <a href="/jsp/login.do?action=ibUsrLogout">Log Out</a>
                              </li>
                           </ul>
                        </span>
                     </div>
                    </div>              
                </div>
            </div>
        </div>
    </section>
  
      <section class="Account-Statement my-5 fd-account-details-main set-limit">
         <div class="Account-Statement-inner">
            <div class="act-ineer-statemt">
               <div class="container">
                  <div class="row">
                     <div class="statement-main-shadow-div">
                        <div class="set-limit text-center">
                           <h2>Cheque Services</h2>
                        </div>
                        <div class="set-limit-main">
                           <div class="set-limit-inner">
                                <button class="tablink" onclick="openPage('Request', this, '#0067B8' )" id="defaultOpen">Cheque Book Request</button>
                                <button class="tablink" onclick="openPage('Stop', this, '#0067B8' )" >Stop Cheque</button>
                                <button class="tablink" onclick="openPage('Enquiry', this, '#0067B8' )" >Cheque Enquiry</button>
                              
                              <div class="form-set-limit">
                                  <div id="Request" class="tabcontent">
                                    <h2>Cheque Book Request</h2>
                                    <form name="AccountTrnsLmt" id="AccountTrnsLmt">                                            
                                        <%-- <span class="inner-inpts">
                                            <label>Account No.</label>
                                            <input type="text" name="accNo1" id="accNo1" class="number-restrictChar" maxlength="10" placeholder="Enter Account No">
                                        </span> --%>

                                        <span class="inner-inpts">
                                            <label>Account Type: </label>
                                            <select id="sAccountType1" name="sAccountType" >                                                
                                            </select>
                                        </span>

                                        <span class="inner-inpts">
                                            <label>Leaves</label>
                                            <input type="text" id="leavesNo" class="number-restrictChar" maxlength="10" name="lmtWithInbnk" placeholder="Enter Leaves">                                            
                                        </span>

                                    </form>

                                    <div class="btns text-center mt-4"><button onclick="ReqChequeBook()" class="submit-button" >SUBMIT</button></div>
                                    
                                  </div>

                                  <div id="Stop" class="tabcontent">
                                    <h2>Stop Cheque</h2>
                                    <form> 
                                        <%-- <span class="inner-inpts">
                                            <label>Account No.</label>
                                            <input type="text" name="accNo2" id="accNo2" class="number-restrictChar" maxlength="10" placeholder="Enter Account No">
                                        </span> --%>

                                        <span class="inner-inpts">
                                            <label>Account Type: </label>
                                            <select id="sAccountType2" name="sAccountType" >                                               
                                            </select>
                                        </span>

                                        <span class="inner-inpts">
                                            <label>Cheque No.</label>
                                            <input type="text" id="ChqNo1" class="number-restrictChar" maxlength="10" name="lmtWithInbnk" placeholder="Cheque No.">                                            
                                        </span>
                                    </form>

                                    <div class="btns text-center mt-4"><button onclick="ReqStopCheque()" class="submit-button" >SUBMIT</button></div>

                                  </div>


                                  <div id="Enquiry" class="tabcontent">
                                    <h2>Cheque Enquiry</h2>
                                    <form> 
                                        <%-- <span class="inner-inpts">
                                            <label>Account No.</label>
                                            <input type="text" name="accNo3" id="accNo3" class="number-restrictChar" maxlength="10" placeholder="Enter Account No">
                                        </span> --%>

                                        <span class="inner-inpts">
                                            <label>Account Type: </label>
                                            <select id="sAccountType3" name="sAccountType" >                                               
                                            </select>
                                        </span>    

                                        <span class="inner-inpts">
                                            <label>Cheque No.</label>
                                            <input type="text" id="ChqNo2" class="number-restrictChar" maxlength="10" name="lmtWithInbnk" placeholder="Cheque No.">                                            
                                        </span>
                                    </form>

                                    <div class="btns text-center mt-4"><button onclick="ReqEnquiryCheque()" class="submit-button" >SUBMIT</button></div>

                                  </div>                  


                              </div>
                              
                             
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-------- Footer Start --------------- -->
          <%@ include file="/header/footer.jsp"%>
      <!-------- Footer End   -------------- -->     

      <script>
         function openPage(pageName,elmnt,color) {
           var i, tabcontent, tablinks;
           tabcontent = document.getElementsByClassName("tabcontent");
           for (i = 0; i < tabcontent.length; i++) {
             tabcontent[i].style.display = "none";
           }
           tablinks = document.getElementsByClassName("tablink");
           for (i = 0; i < tablinks.length; i++) {
             tablinks[i].style.backgroundColor = "";
           }
           document.getElementById(pageName).style.display = "block";
           elmnt.style.backgroundColor = color;
         }
         
         // Get the element with id="defaultOpen" and click on it
         document.getElementById("defaultOpen").click();
      </script>

      
      <script>         
        $('.number-restrictChar').bind('input', function () { restrictChar(this, /[^0-9]/g); });
        
            var restrictChar = (input, r) => {
            var c = input.selectionStart,
            v = $(input).val();
            if (r.test(v)) {
                $(input).val(v.replace(r, ''));
                c--;
            }
            input.setSelectionRange(c, c);
        };


    function ReqChequeBook(){       
        var accNo = document.getElementById("sAccountType1").value;
        alert(accNo);
        var leavesNo = document.getElementById("leavesNo").value;         
        if( accNo == ""  || leavesNo == "" ){
           alert("Please fill All fields");
		    document.getElementById("accNo1").focus();
			return false;
        }
        var a = "chequeBookRequest";
        ChequeServices(accNo,leavesNo,a);
    }

    function ReqStopCheque(){       
        var accNo = document.getElementById("sAccountType2").value;
        var chqNo = document.getElementById("ChqNo1").value;         
        if( accNo == ""  || chqNo == "" ){
           alert("Please fill All fields");
		    document.getElementById("accNo3").focus();
			return false;
        }
        var a = "chequeStopPayment" ;
        ChequeServices(accNo,chqNo,a);
    }

    function ReqEnquiryCheque(){           
        var accNo = document.getElementById("sAccountType3").value;
        var chqNo = document.getElementById("ChqNo2").value;       
        if( accNo == ""  || chqNo == "" ){            
           alert("Please fill All fields");
		    document.getElementById("accNo3").focus();
			return false;
        }        
        var a = "chequeNoEnquiry" ;
        ChequeServices(accNo,chqNo,a);
    }

    async function ChequeServices(accNo,chqNo,callMethodName){
        // alert("Request for cheque is calling");                  
         try {
            // var jsonData  =  await fetch("<%=IBURL%>"+"/rest/AccountService/chequeBookRequest/", {
            var jsonData  =  await fetch("<%=IBURL%>"+"/rest/AccountService/"+callMethodName+"/", {
            method: "POST",
            body: JSON.stringify({
                "accNo": accNo ,
                "leaves": chqNo,
                "chequeNo": chqNo,
                "userId": '<%=loggedInUserId%>'
            }),
            headers: {
                "Content-type": "application/json; charset=UTF-8",
                "Access-Control-Allow-Origin": "*"
            }
        }).then(response => response.json()).then(response=>displayChequeRequestMessage(response));     
         }catch (e) {
            console.log("error");
            console.log(e);       
         } 
      } 
		 
      function displayChequeRequestMessage(response){ 
        console.log(response); 
         console.log("Response",response.Data);    
        if(response.Data == "SUCCESS"){
            alert("Cheque Request Send Successfully");
        }
        else if(response.Data != null ){
               alert( "Your Cheque Status is : " + response.Data); 
        }
        else{
            alert("Invalid Request Please try again");
        }         
      }
</script>


<script>
    async function getAccData() { 	   
       var URL ="/AccountInfoAction.do?action=fetchCustomerAccounts&custID="+<%=custId%>; 
	   http.open("POST",URL,false);
		http.onreadystatechange= function (){processAccount()};
		http.send(null);
   }
	function processAccount(){ // process data start
        if((http.readyState == 4) && (http.status == 200)){
            var resArray=http.responseText;  
            var jsonData = JSON.parse(resArray); 
            var chqAcc = "" ;         

            for (var i = 0; i < jsonData.accountInformation.length; i++) { // start for loop
               counter = jsonData.accountInformation[i];              
               if(counter.accountType=="S"){
                    console.log("Saving a/c : : " , counter.accountNo);
                    chqAcc += '<option value='+ counter.accountNo +'>'+ counter.accountNo +'</option>'
               }

                if(counter.accountType=="A"){
                    console.log("Current a/c : : " , counter.accountNo);
                    chqAcc += '<option value='+ counter.accountNo +'>'+ counter.accountNo +'</option>'
               }

                if(counter.accountType=="C"){
                    console.log("Cash Credit  : : " , counter.accountNo);
                   chqAcc += '<option value='+ counter.accountNo +'>'+ counter.accountNo +'</option>'
               }

             } // End for loop
        } 

        console.log(chqAcc);      
        document.getElementById("sAccountType1").innerHTML = '<option value="----">Select an Account</option>' + chqAcc ;   
        document.getElementById("sAccountType2").innerHTML = '<option value="----">Select an Account</option>' + chqAcc ;
        document.getElementById("sAccountType3").innerHTML = '<option value="----">Select an Account</option>' + chqAcc ;
        
    }
</script>


   </body>
</html>
