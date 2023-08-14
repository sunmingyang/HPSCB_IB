<%@ page import="java.util.Calendar " %>
<%@ include file="/common/Include.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%@ page import= "java.awt.*"%>
<%@ page import= "java.awt.event.*"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>
<%@ page import="org.json.JSONArray" %> 
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.*" %>
<%@ page import="org.json.JSONObject" %>
<%@page import="java.text.SimpleDateFormat"%>

<% 
	Calendar mycal1 = Calendar.getInstance(); 

	ArrayList<String> accTypeList=null;
	String resleng ="";
  	if(session.getAttribute("resleng")!=null){
	   resleng = (String)session.getAttribute("resleng");
       session.removeAttribute("resleng");
    }
	if(session.getAttribute("accTypeList")!=null)
 	{
  		accTypeList = (ArrayList<String>)session.getAttribute("accTypeList");
 	}

	ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
		myList = (ArrayList<String>)session.getAttribute("resStr");
		
	}


	if(request.getAttribute("FileDetails")!=null){}
	String[] acc_nums = null;
	String[] acc_curr = null;
    String userInfo[][]=null;
	String acc_num ="";
    String arr = null,curCode="",curBal="",usrName="",source="";
	int l = 0;
	if(session.getAttribute("AccNum")!=null){
     acc_num=(String)session.getAttribute("AccNum");
     System.out.println("enter in accnum11111111111111111111111111111111111111111111111111111111111");
	}else{
		System.out.println("enter in accnum222222222222222222222222222222222222222222222222222222222222222222222222222");
	}
	
	
    if(session.getAttribute("userInfo")!=null){
	   userInfo = (String[][])session.getAttribute("userInfo");
       //session.removeAttribute("userInfo");
    }
	
	
	// like 0-accno,1-brcode,2-brnstatus,3-appserver
	System.out.println("LENGTH OF USERINFO is : "+userInfo.length);
	System.out.println("userInfo  : "+userInfo);
	l = userInfo.length;
	java.sql.Date dt=new java.sql.Date(106,11,22);
	Date curdate=new Date();
	String strdate=DateTimeFunction.dateToStrFmt(curdate,"dd/mm/yyyy");
		
	String obj1=null;
	String obj2=null;
	HashMap mini_stmt = null;
	HashMap mini_stmt1 = null;
	
	ArrayList mini_date = null;
	ArrayList mini_Edesc= null;
	ArrayList mini_Hdesc= null;
	ArrayList mini_crdr = null;
	ArrayList mini_amt = null;
	ArrayList mini_cumbal = null;
	String flag = "m";
	
	if(session.getAttribute("mini_stmt1") != null)	{
		mini_stmt1 = (HashMap)session.getAttribute("mini_stmt1"); 
		session.removeAttribute("mini_stmt1");
		System.out.println("enter in mini_stmt1");
		System.out.println("obj*##########################################* ==== "+mini_stmt1);
		}else{
			System.out.println("enter in mini_stmt1 but null ");
			}
	
	if(session.getAttribute("obj2") != null)
	{
		obj1 = (String)session.getAttribute("obj2");
		System.out.println("enter in if condition obj2  11111111111111111111111111111111111");  
		session.removeAttribute("obj2");
		System.out.println("obj2  obj2  obj2  obj2 ==== "+obj2);
		
	}else{
				System.out.println("enter in else obj1  error 22222222222222222222222222222222222");
	}
	if(request.getAttribute("flag") != null)
		 flag = (String)request.getAttribute("flag");
	if(session.getAttribute("currency") != null)
	{
		curCode = (String)session.getAttribute("currency");
		session.removeAttribute("currency");
	}
	if(session.getAttribute("nCurBal") != null)
	{
		curBal = (String)session.getAttribute("nCurBal");
		session.removeAttribute("nCurBal");
	}
	if(session.getAttribute("user") != null){
		usrName = (String)session.getAttribute("user");
         //session.removeAttribute("user");
    }
	if(request.getParameter("success") != null){
		source = (String)request.getParameter("success");
       // session.removeAttribute("success");
    }
	
	if(session.getAttribute("mini_stmt") != null)	{
		mini_stmt = (HashMap)session.getAttribute("mini_stmt"); 
		session.removeAttribute("mini_stmt");
		if(mini_stmt != null) { 
			mini_date =(ArrayList)mini_stmt.get("mini_date");
			mini_Edesc=(ArrayList)mini_stmt.get("mini_Edesc");
			mini_Hdesc=(ArrayList)mini_stmt.get("mini_Hdesc");
			mini_crdr=(ArrayList)mini_stmt.get("mini_crdr");
			mini_amt=(ArrayList)mini_stmt.get("mini_amt");
			String acc_no=(String)mini_stmt.get("acc_no");
			mini_cumbal=(ArrayList)mini_stmt.get("mini_cumbal");
		}
		String acc_no=(String)mini_stmt.get("acc_no");
		System.out.println("mini_date is : "+ mini_date );
		System.out.println("mini_Edesc is : "+ mini_Edesc );
		System.out.println("mini_Hdesc is : "+ mini_Hdesc );
		System.out.println("mini_crdr is : "+ mini_crdr );
		System.out.println("mini_amt is : "+ mini_amt );
		System.out.println("acc_no is : "+ acc_no );
		System.out.println("mini_cumbal is : "+ mini_cumbal );
		
	}
	//ajay
	JSONArray array1 = null;
      String stDtl = "";
	  		
      if (session.getAttribute("obj1") != null ) { 	                
			 stDtl = (String) session.getAttribute("obj1");  
			 session.removeAttribute("obj1");
			JSONObject jsonObject = new JSONObject(stDtl);	
			 System.out.println("ajay deepak :::::::::::: : "+jsonObject );
			 JSONArray miniEdescArray = jsonObject.getJSONArray("mini_Edesc");
			  for (int i = 0; i < miniEdescArray.length(); i++) {
				System.out.println("<p>" + miniEdescArray.getString(i) + "</p>");
						}
			}else{
			System.out.println("length of atmData1 *********************************8 " );
	  }


	String custid = (String)session.getAttribute("custid");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HPSCB INTERNET BANKING</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800&display=swap" rel="stylesheet">  
    <link rel="stylesheet" href="/accDetails/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/accDetails/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/accDetails/css/font-awesome.min.css">
    <link rel="stylesheet" href="/accDetails/css/bootstrap.min.css">
    <link rel="stylesheet" href="/accDetails/css/custom.css">
    <script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"></style>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css"></style>


	<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>	
	<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<!-- code for download data to pdf and excel -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
   <script>


        $(document).ready(function() {
            $('#myTable').DataTable( {
                searching: false,
    			"iDisplayLength": 15
            } );
        } );

        jQuery(document).ready(function(){  
            jQuery(".profile").click(function(){  
                jQuery(".profile-menu").toggleClass("show");  
            });
         });   
 

	    if(document.getElementById("sAccnum1")) // added by abhishek
        	document.getElementById("sAccnum1").className="miniStmtResultback";
	
    	if(document.getElementById("fromdate").value==""){
	    	document.getElementById("fromdate").value = '<%=systemDate%>';
    	}
	
        if(document.getElementById("todate").value==""){
		    document.getElementById("todate").value = '<%=systemDate%>';
    	}


        function helpopen(){
        	var bar = "width=600,height=350,left=0, top=0, scrollbars=yes,resizable=no";
        	window.open("/jsp/IBHelp.jsp?src=detailst","child", bar);
        }

        function changeStrToDate(g_dte){
        	var slindex=g_dte.indexOf("/");
        	if(slindex==2){
        		var d1_day = g_dte.substring(0,2);
        		slindex=g_dte.indexOf("/",slindex+1);
        		if(slindex==5){
			        var d1_month = g_dte.substring(3,5);
        			var d1_year = g_dte.substring(6,10);
        		}else{
        			var d1_month = g_dte.substring(3,4);
        			var d1_year = g_dte.substring(5,9);
        		}
        	}else if(slindex==1){
		        var d1_day = g_dte.substring(0,1);
        		slindex=g_dte.indexOf("/",slindex+1);
        		if(slindex==4){
        			var d1_month = g_dte.substring(2,4);
        			var d1_year = g_dte.substring(5,9);
        		}else{
		        	var d1_month = g_dte.substring(2,3);
        			var d1_year = g_dte.substring(4,8);
        		}
        	}
        	var sqlDate = new Date();
        	sqlDate.setMonth(d1_month - 1);
        	sqlDate.setYear(d1_year);
        	sqlDate.setDate(d1_day);
        	return (sqlDate);
        }

        function showhide(di){
    		var divs = di;
	    	if(divs == "IBtodate"){
    			var sty = cal_todate_display.style.display;
			    if(sty == "none"){
				    cal_frdate_display.style.display = "none";
    				cal_frdate_display_year.style.display = "none";
	    			cal_todate_display.style.display = "block";
		    		cal_todate_display_year.style.display = "block";
			    }else{
				    cal_todate_display.style.display = "none";
    				cal_todate_display_year.style.display = "none";
	    			cal_frdate_display.style.display = "none";
		    		cal_frdate_display_year.style.display = "none";
			    }
    		}else if(divs == "IBfrdate"){
	    		var sty = cal_frdate_display.style.display;
		    	if(sty == "none"){
			    	cal_frdate_display.style.display = "block";
				    cal_frdate_display_year.style.display = "block";
    				cal_todate_display.style.display = "none";
	    			cal_todate_display_year.style.display = "none";
		    	}else{
			    	cal_todate_display.style.display = "none";
				    cal_todate_display_year.style.display = "none";
    				cal_frdate_display.style.display = "none";
	    			cal_frdate_display_year.style.display = "none";
		    	}
    		}
        }

        function changeDate(g_dte){
           	var d1_year =g_dte.substring(0,4);
        	var d1_month= g_dte.substring(5,7);
        	var d1_day = g_dte.substring(8,10);
        	var d1_devide = d1_month + "/" + d1_day + "/" + d1_year;
        	gCompDate = d1_devide;
        	var dd = parseInt(parseFloat(d1_day));
        	dd++;
        	var dd1;
        	if(dd < 10)
            	dd1 = "0" + dd;
        	else
            	dd1 = dd;
            	var d1_devide = d1_month + "/" + dd + "/" + d1_year;
        	return (d1_devide);
        }

        function changeDateFormat(ddate){
	        var year=ddate.substring(6,10);
        	var month=ddate.substring(3,5);
        	var day=ddate.substring(0,2);
        	comdate=day+"/"+month+"/"+year;
        	return comdate;
        }
        
        function isValidDateValue(control1,control2,ismax){
	        var check=true;
        	var UDate1 = document.getElementById(control1).value;
        	var UDate2=(control2!='g_Date')?document.getElementById(control2).value:g_Date;
	
        	if(UDate1!= 'DD/MM/YYYY'){
		        if(UDate2!= 'DD/MM/YYYY'){
        			if(control2=='g_Date')
        				check = dateComparison(control1,g_Date);
        			else
		        		check = dateComparisionOnControls(control1,control2);
		    	    //if want to check wether control1 is max from control2 then check will oposite of itself. 
        			if(!ismax)
				        check=!check;
        		}//end of if udate2
		        else
    			check=false;// if control 2 is blank then user cant fill its dependent control!!!
	        }//end of if udate1
        	return check;
        }

        function isValidValueDate(control1,control2,ismax){
	        alert("Invalid Date");
            alert('<%=strdate%>');
            control2=(control2=='<%=strdate%>')?'<%=strdate%>':control2;// this will change dependancy on retirement date to penstart date in case of Direct Family Pension.
        	if(!isValidDateValue(control1,control2,ismax)) { //if check is false then error will raise!!!    
	            alert("Invalid Date");
        	   document.getElementById(control1).value='<%=strdate%>'; 
        	}
        }

        function fillData(){  
        //changeTop();
		debugger;  
        	if('<%=resleng%>'=="crAcc"){
		        alert("To date can not greater than one month");
        	}else if('<%=resleng%>'=="othAcc"){
        		alert("To date can not greater than six month");
        	}

           // alert("fill data is called");
            var e = document.getElementById("sAccnum").value;
           //alert("eee" + e);
            radioClick(e);
            
  
        }

        function radioClick(sAccnum) {
	    	var aNo = sAccnum.slice(7);
		    demo.innerHTML = aNo;	
        }

    	function changeTop(){
	    	alert("changeTop ");
		    console.log("chnage Top method");
    		var divs = document.querySelectorAll(".group_87"); // get all divs with class "group_87"
	    	for (var i = 0; i < divs.length; i++) { // loop through all the divs
		    	var currentMarginTop = parseInt(divs[i].style.marginTop) || 0; // get the current top margin value, or 0 if it's not set
			    divs[i+1].style.marginTop = (currentMarginTop + 65) + 'px'; // add 65px to the current margin value and set it back to the div
    		}		
	    }

    	function getDateRadioButton(){
	    	alert("get Date Radio button is called ");
		    var dtValue = document.querySelector('input[name = dateValue]:checked').value;				
    		alert("Date Value :  " + dtValue);			
	    	var firstDay = startDate(dtValue);
		    var lastDay = endDate(dtValue);

    		alert("firstDay " + firstDay);
	    	document.getElementById("frdate").value=firstDay;	
		    //demo.innerHTML = firstDay;	
    		alert(" lastDay" + lastDay ); 
	    	document.getElementById("todate").value=lastDay;
	    }

    	function startDate(dtValue){
	    	var date = new Date();
		    var firstDay = new Date(date.getFullYear(), date.getMonth()-dtValue, 1);
    		return [("0" + firstDay.getDate()).slice(-2),("0"+ (firstDay.getMonth()+ 1)).slice(-2), firstDay.getFullYear()].join('/');		
	    }

    	function endDate(dtValue){
	    	var date = new Date();		
		    var lastDay = new Date(date.getFullYear(), date.getMonth()-1 + 1, 0);
    		return [("0" + lastDay.getDate()).slice(-2),("0"+ (lastDay.getMonth()+ 1)).slice(-2), lastDay.getFullYear()].join('/');
	    }
    </script>
	<style>
		#dataShowTable tr th{
			border: 1px solid gray;
			height: 34px;
			text-align: center;
			font-size: 14px;
			color: black;
			font-weight: bold;
			background: #0b5ca3;
    		color: white;
		} 
		#dataShowTable tr td{
			border: 1px solid gray;
			height: 34px;
		} 
		.tableTdInput{
			width: 100%;
			height: 100%;
			border: none;
			text-align: center;
			font-size: 14px;
			color: black;
			padding: 4px;
		}
		#intTableDiv{
			height: 250px;
			overflow-y: scroll;
			padding: 0px;
		}
	</style>
