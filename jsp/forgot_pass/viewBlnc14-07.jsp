
<head>        
    <%-- <link rel="stylesheet" href="css/custom.css">        --%>
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



</style>
<%@ include file="/header/headerbar-logout.jsp"%>

<body>    
    
<div class="forgot-password-main">
    <div class="container">
        <div class="forgot-password-inner">
            <div class="fotgot-form">
                <h3>View  BALANCE</h3>
                <form action="">
                    <label>Account No : </label> 
                    <input type="text" id="accNo" maxlength="15" required>                    
                    <button type="button" class="submit-button" >View</button>
                </form>
            </div>
            <div class="bottns"></div>
        </div>
    </div>
</div>
<section class="back-home-button mt-5">
    <div class="container">
        <div class="inner-back-home">
            <button type="button" onclick="window.location.href='/jsp/loginNew.jsp'"> <a>BACK</a></button>
            <button type="button" onclick="window.location.href='/jsp/loginNew.jsp'"> <a>HOME</a></button>
        </div>
    </div>
</section>



<script>  

         jQuery(".submit-button").click(function(){                 
            jQuery(".OTP-confirm-popup").toggleClass("show");  
            if(isEmpty()){
                alert("field can not be left blank.");
            } else {
                viewAccountBalance();                
            }
         });

        function isEmpty() {
            var isCorrect = false;
            var CustomerId =jQuery("#accNo");          
            if (jQuery.trim(CustomerId.val()) == "") {
                isCorrect = true;
            }
            return isCorrect;
        }     
        
</script>

 <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.3.js"></script>
    <script type="text/javascript" src="xml2json.js"></script>
    
<script type="text/javascript">
    var x2js = new X2JS();
     async function viewAccountBalance(){                   
        var sAccNO = document.getElementById("accNo").value;	
        alert(sAccNO);   

      try {
        const jsonData  =  await fetch("http://127.0.0.1:8643/rest/AccountService/accountBalance/"+ sAccNO)
        // "http://127.0.0.1:8643/rest/AccountService/accountBalance/"+ sAccNO     
        .then(response => response.json()).then(response=>processResOTP(response));         
      }catch (e) {
        console.log("error");
         console.log(e);       
      }
        			
	}

    function processResOTP(response){
        alert("API response get successfully"); 
       //var xmlData = response.text();
       console.log(response);
       if(response.accBalance == ""){
        alert("Invalid Account No");
       }
       else{
            alert("Your Current Balance is :::: " + response.accBalance);
       }
       
        
    }

    
</script>



</body>
</html>