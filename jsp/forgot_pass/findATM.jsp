<%@ include file="/header/headerbar-logout.jsp"%>
<head>
   <%-- <link rel="stylesheet" href="css/custom.css">        --%>
   <%-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> --%>
   <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
   <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.3.6/css/buttons.dataTables.min.css">
   <script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
   <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script> 

   <%-- <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> --%>

   <%-- <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"> --%> 
   <%-- <script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>	 --%>
   <!-- code for download data to pdf and excel -->
   <%-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script> --%>
   <%-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> --%>
   <%-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script> --%>
   <%-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script> --%>
   <%-- <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script> --%>
   
<script src="atmData.js"></script>
   
</head>
<style>
   .forgot-password-inner .fotgot-form {
   width: 60%;
   margin: 100px auto;
   box-shadow: 0 0 10px 0px #ccc;
   padding: 40px;
   border-radius: 15px;
   }
   .forgot-password-inner .fotgot-form h3 {
   margin: 0 0 30px;
   border-bottom: 1px solid #ccc;
   padding: 0 0 15px;
   font-size: 26px;
   color: #2D3079;
   }
   .forgot-password-inner .fotgot-form form {
   display: flex;
   flex-wrap: wrap;
   }
   .forgot-password-inner .fotgot-form form input {
   width: 100%;
   margin: 0 0 20px;
   height: 55px;
   padding: 10px;
   border: 1px solid #ccc;
   border-radius: 5px;
   outline: none;
   }
   .forgot-password-inner .fotgot-form form button {
   width: 100%;
   height: 55px;
   font-size: 20px;
   border: 0;
   background: #0067B8;
   color: #fff;
   font-weight: 500;
   margin: 100px 0 50px;
   border-radius: 5px;
   }
   .forgot-password-inner .fotgot-form form label {
   width: 100%;
   margin: 10px 0 0;
   }
   .atm-branch-find-inner form {border-bottom: 1px solid #ccc;padding: 0 0 10px;margin: 0 0 20px;}
   .atm-branch-find-inner form button.submit-button {
   padding: 10px 60px;
   border: 0;
   background: #0a67b5;
   color: #fff;
   font-size: 16px;
   font-weight: 500;
   font-family: 'Montserrat';
   margin: 10px 0 10px;
   border-radius: 5px;
   }
   .atm-branch-find-inner .tabcontent.tabing-dash {
   padding: 0;
   }
   .atm-branch-find-inner .tabcontent.tabing-dash {
   width: 100%;
   display: block;
   }
   .atm-branch-find-inner .tabcontent.tabing-dash div#find-atm-branch-inner {display: flex;flex-wrap: wrap;justify-content: space-between;}
   .atm-branch-find-inner .tabcontent.tabing-dash div#find-atm-branch-inner .fatch-data {
   width: 32%;
   margin: 0 0 20px;
   padding: 20px 20px 20px;
   BOX-SHADOW: 0 0 10px 0px #ccc;
   border-radius: 15px;
   }
   .atm-branch-find-inner .tabcontent.tabing-dash div#find-atm-branch-inner .fatch-data .account {
   margin: 0 0 10px;
   }
   .atm-branch-find-inner .tabcontent.tabing-dash div#find-atm-branch-inner .fatch-data .account strong::after {
   content: ':';
   margin-left: 5px;
   }

</style>

<body onload="getAtmData()" >
   <section class="find-atm-branch-main my-5">
      <div class="container">
         <div class="row">
            <div class="atm-branch-find-inner">
               <h2>Find a ATM or Branch Near You</h2>
               <h5>HPSCB Bank Network</h5>
              <%-- <form action="">                                 
                  <button type="button" class="submit-button"  > View</button>
               </form>   --%>

               <div id="atmTable">
               </div>

            </div>
         </div>
      </div>
   </section>
   <%-- <footer>
   </footer> --%>
<section class="back-home-button mt-5">
    <div class="container">
        <div class="inner-back-home">
            <button type="button" onclick="window.location.href='/jsp/loginNew.jsp'"> <a>BACK</a></button>
            <button type="button" onclick="window.location.href='/jsp/loginNew.jsp'"> <a>HOME</a></button>
        </div>
    </div>
</section>

<div class="bottom-footer">
       <div class="container">
          <div class="row">
             <div class="col-md-12">                
				<p>Copyright &#169;  2023, Himachal Pradesh State Co-operative Bank Ltd. All Rights Reserved.</p>
             </div>
          </div>
       </div>
    </div>
   
</body>
</html>