</head>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body onload=fillData() >
<html:form action="/accsum/acc_sum" >  
    <!-- <header class="site-header">
        <div class="top-header">
            <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <div class="site-logo">
                        <a href="index.html">
                            <img src="/allNewCSS/images/Final_Bank_Logo.png" alt="" width="150">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>  -->

<!-------------- Login Id --------------->
<div class="menu">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="toggle d-none">
                    <span class="one"></span>
                    <span class="one"></span>
                    <span class="one"></span>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- header-end -->
<!-- <section class="brad-log-time">
        <div class="inner-brad-log">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="bradcums">
                            <ul>
                                <li>
                                    <a href="/dashBoard/dashboard.jsp">Dashboard</a>
                                    >
                                    <strong>Account Statement</strong>
                                </li>
                            </ul>
                        </div>
                    </div>  
                    <div class="col-md-6">
                     <div class="log-time">
                        <span class="time">
                            <%= (new java.util.Date()).toLocaleString()%>
                        </span>
                        <span class="profile">                       
                           <img src="/dashBoard/images/down-aroowwww.png" alt="">
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
</section> -->



<div class="breadcrumb-container">
	<div class="row">
		<div class="col">
			<div class="breadcrumb">
				<div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
				<div class="breadcrumb-item">    <a >Loan</a></div>
				
				
				<div class="breadcrumb-item"><a>Interest Certificate </a></div>
			</div>
		</div>
	</div>
