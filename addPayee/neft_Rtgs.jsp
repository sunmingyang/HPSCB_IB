<%
String accountList="" ; 
	String [] AccListArr= null ; 
	String  mobileNo="";
if (session.getAttribute("allAccountlist") != null ) { 
	   accountList=(String)session.getAttribute("allAccountlist"); 
	   System.out.println("FundAccountList----------------"+accountList);
	   AccListArr =accountList.split(",");
	   
}
	   
	   %>



<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">
	  
      <script
         src="https://code.jquery.com/jquery-3.6.4.min.js"
         integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
         crossorigin="anonymous"></script>
      <script src="js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="css/owl.carousel.min.css">
      <link rel="stylesheet" href="css/owl.theme.default.min.css">
      <link rel="stylesheet" href="css/font-awesome.min.css">
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <link rel="stylesheet" href="css/custom.css">
	  <script language="JavaScript" src="/fundtransfer/scripts/neft.js"></script>
<script language="JavaScript" src="/scripts/MD5.js"></script>
<script language="JavaScript" src="/scripts/json.js" type="text/javascript"></script>
	<script language="JavaScript" src="/scripts/common.js" type="text/javascript"></script>
<script>

function checkAccount(accNo){
	alert(accNo)
		var accno=accNo;
		var url="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+accno;
		http.open("POST",url,false);
		http.onreadystatechange= function (){payeeName()};
		http.send(null);
	}
	function isValidNumber(NumText){
		lenNum = NumText.length;
		for(i=0; i<lenNum; i++)
		{
			if(NumText.charAt(i)<'0' || NumText.charAt(i)>'9')
			{
				if(NumText.charAt(i)!='.')
				{	
					return false;
				}
				
			}
		}
		return true;
	}
	function payeeName(){
		var cat2=null;
		if (http.readyState == 4 && http.status == 200)
		{
				var resArray=http.responseText;
				var jsonData = JSON.parse(resArray);
				if(jsonData.customerName=="")
				{
					document.getElementById("ifscLabel").style.display="block";
					document.getElementById("ifscField").style.display="block";
					document.getElementById("toAccName").value="";
					
				}
				else{
					cat2+='<tr>'+'<td>'+jsonData.customerName+'</td>'
			+'<td>'+jsonData.accountType+'</td>'+'<td>'+jsonData.accBalance+'</td>'+'</tr>'
				+'<td>'+jsonData.address+'</td>'	
				}
		}
		document.getElementById("exampleid").innerHTML = cat2;
	
	}
	</script>
      <title>HPSCB INTERNET BANKING</title>
   </head>
   <body>
      <header class="site-header">
         <div class="top-header">
            <div class="container">
               <div class="row">
                  <div class="col-md-2">
                     <div class="site-logo">
                        <%-- <a href="index.html"> --%>
                        <img src="/images/logo.png" alt="" width="150">
                        <%-- </a> --%>
                     </div>
                  </div>
                  <div class="col-md-10">
                     <div class="main-upper-header-menu">
                        <ul>
                           <li>
                              <a href="#">
                              HPSCB Bank Home 
                              </a>
                           </li>
                           <li>
                              <a href="#">
                              About Us
                              </a>
                           </li>
                           <li>
                              <a href="#">
                              Customer Care 
                              </a>
                           </li>
                           <li>
                              <a href="#">
                              Find ATM/Branch
                              </a>
                           </li>
                           <li>
                              <a href="#">
                              Mobile Banking
                              </a>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <div class="menu">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="toggle d-none">
                     <span class="one"></span>
                     <span class="one"></span>
                     <span class="one"></span>
                  </div>
                  <ul class="dashboard-menu">
                     <li>
                        <a href="#">
                        <img src="images/dashboard/overview.png" alt="">
                        OVERVIEW
                        </a>
                     </li>
                     <li>
                        <a href="#">
                        <img src="images/dashboard/my-account.png" alt="">
                        MY ACCOUNTS  
                        </a>
                     </li>
                     <li class="sub-menu-item-3">
                        <a href=" PAYMENTS-TRANSFER.html">
                        <img src="images/dashboard/transfer.png" alt="">
                        PAYMENTS & TRANSFER
                        </a>
                        <ul class="sub-menu">
                           <li>
                              <a href="fund-transfer.html">
                              FUND TRANSFER
                              </a>
                           </li>
                           <li>
                              <a href="">
                              BILL PAYMENTS
                              </a>
                           </li>
                           <li>
                              <a href="">
                              QUICK PAY
                              </a>
                           </li>
                           <li>
                              <a href="">
                              RECHARGE 
                              </a>
                           </li>
                           <li>
                              <a href="">
                              RECEIVE FUNDS
                              </a>
                           </li>
                           <li>
                              <a href="">
                              MANAGE PAYEES
                              </a>
                           </li>
                           <li>
                              <a href="">
                              MANAGE BILLERS
                              </a>
                           </li>
                           <li>
                              <a href="">
                              TRANSACTION STATUS
                              </a>
                           </li>
                           <li>
                              <a href="">
                              TAX CENTER
                              </a>
                           </li>
                        </ul>
                     </li>
                     <li>
                        <a href="#">
                        <img src="images/dashboard/investment.png" alt="">
                        INVESTMENTS & INSURANCE 
                        </a>
                     </li>
                     <li>
                        <a href="#">
                        <img src="images/dashboard/offer.png" alt="">
                        EXCLUSIVE OFFERINGS
                        </a>
                     </li>
                     <li>
                        <a href="#">
                        <img src="images/dashboard/customer-service.png" alt="">
                        CUSTOMER SERVICE
                        </a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <section class="brad-log-time">
         <div class="inner-brad-log">
            <div class="container">
               <div class="row">
                  <div class="col-md-8">
                     <div class="bradcums">
                        <ul>
                           <li>
                              <a href="dashboard.html">Dashboard</a>
                              >
                              <a href="PAYMENTS-TRANSFER.html">Payments & Transfer</a>
                              >
                              <a href="fund-transfer.html">Fund Transfer</a>
                              >
                              <strong>
                                NEFT & RTGS Fund Transfer
                              </strong>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-4">
                     <div class="log-time">
                        <span class="time">
                        28-Mar-2023, [ 04:16:06 AM IST ]
                        </span>
                        <span class="profile">
                        <img src="images/profile.png" alt="">
                        <img src="images/down-aroowwww.png" alt="">
                        </span>
                        <span class="profile-menu">
                           <ul>
                              <li>
                                 <a href="my-profile.html">My Profile</a>
                              </li>
                              <li>
                                 <a href="index.html">Log Out</a>
                              </li>
                           </ul>
                        </span>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- header-end -->
      <section class="PAYMENTS-TRANSFER-main  funds-tra my-5">
         <div class="container">
            <div class="selcet-neft-and-rtgs my-3">
                <strong>Select Transfer Type</strong>
                <span class="neft">
                    NEFT
                    <input type="radio" name="neft" id="neft">
                </span>
                <span class="neft">
                    RTGS
                    <input type="radio" name="rtgs" id="rtgs">
                </span>
            </div>
            <div class="payments-and-transfer-inner">
               <div class="row">

               

                  <div class="pay-heading">
                     <h2>
                        <img src="images/desktop-bank-transfer-icon 1.png" alt="">
                        NEFT Funds Transfer
                     </h2>
                  </div>

                  <div class="chosse-an-account">
                   <select name="sUsrList1"
												list="AccountNoList" listkey="custId" listValue="accountNo"
												style="width: 200" id="accList" onChange="checkAccount(this.value)" /> <%if (AccListArr != null)
				for(int i=0;i<AccListArr.length;i++){%>
												<option value='<%=AccListArr[i]%>'><%=AccListArr[i]%></option>
												<%}%> </select>
                </div>

                <div class="Selected-Account-Number">
                    <strong>Selected Account Number:  </strong>
                    <span>123XX678XXX234XX</span>
                </div>

                <div class="select-account-table">
                    <table>
					   <thead>
                        <tr>
                            <th>Account No. / Nick Name</th>
                            <th>Account Type</th>
                            <th>HPSCB Branch</th>
                            <th>Balance</th>
                        </tr>
						   </thead>
                        <tbody id="exampleid">
						</tbody>
                    </table>
                </div>

                <div class="amount-selection-main-sec">

                    <div class="amount-sec">
                        <span class="amt-inner">
                            <label for="">Amount*</label>
                            <input type="text">
                        </span>

                        <span class="amt-inner">
                            <label for="">Purpose*</label>
                            <input type="text">
                        </span>

                        <span class="amt-inner">
                            <label class="find-ifsc" for="">IFSC* <a href="">Find IFSC</a></label>
                            <input type="text">
                        </span>

                        <a href="add-new-beneficiary.html">
                            Click here to add a new Other Bank Beneficiary / Change Limit
                        </a>


                    </div>

                    <div class="select-the-benificery-account">
                        <div class="chosse-an-account">
                            <select name="" id="">
                                <option value="">Select the Beneficiary account</option>
                                <option value=""><span class="namem">Saving A/C</span> <span class="accountnu">123XX678XXX234XX</span> </option>
                                <option value=""><span class="namem">Current A/C </span> <span class="accountnu">123XX678XXX234XX</span> </option>
                            </select>
                        </div>
                    </div>

                    <div class="Selected-Account-Number">
                        <strong>Selected Account Number:  </strong>
                        <span>123XX678XXX234XX</span>
                    </div>

                    <div class="select-account-table">
                        <table>
                            <tr>
                                <th>Account No</th>
                                <th>Beneficiary Name</th>
                                <th>Branch</th>
                                <th>Bank</th>
                                <th>Limit</th>
                            </tr>
                            <tr>
                                <td>1234567891234567</td>
                                <td>AJAY KUMAR BAIRWA</td>
                                <td>JODHPUR-DRDA COLLECTORATE</td>
                                <td>PUNJAB NATIONAL BANK</td>
                                <td>₹50000.00</td>
                            </tr>
                        </table>
                    </div>


                    <div class="select-shedual-option">
                        <h5>Select a schedule option</h5>
                        <span class="shedual-date">
                            <span>Schedule Date</span>
                            <span class="input-paid">
                                Pay Now
                                <input type="radio">
                            </span>

                            <span class="input-paid">
                                Standing Instruction
                                <input type="radio">
                            </span>

                            <span class="input-paid">
                                Standing Instruction
                                <input type="radio">
                            </span>
                        </span>
                    </div>

                    <div class="auth">
                        <p>If you authorise an NEFT transaction using 'Pay Now' option, it will be posted to your account immediately and will be sent in the next available NEFT batch.</p>
                    </div>

                    <div class="note-plz">
                        <p>
                            Please note, Beneficiary Account Number and IFSC information will ONLY be used for Electronic Fund Transfer (please ensure correctness), the Beneficiary Name provided will not be considered for Electronic Fund Transfer as per RBI guidelines.
                        </p>
                    </div>

                    <div class="accept-term-con">
                        <input type="checkbox" name="" id="">
                        I accept the <a href="">Terms and Conditions</a>
                    </div>

                    <div class="buttons">
                        <button type="button" class="submit-button"><img src="images/submit.png" alt=""> SUBMIT</button>
                        <button type="button" onclick="window.location.href = 'fund-transfer.html'"><img src="images/cancle.png" alt=""> CANCEL</button>
                    </div>






                    



                </div>
                  
                  </div>
               </div>
            </div>


            <section class="detail-confirm-popup">
                <div class="confirm-inner">
                    <h4>Confirm Your Details</h4>
                    <div class="confi-table">

                        <span class="con-details">
                            <span>Name:</span>
                            <span>Dinesh kumar</span>
                        </span>

                        <span class="con-details">
                            <span>From A/C:</span>
                            <span>9876543211234567</span>
                        </span>

                        <span class="con-details">
                            <span>To A/C:</span>
                            <span>1234567891234567</span>
                        </span>

                        <span class="con-details">
                            <span>Amount:</span>
                            <span>₹ 5000</span>
                        </span>

                        <span class="con-details">
                            <span>Transaction Type:</span>
                            <span>NEFT</span>
                        </span>

                        
                    </div>
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="confirm-btn"><img src="images/next 2.png" alt=""> Confirm</button>
                        <button type="button" class="edit-btn"><img src="images/edit.png" alt=""> Edit</button>
                    </div>
                </div>
            </section>

            <section class="OTP-confirm-popup">
                <div class="confirm-inner">
                    <h2>
                        <img src="images/padlock-black-icon 1.png" alt="">
                        OTP Verification</h2>
                        
                        <span class="sent">
                            OTP sent on mobile no +91 95XXX09X04
                            <a href="">Change</a>
                        </span>
                        <span class="otp-inputs">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                            <input type="text">
                        </span>

                        <div class="btnGroup otp-count-down">
                            <span class="Btn" id="verifiBtn">
                              <button type="submit">Resend OTP:</button>
                            </span>
                            <span class="timer">
                              <span id="counter"></span>
                            </span>
                          </div>
                    
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="AUTHENTICATE" ><img src="images/auth.png" alt=""> AUTHENTICATE</button>                        
                    </div>
                </div>
            </section>




            <section class="transction-succesfull-popup">
                <div class="confirm-inner">
                    
                    <span class="succesful-msg">
                        <h2>Transaction Successful</h2>
                        <span class="time">03:20 PM on 30 Mar 2023</span>
                    </span>

                    <div class="confi-table">

                        <span class="con-details">
                            <span>Transaction ID:</span>
                            <span>T2302568158925041654876</span>
                        </span>

                        <span class="con-details">
                            <span>Paid To:</span>
                            <span>1234567891234567</span>
                        </span>

                        <span class="con-details">
                            <span>Debit From A/C:</span>
                            <span>9876543211234567</span>
                        </span>

                        <span class="con-details">
                            <span>Bank Name:</span>
                            <span><img src="images/image 20.png" alt="">   PUNJAB NATIONAL BANK</span>
                        </span>

                        <span class="con-details">
                            <span>Amount:</span>
                            <span>₹5000</span>
                        </span>

                        <span class="con-details">
                            <span>Transaction Type:</span>
                            <span>NEFT</span>
                        </span>

                        
                    </div>
                    
                    <div class="buttons confirm-detailsss">
                        <button type="button" class="done" onclick="window.location.href = 'fund-transfer.html'"> DONE</button>                        
                    </div>
                </div>
            </section>


         
      </section>
      <section class="back-home-button">
         <div class="container">
            <div class="inner-back-home">
               <button> <a href="dashboard.html"> BACK</a></button>
               <button> <a href="dashboard.html">HOME</a></button>
            </div>
         </div>
      </section>


      <!-- footer-start -->
      <footer>
         <div class="footer-follow-aria">
            <a href="#">
            <span><i class="fa fa-twitter" aria-hidden="true"></i></i>Follow:  @hpscblofficial</span>
            </a>
         </div>
         <div class="logo-aria-fooetr">
            <div class="container">
               <div class="row">
                  <div class="col-md-2">
                     <a href="index.html">
                     <img src="/images/logo.png" alt="" width="150">
                     </a>
                  </div>
                  <div class="col-md-10">
                     <p>
                        The Himachal Pradesh State Cooperative Bank Ltd. is an Apex bank of the State of Himachal Pradesh; and is listed as Scheduled Bank with its branches spread across 6 districts of the State and one branch at New Subzi Mandi, New Delhi.
                     </p>
                  </div>
               </div>
            </div>
         </div>
         <div class="footer-menu">
            <div class="container">
               <div class="row">
                  <div class="col-md-3">
                     <div class="menu-footer">
                        <h4 class="heading">
                           HPSCB
                        </h4>
                        <ul>
                           <li>
                              <a href="#">About Us</a>
                           </li>
                           <li>
                              <a href="#">Managing Committee</a>
                           </li>
                           <li>
                              <a href="#">Board of Directors</a>
                           </li>
                           <li>
                              <a href="#">Branches Network</a>
                           </li>
                           <li>
                              <a href="#">ATM Network</a>
                           </li>
                           <li>
                              <a href="#">Contact Us</a>
                           </li>
                           <li>
                              <a href="#">Right To Information</a>
                           </li>
                           <li>
                              <a href="#">List of Unclaimed Deposits</a>
                           </li>
                           <li>
                              <a href="#">Customer grievance Redressal Policy</a>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="menu-footer">
                        <h4 class="heading">
                           Loans
                        </h4>
                        <ul>
                           <li>
                              <a href="#">Home Loan</a>
                           </li>
                           <li>
                              <a href="#">Car Loan</a>
                           </li>
                           <li>
                              <a href="#">Personal Loan</a>
                           </li>
                           <li>
                              <a href="#">Education Loan</a>
                           </li>
                           <li>
                              <a href="#">Hotel/Motel/Tiny Tourism</a>
                           </li>
                           <li>
                              <a href="#">Financing of Hydel Projects</a>
                           </li>
                           <li>
                              <a href="#">Interest Rates on Loans</a>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="menu-footer">
                        <h4 class="heading">
                           Deposits
                        </h4>
                        <ul>
                           <li>
                              <a href="#">Savings Account</a>
                           </li>
                           <li>
                              <a href="#">Current Account</a>
                           </li>
                           <li>
                              <a href="#">Recurring Deposit</a>
                           </li>
                           <li>
                              <a href="#">Fixed Deposit</a>
                           </li>
                           <li>
                              <a href="#">Himpurnivesh Deposit</a>
                           </li>
                           <li>
                              <a href="#">Sarvapriya Deposit</a>
                           </li>
                           <li>
                              <a href="#">Mahalaxmi Deposit</a>
                           </li>
                           <li>
                              <a href="#">Interest Rates on Deposits</a>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="col-md-3">
                     <div class="menu-footer">
                        <h4 class="heading">
                           ACSTI
                        </h4>
                        <ul>
                           <li>
                              <a href="#">About ACSTI</a>
                           </li>
                           <li>
                              <a href="#">Facilities</a>
                           </li>
                           <li>
                              <a href="#">Faculty</a>
                           </li>
                           <li>
                              <a href="#">Courses Calendar</a>
                           </li>
                           <li>
                              <a href="#">How to Reach</a>
                           </li>
                           <li>
                              <a href="#">Contact Us</a>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="bottom-footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <p>Copyright &#169;  2023, Himachal Pradesh State Co-operative Bank Ltd. All Rights Reserved.</p>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- =-===================================================== -->
      <script
         src="https://code.jquery.com/jquery-3.6.4.min.js"
         integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
         crossorigin="anonymous"></script>
      <script src="js/owl.carousel.min.js"></script>
      <script>
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
         
         jQuery('.owl-carousel').owlCarousel({
         loop:true,
         margin:10,
         responsiveClass:true,
         responsive:{
         0:{
             items:1,
             nav:true
         },
         600:{
             items:2,
             nav:false
         },
         1000:{
             items:2,
             nav:true,
             loop:true
         }
         }
         })
         
         jQuery(document).ready(function(){  
         jQuery(".profile").click(function(){  
         jQuery(".profile-menu").toggleClass("show");  
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".submit-button").click(function(){  
         jQuery(".detail-confirm-popup").toggleClass("show");  
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".edit-btn").click(function(){  
         jQuery(".detail-confirm-popup").toggleClass("show");  
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".confirm-btn").click(function(){  
         jQuery(".detail-confirm-popup").toggleClass("show");  
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".confirm-btn").click(function(){  
         jQuery(".OTP-confirm-popup").toggleClass("show");  
         });
         });
         
         jQuery(document).ready(function(){  
         jQuery(".AUTHENTICATE").click(function(){  
         jQuery(".OTP-confirm-popup").toggleClass("show");  
         });
         });

         jQuery(document).ready(function(){  
         jQuery(".AUTHENTICATE").click(function(){  
         jQuery(".transction-succesfull-popup").toggleClass("show");  
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

         function countdown() {
        var seconds = 59;
        function tick() {
          var counter = document.getElementById("counter");
          seconds--;
          counter.innerHTML =
            "0:" + (seconds < 10 ? "0" : "") + String(seconds);
          if (seconds > 0) {
            setTimeout(tick, 1000);
          } else {
            document.getElementById("verifiBtn").innerHTML = `
                <div class="Btn" id="ResendBtn">
                    <button type="submit">Resend</button>
                </div>
            `;
            document.getElementById("counter").innerHTML = "";
          }
        }
        tick();
      }
      countdown();
         
         
      </script>
   </body>
</html>