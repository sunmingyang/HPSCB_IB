
  <%@ page import="easycbs.bancmateib.common.dto.BMConfig"%>
   <%@ page import="java.util.*" %>
<%
   String IBURL = BMConfig.getProperty("IBURL");
   System.out.println("IBURL web url from ini file is : - " + IBURL);

     ArrayList<String> myList=null;
	if(session.getAttribute("resStr")!=null)
	{
		myList = (ArrayList<String>)session.getAttribute("resStr");
	}
   System.out.println("myList in mini statement page "+myList);


%>

<head> 
  
</head>
<style>
 .fd-details-table {
    background: #fff;
    /* padding: 0 25px 50px; */
}

    .fd-details-table .table-inner {
        box-shadow: 0 0 10px 0 #ccc;
        border-radius: 10px;
        overflow-x: scroll;
    }

    .fd-details-table .table-inner table {
        width: 100%;
    }

    .fd-details-table .table-inner table th {
    /* padding: 15px 15px; */
    background: #0a67b5;
    color: #fff;
    font-size: 14px;
    font-weight: 500;
    border: 1px solid #145996;
}

.fd-details-table .table-inner table td {
    padding: 8px;
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

thead {
    text-align: center;
}

div#demo {
    display: inline;
}

</style>

<%@ include file="/header/headerbar.jsp"%>

<jsp:include page="/dashBoard/dashboardNew.jsp" />

<body onload="fillData()" >
   
    <div class="breadcrumb-container">
        <div class="row">
            <div class="col">
                <div class="breadcrumb">
                    <div class="breadcrumb-item"><a href="/dashBoard/dashboard.jsp">Home</a></div>
                  
                   
                    
                    <div class="breadcrumb-item"><a>Mini-Statement </a></div>
                </div>
            </div>
        </div>
    </div>


   <section class="find-atm-branch-main ">
      <div class="container-fluid">
         <div class="row">            
               <section class="Account-Statement fd-account-details-main">
                  <div class="Account-Statement-inner">
                     <div class="act-ineer-statemt">
                           <div class="container">
                              <div class="row">
                                 <div class="statement-main-shadow-div p-0">
                                       <!-- <div class="account-main-heading">
                                          <h2>Mini Statement</h2>
                                       </div> -->
                                       <div class="account-main-heading">
                                            <h6>
                                            <img style="width: 20px"  src="/styles/images/add-user-account-icon 1.png" alt="">
                                            Mini Statement
                                            </h6>  
                                        </div>
                                        <div class="p-3">
                                            <div class="chosse-an-account col-md-12"> 
                                                <div class="inner-inpts d-flex">
                                                    <div class="col-md-6" ><label>Please Select Account:  </label></div>
                                                    <div class="col-md-4">
                                                        <select id="mAccNo" class="form-select" name="mAccNo" onchange="radioClick(this.value)" >
                                                            <%
                                                                if(myList.size()!=0)
                                                            %>
                                                            <%
                                                                for(int i=0; i<myList.size(); i++){			        		    	               			
                                                            %>
                                                            <option value="<%=myList.get(i)%>" >                                   
                                                                <span class="accountnu">
                                                                    <%=myList.get(i)%>     
                                                                </span>
                                                            </option>                                
                                                            <%                                                            
                                                                }
                                                            %>
                                                        </select>   
                                                    </div>
                                                                                                   
                                                </div>
                                            </div>  
                                            <div class="Selected-Account-Number">
                                                <strong>Selected Account Number:  </strong>
                                                <span><div id="demo" name="demo" ></div></span>
                                            </div>  
    
                                           <div class="fd-details-table">
                                              <div class="table-inner">
                                                 <div id="MiniStmtResult">
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
         </div>
      </div>
   </section>
 

<!-- <section class="back-home-button mt-5">
    <div class="container">
        <div class="inner-back-home">
            <button type="button" onclick="window.location.href='/dashBoard/dashboard.jsp'"> <a>BACK</a></button>
            <button type="button" onclick="window.location.href='/dashBoard/dashboard.jsp'"> <a>HOME</a></button>
        </div>
    </div>
</section> -->

<!-- Footer Start -->
 <%@ include file="/header/footer.jsp"%>	
<!-- Footer End -->
   

<script>

    function radioClick(sAccnum) {		   	
	    	var aNo = sAccnum;
            //console.log(aNo);
		    demo.innerHTML = aNo;	
            getMiniStatement(aNo);
    }

      function fillData(){ 
           // alert("fill data is called");
            var e = document.getElementById("mAccNo").value;
           //alert("eee" + e);
            radioClick(e);

        }

   async function getMiniStatement(sAccnum){    
      //var fdAccNo= localStorage.getItem("fdAccNo") ;  
      try {
         const jsonData  =  await fetch("/rest/AccountService/getMiniStatement/"+sAccnum)         
         .then(response => response.json()).then(response=>displayMiniStatement(response));         
      }catch (e) {
         console.log("error");
         console.log(e);       
      } 
   }   	

   function displayMiniStatement(response){     
      var tempLen = response.tranList.length;    
      var mini_stmt = "";      
      var MiniStmt_res = "";      
      if (tempLen>0){
         var tableBody = '<table>' + '<thead>' +
                                       '<th> S.No</th> <th>Date</th>'+
                                       '<th>Description</th> <th>DEBIT</th>'+
                                       '<th>CREDIT</th> <th>Current Balance</th>'+                                                                             
                                  '</thead>' ;    

            for (var i = 0; i < tempLen; i++) { 
               var drAmt = "";  var crAmt = "";  
              MiniStmt_res  =  response.tranList[i];    
              if(MiniStmt_res.trdDrCr == "D"){
                  drAmt =  Number(MiniStmt_res.trdAmt).toFixed(2);   
              } 
              else{
                  crAmt =  Number(MiniStmt_res.trdAmt).toFixed(2); 
              }  
              mini_stmt += 
                           '<tr>'+ 
                              '<td style="text-align:left;" >'+ (i+1) +'</td>'+ 
                              '<td style="text-align:left;">'+ (MiniStmt_res.trdDate).slice(0, 10) +'</td>'+ 
                              '<td style="text-align:left;" >'+ MiniStmt_res.narration +'</td>'+                                              
                              '<td style="text-align:right;" >'+ drAmt +'</td>'+ 
                              '<td style="text-align:right;" >'+ crAmt +'</td>'+                               
                              '<td style="text-align:right;" >'+ Number(MiniStmt_res.curbalance).toFixed(2)  +'</td>'+                                 
                           '</tr>'       
            }               
            document.getElementById("MiniStmtResult").innerHTML = tableBody + '<tbody>' + mini_stmt + '</tbody>' + '</table>' ;   
      }
      else{
            document.getElementById("MiniStmtResult").innerHTML =  'No Record Found' ;
      }
          
   }	 		
</script> 


</body>
</html>


