// $('.name').bind('input', function () {
//     var c = this.selectionStart,
//         r = /[^a-z ]/gi,
//         v = $(this).val();
//     if (r.test(v)) {
//         console.log("s");
//         $(this).val(v.replace(r, ''));
//         c--;
//     }
//     this.setSelectionRange(c, c);
// });
// $('.email').bind('input', function () {
//     var c = this.selectionStart,
//     r = /[^A-Za-z0-9@%$\.\-+_]/g,
//     // r = /[^A-Za-z0-9!#$%&'*+-/=?^_`{|}~.@[\]]/gi,
//         v = $(this).val();
//     if (r.test(v)) {
//         $(this).val(v.replace(r, ''));
//         c--;
//     }
//     // this.setSelectionRange(c, c);
// });
// $('.mobile').bind('input', function () {
//     var c = this.selectionStart,
//         r = /[^0-9]/g,
//         v = $(this).val();
//     if (r.test(v)) {
//         // console.log(v);
//         // console.log(this);
//         $(this).val(v.replace(r, ''));
//         c--;
//     }
//     this.setSelectionRange(c, c);
// });

var pass =false;
var cnfPass =false;

function checkPass(field){
    var id="passwordError1"; 
    if(!isEmpty(field, id)) {
        if(test(/(?=.*[ -/:-@[-`{-~])(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}/g, field, id)) {
            pass=true;
        } else {
            pass=false;
        }
    } else {
        pass=false;
    }
}

function checkCnfPass(field) {
    var id='passwordError2';
    if(!isEmpty(field,id)) {
        if (test(/(?=.*[ -/:-@[-`{-~])(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}/g, field, id)) {
            cnfPass=true;
        } else {
            cnfPass=false;
        }
    } else {
        cnfPass=false;
    }
}


function isEmpty(element,id) {
    if (element.value.length < 1) {
        //red border
        element.style.borderColor = "#e74c3c";
        document.getElementById(id).innerHTML="The field must not be empty.";
        return true;
    } else {
        //green border
        element.style.borderColor = "#2ecc71";
        document.getElementById(id).innerHTML="";
        return false;
    }
}

function test(r, element, id) {
    const value = element.value;
    const massage = element.title;
    if(value.match(r)) {
        // console.log("if");
        //green border
        element.style.borderColor = "#2ecc71";
        document.getElementById(id).innerHTML="";
        return true;
    } else {
        // console.log("else");
        //red border
        element.style.borderColor = "#e74c3c";
        document.getElementById(id).innerHTML=massage;
        return false;
    }
}


