<%@ include file="/common/Include.jsp" %>
<%@ page import="easycbs.bancmateib.common.web.SessionHandler"%>
<%@ page import="java.util.*" %>

<% 
   String Arr= null, usrName="";
   String userInfo[][] = null;
   int j; 
   
   usrName = (String)session.getAttribute("user");

   String custRole = (String)session.getAttribute("custRole"); 
   String ustKid = (String)session.getAttribute("ustType"); 


   userInfo = (String [][])session.getAttribute("userInfo");
   String brnCode=userInfo[0][1];
//out.writeln(""+request.setAttribute("brnCode",brnCode));
   System.out.println("Branch Code is this -->"+brnCode);
   String loginTime = (String)session.getAttribute("lastLoginTime");
   String totallogin = (String)request.getAttribute("totallogin");
    String responseStr = (String)session.getAttribute("responseStr");

   boolean mobileUserAgent  = SessionHandler.mobileUserAgent(request.getHeader("User-Agent").toLowerCase()); 
   if (mobileUserAgent)	{
       response.sendRedirect("/mobile/mobilemenu.jsp");   
       System.out.println("GO TO ANDROID TABLET mobilemenu");
   } 
                   
   System.out.println("Context Path: "+request.getContextPath());                 
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dashBoard/css/index.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dashBoard/css/font-awesome.min.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<style>

.user-icon{
  height: 33px;
  width: 33px;
  background-color: rgb(164, 166, 172);
  border-radius: 50%;
  display: inline-block;
}

.user-icon:hover{
  background-color: rgb(165 185 243);
  cursor: pointer;
}
.header{
    background-color: #b1cde2;
}

.profile-menu{
  margin-left: -128px !important;
  margin-top: 19px !important;
}
.profile-menu:hover{
  cursor: pointer;
}


span.profile-menu a:hover {
  background-color: #eaeaea;
}

.nav_name{
  max-width: 150px;
}

</style>
<script>
  console.log("Working");
  var custRole = "<%=custRole%>";
  var ustKid = "<%=ustKid%>";
  console.log(custRole);
  console.log("<%=ustKid%>");
</script>
<body id="body-pd">
    <header class="header shadow" id="header">
        <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
        <nav class="navbar navbar-expand-lg navbar-light">
            <!-- <a class="navbar-brand" href="#">Navbar</a> -->
            <button class="navbar-toggler" id="nav_open" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav" id="level_1_menus">
              </ul>
            </div>
            
        </nav>
        <div class="">
            <div id="userDiv">
              <!-- <span class="time">
                <%= (new java.util.Date()).toLocaleString()%>
              </span>
              <span onclick="toggleProfileMenu()">                       
                <img src="/dashBoard/images/down-aroowwww.png" alt="">
              </span> -->
              <div class="user-icon text-center p-2" onclick="toggleProfileMenu()">
                <i class="fa fa-user" aria-hidden="true"></i>
              </div>
              <!-- <span class="profile-menu" id="profileMenuTop" style="display: none;"> -->
              <ul class="profile-menu dropdown-menu dropdown-menu-end shadow p-1" id="profileMenuTop" style="display: none;">
                <li class="py-2 px-2">
                  <div>
                    <i class="fa fa-user me-2 text-primary"></i>
                    <span class="text-dark fw-semibold"><%=usrName %></span> 
                    
                  </div>
                </li>
                <hr class="p-0 m-0">
                <li class="py-2 px-2" onclick="()=>{localStorage.clear()}">
                  <a href="/jsp/login.do?action=ibUsrLogout">
                    <i class="fa fa-sign-out me-2 "></i>  
                    <span class="text-dark fw-semibold">Logout</span> 
                  </a>
                </li>
              </ul>
              <!-- </span> -->
            </div>
        </div>
          
          
    </header>
    <div class="l-navbar" id="nav-bar"> 
        <nav class="nav">
            <div> 
                <a href="/dashBoard/dashboard.jsp" class="nav_logo"> 
                    <i class='bx bx-layer nav_logo-icon' id="home_button"></i> 
                    <span class="nav_logo-name">
                        <img src="/dashBoard/images/hpradesh.png" alt="" width="100" style="background-color: #f2f2f2; ">
                    </span> 
                </a>
                <div class="nav_list" id="side_menus" style="height: 100vh; overflow-y: auto; max-height: 600px;"> 
                    <a href="#" class="nav_link active side-item"> 
                        <i class='bx bx-grid-alt nav_icon'></i> 
                        <span class="nav_name">Dashboard</span> 
                    </a> 
                    <a href="#" class="nav_link side-item"> 
                        <i class='bx bx-user nav_icon'></i> 
                        <span class="nav_name">Users</span> 
                    </a> 
                    <a href="#" class="nav_link side-item"> 
                        <i class='bx bx-message-square-detail nav_icon'></i> 
                        <span class="nav_name">Messages</span> 
                    </a> 
                    <a href="#" class="nav_link side-item"> 
                        <i class='bx bx-bookmark nav_icon'></i> 
                        <span class="nav_name">Bookmark</span> 
                    </a> 
                    <a href="#" class="nav_link side-item"> 
                        <i class='bx bx-folder nav_icon'></i> 
                        <span class="nav_name">Files</span> 
                    </a> 
                    <a href="#" class="nav_link side-item"> 
                        <i class='bx bx-bar-chart-alt-2 nav_icon'></i> 
                        <span class="nav_name">Stats</span> 
                    </a> 
                </div>
            </div> 
        </nav>
    </div>

</body>

<script src="<%=request.getContextPath()%>/dashBoard/js/index.js"></script>


</html>
