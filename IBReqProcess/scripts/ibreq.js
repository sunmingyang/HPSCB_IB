// JavaScript Document
function changeDateFormat(ddate)
{

	var year=ddate.substring(6,10);
	var month=ddate.substring(3,5);
	var day=ddate.substring(0,2);
	comdate=day+"/"+month+"/"+year;
	return comdate;
}



function save_data()
{
document.forms[0].action="/IBReqProcess/ibreqProcess.do?action=saveRequests";

}