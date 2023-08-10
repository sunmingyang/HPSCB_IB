
  <%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>

<%

   String IBURL = BMConfig.getProperty("IBURL");
   System.out.println("IBURL web url from ini file is : - " + IBURL);
  
   String MINISTMTRECORD = BMConfig.getProperty("MINISTMTRECORD");
   System.out.println("MINISTMTRECORD  from ini file is : - " + MINISTMTRECORD);

%>

<head> 
  
</head>
<style>
 .fd-details-table {
    background: #fff;
    padding: 0 25px 50px;
}

    .fd-details-table .table-inner {
        box-shadow: 0 0 10px 0 #ccc;
        border-radius: 10px;
        overflow-x: scroll;
    }

    .fd-details-table .table-inner table {
        width: 180%;
    }

    .fd-details-table .table-inner table th {
    padding: 15px 15px;
    background: #0a67b5;
    color: #fff;
    font-size: 16px;
    font-weight: 500;
    border: 1px solid #145996;
}

.fd-details-table .table-inner table td {
    padding: 15px;
    border: 1px solid #ccc;
}

    .pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.fd-details-table .pagination {
    width: 100%;
    padding: 0 !important;
}

.fd-account-details-main .account-main-heading {
    margin: 0;
    padding: 20px 25px;
}

</style>
<%@ include file="/header/headerbar.jsp"%>
<jsp:include page="/dashBoard/dashboardNew.jsp" />

<body onload="getFDDetails()" >
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
                                    <strong>FD Account Details</strong>
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


   <section class="find-atm-branch-main ">
      <div class="container">
         <div class="row">            
               <section class="Account-Statement fd-account-details-main">
                  <div class="Account-Statement-inner">
                     <div class="act-ineer-statemt">
                           <div class="container">
                              <div class="row">
                                 <div class="statement-main-shadow-div">
                                       <div class="account-main-heading">
                                          <h2>FD Account Details</h2>
                                       </div>
                                       <div class="fd-details-table">
                                          <div class="table-inner">
                                             <div id="fdDetails">
                                             </div>                                
                                             
                                          </div>                            
                                       </div>
                                 </div>
                              </div>
                           </div>
                     </div>
                  </div>
               </section>           
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

<!-- Footer Start -->
 <%@ include file="/header/footer.jsp"%>	
<!-- Footer End -->
   

<script>
   async function getFDDetails(){    
      var fdAccNo= localStorage.getItem("fdAccNo") ;  
      try {
         const jsonData  =  await fetch("<%=IBURL%>"+"/rest/AccountService/fdDetail/"+fdAccNo)         
         .then(response => response.json()).then(response=>displayFdDetails(response));         
      }catch (e) {
         console.log("error");
         console.log(e);       
      } 
   }   	

   function displayFdDetails(response){        
      var fdAccDetails = "";
      var tempLen = response.length;     

      if (tempLen>0){
               var tableBody =  '<table >'  + '<thead>' + 
               '<th>Sr No</th> <th >Acc-No</th> <th > Amount </th>  <th >Code</th> <th >Date</th> <th >Days</th> <th >Fd ROI.</th> <th >Int Paid</th>' +
               '<th >mamount</th> <th >mdateD</th> <th >month</th> <th >number</th> <th >pstatus</th> <th >series</th>' +
               '<th >status</th> <th >strsrno</th> <th >Td-Samt</th> <th >Year</th> </thead>' ;        
                  for (var i = 0; i < tempLen; i++) {     
                     fdAccDetails+=
                        '<tr>'+ 
                           '<td>'+ (i+1) +'</td>'+ 
                           '<td>'+ response[i].accNo +'</td>'+     
                           '<td>'+ response[i].amount +'</td>'+ 
                           '<td>'+ response[i].code +'</td>'+ 
                           '<td>'+ response[i].date +'</td>'+ 
                           '<td>'+ response[i].days +'</td>'+ 
                           '<td>'+ response[i].fdi_int +'</td>'+ 
                           '<td>'+ response[i].intpaid +'</td>'+                   
                           '<td>'+ response[i].mamount +'</td>'+   
                           '<td>'+ response[i].mdate +'</td>'+     
                           '<td>'+ response[i].month +'</td>'+ 
                           '<td>'+ response[i].number +'</td>'+ 
                           '<td>'+ response[i].pstatus +'</td>'+ 
                           '<td>'+ response[i].series +'</td>'+ 
                           '<td>'+ response[i].status +'</td>'+ 
                           '<td>'+ response[i].strsrno +'</td>'+ 
                           '<td>'+ response[i].tdsamt +'</td>'+  
                           '<td>'+ response[i].year +'</td>'+ 
                        '</tr>'
                  }               
                  document.getElementById("fdDetails").innerHTML = tableBody + '<tbody>' + fdAccDetails + '</tbody>' + '</table>' ;   
      }
      else{
         document.getElementById("fdDetails").innerHTML =  'No Record Found' ;
      }

      
          
   }	 		
</script> 


</body>
</html>


