
$(document).ready(function () {
    debugger;
	$('#dateShowDiv').hide();
var navListItems = $('div.setup-panel div a'),
    allWells = $('.setup-content'),
    allNextBtn = $('.nextBtn'),
    allPreviousBtn = $('.previousBtn');
    
allWells.hide();

navListItems.click(function (e) {
debugger;
e.preventDefault();
var $target = $($(this).attr('href')),
        $item = $(this);

if (!$item.hasClass('disabled')) {
    navListItems.removeClass('btn-success').addClass('btn-secondary');
    $item.addClass('btn-success');
    allWells.hide();
    $target.show();
    $target.find('input:eq(0)').focus();
}
});


allNextBtn.click(function(){
debugger

var curStep = $(this).closest(".setup-content"),
    curStepBtn = curStep.attr("id"),
    nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
    curInputs = curStep.find("input[type='text'],input[type='url']"),
    isValid = true;

//This is for Step 1st Page
if(curStepBtn=="step-1"){
	var nameReg = $('#regName').val();
    var nameRegAcNo = $('#regAccNo').val();
	var mobileNo = $('#regMobileNo').val();
	var postalCode = $('#regPostalCode').val();
	var emailReg = $('#registEmail').val();
    // var checkBox = document.getElementById('checkBoxStep1');
	if(nameReg===""){
		
		alert("Please fill Name");
		// $('.alertShow').show()
		// $('.alertShow').text("Please Fill the Name");
		$('#regName').focus();
		return false;
	}
	if(nameRegAcNo===""){
		alert("Please fill Account Number");
		$('#regAccNo').focus();
		return false;
	}
    if(mobileNo===""){
		alert("Please fill Mobile No");
		$('#regMobileNo').focus();
		return false;
	}
    if(postalCode===""){
		alert("Please fill Postal Code");
		$('#regPostalCode').focus();
		return false;
	}
    if(emailReg===""){
		alert("Please fill Email");
		$('#registEmail').focus();
		return false;
	}

    if(mobileNo!=""){
        sentOtpApi(this);
    }
    $('#viewName').val(nameReg);
	$('#viewAccNo').val(nameRegAcNo);
	$('#viewMobNo').val(mobileNo);
	$('#viewPostalCode').val(postalCode);	
	$('#viewEmail').val(emailReg);
	$('#successOtpCard').hide();
}
// This is for third Step 
if(curStepBtn=="step-4"){
	// upDocSelect();
	// alert(base64ImageVariable);
	submitData();
}

$(".form-group").removeClass("has-error");

for(var i=0; i<curInputs.length; i++){
    if (!curInputs[i].validity.valid){
        isValid = false;
        $(curInputs[i]).closest(".form-group").addClass("has-error");
    }
}

if (isValid)
    nextStepWizard.removeClass('disabled').trigger('click');
});


//Previous Button 
allPreviousBtn.click(function(){
    debugger;
    var curStep = $(this).closest(".setup-content");
    var curStepBtn = curStep.attr("id");
    
    var currStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().children("a");
    var prevStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().prev().children("a");
    
    prevStepWizard.trigger('click');
    currStepWizard.attr("disabled", "disabled");
});    
//Previous Button 

$('div.setup-panel div a.btn-success').trigger('click');
});


/*--------------------------setMobileNo-----------------------*/				
function setMobileNo(){
	debugger;
	var mText = $('#regMobileNo').val();
	var mobNo = mText.substring(6, 10);
	document.getElementById("mobTagId").innerHTML = "*******"+mobNo;
	
}

//Check Email
function emailValFn(that){
	var inputvalues = $("#registEmail").val();
	var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;    
	if(!regex.test(inputvalues)){    
		alert("invalid email id");  
		$('#registEmail').val('');
		$('#registEmail').focus();
		return regex.test(inputvalues);    
	} 
}
//Check Mobile
function mobileValFn(that){
	var inputvalues = $("#regMobileNo").val();
	var regex = /^[0-9-+]+$/; 
	if(!regex.test(inputvalues)){    
		alert("This field except only numbers");  
		$('#regMobileNo').val('');
		$('#regMobileNo').focus();
		return regex.test(inputvalues);    
	} 
}
//Check Account Number
function regAccNoCheck(that){
	var inputvalues = $("#regAccNo").val();
	var regex = /^([0-9]{11})|([0-9]{2}-[0-9]{3}-[0-9]{6})$/;
	if(!regex.test(inputvalues)){    
		alert("Account number is not proper format");  
		$('#regAccNo').val('');
		$('#regAccNo').focus();
		return regex.test(inputvalues);    
	} 

	// Validate Account Number Using API
	var accNo = $('#regAccNo').val();
	var json= {"Accno":accNo};
	const myJson = JSON.stringify(json) ;
	var url="/rest/AccountService/AccountNoValidation";
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var resArray=xhttp.responseText;
			var jsN = JSON.parse(resArray);
			// // console.log(jsN);
			// var newJsno = jsN.Data.replace(/\\/g, "");
			// var jsN2 = JSON.parse(newJsno);
			if(jsN!=null)
			{
				if(jsN.Data!="Accont Number Valid"){
					alert("Account Number Not Valid");
					$('#regAccNo').val('');
					$('#regAccNo').focus();
					return false;
				}
			}	
		} 	
	};
	xhttp.open("POST", url, true);
	xhttp.send(myJson);
}
//Check Postal Code
function postalCodeFn(that){
	debugger;
	var inputvalues = $("#regPostalCode").val();
	var regex = /^[0-9-+]+$/; 
	if(!regex.test(inputvalues)){    
		alert("This field except only numbers");  
		$('#regPostalCode').val('');
		$('#regPostalCode').focus();
		return regex.test(inputvalues);    
	} 
}

