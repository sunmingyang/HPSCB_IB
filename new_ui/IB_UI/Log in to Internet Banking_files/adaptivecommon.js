ADAPTIVECONFIG = {
		adaptiveEnabled : "Y",
		solutionType : "arcot"
};

feba.js.adaptive = {
	/*
	 * This method loads adaptive solution specific js
	 */
	loadAdaptiveSolnSpecificJs : function(){  
	
	    if(ADAPTIVECONFIG.solutionType == "arcot")
	    {
			feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION,"ArcotDeviceDNA.js");
		    feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION,"deployJava.js");
		    feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION,"FlashDetect.js");
		    feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION,"PluginDetect.js");
			feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION, "FDeploy.js");
			feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION, "ArcotPref.js");
			feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION, "arcot_json.js"); /*feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION,"PluginDetect.js");*/
			feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION,"rfutil.js");
			feba.js.include(Constants.FEBA_ADAPTIVEAUTH_SOLUTION,"swfobject.js");
			feba.js.include(Constants.FEBA_ADAPTIVEAUTH,"ca_gd_browsercookie.js");
			feba.js.include(Constants.FEBA_ADAPTIVEAUTH,"arcot.js");	
	    }
	    feba.add(feba.js.adaptive);
	},
	
	/*
	 * This method is called on click of Submit button on login page
	 */
	onLoginSubmit : function(buttonId){
	   
	    if(ADAPTIVECONFIG.solutionType == "arcot")
	    {	
			//feba.js.adaptive.arcot.submitDNAForm(true, 2); //Collect Device DNA information	
	    }
	    return encryptValues(buttonId);
	},
	
	/*
	 * This method is called on click of Submit button on login page for Digital Certificate
	 */
	onLoginSubmitForDigCert : function(obj){
	
	    if(ADAPTIVECONFIG.solutionType == "arcot")
	    {
		//	feba.js.adaptive.arcot.submitDNAForm(true, 2); //Collect Device DNA information	
	    }
	    return validateCertificateForLogin(obj);
	},
	
	postAdaptiveAuthProcessing : function(value){
				
			if(ADAPTIVECONFIG.solutionType == "arcot")
		    {
				feba.js.adaptive.arcot.setDeviceInfo(value); // Install device id on end user's system
		    }
	    
	}
};

function adaptiveEnabled(){

       if(ADAPTIVECONFIG.adaptiveEnabled == "Y"){
       
              feba.js.adaptive.loadAdaptiveSolnSpecificJs();
        }
}

adaptiveEnabled();
