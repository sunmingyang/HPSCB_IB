function hello(){
    //("Hello");    
    if(document.getElementById('pass').value===document.getElementById('cnfPass').value){
        if (pass!=true || cnfPass!=true) {
            alert(" Unsatisfied Password Policy ");        
            return 0;
        }
        //alert("Password matched");        
       forgetPassResponse(); 
       // verifyOTPForForgetPass();      
    } else {
        alert(" Password  not match ");
        window.location.href="/jsp/forgot_pass/ConForgetPass.jsp";
    }       
}



async function forgetPassResponse(){	
    //alert("forgetPassResponse is calling 1111");                                
    var userId = localStorage.getItem("userID") ;
    var beneficiaryAccNo = localStorage.getItem("beneficiaryAccNo") ; 

    var OTP =  document.getElementById('otp').value;      
    var pass= document.getElementById('cnfPass').value;
    var sPwd = calcMD5(pass);
    
    //alert("userId: ::: " + userId + "mobile ::::" + beneficiaryAccNo + " otp ::::::" + OTP + "pass ::::" + pass);           
    try {
        const jsonData  =  await fetch("http://127.0.0.1:8643/rest/AccountService/ForgetPasswordUrl", {
            method: "POST",
            body: JSON.stringify({
                "userID": userId,
                "beneficiaryAccNo": beneficiaryAccNo ,
                "sessionID":"cdm",
                "OTP": OTP,
                "encPassword" : sPwd                                    
            }),
            headers: {
                "Content-type": "application/json; charset=UTF-8",
                "Access-Control-Allow-Origin": "*"
            }
        }).then(response => response.json()).then(response=>processResOTP(response));
        
    } catch (e) {
        console.log("error");
        console.log(e);
        //alert(e);
    }     
}


function processResOTP(response){
    //alert(" processForgetPassResponse function is calling 222222222222 ");
    console.log(response,"data");
    const verifyStatus = response.result;
    console.log(verifyStatus);
    if (verifyStatus == "success"){
        alert("Your password has been reset successfully");
        window.location.href="/jsp/loginNew.jsp";
    }                   
    else if (verifyStatus == "-2"){
        alert(" Invalid OTP ");
        window.location.href="/jsp/forgot_pass/ConForgetPass.jsp";
    }
    else{
        alert(" Invalid Details ");
       window.location.href="/jsp/forgot_pass/forgetPass.jsp";
    }                    		
} 