</div>

<section class="Account-Statement my-5">
    <div class="Account-Statement-inner">
        <div class="act-ineer-statemt">
            <div class="container">
                <div class="row">
                    <div class="statement-main-shadow-div">
          

					<div class="text-center">
						<h5 class="justify-content-center  badge bg-primary p-2 fs-6  ">Loan Certificate</h5>
					</div>
                
					<div class="container">
						<div class="chosse-an-account">
							<div class="row">
								<div class="col-md-4">
									<label class="form-label" style="font-size: 16px;">Account Number</label>
									<select class="form-select" id="sAccnum" name="sAccnum" onchange="radioClick(this.value)">
										<option value="">Select Account Number</option>
										<% if (myList.size() != 0) {
												String accNo = "";
												for (int i = 0; i < myList.size(); i++) {
													accNo = accTypeList.get(i) + "@" + userInfo[0][1] + "-" + myList.get(i);
										%>
											<option value="<%= accNo %>">
												<span class="accountnu"><%= myList.get(i) %></span>
											</option>
										<% } } %>
									</select>
								</div>
								<div class="col">
									<label class="form-label">Customer Id :- <%= custid %></label>
								</div>
							</div>
						</div>
					</div>
					  


					<div class="container">
						<div class="start-date-end-date  ">
							<div class="row">
								<div class="col">
									<span class="date-pikkar">
										<img src="/allNewCSS/images/statement/search-date-calendar-icon 1.png" alt="">
										<label>From Date</label>
										<input type="date" class="form-control" id="frdate" name="frdate" size="15" onkeypress="isValidDatechar()" maxlength="10">
										
									</span>
								</div>
								<div class="col">
									<span class="date-pikkar">
										<img src="/allNewCSS/images/statement/search-date-calendar-icon 1.png" alt="">
										<label>To Date</label>
										<input type="date" class="form-control" id="todate" name="todate" size="15" onkeypress="isValidDatechar()" maxlength="10">
										
									</span>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div id="invisible" class="mt-2" style="display:none;">
										<span><bean:message bundle='<%=lang%>' key='117'/></span>
										
										<span><bean:message bundle='<%=lang%>' key='7098'/></span>
										<input type="radio" name="sTran_type" id="sTran_type" value="a">
										<span><bean:message bundle='<%=lang%>' key='7100'/></span>
										<input type="radio" name="sTran_type" id="sTran_type" value="d" checked="true">
										<span><bean:message bundle='<%=lang%>' key='7101'/></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
                   

					<div class="container p-2">
						<div class="row">
							<div class="col text-center">
								<div class="d-flex justify-content-center">
									<button type="button" class="btn btn-primary btn-sm statement-button mx-2" onclick="detailInterest()" id="ViewBtn">View</button>
									<button type="button" class="btn btn-primary btn-sm statement-button" id="downloadPdf" onclick="downloadPdfInt()">Download</button>
								</div>
							</div>
						</div>
					</div>
					
					
					<!--------------------Loading Spinner -------------------->
					<style>
						.loader {
							display: none;
							top: 50%;
							left: 50%;
							position: absolute;
							transform: translate(-50%, -50%);
							}

							.loading {
							border: 2px solid #ccc;
							width: 60px;
							height: 60px;
							border-radius: 50%;
							border-top-color: #1ecd97;
							border-left-color: #1ecd97;
							animation: spin 1s infinite ease-in;
							}

							@keyframes spin {
							0% {
								transform: rotate(0deg);
							}

							100% {
								transform: rotate(360deg);
							}
							}
					</style>

					<div class="loader" style="margin-top: 450px;" id="spinnerDiv">
						<div class="loading">
						</div>
					</div>
				<!--------------------Loading Spinner -------------------->
                    <div class="statement-start-aria show m-4 " id="intTableDiv"  style="width: 100%; overflow:  hidden;">
                        <table class="dataShowTable" id="dataShowTable" style="display: none;width: 100%; ">
							<input type="hidden" name = "SelectedRow" id = "SelectedRow" value = "0"> 
							<thead style="position: sticky;top: -1px;height: 25px;">
								<tr>
									<th style="width: 150px;">SR No.</th>
									<th >Date</th>
									<th>Cr/Dr</th>
									<th >Amount</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>	
						</table>

						
                    </div>
            </div>
            </div>
            </div>
        </div>
    </div>
