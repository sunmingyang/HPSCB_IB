function showhide(di)
{			
	var divs = di;

    if(divs == "ABBIBsDocDate"){
		var sty = cal_sDocDate_display.style.display;		
		if(sty == "none"){
			cal_sDocDate_display.style.display = "block";
			cal_sDocDate_display_year.style.display = "block";
		}
		else{
			cal_sDocDate_display.style.display = "none";
			cal_sDocDate_display_year.style.display = "none";
		}
		document.getElementById("btnsDocDate").focus();	
	}
}