// OTP CountDown Function 
var timeleft = 60;
function otpTimer(remaining) {
	debugger;
	clearInterval(1);
    var downloadTimer = setInterval(function(){

	// alert("Otp Sent on your given Number");
	$('#resendButton').prop('disabled', true);
	// $('#secondBackBtn').prop('disabled', true);
	// $('#secondNextBtn').addClass('disabled');
	// $('#stepBtn1').addClass('disabled');
    timeleft--;
    document.getElementById("timer").textContent = timeleft;
    if(timeleft == 0){
        clearInterval(downloadTimer);
		alert('Timeout Please Resend OTP');
		$('#resendButton').prop('disabled', false);
		// $('#secondBackBtn').prop('disabled', false);
		// $('#secondNextBtn').removeClass('disabled');
		// $('#stepBtn1').removeClass('disabled');
	}
	if(timeleft == -1){
        clearInterval(downloadTimer);
		// alert('Timeout Please Resend OTP');
		// $('#resendButton').prop('disabled', false);
		// $('#secondBackBtn').prop('disabled', false);
		// $('#secondNextBtn').prop('disabled', false);
		// $('#stepBtn1').removeClass('disabled');
	}
    },1000);
}
function resetimer(){
	timeleft=-1;
}
//Otp Sent Function API 
function sentOtpApi(that){
	debugger;
	var regMbNo = $('#regMobileNo').val();
	var accNo = $('#regAccNo').val();
	var json= {"Accno":accNo,"MobileNo":regMbNo,"purpose":"IBNewUsrReg"};
	const myJson = JSON.stringify(json) ;	
	var getResBtnId = that.id;
	// $('#sentOtpMsg').hide();
	if(getResBtnId!= "" && getResBtnId == "resendButton")	{
		// $('#sentOtpMsg').show();
		alert("Otp Sent again on your given Number");
	}
	timeleft=60;
	otpTimer(60); 
	    var url="/rest/AccountService/sendOTPUserreg";

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				var resArray=xhttp.responseText;
				var jsonData = JSON.stringify(resArray);
				if(jsonData!=null)
				{
					
				}	
			} 	
		};
		xhttp.open("POST", url, true);
		xhttp.send(myJson);
}


//Validate Button Api For Validate OTP
function validateOtp(){
	debugger;
	var name = $('#regName').val();
	var accNo = $('#regAccNo').val();
	var mobNo = $('#regMobileNo').val();
	var postal = $('#regPostalCode').val();
	var email = $('#registEmail').val();
	var firstOtp = $('#first').val();
	var secondOtp = $('#second').val();
	var thirdOtp = $('#third').val();
	var fourthOtp = $('#fourth').val();
	var fifthOtp = $('#fifth').val();
	var sixthOtp = $('#sixth').val();
	var otpVal = firstOtp+secondOtp+thirdOtp+fourthOtp+fifthOtp+sixthOtp;

	var json= {"Accno":accNo,"UserName":name,"UserMobileNo":mobNo,"UserPincode":postal,"UserEmailid":email,"OTP":otpVal};
	const myJson = JSON.stringify(json) ;

	var url="/rest/AccountService/UserRegistration";

	$('#spinnerDiv').show();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var resArray=xhttp.responseText;
			var jsonData = JSON.parse(resArray);
			
			if(jsonData!=null)
			{
				// alert(jsonData.message);
				if(jsonData.Result!="" && jsonData.Result=="Fails"){
					alert(jsonData.message);
					
					// $('#secondNextBtn').prop('disabled', false);
					// $('#stepBtn1').prop('disabled', false);
					return false;
					
				}
				else{
					resetimer();
					$('#successOtpCard').show();
					$('#otpMesage').text(jsonData.message);
					showSwal('success-message');
					$('#otpDivCont').hide();
					// $('#secondNextBtn').prop('disabled', false);
					// $('#stepBtn1').prop('disabled', false);
				}
				$('#spinnerDiv').hide();
				
			}	
		} 	
	};
	xhttp.open("POST", url, true);
	xhttp.send(myJson);
}