</section>

<input type="hidden" name ="sCurrency" id ="sCurrency" value=<%=curCode %> >
</html:form>


<script>var specialChars = document.querySelectorAll("span.char"); for(var c=0; c<specialChars.length; c++){ specialChars[c].innerHTML = decodeURIComponent(specialChars[c].innerHTML); }</script>

<script>

var showIntApiData = '<td><input type="text" class="form-control" name="sr_No" class="sr_No tableTdInput" id="sr_No" value=""  /></td><td><input  class="form-control" type="text" id="intDate" name="intDate" class="intDate tableTdInput"/></td><td><input  class="form-control" type="text" id="intCrDr" name="intCrDr" class="intCrDr tableTdInput" /></td><td><input  class="form-control" type="text" id="intAmount" name="intAmount" class="intAmount tableTdInput" /></td>';

var showIntTotalAmt = '<td colspan="3" style="text-align:right"><label style="font-size: 15px;padding-left: 40px;">Total Amount </label></td><td><input  class="form-control" type="text" id="totalInput" name="totalInput" style="width:100%;height:100%;border:1px solid black;color:black;font-size: 14px;text-align: center;"></td>';



function detailInterest(){	
debugger;  

	$('#dataShowTable').show();
	var acsplit = $('#sAccnum').val();
	var accNumber = acsplit.slice(acsplit.indexOf('-') + 1);
	var fromDate = $('#frdate').val();
	var toDate = $('#todate').val();
	var totalIntAmount;
	var tempStoreAmt = 0;
	var loginCustId = '<%=custid%>';
	document.getElementById("dataShowTable").tBodies[0].innerHTML="";
	var pttable=document.getElementById("dataShowTable").tBodies[0];
	var tablerow;
	document.getElementsByClassName("loader")[0].style.display = "block";
				
	var url="<%=request.getContextPath()%>/accsum/acc_sum.do?action=InterestCr&accountNo="+accNumber+"&formdate="+fromDate+"&todateS="+toDate+"&custLogId="+loginCustId;

	$('#spinnerDiv').show();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			debugger;
			var resArray=xhttp.responseText;
			var jsonData = JSON.parse(resArray);
			debugger;
			if(jsonData!=null)
			{
				for(var i=0;i<jsonData.length;i++)
				{
					var tableLength=pttable.rows.length;
					pttable.insertRow(tableLength).innerHTML=showIntApiData;
					tablerow=pttable.rows[tableLength];
					$(pttable.rows[i]).find('#sr_No').val(i+1);
					$(tablerow).find('#intDate').val(jsonData[i].tdsdetdate.split(" ")[0]);
					$(tablerow).find('#intCrDr').val(jsonData[i].trddrcr);
					$(tablerow).find('#intAmount').val(jsonData[i].interest_paid);
					totalIntAmount = $(tablerow).find('#intAmount').val();
					tempStoreAmt =  parseFloat(tempStoreAmt) + parseFloat(totalIntAmount);
				}
				pttable.insertRow(tableLength+1).innerHTML=showIntTotalAmt;
				$('#totalInput').val(tempStoreAmt);
				$('#spinnerDiv').hide();
				
			} 
			else{
				alert("No Data Found");
			}
		}	 	
	};
	xhttp.open("GET", url, true);
	xhttp.send();    
}

function downloadPdfInt(){
	debugger;
	var acsplit = $('#sAccnum').val();
	var accNumber = acsplit.slice(acsplit.indexOf('-') + 1);
	var fromDate = $('#frdate').val();
	var toDate = $('#todate').val();
	var loginCustId = '<%=custid%>';
	document.forms[0].action="<%=request.getContextPath()%>/accsum/acc_sum.do?action=IntCrDownloadPdf&accountNo="+accNumber+"&formdate="+fromDate+"&todateS="+toDate+"&custLogId="+loginCustId;
	document.forms[0].method="post";
	document.forms[0].submit();	
}
</script>
	</body>
</html>