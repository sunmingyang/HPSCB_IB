	//Added to avoid javaScript Error while log - in.Added on 21012008
	//Function for disabling cntrl key combinations
function disableCtrlKeyCombination(e)
{
        //list all CTRL + key combinations you want to disable
        var forbiddenKeys = new Array('a','n','c','x','v','j');
        var key;
        var isCtrl;

        if(window.event)
        {
                key = window.event.keyCode;     //IE
                if(window.event.ctrlKey)
                        isCtrl = true;
                else
                        isCtrl = false;
        }
        else
        {
                key = e.which;     //firefox
                if(e.ctrlKey)
                        isCtrl = true;
                else
                        isCtrl = false;
        }

        //if ctrl is pressed check if other key is in forbidenKeys array
        if(isCtrl)
        {
                for(i=0; i<forbiddenKeys.length; i++)
                {
                        //case-insensitive comparation
                        if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
                        {

                                return false;
                        }
                }
        }
        return true;
}