
function autoMask(field, event, sMask) 
{
        
        var KeyTyped = String.fromCharCode(getKeyCode(event));
	
        var targ = getTarget(event);
    
		keyCount = targ.value.length;
		var test = sMask.charAt(keyCount+1);
		var test1 = sMask.charAt(keyCount);
		var test2 = KeyTyped.charCodeAt(0);
		//var test3 = sNumbers.indexOf(c)
		
		//alert(test);
		//alert(test1)
		//alert(test2)
		//alert(test3)
		
		//alert(KeyTyped)
		//alert(targ)
		//alert(keyCount)
		
	if(keyCount == sMask.length)
	{				
	return false;
	}
      if ((sMask.charAt(keyCount+1) != '#') && (sMask.charAt(keyCount+1) != 'A' ) )
      {
         field.value = field.value + KeyTyped + sMask.charAt(keyCount+1);
          
         return false;
      }

        if (sMask.charAt(keyCount) == '*')
				
                return true;

        if (sMask.charAt(keyCount) == KeyTyped)
        {
                return true;
        }

        if ((sMask.charAt(keyCount) == '#') && isNumeric(KeyTyped))
           return true;

        if ((sMask.charAt(keyCount) == 'A') && isAlpha(KeyTyped))
         return true;

      if ((sMask.charAt(keyCount+1) == '?'))
      {
         field.value = field.value + KeyTyped + sMask.charAt(keyCount+1);
         return true;
      }
      if (KeyTyped.charCodeAt(0) < 32) return true;
      //alert(nam);
    //alert(val);
    return false;
    
    
}
 function getTarget(e) {
  // IE5
   if (e.srcElement) 
   //alert("e.srcElement" & e.srcElement)
   {
        return e.srcElement;
   }
    if (e.target) 
    
    {
        return e.target;
   }
 }

  function getKeyCode(e) {      
 //IE5
 if (e.srcElement) 
 //alert("e.srcElement2" & e.srcElement)
 {
        return e.keyCode
 }
  // NC5
  if (e.target) {
   return e.which
  }
 }

 function isNumeric(c)
{
        var sNumbers = "01234567890";
        if (sNumbers.indexOf(c) == -1)
                return false;
        else return true;

}

function isAlpha(c)
{
        var lCode = c.charCodeAt(0);
        if (lCode >= 65 && lCode <= 122 )
          {
                return true;
         }
        else
        return false;
}

function isPunct(c)
{
        var lCode = c.charCodeAt(0);
        if (lCode >= 32 && lCode <= 47 )
          {
                return true;
         }
        else
        return false;

}



