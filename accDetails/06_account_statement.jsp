<%@ page import="java.util.Calendar " %>
<%@ include file="/common/Include.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%@ page import= "java.awt.*"%>
<%@ page import= "java.awt.event.*"%>
<%@ page import ="java.io.*"%>
<%@ page import ="java.util.ArrayList, javax.servlet.ServletOutputStream "%>

<% 
	Calendar mycal1 = Calendar.getInstance(); 
%>

<%@ include file="/header/headerbar.jsp"%>

<% 
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
	if(session.getAttribute("AccNum")!=null)
     acc_num=(String)session.getAttribute("AccNum");
	
	
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
		
	
	HashMap mini_stmt = null;
	ArrayList mini_date = null;
	ArrayList mini_Edesc= null;
	ArrayList mini_Hdesc= null;
	ArrayList mini_crdr = null;
	ArrayList mini_amt = null;
	ArrayList mini_cumbal = null;
	String flag = "m";
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
%>


 <style>
        .Selected-Account-Number {
            display: flex;
        }
    </style>
<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>

<!DOCTYPE html>
<html lang="en">
<head>
    

    


    	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
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

<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"></style>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css"></style>

   <script>
        $(document).ready(function() {
            $('#myTable').DataTable( {
                searching: false,
                dom: 'frtip',
                ordering: false,
				 bLengthChange: true,    			
    			"iDisplayLength": 15
            } );
        } );

 </script>

    <script>
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
            alert(<%=strdate%>);
            control2=(control2=='<%=strdate%>')?'<%=strdate%>':control2;// this will change dependancy on retirement date to penstart date in case of Direct Family Pension.
        	if(!isValidDateValue(control1,control2,ismax)) { //if check is false then error will raise!!!    
	            alert("Invalid Date");
        	   document.getElementById(control1).value='<%=strdate%>'; 
        	}
        }

        function fillData(){  
        //changeTop();
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
		   // alert("radio click is called");
    		//alert(document.getElementById("sAccnum").checked);
    		//alert(sAccnum);		
    		//var acNo = document.getElementById(sAccnum).value;	
	    	var aNo = sAccnum.slice(6);
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
    


</head>
<jsp:include page="/dashBoard/dashboardNew.jsp" />
<body onload=fillData() >
<html:form action="/accsum/acc_sum.do" >  


  

<!-- header-end -->

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

<section class="Account-Statement">
    <div class="Account-Statement-inner">
        <div class="act-ineer-statemt">
            <div class="container">
                <div class="row">
                    <div class="statement-main-shadow-div">
                    <div class="account-main-heading">
                        <img src="/styles/images/bank-statement-icon 1.png" alt=""> Account-Statement
                    </div>               
                    <div class="chosse-an-account">
                        <html:select property="sAccnum" styleId="sAccnum" onchange="radioClick(this.value)">                          
                                <% 
					            	if(myList.size() != 0){
        			      			    String accNo = "";
                                %>
                                
                                <%
                                 	    for(int i=0; i<myList.size(); i++){
			        		    	        accNo = accTypeList.get(i) + "@" + userInfo[0][1] + "-" + myList.get(i) ;			
			                    %>
                                <html:option value="<%=accNo%>" >                                   
                                    <span class="accountnu">
                                        <%=myList.get(i)%>     
                                    </span>
		        				</html:option>                                
                                <%
                                        }
                                    }
                                %>
                        </html:select>
                    </div>

                    <div class="Selected-Account-Number">
                        <strong>Selected Account Number:  </strong>
                        <span><div id="demo" name="demo" ></div></span>
                    </div>

					<div class="row p-2 d-flex justify-content-center" >
                        <div class="date-pikkar col-md-4">
                            <img src="/allNewCSS/images/statement/search-date-calendar-icon 1.png" alt="">
                            <label>Start Date</label>
                          <input type="date" id="frdate" name="frdate" size="15"  class="form-control"  onkeypress="isValidDatechar()" maxlength="10"/> 
                        </div>

                        <div class="date-pikkar col-md-4">
                            <img src="/allNewCSS/images/statement/search-date-calendar-icon 1.png" alt="">
                            <label>End Date</label>
                           <input type="date" id="todate" name="todate" size="15" class="form-control"  onkeypress="isValidDatechar()" maxlength="10"/>
                        </div>


                        <div id="invisible" style="display:none;">
                            <bean:message bundle='<%=lang%>' key='117'/>
                            &nbsp;:&nbsp;
                            <bean:message bundle='<%=lang%>' key='7098'/>
                            <input type="radio" name="sTran_type" id="sTran_type" value="a"/>
                            <bean:message bundle='<%=lang%>' key='7100'/>
                            <input type="radio" name="sTran_type" id="sTran_type" value="d" checked="true"/>
                            <bean:message bundle='<%=lang%>' key='7101'/>
                        </div>
                    </div>


                    <%-- <p class="in-case-notice-p">In case the account statement does not reflect all your transaction, please download statement from the 'Pending Statement'  link under the 'My Accounts' tabs after some time  </p> --%>
                    

                    <div class="Select-Appropriate">
                        <h5>Select Appropriate Options To View, Print or Download The Statement</h5>
                        
                        <span class="seclect-inner-area">
                            <label for="sOut_req1">
                                <%-- <img src="/styles/images/quickview-icon 1.png" alt=""> --%>
                                <input type="radio" name="sOut_req" id="sOut_req" value="screen" checked="true">
                                <%-- <bean:message bundle='<%=lang %>' key='7102'/> --%>
                                <p>Display on screen</p>

                                <%-- <p>View</p> --%>

                                
                                <%-- <input type="radio"> --%>
                            </label>
                            &nbsp; &nbsp;
                        </span>

                        <span class="seclect-inner-area">
                            <label for="sOut_req2">
                                <%-- <img src="/styles/images/excel-file-icon 1.png" alt=""> --%>
                                <input type="radio" name="sOut_req" id="sOut_req" value="xls">
                                <p>Download in MS Excel format</p>

                                
                                <%-- <input type="radio"> --%>
                            </label>
                            &nbsp; &nbsp;
                        </span>

                        <span class="seclect-inner-area">
                            <label for="sOut_req3">
                                <%-- <img src="/styles/images/pdf-files-icon 1.png" alt=""> --%>
                                <input type="radio" name="sOut_req" id="sOut_req" value="pdf">
                                <p>Download in PDF format</p>

                                
                                <%-- <input type="radio"> --%>
                            </label>
                            &nbsp; &nbsp;
                        </span>

                    </div>

                    <div class="show-btnn">
                        
					    <%-- <input type="button" class="statement-button" onclick="return detail_statment('<%= acc_num %>','<%=curCode %>');" value="<bean:message bundle='<%=lang %>' key='3627'/>"> --%>
                        <%-- <button type="submit" class="statement-button">SUBMIT</button> --%>

                        <button type="submit" class="statement-button"  onclick="return detail_statment('<%= acc_num %>','<%=curCode %>');" >SUBMIT</button>


                    </div>

                  

                    <div class="statement-start-aria show" style="width: 100%; margin-top: 85px;">
                        <span class="headline-upper">
                            <%
                                if(source.equals("detail")){
								    String frdate=(String)request.getAttribute("frdate");
								    String todate=(String)request.getAttribute("todate");
				            %>
				                    <div class="start-date-end-date statement-row" style="display: inline-flex;">    
                                        <span class="date-pikkar">
    		    		                    <bean:message bundle='<%=lang %>' key='115'/>
                                            &nbsp;:&nbsp;
                	    			        <input type="text" id="fromdate" value="<%=frdate%>" class="miniStmtResultback" style="width: 167.66666px;margin-left: 20px;" disabled>
                                        </span>

                                        &nbsp;&nbsp;
                                        
                                        <span class="date-pikkar">
			                    	        <bean:message bundle='<%=lang %>' key='116'/>
                                            &nbsp;:&nbsp;
                				            <input type="text" id="todate" value="<%=todate%>" class="miniStmtResultback" style="width: 167.66666px;margin-left: 20px;" disabled>
                                        </span>
                                    </div>
				
            				<%
                                }
                            %>           
                            
                        </span>

        <div id="group_87">			
			<%
				
				if(mini_stmt != null)
				{
					System.out.println("ministatement not null");
					int j=0;
					if(mini_date != null)
					j= mini_date.size();
					System.out.print("jjj"+j);
					if(j!=0) {}
					{%>							
				<table border="2" id="myTable" style="width: 100%;" >						
						<thead>		
							<tr>						
								<th style="text-align:center;padding: 10px;border: 1px solid #ccc;font-size: 18px; color:black "> S.No </th>
								<th style="text-align:center;padding: 10px;border: 1px solid #ccc;font-size: 18px; color:black " > Date </th>
								<th style="text-align:center;padding: 10px;border: 1px solid #ccc;font-size: 18px; color:black " > Description </th>
                                <th style="text-align:center;padding: 10px;border: 1px solid #ccc;font-size: 18px; color:black " > DEBIT </th>
								<th style="text-align:center;padding: 10px;border: 1px solid #ccc;font-size: 18px; color:black " > CREDIT </th>								
								<th style="text-align:center;padding: 10px;border: 1px solid #ccc;font-size: 18px; color:black " > BALANCE </th>
							</tr>
						</thead> 
						<tbody>
					<%}%>
				<%
					for(int i=0;i<j;i++)
					{
						int k=0;
			%>				
				<tr>			
					<td style="text-align:left;padding: 10px;border: 1px solid #ccc;font-size: 18px;"> <%=i+1%>	</td> 
					<td style="text-align:left;padding: 10px;border: 1px solid #ccc;font-size: 18px;"> <%= mini_date.get(i) %>     </td>
					<td style="text-align:left;padding: 10px;border: 1px solid #ccc;font-size: 18px;"> <%=mini_Edesc.get(i) %> </td>
					<td style="text-align:right;padding: 10px;border: 1px solid #ccc;font-size: 18px;" > <%if(mini_crdr.get(i).equals("D")){%> <%= mini_amt.get(i)%><%}%>  </td>
                    <td style="text-align:right;padding: 10px;border: 1px solid #ccc;font-size: 18px;" > <%if(mini_crdr.get(i).equals("C")) {%> <%= mini_amt.get(i)%><%}%> </td>					
					<td style="text-align:right;padding: 10px;border: 1px solid #ccc;font-size: 18px;" > <%= mini_cumbal.get(i) %> </td>
					
                </tr>    
					<%  session.removeAttribute("mini_stmt");
					} 
				}
                
			%>		
			</tbody>	
			</table>

		</div>

                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>

</section>

<input type="hidden" name ="sCurrency" id ="sCurrency" value=<%=curCode %> >

	


    <div class="bottom-footer">
       <div class="container">
          <div class="row">
             <div class="col-md-12">                
				<p>Copyright &#169;  2023, Himachal Pradesh State Co-operative Bank Ltd. All Rights Reserved.</p>
             </div>
          </div>
       </div>
    </div>
</html:form>


 <script>
            jQuery(document).ready(function(){  
            jQuery(".profile").click(function(){  
            jQuery(".profile-menu").toggleClass("show");  
            });
            });
         </script>
<script>var specialChars = document.querySelectorAll("span.char"); for(var c=0; c<specialChars.length; c++){ specialChars[c].innerHTML = decodeURIComponent(specialChars[c].innerHTML); }</script>
	</body>
</html>


    
