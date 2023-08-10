
async function getAtmData(){
   await findBranchATM().then(() => {
         jQuery('#myTable').DataTable( {
                     searching: true,
                     dom: 'lfrtip',
                     ordering: true,
                     bLengthChange: true,    			
                     "iDisplayLength": 10
         } );
      });
}

async function findBranchATM(){   
    try {
       const jsonData  =  await fetch("http://127.0.0.1:8643/rest/AccountService/getBrnName", {
          method: "POST",
          body: JSON.stringify({                                
             }),
          headers: {
             "Content-type": "application/json; charset=UTF-8",
             "Access-Control-Allow-Origin": "*"
          }        
       }).then(response => response.json()).then(response=>displayBranchATM(response));    
       }catch (e) {
         console.log("error");
          console.log(e);       
       }        			
     }
 
    function displayBranchATM(response){            
      //console.log(response);
      var tempLen = response.length;
      var atmDetails="";   
      var tableBody =  '<table id = "myTable"  border="2">'+
                           '<thead>' +  
                              '<tr>' + 
                                 '<th>' + ' Branch Code' +'</th>' +
                                 '<th>' + ' Branch Address ' +'</th>' +
                                 '<th>' + ' Bank Name ' + '</th>' +
                                 '<th>' + ' Branch Ename ' +'</th>' +
                              '</tr>'  + 
                           '</thead>'   ;                             
      
       if(tempLen > 0){
            for (var i = 0; i < tempLen; i++) {
                atmDetails+=
                '<tr>'+
                    '<td >'+ '<span>'+response[i].brn_brcod+'</span>'+'</td>'+
                    '<td >'+ '<span>'+response[i].brn_eaddr+'</span>'+'</td>' +
                    '<td >'+ '<span>'+response[i].brn_ebank+'</span>'+'</td>'+
                    '<td >'+ '<span>'+response[i].brn_ename+'</span>'+'</td>'+
                '</tr>'
            }
          
            document.getElementById("atmTable").innerHTML = tableBody + '<tbody>' + atmDetails + '</tbody>' + '</table>' ;             
       }
       else{
            alert("API not respond");
            window.location.href="/jsp/forgot_pass/findATM.jsp";
       }      
    
     }
