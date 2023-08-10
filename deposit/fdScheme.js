document.body.addEventListener('DOMContentLoaded',fillData(),selectDuration(),nomRelation()) ; 

function selectDuration() {
    var select1 = document.getElementById("Year");
    var select2= document.getElementById("Month");
    var select3 = document.getElementById("Days");
    
      for (var i = 0; i <= 20; i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = i;
        select1.appendChild(option);
      }

      // Populate options for 1 to 12
      for (var j = 0; j <= 12; j++) {
        var option = document.createElement("option");
        option.value = j;
        option.text = j;
        select2.appendChild(option);
      }

      // Populate options for 31 to days
      for (var k = 0; k <= 31; k++) {
        var option = document.createElement("option");
        option.value = k;
        option.text = k;
        select3.appendChild(option);
      }
    };  

function updateTextBox(that) {
    debugger;

    var getId = that.id;
    // document.getElementById("myTextBox").value=getId;
    $('#myTextBox').val(getId);
    //setyear(that);

}

    
 function openDialog() {
    debugger;
    var dialog = document.getElementById("dialog");
    dialog.style.display = "block";
 }
 
 function closepopup() {
  debugger;
  var dialog = document.getElementById("dialog");
  dialog.style.display = "none";

 }
 function saveOptions(custid) {
  var dropdown1 = document.getElementById("Year");
   var dropdown2 = document.getElementById("Month");
   var dropdown3 = document.getElementById("Days");
   var textBox = document.getElementById("myTextBox");
   var selectedOption1 = dropdown1.value;
   var selectedOption2 = dropdown2.value;
   var selectedOption3 = dropdown3.value;

   textBox.value = selectedOption1 + "Year " + selectedOption2 + "Months " + selectedOption3 + "Days ";

   var dialog = document.getElementById("dialog");
   dialog.style.display = "none";
   matROI(custid);
 }
 
 function showDialog() {
  // debugger;
   document.getElementById("myDialog").style.display = "block";
 }
 
 function closeDialogs() {
   document.getElementById("myDialog").style.display = "none";
 }

 function setyear(that,custid){
  debugger;
  //$('#myTextBox').val(that.id);
  //$('.loader').show();
  var getID = that.id;
  var Year = document.getElementById("Year");
  var Month = document.getElementById("Month");
  var Days = document.getElementById("Days");
  if(getID == "2Years"){
    Year.value="2";
    Month.value ="0";
    Days.value ="0";
  }
  else if(getID == "3Years"){
    Year.value="3";
    Month.value ="0";
    Days.value ="0";
  }
  else{
    Year.value="5";
    Month.value ="0";
    Days.value ="0";
  }
  matROI(custid);
  //$('.loader').show();
 //const myVar =setTimeout(matROITest(that),6000);
  //alert("hello Data =:"+myVar);
 }
