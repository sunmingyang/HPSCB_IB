<%@ page import="java.util.Calendar " %>
<%@ include file="/common/Include.jsp" %>
<%@ page import="java.io.*"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
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
	<link rel="stylesheet" href="/accDetails/css/registration.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

	<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script language="JavaScript" src="/accsum/scripts/accSum.js"></script>
	<script language="JavaScript" src="/accDetails/js/registration.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<style>
		body{
			background-image: linear-gradient(0deg, #d7d7d7, #7691c5);
			height: 800px;
		}
		A:link {
			COLOR: white;
			TEXT-DECORATION: none;
			font-weight: bold;
			padding-top: 4px;
		}
		.btnSt{
			border-radius: 15px;
		}
		.overlay {
		position: fixed;
		top: 0;
		left: 0;
		width: 100vw;
		height: 100vh;
		background-color: rgb(12 12 12 / 68%);
		display: none;
		}

		.Otpcard {
			width: 400px;
			border: none;
			height: 300px;
			box-shadow: 0px 5px 20px 0px #d2dae3;
			z-index: 1;
			display: flex;
			justify-content: center;
			align-items: center;
			position: relative;
			flex-direction: column;
			min-width: 0;
			word-wrap: break-word;
			background-color: #fff;
			background-clip: border-box;
			border-radius: 0.25rem;
		}
		.Otpcard h6 {
			color: rgb(62, 70, 166);
			font-size: 20px
		}
		.otpInput{
			width: 40px;
			height: 40px
		}
		.form-control {
			height: 28px;
		}
		form-control:focus
		{	
			box-shadow:none;
			border:2px solid red
		}
		.labelForm{
			font-size: 13px;
    		margin-bottom: 2px;
			margin-top: 10px;
		}				
		#uploadImg-label {
			position: absolute;
			top: 50%;
			left: 1rem;
			transform: translateY(-50%);
		}

		.image-area {
			border: 2px dashed rgba(255, 255, 255, 0.7);
			padding: 1rem;
			position: relative;
		}

		.image-area::before {
			content: 'Uploaded image result';
			color: #fff;
			font-weight: bold;
			text-transform: uppercase;
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			font-size: 0.8rem;
			z-index: 1;
		}

		.image-area img {
			z-index: 2;
			position: relative;
		}
		.btn-close:hover{
			/* color: white !important; */
			background-color: transparent !important;
			color: black !important;
		}

		.loader {
				display: none;
				top: 50%;
				left: 50%;
				position: absolute;
				transform: translate(-50%, -50%);
				}

		.loading {
		border: 5px solid #ccc;
		width: 70px;
		height: 70px;
		border-radius: 50%;
		border-top-color: #1d4268;
		border-left-color: #1d4268;
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
</head>
<body>
	<!-- Header Part -->
	<header class="site-header" style="background: #005089;">
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
	</header> 
<section style="height: 500px;">
	<div class="alert alert-danger alert-dismissible" role="alert" style="display: none;">
		<strong class="alertShow"></strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</button>
	  </div>
<div class="container h-100" >
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11" style="height: 100%;margin-top: 10px;">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center" style="margin-top: -25px;">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1" style="width: 80%;">

<div class="container-fluid" style="padding: 20px;">
	<div class="stepwizard">
		<div class="stepwizard-row setup-panel">
			<div class="stepwizard-step">
				<a href="#step-1" type="button" class="btn btn-success btn-circle btnSt" id="stepBtn1" >1</a>
				<p><strong>Personal Details</strong></p>
			</div>
			<div class="stepwizard-step">
				<a href="#step-2" type="button" class="btn btn-circle btnSt disabled">2</a>
				<p><strong>OTP Verify</strong></p>
			</div>
			<div class="stepwizard-step">
				<a href="#step-3" type="button" class="btn btn-circle btnSt disabled">3</a>
				<p><strong>Document Upload</strong></p>
			</div>
			<div class="stepwizard-step">
				<a href="#step-4" type="button" class="btn btn-circle btnSt disabled">4</a>
				<p><strong>View Details</strong></p>
			</div>
			<!-- <div class="stepwizard-step">
				<a href="#step-5" type="button" class="btn btn-circle btnSt disabled" >5</a>
				<p><strong>Welcome</strong></p>
			</div> -->
		</div>
		
	</div>
	
	<form role="form">
		<!------------------------First Page --------------------------->
		<div class="row setup-content" id="step-1">
			<div class="col-xs-12">
				<div class="col-md-12">
						<div class="d-flex flex-row align-items-center">
							<!-- <i class="fas fa-user fa-lg me-3 fa-fw"></i> -->
							<div class="form-outline flex-fill mb-0">
							<label class="labelForm" for="form3Example1c"><strong>Name</strong></label>
							<input type="text" id="regName" name="regName" class="form-control" onkeydown="return /[a-z]/i.test(event.key)" />
							</div>
						</div>
					    <div class="d-flex flex-row align-items-center">
						  <div class="form-outline flex-fill mb-0">
							<label class="labelForm" for="form3Example1c"><strong>Account Number</strong></label>
							<!-- <input type="text" id="regName" name="regName" class="form-control" onkeydown="return /[a-z]/i.test(event.key)" > -->
							<input type="text" id="regAccNo" name="regAccNo" class="form-control" onchange="regAccNoCheck(this)" maxlength="18">
						  </div>
						</div>
						<div class="d-flex flex-row align-items-center">
							<div class="form-outline flex-fill mb-0">
								<label class="labelForm" for="form3Example3c"><strong>Mobile Number</strong></label>	
								<input type="text" maxlength="10" id="regMobileNo"  onchange="setMobileNo();mobileValFn()" class="form-control">
								
							</div>
						</div>
						<div class="d-flex flex-row align-items-center">
                            <div class="form-outline flex-fill mb-0">
								<label class="labelForm" for="form3Example3c" maxlength="6" ><strong>Postal Code</strong></label>
                                <input type="text" id="regPostalCode" name="regPostalCode" class="form-control" placeholder="" onchange="postalCodeFn(this)" >
                            </div>
						</div>
						<div class="d-flex flex-row align-items-center">
						  <div class="form-outline flex-fill mb-0">
							<label class="labelForm" for="form3Example3c"><strong>Email</strong></label>
							<input type="email" id="registEmail" name="registEmail" onchange="emailValFn(this)" class="form-control" placeholder="" />
						  </div>
						</div>
					<div class="align-items-center" style="margin-top: 48px;">	
						<button class="btn btn-success nextBtn btn-md pull-right" type="button" onclick="" style="margin-top: -40px;" id="firstNextBtn">Next</button>
					</div>	
				</div>
			</div>
		</div>

		<!--------------------------------Second  ------------------------------------>
		<div class="row setup-content" id="step-2">
			<div class="col-xs-12">
				<div class="col-md-12">
					<div class="container d-flex justify-content-center align-items-center">
						<div class="position-relative">
							<div class="Otpcard p-2 text-center">
								<div id="otpDivCont">
									<div class="loader" style="" id="spinnerDiv">
										<div class="loading">
										</div>
									</div>
									<h6>Please enter the one time password <br> to verify your account</h6>
									<div> <span>A code has been sent to</span> <small id="mobTagId"></small> </div>
									<div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
										<input class="m-2 text-center form-control rounded otpInput" type="text" id="first" maxlength="1" /> 
										<input class="m-2 text-center form-control rounded otpInput" type="text" id="second" maxlength="1" /> 
										<input class="m-2 text-center form-control rounded otpInput" type="text" id="third" maxlength="1" /> 
										<input class="m-2 text-center form-control rounded otpInput" type="text" id="fourth" maxlength="1" /> 
										<input class="m-2 text-center form-control rounded otpInput" type="text" id="fifth" maxlength="1" /> 
										<input class="m-2 text-center form-control rounded otpInput" type="text" id="sixth" maxlength="1" /> 
									</div>
									<div class="mt-4"> 
										<input type="button" class="btn px-4" style="background-color: #143172;color:white;" onclick="sentOtpApi(this)" id="resendButton" value="Resend Otp">
										<input type="button" class="btn px-4 validate" style="background-color: #143172;color:white;" value="Validate" onclick="validateOtp()">
									</div>
									<div class="mt-3">
										<!-- <div id="sentOtpMsg" class="text-danger" style="display: none;">Otp Sent again on your given Number</div> -->
										<div id="otpTimeDiv">Time left = <span id="timer"></span></div>
									</div>
								</div>
								<div class="card" id="successOtpCard" style="display: none;">
									<div class="card-body">
										<h5 class="card-title" id="otpMesage"></h5>
									</div>
								</div>	
							</div>
						</div>
					</div>
					<div class="align-items-center" style="margin-top: 48px;"></div>
						<button class="btn btn-secondary previousBtn btn-md pull-left" type="button" onclick="" style="margin-top: -40px;" id="secondBackBtn">Back</button>
						<button class="btn btn-success nextBtn btn-md pull-right" type="button" style="margin-top: -40px;" id="secondNextBtn" >Next</button>
					</div>
				</div>
			</div>
		</div>

		<!--------------------------------Third  ----------------------------------->
		<div class="row setup-content" id="step-3">
			<div class="d-flex flex-row align-items-center">
				<!-- <div class="form-outline flex-fill mb-0">
					<label class="labelForm"> <strong>Upload Documents</strong></label>
					<select class="form-select" id="uploadDocOption" aria-label="Default select example" onchange="selecTedOpt()"> -->
						<!-- <option selected>Open this select menu</option>
						<option value="1">One</option>
						 -->
					<!-- </select>
				</div> -->
			</div>
			<!-- <div class="d-flex flex-row align-items-center">
				<div class="form-outline flex-fill mb-6" id="showStrDat" style="display: none;">
					<label class="labelForm"><strong>Start Date:</strong></label>
					<div class='input-group date' id='picker'>
						<input type='date' class="form-control" />	                 
					</div>
				</div>
				<div class="form-outline flex-fill mb-6" id="showEndDat" style="padding: 10px;display: none;">
					<label class="labelForm"><strong> Expire Date:</strong></label>
					<div class='input-group date' id='picker'>
						<input type='date' class="form-control" />	                 
					</div>
				</div>
			</div> -->
			<!-- <div class="d-flex flex-row align-items-center">
				<div class="form-outline flex-fill mb-0">
					<label class="form-label labelForm" for="form3Example1c" id="CardLabel"><strong>Card Number</strong></label>	
					<input type="text" id="form3Example1c" class="form-control" placeholder="Enter Your Card Number" />
				</div>
			</div>
			<div class="container col-md-6" style="margin-top: 5px;">
				<div class="mb-5">
					<input class="form-control" type="file" id="formFile" onchange="preview()" style="background-color: #143172;color: #ffffff;">
				</div>
				<div style="width: 100%;height: 170px;margin-top: -44px;">
					<img id="frame" src="" class="img-fluid" style="height: 100%;width: 100%;border: 1px white;"/>
				</div>	
			</div>
			<div class="form-outline flex-fill mb-0" style="margin-top: 5px;">
				<select class="form-select" aria-label="Default select example">
					<option selected>Please select address proof</option>
					<option value="1">One</option>
					<option value="2">Two</option>
					<option value="3">Three</option>
				</select>
			</div> -->
			<div class="container col-md-6" style="margin-top: 5px;">
				<div class="mb-2">
					<input id="uploadImg" type="file" onchange="readURL(this);" class="form-control border-0">
					<!-- <input type="button" value="convert" id="convertImg" onclick="convertImg()"> -->
                <!-- <label id="upload-label" for="upload" class="font-weight-light text-muted">Choose file</label> -->
				<!-- <input type="file" id="imageInput" accept="image/*"> -->
				</div>

				<div class="image-area">
					<img id="imageResult" src="#" alt="" class="img-fluid rounded shadow-sm mx-auto d-block">
				</div>
			</div>
			<div class="align-items-center" style="margin-top: 48px;">
				<button class="btn btn-secondary previousBtn btn-md pull-left" type="button" onclick="" style="margin-top: -40px;" id="">Back</button>
				<button class="btn btn-success nextBtn btn-md pull-right" type="button" style="margin-top: -40px;" id="thirdNextBtn">Next</button>
			</div>	
		</div>
		<!---------------------------------Fourth ------------------------------>
		<div class="row setup-content" id="step-4">
			<div class="col-xs-12">
				<div class="col-md-12">
					<div class="loader" style="" id="spinnerDiv4">
						<div class="loading">
						</div>
					</div>
					<div class="d-flex flex-row align-items-center">
						<!-- <i class="fas fa-user fa-lg me-3 fa-fw"></i> -->
						<div class="form-outline flex-fill mb-0">
						  <label class="form-label labelForm" for="form3Example1c"><strong>Name</strong></label>
						  <input type="text" id="viewName" name="viewName" class="form-control" readonly/>
						</div>
					</div>
					<div class="d-flex flex-row align-items-center">
						<div class="form-outline flex-fill mb-0">
						<label class="form-label labelForm" for="form3Example1c"><strong>Account Number</strong></label>
						<input type="text" id="viewAccNo" name="viewAccNo" class="form-control" readonly/>
						</div>
					</div>
					<div class="d-flex flex-row align-items-center">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label labelForm" for="form3Example3c"><strong>Mobile Number</strong></label>
							<input type="text" id="viewMobNo" name="viewMobNo" class="form-control" placeholder="Enter Mobile No" readonly/>
						</div>
					</div>
					<div class="d-flex flex-row align-items-center">
						<div class="form-outline flex-fill mb-0">
							<label class="form-label labelForm" for="form3Example3c"><strong>Postal Code</strong></label>
							<input type="text" id="viewPostalCode" name="viewPostalCode" class="form-control" placeholder="Enter Email" readonly/>
						</div>
					</div>
					<div class="d-flex flex-row align-items-center">
						<div class="form-outline flex-fill mb-0">
						<label class="form-label labelForm" for="form3Example3c"><strong>Email</strong></label>
						<input type="email" id="viewEmail" name="viewEmail" class="form-control" placeholder="Enter Email" readonly/>
						</div>
					</div>
					<div class="align-items-center" style="margin-top: 75px;">
						<button class="btn btn-secondary previousBtn btn-md pull-left" type="button" onclick="" style="margin-top: -65px;">Back</button>
						<button class="btn btn-success nextBtn btn-md pull-right" type="button" style="margin-top: -65px;" id="fourthNextBtn">Submit</button>
					</div>	
				</div>
			</div>
		</div>
	</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</section>	
<script>
	
</script>

<script>
document.addEventListener("DOMContentLoaded", function(event) {
function OTPInput() {
	const inputs = document.querySelectorAll('#otp > *[id]');
	for (let i = 0; i < inputs.length; i++) { 
		inputs[i].addEventListener('keydown', function(event) { 
			if (event.key==="Backspace" ) { 
				inputs[i].value='' ; if (i !==0) inputs[i - 1].focus();
			 } else { 
				if (i===inputs.length - 1 && inputs[i].value !=='' ) { 
					return true; 
				} else if (event.keyCode> 47 && event.keyCode < 58) { 
					inputs[i].value=event.key; 
					if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); 
				} else if (event.keyCode> 64 && event.keyCode < 91) { 
					inputs[i].value=String.fromCharCode(event.keyCode); 
					if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); 
				} 
			} 
		}); 
	} } OTPInput();
});

function preview() {
	debugger;
	frame.src = URL.createObjectURL(event.target.files[0]);
}
</script>
</body>
</html>