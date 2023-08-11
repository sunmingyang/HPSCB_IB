  <%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
   <%@ page import="java.util.*" %>
<%
   String IBURL = BMConfig.getProperty("IBURL");
   System.out.println("IBURL web url from ini file is : - " + IBURL);
%>

<!DOCTYPE html>
<html lang="en">
   
   </head>
   <style>
        .statement-main-shadow-div .set-limit {
            background: #e5f4ff;
    padding: 5px 18px;
    font-size: 16px;
    font-weight: 600;
    color: #0a67b5;
    display: flex;
    align-items: center;

        }

        .statement-main-shadow-div .set-limit h2 {
            font-size: 42px;
            font-weight: 600;
            color: #0067B8;
        }
/* 
        .statement-main-shadow-div .set-limit-main {
            padding: 0 100px 70px;
        } */

        .statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit {
            margin-top: 12px;
        }

        .statement-main-shadow-div .set-limit-main .set-limit-inner button.tablink {
            border: 1px solid #ccc;
            padding: 5px 15px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
        }

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    border: 1px solid #ccc;
    padding: 18px;
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
    font-size: 14px;
    margin: 0 0 5px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form span.inner-inpts select {
    width: 100%;
    height: 40px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    padding: 0 0px 0 5px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form span.inner-inpts input {
    width: 100%;
    height: 40px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    padding: 0 0px 0 5px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent button {
    padding: 7px 25px;
    border: 0;
    background: #0a67b5;
    font-size: 16px;
    font-weight: 500;
    color: #fff;
    border-radius: 5px;
}

.statement-main-shadow-div .set-limit-main .set-limit-inner .form-set-limit div.tabcontent form span.inner-inpts.Transfer input {
    width: 49%;
}


   </style>


   <%@ include file="/header/headerbar.jsp"%>

<jsp:include page="/dashBoard/dashboardNew.jsp" />
   <body>
      
    
	<div class="breadcrumb-container">
		<div class="row">
			<div class="col">
				<div class="breadcrumb">
					<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
					<div class="breadcrumb-item">    <a >Account</a></div>
					
					
					<div class="breadcrumb-item"><a>Set Transaction Limit </a></div>
				</div>
			</div>
		</div>
	</div>
  
      <section class="Account-Statement fd-account-details-main set-limit">
         <div class="Account-Statement-inner">
            <div class="act-ineer-statemt">
               <div class="container-fluid">
                  <div class="row">
                     <div class="statement-main-shadow-div p-0">
                         <div class="set-limit text-center">
                           <h6>Set Transaction Limits</h6>
                        </div> 
                        
       
                        <div class="set-limit-main p-4">
                           <div class="set-limit-inner">
                             
                                <button class="tablink btn btn-primary" onclick="openPage('Account', this, '#0067B8' )" id="defaultOpen">Account</button>
                                <button class="tablink btn btn-primary" onclick="openPage('Card', this, '#0067B8' )" >Card</button>


                              <div class="form-set-limit">
                                  <div id="Account" class="tabcontent">
                                    <form name="AccountTrnsLmt" id="AccountTrnsLmt"> 
                                        <span class="inner-inpts">
                                            <label>Account Type: </label>
                                            <select id="sAccountType" name="sAccountType" >
                                                <option value="----">SelectAccount Type: </option>
                                                <option value="S@9">Saving Account</option>
                                                <option value="A@10">Current Account</option>
                                            </select>
                                        </span>

                                        <%-- <span class="inner-inpts">
                                            <label>Select Account:  </label>
                                            <select>
                                                <option>Select Account: </option>
                                                <option>123456789</option>
                                                <option>9876543210</option>
                                                <option>7418529630147</option>
                                            </select>
                                        </span> --%>

                                         <span class="inner-inpts">
                                            <label>Cash Withdrawal Limit</label>
                                            <input type="text" name="cashWdlLmt" id="cashWdlLmt" class="number-restrictChar" maxlength="10" placeholder="Enter Cash Withdrawal Limit">
                                        </span>

                                        <span class="inner-inpts Transfer">
                                            <label>Transfer Limit</label>
                                            <input type="text" id="lmtWithInbnk" class="number-restrictChar" maxlength="10" name="lmtWithInbnk" placeholder="Within Bank">
                                            <input type="text" id="lmtOtherbnk" class="number-restrictChar" maxlength="10" name="lmtOtherbnk" placeholder="Other Bank">
                                        </span>

                                        <span class="inner-inpts">
                                            <label>Internet Banking Limit</label>
                                            <input type="text" id="LmtIB" class="number-restrictChar" maxlength="10" name="LmtIB" placeholder="Enter Internet Banking Limit">
                                        </span>

                                        <span class="inner-inpts">
                                            <label>Mobile Banking Limit</label>
                                            <input type="text" id="LmtMB"  class="number-restrictChar" maxlength="10" name="LmtMB" placeholder="Enter Mobile Banking Limit">
                                        </span>


                                    </form>

                                    <div class="btns text-center mt-4"><button onclick="seLimitAcc()" class="submit-button" >SUBMIT</button></div>

                                    
                                  </div>

                                  <div id="Card" class="tabcontent">
                                    <form>
                                        <span class="inner-inpts">
                                            <label>Card Type:  </label>
                                            <select>
                                                <option>Card Type:  </option>
                                                <option>Credit Card</option>
                                                <option>Debit Card</option>
                                            </select>
                                        </span>

                                        <span class="inner-inpts">
                                            <label>Select Card: </label>
                                            <select>
                                                <option>Select Card: </option>
                                                <option>123456789</option>
                                                <option>9876543210</option>
                                                <option>7418529630147</option>
                                            </select>
                                        </span>

                                         <span class="inner-inpts">
                                            <label>Cash Withdrawal Limit</label>
                                            <input type="text" name="" placeholder="Enter Cash Withdrawal Limit">
                                        </span>

                                        <span class="inner-inpts">
                                            <label>Transaction Amount Limit</label>
                                            <input type="text" name="" placeholder="Enter Amount Limit">
                                            
                                        </span>

                                        <span class="inner-inpts">
                                            <label>POS Purchase Limit</label>
                                            <input type="text" name="" placeholder="Enter POS Purchase Limit">
                                        </span>

                                        <span class="inner-inpts">
                                            <label>E Commerce Limit</label>
                                            <input type="text" name="" placeholder="Enter e commerce Limit">
                                        </span>


                                    </form>

                                    <div class="btns text-center mt-4"><button>SUBMIT</button></div>
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
    
         


      async function seLimitAcc(jsonStr){          

         if(document.getElementById("sAccountType").value == "----" || document.getElementById("cashWdlLmt").value == "" || document.getElementById("lmtWithInbnk").value == "" || document.getElementById("lmtOtherbnk").value == "" || document.getElementById("LmtIB").value == "" || document.getElementById("LmtMB").value == ""){
            alert("Please set All limits");
			   document.getElementById("cashWdlLmt").focus();
			    return false;
         }
         
         var kid = document.getElementById("sAccountType").value;
            var acc_ename = kid.substring(0,1);
            var act_kid = kid.slice(2);
            if(acc_ename == "A"){
                 acc_ename = "CURRENT A/C" 
            }
            else{
               acc_ename = "SAVING A/C"
            }

            var acc_withdrawal_lmt =       document.getElementById("cashWdlLmt").value; 
			   var acc_trns_lmt_withinbnk =   document.getElementById("lmtWithInbnk").value;
			   var acc_trns_lmt_otherbnk =    document.getElementById("lmtOtherbnk").value;
			   var acc_IB_lmt =               document.getElementById("LmtIB").value;
			   var acc_MB_lmt =               document.getElementById("LmtMB").value;    
        
         try {
            var jsonData  =  await fetch("<%=IBURL%>"+"/rest/AccountService/setTrnsLimitForAccount/", {
            method: "POST",
            body: JSON.stringify({
                "act_kid":act_kid,
                "acc_ename":acc_ename,
                "acc_withdrawal_lmt":acc_withdrawal_lmt,
                "acc_trns_lmt_withinbnk": acc_trns_lmt_withinbnk,  
                "acc_trns_lmt_otherbnk":acc_trns_lmt_otherbnk,
                "acc_IB_lmt":acc_IB_lmt ,
                "acc_MB_lmt": acc_MB_lmt
            }),
            headers: {
                "Content-type": "application/json; charset=UTF-8",
                "Access-Control-Allow-Origin": "*"
            }
        }).then(response => response.json()).then(response=>displaysetTrnsLimitMessage(response));     
         }catch (e) {
            console.log("error");
            console.log(e);       
         } 
      } 
		 
      function displaysetTrnsLimitMessage(response)
      {                    
         //var json=JSON.parse(response);
         console.log("-----json is",response.Data)  
         if(response.Data == "Success"){
            alert("Transctions Limit Set Successfully");
         }
         else{
            alert("Transctions Limit not Set");
         }
      }
</script>


   </body>
</html>

<script>
   // function setAccountTrnsLimit(){
      //    var obj;		   
		// 	//if(document.getElementById("sPayeeAcc").value!="" && document.getElementById("sNickName").value!=""){
		// 	   //act_kid,acc_ename,acc_withdrawal_lmt,acc_trns_lmt_withinbnk,acc_trns_lmt_otherbnk,acc_IB_lmt,acc_MB_lmt
      //       //sAccountType,cashWdlLmt,lmtWithInbnk,lmtOtherbnk,LmtIB,LmtMB
      //       //CURRENT A/C ,SAVING A/C  
      //       var kid = document.getElementById("sAccountType").value;
      //       var acc_ename = kid.substring(0,1);
      //       var act_kid = kid.slice(2);
      //       if(acc_ename == "A"){
      //            acc_ename = "CURRENT A/C" 
      //       }
      //       else{
      //          acc_ename = "SAVING A/C"
      //       }
            
      //      // console.log(kid);
		// 	   //var acc_ename =                document.getElementById("sAccountType").value;
		// 	   var acc_withdrawal_lmt =       document.getElementById("cashWdlLmt").value; 
		// 	   var acc_trns_lmt_withinbnk =   document.getElementById("lmtWithInbnk").value;
		// 	   var acc_trns_lmt_otherbnk =    document.getElementById("lmtOtherbnk").value;
		// 	   var acc_IB_lmt =               document.getElementById("LmtIB").value;
		// 	   var acc_MB_lmt =               document.getElementById("LmtMB").value;              
            
      //       //console.log("act_kid::", act_kid, " acc_ename::",acc_ename ," acc_withdrawal_lmt::",acc_withdrawal_lmt," acc_trns_lmt_withinbnk::",acc_trns_lmt_withinbnk," acc_trns_lmt_otherbnk::",acc_trns_lmt_otherbnk," acc_IB_lmt::",acc_IB_lmt," acc_MB_lmt::",acc_MB_lmt);
		// 	//} 
			
      //      var obj={"act_kid":act_kid,"acc_ename":acc_ename,"acc_withdrawal_lmt":acc_withdrawal_lmt,"acc_trns_lmt_withinbnk":acc_trns_lmt_withinbnk,"acc_trns_lmt_otherbnk":acc_trns_lmt_otherbnk,"acc_IB_lmt":acc_IB_lmt,"acc_MB_lmt":acc_MB_lmt};
            
		// 	   var jsonStr = JSON.stringify(obj);
		// 		console.log(jsonStr);	            
      //       seLimitAcc(jsonStr);   
      // }

</script>