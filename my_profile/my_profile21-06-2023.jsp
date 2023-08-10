
<%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Calendar " %>
  
 <% 
	Calendar mycal1 = Calendar.getInstance(); 
%> 

<% 
    String Arr= null, usrName="";
    String  custID="";
    String userInfo[][] = null;
    String custInfo[]=null;
    int j; 
    usrName = (String)session.getAttribute("user");
    custID= (String)session.getAttribute("custid");
    userInfo = (String [][])session.getAttribute("userInfo");
    String accountInfo=(String )session.getAttribute("AccountInfo");
    custInfo=(String[])session.getAttribute("agndata");

	System.out.println("CustInfo :::::::::: ---- " + custInfo[0]);
	System.out.println("CustInfo :::::::::: ---- " + custInfo[1]);
	System.out.println("CustInfo :::::::::: ---- " + custInfo[2]);
	System.out.println("CustInfo :::::::::: ---- " + custInfo[3]);
	System.out.println("CustInfo :::::::::: ---- " + custInfo[4]);
	System.out.println("CustInfo :::::::::: ---- " + custInfo[5]);
	System.out.println("CustInfo :::::::::: ---- " + custInfo[6]);
	System.out.println("CustInfo :::::::::: ---- " + custInfo[7]);
	System.out.println("CustInfo :::::::::: ---- " + custInfo[8]);
	
	
	System.out.println("CustInfo :::::::::: ---- " + custInfo[11]);
	


	



    String loginTime = (String)session.getAttribute("lastLoginTime");
    String totallogin = (String)request.getAttribute("totallogin");
%>


<head>
    <%-- <link rel="stylesheet" href="css/custom.css"> --%>
    
	 

</head>
 <%@ include file="/header/headerbar.jsp"%>
<body>	
	   

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
                                    <strong>My Profile</strong>
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
									<i class="fa fa-user" aria-hidden="true"></i>
									<img src="/styles/images/down-aroowwww.png" alt="">
								 </span>
	                            <span class="profile-menu">
	                                <ul>
	                                    <li>
	                                        <a href="my-profile.html">My Profile</a>
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


    <!-- header-end -->



    <section class="e-Statement-main">
        <div class="e-Statement-inner">
            <div class="container">
                <div class="row">
                    <div class="e-Statement-inner-shadow">
                        <div class="heading">
                            <img src="/styles/images/bank-statement-icon 1.png" alt="">
                            <h5>My Profile</h5>
                        </div>

                        <div class="massage-sec my-profile-section">
                            <div class="profil-section-flex">
                                <%-- <span class="my-profile-icon">
                                    <img src="/styles/images/my-profile-icon.png" alt="#">
                                </span> --%>
                                <span class="name-date-section">
                                    <span class="name">
                                       <%=usrName%>
                                    </span>
                                    <span class="last">
                                        Last visited:
                                        <%= (new java.util.Date()).toLocaleString()%>
                                        <!-- 28-Mar-2023, [ 04:16 AM IST ] -->
                                    </span>
                                    <span class="log-out">
                                        <button type="button" onclick="window.location='/jsp/login.do?action=ibUsrLogout'"> 
                        				   <i class="fa fa-sign-in" aria-hidden="true"></i>
                          						 LOG OUT
                        				</button>
                                    </span>
                                </span>
                            </div>

                            <div class="Details-As-Per">
                                <h5>Details As Per Bank Record's</h5>
                            </div>

                            <div class="my-details-profile">
                                <div class="details-my">
                                    <span>Name:<%=custInfo[1]%></span>
                                    <span>
                                        <%=usrName%>
                                        <!-- DINESH -->
                                    </span>
                                </div>

                                <%-- <div class="details-my">
                                    <span>Last Name:</span>
                                    <span>
                                        
                                        <!-- KUMAR -->
                                    </span>
                                </div> --%>

                                <div class="details-my">
                                    <span> Address:<%-- <%=custInfo[2]%> --%></span>
                                    <span>
                                        <%=custInfo[8]%>
                                        <!-- PLOT NUMBER 12A, MAHAVEER NAGAR LADURAM MAWA WALI GALI NEAR ENTERNAL HOSPITAL
                                        SANGANER, JAIPUR -->
                                    </span>
                                </div>

                                <div class="details-my">
                                    <span> State:</span>
                                    <span>
										HP
									</span>
                                </div>

                               

                                <div class="details-my">
                                    <span> Country:</span>
                                    <span>INDIA</span>
                                </div>

                               

                                <div class="details-my">
                                    <span> Display Name * : </span>
                                    <span class="withbackchg">
                                        <span class="background-colo">
                                           Mr. <%=usrName%> <%-- Mr. <%=custInfo[1]%> <!-- DINESH KUMAR YADAV --> --%>
                                        </span>
                                        <%-- <a>Change</a> --%>
                                    </span>
                                </div>

                                <div class="details-my">
                                    <span> PAN Number : </span>
                                    <span class="withbackchg">
                                        <span class="background-colo">
                                            <%=custInfo[7]%>
                                        </span>
                                        <%-- <a>Update</a> --%>
                                    </span>
                                </div>

                                <div class="details-my">
                                    <span> AADHAAR Number : </span>
                                    <span class="withbackchg">
										<span class="background-colo">
                                        	<%=custInfo[5]%>
										</span>
                                        <!-- XXXX XXXX 5189 -->
                                    </span>

                                </div>

                               

										


                                <div class="details-my">
                                    <span> Mobile Number : </span>
                                    <span class="withbackchg">
                                        <span class="background-colo">
                                            <%=custInfo[11]%>
                                            <!-- +91 1234 567 890 -->
                                        </span>
										
                                    </span>
                                </div>

                            </div>

                           

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="back-home-button mt-5">
        <div class="container">
            <div class="inner-back-home">
                <button type="button" onclick="window.location.href='/dashBoard/dashboard.jsp'"> <a>BACK</a></button>
           		<button type="button" onclick="window.location.href='/dashBoard/dashboard.jsp'"> <a>HOME</a></button>	
            </div>
        </div>
    </section>



    <!-- footer-start -->
	
































	    <%@ include file="/header/footer.jsp"%>

    <!-- =-===================================================== -->
 
    	<script>
			var specialChars = document.querySelectorAll("span.char");
			for (var c = 0; c < specialChars.length; c++) {
				specialChars[c].innerHTML = decodeURIComponent(specialChars[c].innerHTML);
			}
		</script>

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

    	    jQuery(document).ready(function () {
    	        jQuery(".close").click(function () {
    	            jQuery(".popScroll").toggleClass("d-none");
    	        });
    	    });

    	    jQuery(document).ready(function () {
    	        jQuery(".statement-button").click(function () {
    	            jQuery(".statement-start-aria").toggleClass("show");
    	        });
    	    });

    	    jQuery(document).ready(function () {
    	        jQuery(".last-10").click(function () {
    	            jQuery(".last-10-tra").toggleClass("show");
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


    	</script>
    	
	
</body>

</html>