/*  ==========================================
    SHOW UPLOADED IMAGE
* ========================================== */
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#imageResult').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
	// uploadImg();
}
// function uploadImg(){
// 	readURL(input);
// }

// Drop Down for Upload Document API
// function upDocSelect(){
// 	debugger;
// 	var json= "";
// 	var option = '';
// 	var url="/rest/AccountService/getidproofmaster";
// 	var xhttp = new XMLHttpRequest();
// 	xhttp.onreadystatechange = function() {
// 		if (xhttp.readyState == 4 && xhttp.status == 200) {
// 			var resArray=xhttp.responseText;
// 			var jsN = JSON.parse(resArray);
// 			// console.log(jsN);
// 			var newJsno = jsN.Data.replace(/\\/g, "");
// 			var jsN2 = JSON.parse(newJsno);
// 			if(jsN2!=null)
// 			{
// 				for (var i=0;i<jsN2.Data.length;i++){
// 					option += '<option value="'+ jsN2.Data[i].ename + '">' + jsN2.Data[i].ename + '</option>';
//    				}
// 				$('#uploadDocOption').append(option);	
// 			}	
// 		} 	
// 	};
// 	xhttp.open("POST", url, true);
// 	xhttp.send(json);
// }

function selecTedOpt(){
	debugger;
	var optVal = $('#uploadDocOption').val();
	$('#CardLabel').text(optVal).css("font-weight", "700");
	if(optVal=="DRIVING LICENSE"){	
		$('#showStrDat').show();
		$('#showEndDat').show();
	}
	else{
		$('#showStrDat').hide();
		$('#showEndDat').hide();
	}
}

//image convert Base 64
// Function to convert an image to Base64
var base64ImageVariable;
function imageToBase64(image, callback) {
	const reader = new FileReader();
	reader.onloadend = function() {
		callback(reader.result);
	};
	reader.readAsDataURL(image);
}
// Event listener for the DOMContentLoaded event
document.addEventListener('DOMContentLoaded', function() {
	// Event listener for the file input
	document.getElementById('uploadImg').addEventListener('change', function(event) {
		const selectedImage = event.target.files[0];
		if (!selectedImage) return;

		// Convert the selected image to Base64
		imageToBase64(selectedImage, function(base64String) {
			// Store the Base64 string in a variable or use it as needed
			base64ImageVariable = base64String;
			console.log(base64ImageVariable); // Display the Base64 string in the console
		});
	});
});



//Submit Data Function Image also upload in it 
function submitData(){
	debugger;
	var imgDoc = document.querySelector('#uploadImg').value.substring(document.querySelector('#uploadImg').value.lastIndexOf('.'));
	var imgD = imgDoc.split('.');
	var finalImg = imgD[1];
	var imgBase64 = base64ImageVariable.split(',')[1].trim();
	var accNo = $('#regAccNo').val();

	var json= {"Accno":accNo,"Formimage":imgBase64,"docType":finalImg,"type":"IB"};
	const myJson = JSON.stringify(json) ;
	var url="/rest/AccountService/uploadformforIbUser";
	
	$('#spinnerDiv4').show();
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			var resArray=xhttp.responseText;
			var jsonData = JSON.parse(resArray);
			if(jsonData!=null)
			{
				alert(jsonData.result);
				if(jsonData.result=="success"){
					window.location.href='/jsp/loginNew.jsp';
				}
				$('#spinnerDiv4').hide();
				// $('#successOtpCard').show();
				// $('#otpDivCont').hide();
				// // $('#secondNextBtn').prop('disabled', false);
			}	
		} 	
	};
	xhttp.open("POST", url, true);
	xhttp.send(myJson);
}



// This is for Otp Success Message after validation 
(function($) {
	showSwal = function(type) {
	  'use strict';
	   if (type === 'success-message') {
		swal({
		  title: 'Congratulations!',
		  text: 'OTP verified successfully',
		  type: 'success',
		  button: {
			text: "Continue",
			value: true,
			visible: true,
			className: "btn btn-primary"
		  }
		})
  
	  }else{
		  swal("Error occured !");
	  } 
	}
  
  })(jQuery);

  
// This is for  Success Message after all Step After Submit 
// (function($) {
// 	showSubmit = function(type) {
// 		debugger;
// 	  'use strict';
// 	   if (type === 'success') {
// 		swal({
// 		  title: 'Congratulations!',
// 		  text: 'Your Request Successfully Sent to the bank',
// 		  type: 'success',
// 		  button: {
// 			text: "Continue",
// 			value: true,
// 			visible: true,
// 			className: "btn btn-primary"
// 		  }
// 		})
// 		window.location.href='/jsp/loginNew.jsp';
  
// 	  }else{
// 		  swal("Error occured !");
// 	  } 
// 	}
  
//   })(jQuery);