//  function openwindow(){
//     window.open();
//  }
//  function closewindow(){
//     window.close();
//  }
 

 //API CODE FOR DROPDOWNset
  var valueselect="";
 function fillData(){
    
    loaderhide(); 
    //$('#lods').hide();
    var url="/rest/AccountService/fetchFDScheme";

    var xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function()

   {
      
   if(xhttp.readyState == 4 && xhttp.status == 200)

    {                                                                                                  
      var resArray=xhttp.responseText;
      var jsonData = JSON.parse(resArray);

        if(jsonData!=null){

       
        for( var i = 0 ; i< jsonData.length ; i++){

        $('#schcode').append("<option value='" + jsonData[i].sch_code  + "' dataf2='" + jsonData[i].fpr_ipp  + "' dataf3='" + jsonData[i].sch_kid  + "'>" + jsonData[i].sch_ename + "</option>");
        valueselect='jsonData[i].fpr_ipp' ;
      }

        }  
        else{

        alert("Scheme Not Available");
        }
      }

    };

    xhttp.open("POST", url, true);
    xhttp.send("f");    
  }

  //API for Account Balance
  function accbal(that){
    debugger ; 
    
    var url="/AccountInfoAction.do?action=fetchAccountBalance&accNo="+that.value;
    //alert(url);
    var xhttp = new XMLHttpRequest();
    loadershow();
    xhttp.onreadystatechange = function()

   {
      
   if(xhttp.readyState == 4 && xhttp.status == 200)

    {                                                                                                  
      var resArray=xhttp.responseText;
      var jsonData = JSON.parse(resArray);

        if(jsonData!=null){
  //        alert(resArray);
          $('#Balance').val( jsonData.accBalance );
            loaderhide();
            checkBal();
        }  
        else{

          alert("No Balance");
          loaderhide();
        }
      }




    };

    xhttp.open("GET", url, true);
    xhttp.send("");    

    
  }

  function checkBal(){
    debugger;
   var custbalance = $('#Balance').val() ; 
    var fdamount = $('#Amount').val() ; 

    if(parseFloat(custbalance) < parseFloat(fdamount) ){
      alert("Insufficient Balance.");
      return false ;
    }
    
    return true ;
    
    
  }
  
  
  var totalInt;
   //API for Maturity And ROI
 function matROI(custid){
    debugger ; 
    
    var url="/rest/AccountService/fDcalculatorData";
    var xhttp = new XMLHttpRequest();
    var scheme=$('#schcode').val();
	var actcode=$('#fdactcode').val();
	
    var schemeFD=scheme.trim();
    //$('.loader').show();
    
    var reqStr='{"fdAmount":"' + $('#Amount').val() + '","durationY":"' + $('#Year').val()  +'","durationM":"' + $('#Month').val() + '","durationD":"'+$('#Days').val() +'","customerid":"' + custid + '","schemeCode":"'+ schemeFD +'","actcodee":"' + actcode + '"}' ; 
    //alert(reqStr) ; 
    //$('#lods').show();
    loadershow();
    //alert("Spin Display");
    xhttp.onreadystatechange = function()

   {
      
   if(xhttp.readyState == 4 && xhttp.status == 200)

    {                                                                                                  
      var resArray=xhttp.responseText;
      var jsonData = JSON.parse(resArray);

        if(jsonData!=null){
          
          alert(resArray);
          $('#maturityDate').val( JSON.parse(jsonData.message).Data.dMatValu );
          $('#Intrest_rates').val( JSON.parse(jsonData.message).Data.dRateofIn );
          totalInt=parseFloat($('#maturityDate').val())-parseFloat($('#Amount').val());
          $('#TotalInterest').val(totalInt);
          $('#maturityDate').val( "Rs."+JSON.parse(jsonData.message).Data.dMatValu );
          $('#Intrest_rates').val(JSON.parse(jsonData.message).Data.dRateofIn+"%");
          $('#TotalInterest').val("Rs."+totalInt);
         // alert("shdfkfdks="+jsonData.Data.dRateofIn);
         // $('#lods').hide();
         loaderhide();
          //$('.loader').hide();
        }  
        else{

          alert("Error");
          loaderhide();
          
        }
        
      }

    };

    xhttp.open("POST", url, true);
    xhttp.send(reqStr);    


  } 

  //API for creating FD
  function submitDetails(custid,brnCode){
    debugger ; 
    // var frm=document.getElementsByName('form1')[0];
    
    if (!checkBal()) { 
      return false ; 
    }
    // var interestPay = $('#instPayable').val();
    var getClass = $('.selectedRowcss').attr('id');
    var scheme=$('#schcode').val();
    var schemeFD=scheme.trim();

    var url="/rest/AccountService/createFD";
    var xhttp = new XMLHttpRequest();

    var Str='{"custId":"' + custid + '","sch_kid":"'+dataf3val +'","amount":"' + $('#Amount').val() + '","year":"' + $('#Year').val()  +'","month":"' + $('#Month').val() + '","day":"'+$('#Days').val() +'","accno":"'+$('#input').val()+'","instPayable":"'+getClass +'","maturityInst":"'+$('#matInst').val()+'","FdScheme":"'+schemeFD+'","fdKid":"'+ dataf3val +'","brnCode":"' + brnCode + '","nominee":{"nomineeName":"'+$('#nameInput').val()+'","nomineeDOB":"'+ $('#dobInput').val()+'","nomineeAddL1":"'+$('#add1Input').val() +'","nomineeAddL2":"'+$('#add2Input').val() +'","nomineeCity":"'+$('#add3Input').val() +'","nomineeRel":"'+$('#relInput').val() +'","guardianName":"'+$('#guardianNameInput').val() +'"}}'; 

    alert(Str) ; 
    loadershow();
    xhttp.onreadystatechange = function()

   {
      
   if(xhttp.readyState == 4 && xhttp.status == 200)

    { 
      
      var resArray=xhttp.responseText;
      alert(resArray);
      var resText=resArray.split("|");
      if (resText != null) {
        var rstatus=resText[0];
        var accNo=resText[1];

      }
     
      //var jsonData = JSON.parse(resArray);

        if(rstatus=="~success"){
        
          alert("Account created successfully:" +  accNo);
          loaderhide();
          window.location.href="/IBMenu.do?action=getMenu_Tab";
        //   closewindow();
        // frm.reset();
        }  
    
        else{

          alert("Error");
          loaderhide();
        }
      }




    };

    xhttp.open("POST", url, true);
    xhttp.send(Str);    


  }
  var dataf3val;
  function changebox(){

debugger;
var dropdown = document.getElementById('schcode');
var halfBtn = document.getElementById('Half_Yearly');
var yearlyBtn= document.getElementById('Yearly');
var quarterBtn = document.getElementById('Quarterly');
var monthlyBtn= document.getElementById('Monthly');
var maturityBtn= document.getElementById('At_Maturity');

var e=document.getElementById('schcode');
var selectedValue=e.options[e.selectedIndex].outerHTML.charAt(e.options[e.selectedIndex].outerHTML.lastIndexOf("dataf2")+8);
 dataf3val=e.options[e.selectedIndex].outerHTML.charAt(e.options[e.selectedIndex].outerHTML.lastIndexOf("dataf3")+8);
var dataval= $('#schcode').val;
      //  monthlyBtn.classList.remove('button2');
      //   yearlyBtn.classList.remove('button2');
      //   quarterBtn.classList.remove('button2');
      //   halfBtn.classList.remove('button2');
      //   maturityBtn.classList.remove('button2');

      $('#Half_Yearly').removeClass("selectedRowcss");
      $('#Monthly').removeClass("selectedRowcss");
      $('#Quarterly').removeClass("selectedRowcss");
      $('#Yearly').removeClass("selectedRowcss");
      $('#At_Maturity').removeClass("selectedRowcss");
        switch (selectedValue) {
            case 'H':
            // $('#Half_Yearly').css('background-color','orange');
            $('#Half_Yearly').addClass("selectedRowcss");
                break;
            case 'M':
            // $('#Monthly').css('background-color','orange');
            $('#Monthly').addClass("selectedRowcss");
                break;
            case 'Y':
                //  $('#Yearly').css('background-color','orange');
                 $('#Yearly').addClass("selectedRowcss");
                break;
            case 'Q':
            // $('#Quarterly').css('background-color','orange');
            $('#Quarterly').addClass("selectedRowcss");
                break;
            case 'X':
            // $('#At_Maturity').css('background-color','orange');
            $('#At_Maturity').addClass("selectedRowcss");
                break;

            default:
                // Handle unknown value or default selection
                break;
        }
    };

    function interestPay(that){
      debugger;
      var Id = that.id;
            // document.getElementById("myTextBox").value=getId;
            $('#instPayable').val(Id);
    }

    function submitNominee(){
        debugger;
    //     const dobInput = document.getElementById("dobInput");
    //   const additionalField = document.getElementById("additionalField");
  
    //   if (dobInput.value) {
    //       const age = calculateAge(dobInput.value);
    //       if (age < 18) {
    //           additionalField.style.display = "block";
    //       } else {
    //           additionalField.style.display = "none";
    //       }
    //   }
  
        
        var nomineeName = document.getElementById("nameInput").value;
        //var nomineeAge = document.getElementById("ageInput").value;
        var nomineedob = document.getElementById("dobInput").value;
        var nomineeadd1 = document.getElementById("add1Input").value;
        var nomineeadd2 = document.getElementById("add2Input").value;
        var nomineeadd3 = document.getElementById("add3Input").value;
        var nomineerel = document.getElementById("relInput").value;
        var guardianName = document.getElementById("guardianNameInput").value;
        var gaurdianRel=document.getElementById("guardianRelInput").value;
  
  
        
        console.log("Nominee Name:", nomineeName);
        //console.log("Nominee Age:", nomineeAge);
        console.log("Nominee DOB:", nomineedob);
        console.log("Nominee Addr:", nomineeadd1);
        console.log("Nominee Addr:", nomineeadd2);
        console.log("Nominee Addr:", nomineeadd3);
        console.log("Nominee Rel:", nomineerel);
        console.log("Guardian Name:", guardianName);
        console.log("Gaurdian Rel:",gaurdianRel);
  
  
        // if(guardianName!="" ){
          document.querySelector("#myDialog").style.display = "none";
        // }
        
      }
  

    function loaderhide(){
        document.getElementById("loading").style.display="none";
    }
    function loadershow(){
        document.getElementById("loading").style.display="block";
    }

    function calculateAge(birthDate) {
        const today = new Date();
        const birth = new Date(birthDate);
        let age = today.getFullYear() - birth.getFullYear();
        const monthDiff = today.getMonth() - birth.getMonth();
        
        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
            age--;
        }
        
        return age;
    }

    function checkgaurdian(){
        const dobInput = document.getElementById("dobInput");
        const additionalField = document.getElementById("additionalField");
        if (dobInput.value) {
            const age = calculateAge(dobInput.value);
            if (age < 18) {
                additionalField.style.display = "block";
            } else {
                additionalField.style.display = "none";
            }
        }
    }

    //API call for nominee relations
    function nomRelation(){
    debugger;
        loaderhide(); 
        //$('#lods').hide();
        var url="/rest/AccountService/helpMasterData";
        var str='{"Type":"relationMaster"}';
    
        var xhttp = new XMLHttpRequest();
    
        xhttp.onreadystatechange = function()
    
       {
          
       if(xhttp.readyState == 4 && xhttp.status == 200)
    
        {                                                                                                  
          var resArray=xhttp.responseText;
          var jsonData = JSON.parse(resArray);
          var jsonData1= JSON.parse(jsonData.Data);
    
            if(jsonData!=null){
    
           
            for( var i = 0 ; i< jsonData1.length ; i++){
    
            $('#relInput').append("<option value='" + jsonData1[i].relmas_code  + "' dataf2='" + jsonData1[i].relmas_kid  + "'>" + jsonData1[i].relmas_ename + "</option>");
            $('#guardianRelInput').append("<option value='" + jsonData1[i].relmas_code  + "' dataf2='" + jsonData1[i].relmas_kid  + "'>" + jsonData1[i].relmas_ename + "</option>");
            //valueselect='jsonData[i].fpr_ipp' ;
          }
    
            }  
            else{
    
            alert("Scheme Not Available");
            }
          }
    
        };
    
        xhttp.open("POST", url, true);
        xhttp.send(str);    
      }

      
      function openpage(){
        window.open("/deposit/Fdchart.jsp");
      }
