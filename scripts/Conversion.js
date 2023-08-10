
	var ls_hin_name  = "";
    var ls_hin_name1  = "";
    var st_as_eng_word  = "";  
    var arr_count=1;
    var c  = 1;
    var  words= new Object(300);
	var word;
    var Hindi = "";
    var loc ;
    var I1 ;
    var f ;
    var temp_str ;
    var x ;
    var TEMPS ;
    var FLAG  = 0;
    var AMITSTR ;
    var LANG_ID; 
    var deckid  = 1;
    var word1 ;
//<tr><td>CHECK WORD</td><td><INPUT TYPE="text" NAME="box"  value=<%=a%> SIZE=30 style="font-size:20px;" disabled="true" ><td></tr>
/*function ResetFields()
{
	engbox.value="";
	hdbox.value="";
	bngbox.value="";
	gbox.value="";
	mlmbox.value="";
	tlbox.value="";
	tlgbox.value="";
	obox.value="";
	kndbox.value="";
	pnbbox.value="";
}	*/
/*function convert()
{
	
	var op=new Array ("Hindi","Bengali","Gujrati","Malayalam",
	"Tamil","Telugu","Oriya","Kannada","Punjabi");
	var s1='<%= a %>';
		
	switch(s1)
	{
	case op[0]: hdbox.value=fetch_dic(engbox.value); 				
				bngbox.disabled='true';
				gbox.disabled='true';
				mlmbox.disabled='true';
				tlbox.disabled='true';
				tlgbox.disabled='true';
				obox.disabled='true';
				kndbox.disabled='true';
				pnbbox.disabled='true';
				break;
	case op[1]:	bngbox.value=hinditobangali(fetch_dic(engbox.value));
				hdbox.disabled='true';
				gbox.disabled='true';
				mlmbox.disabled='true';
				tlbox.disabled='true';
				tlgbox.disabled='true';
				obox.disabled='true';
				kndbox.disabled='true';
				pnbbox.disabled='true';
				break;
	case op[2]:	gbox.value=hinditogujrati(fetch_dic(engbox.value));
				hdbox.disabled='true';
				bngbox.disabled='true';
				mlmbox.disabled='true';
				tlbox.disabled='true';
				tlgbox.disabled='true';
				obox.disabled='true';
				kndbox.disabled='true';
				pnbbox.disabled='true';
				break;
	case op[3]: mlmbox.value=hinditomalayalam(fetch_dic(engbox.value));
				hdbox.disabled='true';
				bngbox.disabled='true';
				gbox.disabled='true';
				tlbox.disabled='true';
				tlgbox.disabled='true';
				obox.disabled='true';
				kndbox.disabled='true';
				pnbbox.disabled='true';
				break;
	case op[4]: tlbox.value=fetch_dic_tamil(engbox.value);
				hdbox.disabled='true';
				bngbox.disabled='true';
				gbox.disabled='true';
				mlmbox.disabled='true';
				tlgbox.disabled='true';
				obox.disabled='true';
				kndbox.disabled='true';
				pnbbox.disabled='true';
				break;
	case op[5]: tlgbox.value=hinditotelugu(fetch_dic(engbox.value));
				hdbox.disabled='true';
				bngbox.disabled='true';
				gbox.disabled='true';
				mlmbox.disabled='true';
				tlbox.disabled='true';
				obox.disabled='true';
				kndbox.disabled='true';
				pnbbox.disabled='true';
				break;
	case op[6]: obox.value=hinditooriya(fetch_dic(engbox.value));
				hdbox.disabled='true';
				bngbox.disabled='true';
				gbox.disabled='true';
				mlmbox.disabled='true';
				tlbox.disabled='true';
				tlgbox.disabled='true';
				kndbox.disabled='true';
				pnbbox.disabled='true';
				break;
	case op[7]: kndbox.value=hinditokannada(fetch_dic(engbox.value));
				hdbox.disabled='true';
				bngbox.disabled='true';
				gbox.disabled='true';
				mlmbox.disabled='true';
				tlbox.disabled='true';
				tlgbox.disabled='true';
				obox.disabled='true';
				pnbbox.disabled='true';
				break;
	case op[8]: pnbbox.value=hinditopunjabi(fetch_dic(engbox.value));
				hdbox.disabled='true';
				bngbox.disabled='true';
				gbox.disabled='true';
				mlmbox.disabled='true';
				tlbox.disabled='true';
				tlgbox.disabled='true';
				obox.disabled='true';
				kndbox.disabled='true';
				break;
	default : alert("INVALIDE CHOICE TRY AGAIN...");
	}
	
			
}*/

/*function conv1()
{
	engbox.value=fetch_dic_h(hdbox.value);
	bngbox.value=hinditobangali(hdbox.value);
	gbox.value=hinditogujrati(hdbox.value);
	mlmbox.value=hinditomalayalam(hdbox.value);
	tlbox.value=fetch_dic_tamil(fetch_dic_h(hdbox.value));
	tlgbox.value=hinditotelugu(hdbox.value);
	obox.value=hinditooriya(hdbox.value);
	kndbox.value=hinditokannada(hdbox.value);
	pnbbox.value=hinditopunjabi(hdbox.value);	
}*/
//---------------------------------Hindi to English code----------------------------------//
function fetch_dic_h(as_hd_name)
{
        if((as_hd_name).length==0)    								//CHECKING FOR NULL STRING     
        {
//			alert("Please Enter a valid entry !!!");
            return "";                   							//RETURN NOTHING
     	}
		
       for(var c=0;c<as_hd_name.length;c++)
		{
			if(isconsonant_h(as_hd_name.substring(c,c+1)) && isconsonant_h(as_hd_name.substring(c+1,c+2)))
			{
			as_hd_name=as_hd_name.substring(0,c+1)+"A"+as_hd_name.substring(c+1,as_hd_name.length);	
			}
			
		}
	   words[arr_count]=as_hd_name ;     						
		for (word=1; word <= arr_count; word++)
	   {
       		var English=""
			if (English == "")
			{   	            								//THIS FUNCTION IS TO CONVERT THE ENGLISH STRING
            	English =gf_htoe_conv(words[word]);           	//INTO ITs EQUIVALENT HINDI STRING
            }                                     				
       }                     									
		                    									
    return English;    				                              			
}//fetch_dic ends

function gf_htoe_conv( as_hd_name)
{
	var ls_English=as_hd_name;
	var ChangeWith= new Array("SINGH", "SHW","KHHH","RR","SHH",
					"#EE", "#EI", "#AA", "#AI", "#AO", "#AU", "#OO", "#OU", "CHH", 
					"KSH","GY", 
					"T","TH","D","DH","N",
					"#A", "#E", "#I", "#O", "#U", "ZA", "KH", 
					"AA", "AE","AI", "AO", "AU", "OO", "OU","K", 
					"GH", "CH", "JH", "TH", "DH","PH", "BH", "SH", "EE", "EI",
					"T", "D", "N", "P", "F", "B", "M", "Y", "R","L","G", "J",  
					"V", "S", "H", "E","I", "O", "U", "C", "Q", 
					"W","X", "Z", 
					".","?",
					"0","1","2","3","4","5","6","7","8","9"," ");
	var Change=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939', '\u0938' + '\u094D' + '\u0935','\u0959','\u090B','\u0937',
		'\u0907', '\u0908', '\u0906', '\u0910', '\u0913', '\u0914', '\u0909','\u090A', '\u091B', 
		'\u0915' + '\u094D' + '\u0937','\u0917'+ '\u094D' + '\u092F',
		'\u091F','\u0920','\u0921','\u0922','\u0923',//ta varag 
		'\u0905', '\u0907', '\u0908', '\u0909', '\u090A', '\u095B', '\u0916',
        '\u093E','\u090F', '\u0948', '\u094B', '\u094C','\u0942', '\u094C','\u0915', 
		'\u0918', '\u091A', '\u091D', '\u0925', '\u0927', '\u092B','\u092D', '\u0936', '\u0940', '\u0940',
		'\u0924', '\u0926','\u0928', '\u092A', '\u095E', '\u092C','\u092E', '\u092F', '\u0930','\u0932','\u0917', '\u091C',
		'\u0935', '\u0938', '\u0939', '\u0947','\u093F', '\u094B', '\u0941', '\u0915', '\u0958', 
		'\u0935','\u095B','\u095B',
		'\u0970','\u097D',
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' ,'\u0020');
		
	var loc1;
	var c  = 0;
    var count1  = 1;
    
	for(count1=0;count1<83;count1++)
	{
		loc=ls_English.indexOf(Change[count1],0);
		while (loc!=-1)
		{
			ls_English= ls_English.replace(Change[count1],ChangeWith[count1]);
			loc = ls_English.indexOf(Change[count1],loc+1);
		}

	}
	
	for(var c=0;c<ls_English.length;c++)
	{
		if(ls_English.substring(c,c+1)=='\u094D')
		{
		ls_English=ls_English.substring(0,c)+ls_English.substring(c+1,ls_English.length);
		}
		if(ls_English.substring(c,c+1)=='\u0902')
		{
		ls_English=ls_English.substring(0,c)+"N"+ls_English.substring(c+1,ls_English.length);
		}
		if(ls_English.substring(c,c+1)=='#')
		{
		ls_English=ls_English.substring(0,c)+ls_English.substring(c+1,ls_English.length);
		}
		if(ls_English.substring(c,c+1)=='\u0943')
		{
		ls_English=ls_English.substring(0,c)+"RI"+ls_English.substring(c+1,ls_English.length);
		}
		/*if(ls_English.substring(c,c+1)=='A' && ls_English.substring(c+1,c+2)=='A')
			{
			ls_English=ls_English.substring(0,c)+ls_English.substring(c+1,ls_English.length);
			}*/
		}
       return ls_English;
}//gf_htoe_conv ends


	function isconsonant_h(ac_letter)
 {
    var lb_ans=false;
	if((ac_letter.charCodeAt(0)>= 2325)&&(ac_letter.charCodeAt(0) <= 2361 ))
	{							
      	lb_ans = true;
	}
        return lb_ans;
 }

//----------------------------------Hindi to English code ends------------------------------------------//
function frd_conv()
{
var str=hdbox.value;
	for(var c=0;c<str.length;c++)
	{
	
		if(str.substring(c,c+1)=='\u0924')
		{
			str=str.substring(0,c)+'\u091F'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0925')
		{
			str=str.substring(0,c)+'\u0920'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0926')
		{
			str=str.substring(0,c)+'\u0921'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0927')
		{
			str=str.substring(0,c)+'\u0922'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0928')
		{
			str=str.substring(0,c)+'\u0923'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		
	}
	hdbox.value=str
}	
function rev_conv()
{
var str=hdbox.value;
var c=str.length;
	while(c>=0)
	{
	
		if(str.substring(c,c+1)=='\u0924')
		{
			str=str.substring(0,c)+'\u091F'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0925')
		{
			str=str.substring(0,c)+'\u0920'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0926')
		{
			str=str.substring(0,c)+'\u0921'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0927')
		{
			str=str.substring(0,c)+'\u0922'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0928')
		{
			str=str.substring(0,c)+'\u0923'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		c=c-1;
	}
	hdbox.value=str
}	

function frd_undo()
{
var str=hdbox.value;
var c=0;
	while(c<=str.length)
	{
	
		if(str.substring(c,c+1)=='\u091F')
		{
			str=str.substring(0,c)+'\u0924'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0920')
		{
			str=str.substring(0,c)+'\u0925'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0921')
		{
			str=str.substring(0,c)+'\u0926'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0922')

		{
			str=str.substring(0,c)+'\u0927'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0923')
		{
			str=str.substring(0,c)+'\u0928'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		c=c+1;
	}
	hdbox.value=str
}	
function rev_undo()
{
var str=hdbox.value;
var c=str.length;
	while(c>=0)
	{
	
		if(str.substring(c,c+1)=='\u091F')
		{
			str=str.substring(0,c)+'\u0924'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0920')
		{
			str=str.substring(0,c)+'\u0925'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0921')
		{
			str=str.substring(0,c)+'\u0926'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0922')
		{
			str=str.substring(0,c)+'\u0927'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		else if(str.substring(c,c+1)=='\u0923')
		{
			str=str.substring(0,c)+'\u0928'+str.substring(c+1,str.length)
			hdbox.value=str;
			return;
		}
		c=c-1;
	}
	hdbox.value=str
}	

 /****************************************************************************
    This Function receives an English string as an argument and returns an  
    Equivalent Hindi string by fetching from DataBase DICTIONARY and if not 
    It converts it using Function 'gf_etoh_conv' word by word.              
  **************************************************************************/
	
//----------------------------------- English to Hindi ---------------------//	
function fetch_dic(as_eng_name)
{
        var ASTR ;
		as_eng_name = as_eng_name;    				
        st_as_eng_word = as_eng_name;
       	if((as_eng_name).length==0)    								//CHECKING FOR NULL STRING     
        {
		//	alert("Please Enter a valid entry !!!");
            return "";                   							//RETURN NOTHING
     	}
		
       as_eng_name=as_eng_name.toUpperCase(); 
	   words[arr_count]=as_eng_name ;     						


      /*This Logic search each array word into Dictionary and If found , returns it's equivalent Hindi
        word Else it Calls Function that convert that English word into Hindi,And also forms them as a
        Hindi string.*/                   
	   for (word=1; word <= arr_count; word++)
	   {
       		var Hindi=""
			if (Hindi == "")
			{   	            								//THIS FUNCTION IS TO CONVERT THE ENGLISH STRING
            	Hindi = gf_etoh_conv(words[word]);           	//INTO ITs EQUIVALENT HINDI STRING
            }                                     				
       }                     									
		                    									
    return Hindi;    				                              			
}//fetch_dic ends

/**********************************************************************************
    THIS FUNCTION CONVERTS AN ENGLISH STRING TO IT'S EQUIVALENT HINDI ISCII STRING   
    STIRNG LETTER-WISE USING THE ARRAYS WITH CORRESPONDING LETTERS.                  
 **********************************************************************************/
function gf_etoh_conv( as_eng_str)
{
	var  ls_Hindi=add_hash(as_eng_str);
	var Change= new Array("SINGH", "SHW","KHHH","RR","SHH","KSH","GY","CHH", //8
					"#EE", "#EI", "#AA", "#AE", "#AI", "#AO", "#AU", "#OO", "#OU",  //9
					"#A", "#E", "#I", "#O", "#U", "ZA", "KH",//7 
					"AA", "AE", "AI", "AO", "AU", "OO", "OU","K", 
					"GH", "CH", "JH", "TH", "DH","PH", "BH", "SH", "EE", "EI",
					"T", "D", "N", "P", "F", "B", "M", "Y", "R","L","G", "J",  
					"V", "S", "H", "E","I", "O", "U", "C", "Q", 
					"W","X", "Z", 		".","?","0","1","2","3","4","5","6","7","8","9");
	var ChangeWith=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939', '\u0938' + '\u094D' + '\u0935','\u0959','\u090B','\u0937',
		'\u0915' + '\u094D' + '\u0937','\u0917'+ '\u094D' + '\u092F','\u091B',//8 
		'\u0907', '\u0908', '\u0906', '\u090F','\u0910', '\u0913', '\u0914', '\u0909','\u090A',//9 
		'\u0905', '\u0907', '\u0908', '\u0909', '\u090A', '\u095B', '\u0916',
        '\u093E','\u0947', '\u0948', '\u094B', '\u094C','\u0942', '\u094C','\u0915', 
		'\u0918', '\u091A', '\u091D', '\u0925', '\u0927', '\u092B','\u092D', '\u0936', '\u0940', '\u0940',
		'\u0924', '\u0926','\u0928', '\u092A', '\u095E', '\u092C','\u092E', '\u092F', '\u0930','\u0932','\u0917', '\u091C',
		'\u0935', '\u0938', '\u0939', '\u0947','\u093F', '\u094B', '\u0941', '\u0915', '\u0958', 
		'\u0935','\u095B','\u095B',
		'\u0970','\u097D',
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' );
		
	var loc1;
	var c  = 0;
    var count1  = 1;
	 var hash = ls_Hindi.indexOf("#");
	
	while(hash != -1)	
		//FIND THE INDEX OF THE #
	//Girdhar Mangal 3/8/05
	{ 			if(hash==0){
							ls_Hindi.substring(hash + 1,ls_Hindi.length); 	//REMOVE THE # AND CONC. LEFT AND RIGHT STRING TO #
							 hash = ls_Hindi.indexOf("#", hash + 1);
	}else{

           ls_Hindi = ls_Hindi.substring(0,hash) +'\u0020'+ ls_Hindi.substring(hash + 1,ls_Hindi.length); 	//REMOVE THE # AND CONC. LEFT AND RIGHT STRING TO #
           hash = ls_Hindi.indexOf("#", hash + 1);
	}
		//Girdhar Mangal 3/8/05
    }
        
	for(count1=0;count1<78;count1++)
	{
	var i=0
	loc=ls_Hindi.indexOf(Change[count1],0);
		while (loc!=-1)
		{
			/*if(count1>7 && count1<22)
			{
			ls_Hindi= ls_Hindi.replace(Change[count1],ChangeWith[count1]);
			}*/
			ls_Hindi= ls_Hindi.replace(Change[count1],ChangeWith[count1]);
			loc = ls_Hindi.indexOf(Change[count1],loc+1);
		}

	}

   
	//alert("before halant"+ ls_Hindi);
	ls_Hindi = Add_halant(ls_Hindi); //THIS FUNCTION ADDS HALANT BETWEEN TWO CONSONANTS WHILE CONVERTING AN ENGLISH STRING INTO ISCII STRING 
	//alert("after halant"+ ls_Hindi); 		
      		
    loc = ls_Hindi.indexOf("A", 0);
    do {
		
		if((loc == (ls_Hindi.length - 1)) && isconsonant(ls_Hindi.substring(loc - 1,loc)) == false)
		{
           ls_Hindi =ls_Hindi.replace("A","\u0906");
		}
		if((loc == (ls_Hindi.length - 1)) || ls_Hindi.substring(loc + 1,loc+2) == '\u0020')
		{
           ls_Hindi =ls_Hindi.replace("A","\u093E");
		}										//PLACE CHARACTER AA ki matra WHEN THERE ARE A PRESENT AT THE END OF THE WORD
        else 
		{
        ls_Hindi=ls_Hindi.replace( "A" , "");        		//WHEN A IS IN B/W STRING THEN REPLACE THE A WITH NOTHING ("")  
		}
        if(loc < ls_Hindi.length) 
		{
        loc = ls_Hindi.indexOf("A", loc + 1);
		}           								 		//'LOGIC IS IMPLEMENT TO PREVENT THE OUT OF INDEX ERROR
        loc = ls_Hindi.indexOf("A", loc);
	
		}while(loc != -1);

       return ls_Hindi;
}//gf_etoh_conv ends

 /*************************************************
     THIS FUNCTION ADDS HASHES(#) BEFORE EVERY WORD 
     TO DISTINGUISH VOWEL LETTERS AND MATRAS.       
  *************************************************/
  function add_hash(as_text) 
   {
        as_text =  as_text ;            						//ADD HASH(#) AT STARTING OF THE STRING
        var blk_loc ;   											//VARIABLE FOR FINDING SPACE(" ") IN STRING
        blk_loc = as_text.indexOf('\u0020', 0);
		while(blk_loc != -1)
		{  	//Girdhar Mangal 3/8/05
			if(	blk_loc==0){
				 as_text.substring(blk_loc + 1,as_text.length); 
				  blk_loc = as_text.indexOf('\u0020', blk_loc + 1);   
			}else{
			 as_text = as_text.substring(0,blk_loc) + "#" + as_text.substring(blk_loc + 1,as_text.length); 
																	//ADD HASH IN B/W THE STRING WHEN A HASH IS FOUND
            blk_loc = as_text.indexOf('\u0020', blk_loc + 1);    	//SEARCH HASH FROM NEXT LOCATION
        }  	//Girdhar Mangal 3/8/05
		}
	return as_text;    												//RETURN THE STRING WITH ADDITIONAL HASH SIGNs.
    }//add_hash ends
	
	/********************************************************************************
                               ADD_HALENT
    
    THIS FUNCTION ADDS HALANT BETWEEN TWO CONSONANTS WHILE CONVERTING AN ENGLISH  
    STRING INTO THE HINDI ONE.  THIS FUNCTION ALSO HANDLES THE SPECIAL CASES  OF   
    CHARACTER(S)/LETTER(S) SUCH AS 'KA','FA','RA' AND THOSE FORMS MIX_CHARACTERS    
    LIKE 'SH' & 'CH' FORMS 'SCH'.                                                  
    ********************************************************************************/

    function Add_halant(as_hindi)
	{
     	for(var c = 0;c < as_hindi.length; c++)  
		{
			if((isconsonant(as_hindi.substring(c, c+ 1 ))) && as_hindi.substring(c + 1, c+2) == '\u090B')
			{
			as_hindi = as_hindi.substring(0, c + 1) + '\u0943'  + as_hindi.substring(c+2,as_hindi.length);
			}
			if((isconsonant(as_hindi.substring(c, c+ 1 ))) && (isconsonant(as_hindi.substring(c + 1, c+2 )))) //1 //IF THERE IS CONTINUE 2 CONSONANTS
			{ 
				if(isconsonant(as_hindi.substring(c + 2, c+ 3)))  // 2 //IF ONE MORE CONSONANT (3 CONSONANTS )
				{																																			
					if(Ismix_ch(as_hindi.substring(c,c+2 ))) // PASS 2 CONSONANTS AS A STRING IN IS_MIX FUNCTION  
					{
						as_hindi = as_hindi.substring(0,c + 1 ) + '\u094D' + as_hindi.substring(c+2,as_hindi.length);
					}																						//'ADD A HALANT IN B/W THE TWO CONCONANTS (?)
					else if(as_hindi.substring(c,c+1) == '\u0928' )
					{    
					as_hindi = as_hindi.substring(0,c ) + '\u0902' + as_hindi.substring(c+1,as_hindi.length);																	//'IF A 'N' PRESENT AFTER 2 CONSONANTS				//'HANDLE N AS ?
					}
					else if(as_hindi.substring(c, c+1) == '\u0931')
					{
						as_hindi = as_hindi.substring(0, c) + '\u0943' + as_hindi.substring( c+1,as_hindi.length);
					}
					/*else if(as_hindi.substring(c + 1, c+2) = '\u0930')
					{
					as_hindi = as_hindi.substring(0, c + 1) + '\u0943' + as_hindi.substring(c+2,as_hindi.length);
					}*/
					else if((as_hindi.substring(c + 1, c+2) == '\u0913') || (as_hindi.substring(c + 1, c+2) == '\u092B')) 
					{
						as_hindi = as_hindi.substring(0,c + 1) + '\u094D' + as_hindi.substring(c + 1,as_hindi.length);
					}
					else
					{
						as_hindi = as_hindi.substring(0, c + 1) + '\u094D' +  as_hindi.substring(c+1,as_hindi.length);
					}
             	 } // 2  if end 
             	else   // 2  else  
			 	{	
					if(Ismix_ch(as_hindi.substring(c, c + 2 )))
					{
						as_hindi = as_hindi.substring(0, c+1) + '\u094D' + as_hindi.substring(c+1,as_hindi.length);
					}
					else if(as_hindi.substring(c,c+1) == '\u0928')
					{
						as_hindi = as_hindi.substring(0, c) + '\u0902' + as_hindi.substring(c+1,as_hindi.length);
					}
					else if(as_hindi.substring(c,c+1) == '\u0931')
					{
						as_hindi = as_hindi.substring(0, c) + '\u094D' +  as_hindi.substring(c+1,as_hindi.length);
					}
					else if(as_hindi.substring(c , c+1) == '\u0924' && as_hindi.substring(c + 1, c+2) == '\u0930')
					{
						as_hindi = as_hindi.substring(0, c+1) + '\u0943' + as_hindi.substring(c+1,as_hindi.length);
					}			
					/*else if(as_hindi.substring(c + 1, c+2) == '\u0930' && as_hindi.substring(c + 2, c+3) == '\u093F')
					{
						as_hindi = as_hindi.substring(0, c+1) + '\u0943' + as_hindi.substring(c+3,as_hindi.length);
					}*/
					else if((as_hindi.substring(c, c+1) == '\u0915') && (as_hindi.substring(c+1,c+2) == '\u0915'))
					{
						as_hindi = as_hindi.substring(0, c+1) + '\u094D' + as_hindi.substring(c+1,as_hindi.length);
					}
					else 
					{
						as_hindi = as_hindi.substring(0, c + 1 ) + '\u094D'  + as_hindi.substring(c + 1 ,as_hindi.length);
					}          
				}  // 2   else end 
			 	c = c + 3;
			 } //  1 if  end 
			 
			 
		} // 0 
		
	for(c = 0;c<as_hindi.length;c++)  
	{
		if((isconsonant(as_hindi.substring(c, c+ 1 ))) && (isconsonant(as_hindi.substring(c + 1, c+2 ))))
		{
		as_hindi = as_hindi.substring(0, c + 1 ) + '\u094D'  + as_hindi.substring(c + 1 ,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u093E')
		{
			as_hindi=as_hindi.substring(0,c)+ '\u0906' +as_hindi.substring(c+1,as_hindi.length);//yahan hain
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u093F')
		{
			as_hindi=as_hindi.substring(0,c)+ '\u0907' +as_hindi.substring(c+1,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u0940')
		{
			as_hindi=as_hindi.substring(0,c)+ '\u0908' +as_hindi.substring(c+1,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u0941')
		{
			as_hindi=as_hindi.substring(0,c)+ '\u0909' +as_hindi.substring(c+1,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u0942')
		{
			as_hindi=as_hindi.substring(0,c)+ '\u090A' +as_hindi.substring(c+1,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u0943')
		{
			as_hindi=as_hindi.substring(0,c)+ '\u090B' +as_hindi.substring(c+1,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u0947')
		{
			as_hindi=as_hindi.substring(0,c)+ '\u090F' +as_hindi.substring(c+1,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u0948')
		{
			as_hindi=as_hindi.substring(0,c)+ '\u0910' +as_hindi.substring(c+1,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && as_hindi.substring(c,c+1)== '\u094B')
		{
			as_hindi=as_hindi.substring(0,c) + '\u0913' +as_hindi.substring(c+1,as_hindi.length);
		}
		if(isconsonant(as_hindi.substring(c-1,c))==false && (as_hindi.substring(c,c+1)== '\u094C'))
		{
			as_hindi=as_hindi.substring(0,c)+ '\u0914' +as_hindi.substring(c+1,as_hindi.length);
		}
	
	}
		
        return as_hindi;
    }//Add_halant ends
	
	/**********************************************************
     RETURNS TRUE IF ARGUMENT IS A HINDI CONSONANT.            
    ***********************************************************/
 function isconsonant(ac_letter)
 {
    var lb_ans=false;
	if((ac_letter.charCodeAt(0)>= 2325)&&(ac_letter.charCodeAt(0) <= 2361 ))
	{							
      	lb_ans = true;
	}
        return lb_ans;
 }
	
	/**********************************************************************************
   		THIS FUNCTION RETURNS BOOLEAN TRUE IF TWO CHARACTERS PASSED AS ARGUMENT 
   		STRING FORMS A MIX-CHARACTER.                                           
 	**********************************************************************************/

  function Ismix_ch( as_str ) 
  {
        var bln  = false;
        if((as_str == '\u0926' + '\u0926') || (as_str == '\u0926' + '\u0917') ||																												//IF A PERTICULAR COMBINATION OF CHARACTER IS PRESENT IN STRING RETURN TRUE.
           (as_str == '\u0926' + '\u0927')|| (as_str == '\u0926'+ '\u092C') ||
			(as_str =='\u0926' + '\u092E') || (as_str == '\u0926' + '\u092F') ||
			(as_str =='\u0926' + '\u0935') || (as_str == '\u0919' + '\u0915') ||
			(as_str =='\u0919' + '\u0916') || (as_str == '\u0919' + '\u0917') ||
			(as_str =='\u0919' + '\u0918') || (as_str == '\u091E' + '\u091A') ||
			(as_str =='\u091E' + '\u091C') || (as_str == '\u091F' + '\u091F') ||
			(as_str =='\u0924' + '\u0924') || (as_str == '\u091F' + '\u0921') ||
			(as_str =='\u0920' + '\u0920') || (as_str == '\u0921' + '\u0921') ||
			(as_str =='\u0921' + '\u0922') || (as_str == '\u0922' + '\u0922') ||
			(as_str =='\u0926'+ '\u092D') || (as_str == '\u0936' + '\u091A') ||
			(as_str =='\u0937' + '\u091F') || (as_str == '\u0937'+ '\u0920') ||
			(as_str =='\u0939' + '\u0928') || (as_str == '\u0939'+ '\u0932') ||
			(as_str =='\u0939' + '\u0935') || (as_str == '\u0928'+ '\u0928') ||
			(as_str =='\u0936' + '\u0930') || (as_str =='\u0924' + '\u0930'))
			{
                bln = true;
        	}
        return bln;
    }
//------------------------------------- English to Hindi ends -------------------//
//------------------------------------- Hindi to bangali ------------------------//
function hinditobangali(as_bangali)
{
	var ChangeWith=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939','\u0938' + '\u094D' + '\u0935',//2
		'\u0959','\u090B','\u0937','\u0907', '\u0908','\u0906', '\u090F','\u0910', '\u0913', '\u0914', //10
		'\u0909','\u090A', '\u091B', //3
		'\u0915' + '\u094D' + '\u0937',//1
		'\u0917'+ '\u094D' + '\u092F', //1
		'\u091F','\u0920','\u0921','\u0922','\u0923',//5
		'\u0905', '\u0907', '\u0908','\u0909', '\u090A', '\u095B', '\u0916','\u093E','\u0947', '\u0948', //10
		'\u094B', '\u094C','\u0942','\u094C','\u0915','\u0918', '\u091A', '\u091D','\u0925', '\u0927', //10
		'\u092B','\u092D', '\u0936','\u0940', '\u0940','\u0924', '\u0926','\u0928','\u092A', '\u095E', //10
		'\u092C','\u092E', '\u092F','\u0930','\u0932','\u0917', '\u091C','\u0935','\u0938', '\u0939', //10
		'\u0947','\u093F', '\u094B','\u0941', '\u0915', '\u0958','\u0935','\u095B',	'\u095B','\u0970',//10
		'\u097D',//10
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' );//10
		
	var ChangeWith_bangali=new Array ('\u09B8' + '\u09BF' + '\u0982' + '\u09B9','\u09B8' + '\u09CD' + '\u09AC',//2
		'\u0996','\u098B','\u09B7','\u0987','\u0988','\u0986', '\u098F','\u0990','\u0993','\u0994', //10
		'\u0989','\u098A', '\u099B', //3
		'\u0995' + '\u09CD' + '\u09B7',//1
		'\u0997'+ '\u09CD' + '\u09AF',//1
		'\u099F','\u09A0','\u09A1','\u09A2','\u09A3',//5
		'\u0985', '\u0987', '\u0988', '\u0989', '\u098A','\u099C', '\u0996','\u09BE','\u09C7', '\u09C8',//10
		'\u09CB', '\u09CC','\u09C2', '\u09CC','\u0995','\u0998', '\u099A', '\u099D', '\u09A5', '\u09A7', //10
		'\u09AB','\u09AD', '\u09B6', '\u09C0', '\u09C0','\u09A4', '\u09A6','\u09A8', '\u09AA', '\u09AB',//10
		'\u09AC','\u09AE', '\u09AF', '\u09B0','\u09B2','\u0997', '\u099C','\u09AC', '\u09B8', '\u09B9', //10
		'\u09C7','\u09BF', '\u09CB', '\u09C1', '\u0995', '\u0995','\u09AC','\u099C','\u099C','.',//10
		'?',//1
		'\u09E6','\u09E7','\u09E8','\u09E9','\u09EA','\u09EB','\u09EC','\u09ED','\u09EE','\u09EF' );//10
		
	var loc1 
    var c  = 0
    var count1  = 1
    for(count1=0;count1<83;count1++)
	{
		loc=as_bangali.indexOf(ChangeWith[count1],0);
		while (loc!=-1)
		{
			as_bangali= as_bangali.replace(ChangeWith[count1],ChangeWith_bangali[count1]);
			loc = as_bangali.indexOf(ChangeWith[count1],loc+1);
		}

	}
	for(c=0;c<as_bangali.length;c++)
	{
		if(as_bangali.substring(c,c+1)=='\u094D')
		{
			as_bangali=as_bangali.substring(0,c)+'\u09CD'+as_bangali.substring(c+1,as_bangali.length);
		}
		if(as_bangali.substring(c,c+1)=='\u09BF')
		{
			as_bangali=as_bangali.substring(0,c-1)+'\u09BF'+as_bangali.substring(c-1,c)+as_bangali.substring(c+1,as_bangali.length);
		}
		if(as_bangali.substring(c,c+1)=='\u0902')
		{
			as_bangali=as_bangali.substring(0,c)+'\u0982'+as_bangali.substring(c+1,as_bangali.length);
		}
		if(as_bangali.substring(c,c+1)=='\u0943')
		{
			as_bangali=as_bangali.substring(0,c)+'\u09C3'+as_bangali.substring(c+1,as_bangali.length);
		}
	}
	/*for(c=0;c<as_bangali.length;c++)
	{
		
	}
	for(c=0;c<as_bangali.length;c++)
	{
		
	}*/
	
	return as_bangali;		
}//hinditobangali ends 

function hinditogujrati(as_gujrati)
{

	var ChangeWith=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939', '\u0938' + '\u094D' + '\u0935','\u0959','\u090B','\u0937',
		'\u0907', '\u0908', '\u0906', '\u090F','\u0910', '\u0913', '\u0914', '\u0909','\u090A', '\u091B', 
		'\u0915' + '\u094D' + '\u0937','\u0917'+ '\u094D' + '\u092F', '\u0905', '\u0907', '\u0908', '\u0909', '\u090A', '\u095B', '\u0916',
        '\u093E','\u0947', '\u0948', '\u094B', '\u094C','\u0941', '\u0942','\u0915', 
		'\u091F','\u0920','\u0921','\u0922','\u0923',
		'\u0918', '\u091A', '\u091D', '\u0925', '\u0927', '\u092B','\u092D', '\u0936', '\u0940', '\u0940',
		'\u0924', '\u0926','\u0928', '\u092A', '\u095E', '\u092C','\u092E', '\u092F', '\u0930','\u0932','\u0917', '\u091C',
		'\u0935', '\u0938', '\u0939', '\u0947','\u093F', '\u094B', '\u0941', '\u0915', '\u0958', 
		'\u0935','\u095B','\u095B',
		'\u0970','\u097D',
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' );
		
		var ChangeWith_gujrati=new Array ('\u0AB8' + '\u0ABF' + '\u0A82' + '\u0AB9', '\u0AB8' + '\u0ACD' + '\u0AB5','\u0A96','\u0A8B','\u0AB7',
		'\u0A87', '\u0A88', '\u0A86', '\u0A8F','\u0A90', '\u0A93', '\u0A94', '\u0A89','\u0A8A', '\u0A9B', 
		'\u0A95' + '\u0ACD' + '\u0AB7','\u0A97'+ '\u0ACD' + '\u0AAF', '\u0A85', '\u0A87', '\u0A88', '\u0A89', '\u0A8A', '\u0A9C', '\u0A96',
        '\u0ABE','\u0AC7', '\u0AC8', '\u0ACB', '\u0ACC','\u0AC1', '\u0AC2','\u0A95', 
		'\u0A9F','\u0AA0','\u0AA1','\u0AA2','\u0AA3',
		'\u0A98', '\u0A9A', '\u0A9D', '\u0AA5', '\u0AA7', '\u0AAB','\u0AAD', '\u0AB6', '\u0AC0', '\u0AC0',
		'\u0AA4', '\u0AA6','\u0AA8', '\u0AAA', '\u0AAB', '\u0AAC','\u0AAE', '\u0AAF', '\u0AB0','\u0AB2','\u0A97', '\u0A9C',
		'\u0AB5', '\u0AB8', '\u0AB9', '\u0AC7','\u0ABF', '\u0ACB', '\u0AC1', '\u0A95', '\u0A95', 
		'\u0AB5','\u0A9C','\u0A9C',
		'.','?',
		'\u0AE6','\u0AE7','\u0AE8','\u0AE9','\u0AEA','\u0AEB','\u0AEC','\u0AED','\u0AEE','\u0AEF' );
		
		for(count1=0;count1<83;count1++)
		{
			loc=as_gujrati.indexOf(ChangeWith[count1],0);
			while (loc!=-1)
			{
				as_gujrati= as_gujrati.replace(ChangeWith[count1],ChangeWith_gujrati[count1]);
				loc = as_gujrati.indexOf(ChangeWith[count1],loc+1);
			}

		}
		
		for(c=0;c<as_gujrati.length;c++)
		{
			if(as_gujrati.substring(c,c+1)=='\u094D')
			{
				as_gujrati=as_gujrati.substring(0,c)+'\u0ACD'+as_gujrati.substring(c+1,as_gujrati.length);
			}
			if(as_gujrati.substring(c,c+1)=='\u0902')
			{
				as_gujrati=as_gujrati.substring(0,c)+'\u0A82'+as_gujrati.substring(c+1,as_gujrati.length);
			}
			if(as_gujrati.substring(c,c+1)=='\u0943')
			{
				as_gujrati=as_gujrati.substring(0,c)+'\u0AC3'+as_gujrati.substring(c+1,as_gujrati.length);
			}
		}
		for(c=0;c<as_gujrati.length;c++)
		{
			if(as_gujrati.substring(c,c+1)=='\u0902')
			{
				as_gujrati=as_gujrati.substring(0,c)+'\u0A82'+as_gujrati.substring(c+1,as_gujrati.length);
			}
		}
/*for(c=0;c<as_gujrati.length;c++)
{
	if(as_gujrati.substring(c,c+1)=='\u0902')
	{
		as_gujrati=as_gujrati.substring(0,c)+'\u0ACD'+as_gujrati.substring(c+1,as_gujrati.length);
	}
}*/

return as_gujrati;
}//hindi to gujrati ends

function hinditomalayalam(as_malayalam)
{
	var ChangeWith=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939', '\u0938' + '\u094D' + '\u0935','\u0959','\u090B','\u0937',
		'\u0907', '\u0908', '\u0906', '\u090F','\u0910', '\u0913', '\u0914', '\u0909','\u090A', '\u091B', 
		'\u0915' + '\u094D' + '\u0937','\u0917'+ '\u094D' + '\u092F', '\u0905', '\u0907', '\u0908', '\u0909', '\u090A', '\u095B', '\u0916',
        '\u093E','\u0947', '\u0948', '\u094B', '\u094C','\u0941', '\u0942','\u0915', 
		'\u091F','\u0920','\u0921','\u0922','\u0923',
		'\u0918', '\u091A', '\u091D', '\u0925', '\u0927', '\u092B','\u092D', '\u0936', '\u0940', '\u0940',
		'\u0924', '\u0926','\u0928', '\u092A', '\u095E', '\u092C','\u092E', '\u092F', '\u0930','\u0932','\u0917', '\u091C',
		'\u0935', '\u0938', '\u0939', '\u0947','\u093F', '\u094A', '\u0941', '\u0915', '\u0958', 
		'\u0935','\u095B','\u095B',
		'\u0970','\u097D',
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' );
		
		var ChangeWith_malayalam=new Array ('\u0D38' + '\u0D3F' + '\u0D02' + '\u0D39', '\u0D38' + '\u0D4D' + '\u0D35','\u0D16','\u0D0B','\u0D37',
		'\u0D07', '\u0D08', '\u0D06', '\u0D0F','\u0D10', '\u0D13', '\u0D14', '\u0D09','\u0D0A', '\u0D1B', 
		'\u0D15' + '\u0D4D' + '\u0D37','\u0D17'+ '\u0D4D' + '\u0D2F', '\u0D05', '\u0D07', '\u0D08', '\u0D09', '\u0D0A', '\u0D1C', '\u0D16',
        '\u0D3E','\u0D47', '\u0D48', '\u0D4B', '\u0D4C','\u0D41', '\u0D42','\u0D15', 
		'\u0D1F','\u0D20','\u0D21','\u0D22','\u0D23',
		'\u0D18', '\u0D1A', '\u0D1D', '\u0D25', '\u0D27', '\u0D2B','\u0D2D', '\u0D36', '\u0D40', '\u0D40',
		'\u0D24', '\u0D26','\u0D28', '\u0D2A', '\u0D2B', '\u0D2C','\u0D2E', '\u0D2F', '\u0D30','\u0D32','\u0D17', '\u0D1C',
		'\u0D35', '\u0D38', '\u0D39', '\u0D47','\u0D3F', '\u0D4A', '\u0D41', '\u0D15', '\u0D15', 
		'\u0D35','\u0D1C','\u0D1C',
		'.','?',
		'\u0D66','\u0D67','\u0D68','\u0D69','\u0D6A','\u0D6B','\u0D6C','\u0D6D','\u0D6E','\u0D6F');
	for(count1=0;count1<83;count1++)
	{
		loc=as_malayalam.indexOf(ChangeWith[count1],0);
		while (loc!=-1)
		{
			as_malayalam= as_malayalam.replace(ChangeWith[count1],ChangeWith_malayalam[count1]);
			loc = as_malayalam.indexOf(ChangeWith[count1],loc+1);
		}
	}
	for(c=0;c<as_malayalam.length;c++)
	{
		if(as_malayalam.substring(c,c+1)=='\u094D')
		{
			as_malayalam=as_malayalam.substring(0,c)+'\u0D4D'+as_malayalam.substring(c+1,as_malayalam.length);
		}
		if(as_malayalam.substring(c,c+1)=='\u0902')
		{
			as_malayalam=as_malayalam.substring(0,c)+'\u0D02'+as_malayalam.substring(c+1,as_malayalam.length);
		}
		if(as_malayalam.substring(c,c+1)=='\u0943')
		{
			as_malayalam=as_malayalam.substring(0,c)+'\u0D43'+as_malayalam.substring(c+1,as_malayalam.length);
		}
	}
return as_malayalam;
} //hindi to malayalam ends
//------------------------------------TAMIL CODE STARTS-------------------------------------------------------//
  function fetch_dic_tamil(as_eng_name)
  {
    var ASTR ;
	as_eng_name = as_eng_name;    																		//'REMOVE EXTRA SPACE FROM STRING
    if((as_eng_name).length==0)    																//'CHECKING FOR NULL STRING     
    {   //alert("Please Enter a valid entry !!!");
        return "";                   																		// 'RETURN NOTHING
    }
		
        																											//' And then stores into an array of variable size. 
        ASTR = as_eng_name+"";                          															//USE VARIABLE TO STORE ENGLISH STRING
        as_eng_name=(as_eng_name).toUpperCase(); 														//WE USING THIS VARIABLE IN MESSAGE BOX AS PREVIOUS STRING
        
	   words[arr_count]=as_eng_name ;     																	//THIS LOGIC STORES THE LAST WORD OF THE STRING
	for (word=1; word <= arr_count; word++)
	{
    	var Tamil=""
		if (Tamil == "")
		{   	            																				// 'THIS FUNCTION IS CONVERT THE ENGLISH STRING
           	Tamil = engtotamil_conv(words[word]);           													//'INTO ITs EQUIVALENT ISCII STRING
        }                                     																//'THIS FUNCTION GET ISCII CHARACTER ONE BY ONE AND PASS 
                           																					//'THEM INTO THE ISCII_TO_FONT FUNCTION, TO CONVERT        
	}                                               														//'ISCII CHARACTERS TO UNICODE
   return Tamil;                                      
}//fetch_dic ends

 
 function engtotamil_conv(as_eng_str)
{
var  as_tamil=add_hash_tamil(as_eng_str);
var ChangeWith= new Array( "SINGH", "SHW",
					"SHH","#EE", "#AI", "#AA","#UU", "#II", "#OO", 
					"#A", "#E", "#I", "#O", "#U", 
					"AA", "EE", "AI", "AU", "OO", "II","TH","NH","NG","NY",
					"K", "CH","SH","T","N", "P", "M", "Y", "R","L",
					"J","V", "S", "H", "E","I", "O", "U", "C", "Q", 
					"W","X", "Z","B","D","F","G", 
					".","?",
					"0","1","2","3","4","5","6","7","8","9");
	
		
		var ChangeWith_tamil=new Array ('\u0BB8' + '\u0BBF' + '\u0B82' + '\u0BB9', '\u0BB8' + '\u0BCD' + '\u0BB5',//2
		'\u0BB7','\u0B87', '\u0B88', '\u0B86', '\u0B8A', '\u0B88', '\u0B93',//7
		'\u0B85', '\u0B8E', '\u0B87', '\u0B92', '\u0B89',//5 
		'\u0BBE', '\u0BC7','\u0BC8','\u0BCC','\u0BCB','\u0BC0','\u0B9F','\u0BA3','\u0B99','\u0B9E',//10
        '\u0B95','\u0B9A','\u0BB6','\u0BA4','\u0BA8','\u0BAA','\u0BAE','\u0BAF','\u0BB0','\u0BB2',//10 
		'\u0BB9C','\u0BB5','\u0BB8','\u0BB9','\u0BC6','\u0BBF','\u0BCA','\u0BC1','\u0B95','\u0B95',//10
		'\u0BB5','\u0B9C','\u0B9C','\u0BB5','\u0B99','\u0BAA','\u0B9C',//7
		'.','?',//2
		'\u0BE6','\u0BE7','\u0BE8','\u0BE9','\u0BEA','\u0BEB','\u0BEC','\u0BED','\u0BEE','\u0BEF' );//10

   var hash = as_tamil.indexOf("#");
																					 	//'FIND THE INDEX OF THE #
       while(hash != -1)
		{ 
            as_tamil = as_tamil.substring(0,hash) +'\u0020'+ as_tamil.substring(hash + 1,as_tamil.length); 			//'REMOVE THE # AND CONC. LEFT AND RIGHT STRING TO #
            hash = as_tamil.indexOf("#", hash + 1);
        }     		
for(count1=0;count1<63;count1++)
{
var i=0
loc=as_tamil.indexOf(ChangeWith[count1],0);
	while (loc!=-1)
	{
		as_tamil= as_tamil.replace(ChangeWith[count1],ChangeWith_tamil[count1]);
		loc = as_tamil.indexOf(ChangeWith[count1],loc+1);
	}

}

    
		//alert("before halant"+ as_tamil);
		as_tamil = Add_halant_tamil(as_tamil);  
		//alert("before halant"+ as_tamil); 																						//'THIS FUNCTION ADDS HALANT BETWEEN TWO CONSONANTS WHILE CONVERTING AN ENGLISH STRING INTO ISCII STRING
       /* if((as_tamil.indexOf("A",(as_tamil.length - 1)) ==  (as_tamil.length - 1)) && (as_tamil.indexOf("Æ",(as_tamil.length - 1)) != (as_tamil.length - 1)))  
		{    
            as_tamil = as_tamil + '\u093E';
        }
		*/
		
      loc = as_tamil.indexOf("A", 0);

        do {
            if((loc == (as_tamil.length - 1)) || as_tamil.substring(loc ,loc+1) == '\u0020')
			{
                as_tamil =as_tamil.replace("A","\u0BBE");
			}			 										//'PLACE CHARACTER Ú WHEN THERE ARE A PRESENT AT THE END OF THE WORD
            else 
			{
                as_tamil=as_tamil.replace( "A" , "");        		//'WHEN A IS IN B/W STRING THEN REPLACE THE A WITH NOTHING ("")  
      	 	}
            if(loc < as_tamil.length) 
				{
                loc = as_tamil.indexOf("A", loc + 1);
				}           								 		//'LOGIC IS IMPLEMENT TO PREVENT THE OUT OF INDEX ERROR
           
				loc = as_tamil.indexOf("A", loc);
        	}while(loc != -1);
	//	alert("  gf_etoh_conv  "+as_tamil+"");
		
        return as_tamil+"";


 // return as_eng_str;
}//gf_etoh_conv ends

 function add_hash_tamil(as_text) 
   {

        as_text = "#" + as_text ;            																//'ADD HASH(#) AT STARTING OF THE STRING
        var blk_loc ;   																//'VARIABLE FOR FINDING SPACE(" ") IN STRING
        blk_loc = as_text.indexOf('\u0020', 0);
		while(blk_loc != -1)
		{ 
            as_text = as_text.substring(0,blk_loc) + "#" + as_text.substring(blk_loc + 1,as_text.length); 
																									//'ADD HASH IN B/W THE STRING WHEN A HASH IS FOUND
            blk_loc = as_text.indexOf('\u0020', blk_loc + 1);    								//'SEARCH HASH FROM NEXT LOCATION
        }
		
        return as_text;    																		//'RETURN THE STRING WITH ADDITIONAL HASH SIGNs.

    }//add_hash ends
	
 function Add_halant_tamil(as_tamil){
//        alert ("length" + as_tamil.length) ; 
  
        for(var c = 0;c < as_tamil.length; c++)  
		{
		if((isconsonant_tamil(as_tamil.substring(c, c+ 1 ))) && (isconsonant_tamil(as_tamil.substring(c + 1, c+2 )))) //1
		{ 
			if(isconsonant_tamil(as_tamil.substring(c + 2, c+ 3)))  // 2  //IF THERE IS CONTINUE 2 CONSONANTS
			{																																			
																															//IF ONE MORE CONSONANT (3 CONSONANTS )
				if(Ismix_ch_tamil(as_tamil.substring(c,c+2 )))  
				{													//    'PASS 2 CONSONANTS AS A STRING IN IS_MIX FUNCTION 
					as_tamil = as_tamil.substring(0,c + 1 ) + '\u0BCD' + as_tamil.substring(c+2,as_tamil.length);
				}																						//'ADD A HALANT IN B/W THE TWO CONCONANTS (?)
				else if(as_tamil.substring(c,c+1) == '\u0BA8' )
				{    
					as_tamil = as_tamil.substring(0,c ) + '\u0B82' + as_tamil.substring(c+1,as_tamil.length);																	//'IF A 'N' PRESENT AFTER 2 CONSONANTS				//'HANDLE N AS ?
				}
				else
				{
					as_tamil = as_tamil.substring(0, c + 1) + '\u0BCD' +  as_tamil.substring(c+1,as_tamil.length);
				}
            } // 2  if end 
            else   // 2  else  
			{	
				if(Ismix_ch_tamil(as_tamil.substring(c, c + 2 )))
				{
					as_tamil = as_tamil.substring(0, c+1) + '\u0BCD' + as_tamil.substring(c+1,as_tamil.length);
				}
				else if(as_tamil.substring(c,c+1) == '\u0BA8')
				{
					as_tamil = as_tamil.substring(0, c) + '\u0B82' + as_tamil.substring(c+1,as_tamil.length);
				}
				else if(as_tamil.substring(c , c+1) == '\u0BA4' && as_tamil.substring(c + 1, c+2) == '\u0BB0')
				{
					as_tamil = as_tamil.substring(0, c+1) + '\u0BCD' + as_tamil.substring(c+1,as_tamil.length);
				}			
				/*else if(as_tamil.substring(c + 1, c+2) == '\u0930' && as_tamil.substring(c + 2, c+3) == '\u093F')
				{
					as_tamil = as_tamil.substring(0, c+1) + '\u0943' + as_tamil.substring(c+3,as_tamil.length);
				}*/
				else if((as_tamil.substring(c, c+1) == '\u0B95') && (as_tamil.substring(c+1,c+2) == '\u0B95'))
				{
					as_tamil = as_tamil.substring(0, c+1) + '\u0BCD' + as_tamil.substring(c+1,as_tamil.length);
				}
				else 
				{
					as_tamil = as_tamil.substring(0, c + 1 ) + '\u0BCD'  + as_tamil.substring(c + 1 ,as_tamil.length);
				}          
			}  // 2   else end 
			c = c + 3;
		} //  1 if  end 
	} // 0 
	for(var c = 0;c < as_tamil.length; c++)  
	{
		if((isconsonant_tamil(as_tamil.substring(c, c+ 1 ))) && (isconsonant_tamil(as_tamil.substring(c + 1, c+2 ))))
		{
		as_tamil = as_tamil.substring(0, c + 1 ) + '\u0BCD'  + as_tamil.substring(c + 1 ,as_tamil.length);
		}
	}
	
	for(c = 0;c<as_tamil.length;c++)  
	{
		if((isconsonant_tamil(as_tamil.substring(c, c+ 1 ))) && (isconsonant_tamil(as_tamil.substring(c + 1, c+2 ))))
		{
		as_tamil = as_tamil.substring(0, c + 1 ) + '\u0BCD'  + as_tamil.substring(c + 1 ,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BBE')
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B86' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BBF')
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B87' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BC0')
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B88' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BC1')
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B89' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BC2')
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B8A' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BCA')
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B92' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BC7')
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B8F' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BC8')
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B90' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && as_tamil.substring(c,c+1)== '\u0BCB')
		{
			as_tamil=as_tamil.substring(0,c) + '\u0B93' +as_tamil.substring(c+1,as_tamil.length);
		}
		if(isconsonant_tamil(as_tamil.substring(c-1,c))==false && (as_tamil.substring(c,c+1)== '\u0BCC'))
		{
			as_tamil=as_tamil.substring(0,c)+ '\u0B94' +as_tamil.substring(c+1,as_tamil.length);
		}
	
	}
		
        return as_tamil;
    }//Add_halant ends
	
function isconsonant_tamil(ac_letter){
       var lb_ans=false;
	   //alert("isconsonamnt :"+ ac_letter.charCodeAt(0));
        if((ac_letter.charCodeAt(0)>= 2965)&&(ac_letter.charCodeAt(0) <= 3001 )){							//  'RANGE OF CONSONANT IS 179 TO 216
            
			lb_ans = true;
			
       }
        return lb_ans;
    }
	

 function Ismix_ch_tamil( as_str ) {
        var bln  = false;
        if(
			
			(as_str =='\u0B99' + '\u0B95') || (as_str =='\u0919' + '\u0916') || 
			(as_str =='\u0B9E' + '\u0B9A') || (as_str =='\u0B9E' + '\u0B9C') || 
			(as_str =='\u0B9F' + '\u0B9F') || (as_str =='\u0BA4' + '\u0BA4') || 
			(as_str =='\u0BB6' + '\u0B9A') || (as_str =='\u0BB9' + '\u0BA8') || 
			(as_str =='\u0BB9' + '\u0BB2') || (as_str =='\u0BB9' + '\u0BB5') || 
			(as_str =='\u0BA8' + '\u0BA8') || (as_str =='\u0BB6' + '\u0BB0') || 
			(as_str =='\u0BA4' + '\u0BB0') || (as_str =='\u0BA8' + '\u0BB0'))
			{
                bln = true;
        	}
        return bln;
    }

 //-------------------------- tamil code ends ------------------------------------//
function hinditotelugu(as_telugu)
{
	var ChangeWith=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939', '\u0938' + '\u094D' + '\u0935','\u0959','\u090B','\u0937',
		'\u0907', '\u0908', '\u0906', '\u090F','\u0910', '\u0913', '\u0914', '\u0909','\u090A', '\u091B', 
		'\u0915' + '\u094D' + '\u0937','\u0917'+ '\u094D' + '\u092F', '\u0905', '\u0907', '\u0908', '\u0909', '\u090A', '\u095B', '\u0916',
        '\u093E','\u0947', '\u0948', '\u094B', '\u094C','\u0941', '\u0942','\u0915', 
		'\u091F','\u0920','\u0921','\u0922','\u0923',
		'\u0918', '\u091A', '\u091D', '\u0925', '\u0927', '\u092B','\u092D', '\u0936', '\u0940', '\u0940',
		'\u0924', '\u0926','\u0928', '\u092A', '\u095E', '\u092C','\u092E', '\u092F', '\u0930','\u0932','\u0917', '\u091C',
		'\u0935', '\u0938', '\u0939', '\u0947','\u093F', '\u094A', '\u0941', '\u0915', '\u0958', 
		'\u0935','\u095B','\u095B',
		'\u0970','\u097D',
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' );
		
		var ChangeWith_telugu=new Array ('\u0C38' + '\u0C3F' + '\u0C02' + '\u0C39', '\u0C38' + '\u0C4D' + '\u0C35','\u0C59','\u0C0B','\u0C37',
		'\u0C07', '\u0C08', '\u0C06', '\u0C0F','\u0C10', '\u0C13', '\u0C14', '\u0C09','\u0C0A', '\u0C1B', 
		'\u0C15' + '\u0C4D' + '\u0C37','\u0C17'+ '\u0C4D' + '\u0C2F', '\u0C05', '\u0C07', '\u0C08', '\u0C09', '\u0C0A', '\u0C1C', '\u0C16',
        '\u0C3E','\u0C47', '\u0C48', '\u0C4B', '\u0C4C','\u0C41', '\u0C42','\u0C15', 
		'\u0C1F','\u0C20','\u0C21','\u0C22','\u0C23',
		'\u0C18', '\u0C1A', '\u0C1D', '\u0C25', '\u0C27', '\u0C2B','\u0C2D', '\u0C36', '\u0C40', '\u0C40',
		'\u0C24', '\u0C26','\u0C28', '\u0C2A', '\u0C2B', '\u0C2C','\u0C2E', '\u0C2F', '\u0C30','\u0C32','\u0C17', '\u0C1C',
		'\u0C35', '\u0C38', '\u0C39', '\u0C47','\u0C3F', '\u0C4A', '\u0C41', '\u0C15', '\u0C16', 
		'\u0C35','\u0C1C','\u0C1C',
		'.','?',
		'\u0C66','\u0C67','\u0C68','\u0C69','\u0C6A','\u0C6B','\u0C6C','\u0C6D','\u0C6E','\u0C6F' );
		for(count1=0;count1<83;count1++)
		{
			loc=as_telugu.indexOf(ChangeWith[count1],0);
			while (loc!=-1)
			{
				as_telugu= as_telugu.replace(ChangeWith[count1],ChangeWith_telugu[count1]);
				loc = as_telugu.indexOf(ChangeWith[count1],loc+1);
			}
		}
	for(c=0;c<as_telugu.length;c++)
	{
		if(as_telugu.substring(c,c+1)=='\u094D')
		{
			as_telugu=as_telugu.substring(0,c)+'\u0C4D'+as_telugu.substring(c+1,as_telugu.length);
		}
		if(as_telugu.substring(c,c+1)=='\u0902')
		{
			as_telugu=as_telugu.substring(0,c)+'\u0C02'+as_telugu.substring(c+1,as_telugu.length);
		}
		if(as_telugu.substring(c,c+1)=='\u0943')
		{
			as_telugu=as_telugu.substring(0,c)+'\u0C43'+as_telugu.substring(c+1,as_telugu.length);
		}
	}
return as_telugu;
}

function hinditooriya(as_oriya)
{
	var ChangeWith=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939', '\u0938' + '\u094D' + '\u0938','\u0959','\u090B','\u0937',
		'\u0907', '\u0908', '\u0906', '\u090F','\u0910', '\u0913', '\u0914', '\u0909','\u090A', '\u091B', 
		'\u0915' + '\u094D' + '\u0937','\u0917'+ '\u094D' + '\u092F', '\u0905', '\u0907', '\u0908', '\u0909', '\u090A', '\u095B', '\u0916',
        '\u093E','\u0947', '\u0948', '\u094B', '\u094C','\u0941', '\u0942','\u0915', 
		'\u091F','\u0920','\u0921','\u0922','\u0923',
		'\u0918', '\u091A', '\u091D', '\u0925', '\u0927', '\u092B','\u092D', '\u0936', '\u0940', '\u0940',
		'\u0924', '\u0926','\u0928', '\u092A', '\u095E', '\u092C','\u092E', '\u092F', '\u0930','\u0932','\u0917', '\u091C',
		'\u0935', '\u0938', '\u0939', '\u0947','\u093F', '\u094A', '\u0941', '\u0915', '\u0958', 
		'\u0935','\u095B','\u095B',
		'\u0970','\u097D',
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' );
		
		var ChangeWith_oriya=new Array('\u0B38' + '\u0B3F' + '\u0B02' + '\u0B39', '\u0B38' + '\u0B4D' + '\u0B35','\u0B59','\u0B0B','\u0B37',
		'\u0B07', '\u0B08', '\u0B06', '\u0B0F','\u0B10', '\u0B13', '\u0B14', '\u0B09','\u0B0A', '\u0B1B', 
		'\u0B15' + '\u0B4D' + '\u0B37','\u0B17'+ '\u0B4D' + '\u0B2F', '\u0B05', '\u0B07', '\u0B08', '\u0B09', '\u0B0A', '\u0B1C', '\u0B16',
        '\u0B3E','\u0B47', '\u0B48', '\u0B4B', '\u0B4C','\u0B41', '\u0B42','\u0B15', 
		'\u0B1F','\u0B20','\u0B21','\u0B22','\u0B23',
		'\u0B18', '\u0B1A', '\u0B1D', '\u0B25', '\u0B27', '\u0B2B','\u0B2D', '\u0B36', '\u0B40', '\u0B40',
		'\u0B24', '\u0B26','\u0B28', '\u0B2A', '\u0B2B', '\u0B2C','\u0B2E', '\u0B2F', '\u0B30','\u0B32','\u0B17', '\u0B1C',
		'\u0B35', '\u0B38', '\u0B39', '\u0B47','\u0B3F', '\u0B4A', '\u0B41', '\u0B15', '\u0B16', 
		'\u0B35','\u0B1C','\u0B1C',
		'.','?',
		'\u0B66','\u0B67','\u0B68','\u0B69','\u0B6A','\u0B6B','\u0B6C','\u0B6D','\u0B6E','\u0B6F' );
	for(count1=0;count1<83;count1++)
	{
		loc=as_oriya.indexOf(ChangeWith[count1],0);
		while (loc!=-1)
		{
			as_oriya= as_oriya.replace(ChangeWith[count1],ChangeWith_oriya[count1]);
			loc = as_oriya.indexOf(ChangeWith[count1],loc+1);
		}
	}
	for(c=0;c<as_oriya.length;c++)
	{
		if(as_oriya.substring(c,c+1)=='\u094D')
		{
			as_oriya=as_oriya.substring(0,c)+'\u0B4D'+as_oriya.substring(c+1,as_oriya.length);
		}
		if(as_oriya.substring(c,c+1)=='\u0902')
		{
			as_oriya=as_oriya.substring(0,c)+'\u0B02'+as_oriya.substring(c+1,as_oriya.length);
		}
		if(as_oriya.substring(c,c+1)=='\u0943')
		{
			as_oriya=as_oriya.substring(0,c)+'\u0B43'+as_oriya.substring(c+1,as_oriya.length);
		}
	}
return as_oriya;
}

function hinditokannada(as_kannada)
{
	var ChangeWith=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939', '\u0938' + '\u094D' + '\u0938','\u0959','\u090B','\u0937',
		'\u0907', '\u0908', '\u0906', '\u090F','\u0910', '\u0913', '\u0914', '\u0909','\u090A', '\u091B', 
		'\u0915' + '\u094D' + '\u0937','\u0917'+ '\u094D' + '\u092F', '\u0905', '\u0907', '\u0908', '\u0909', '\u090A', '\u095B', '\u0916',
        '\u093E','\u0947', '\u0948', '\u094B', '\u094C','\u0941', '\u0942','\u0915', 
		'\u091F','\u0920','\u0921','\u0922','\u0923',
		'\u0918', '\u091A', '\u091D', '\u0925', '\u0927', '\u092B','\u092D', '\u0936', '\u0940', '\u0940',
		'\u0924', '\u0926','\u0928', '\u092A', '\u095E', '\u092C','\u092E', '\u092F', '\u0930','\u0932','\u0917', '\u091C',
		'\u0935', '\u0938', '\u0939', '\u0947','\u093F', '\u094A', '\u0941', '\u0915', '\u0958', 
		'\u0935','\u095B','\u095B',
		'\u0970','\u097D',
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' );
		
		var ChangeWith_kannada=new Array ('\u0CB8' + '\u0CBF' + '\u0C82' + '\u0CB9', '\u0CB8' + '\u0CCD' + '\u0CB5','\u0C96','\u0C8B','\u0CB7',
		'\u0C87', '\u0C88', '\u0C86', '\u0C8F','\u0C90', '\u0C93', '\u0C94', '\u0C89','\u0C8A', '\u0C9B', 
		'\u0C95' + '\u0CCD' + '\u0CB7','\u0C97'+ '\u0CCD' + '\u0CAF', '\u0C85', '\u0C87', '\u0C88', '\u0C89', '\u0C8A', '\u0C9C', '\u0C96',
        '\u0CBE','\u0CC7', '\u0CC8', '\u0CCB', '\u0CCC','\u0CC1', '\u0CC2','\u0C95', 
		'\u0C9F','\u0CA0','\u0CA1','\u0CA2','\u0CA3',
		'\u0C98', '\u0C9A', '\u0C9D', '\u0CA5', '\u0CA7', '\u0CAB','\u0CAD', '\u0CB6', '\u0CC0', '\u0CC0',
		'\u0CA4', '\u0CA6','\u0CA8', '\u0CAA', '\u0CAB', '\u0CAC','\u0CAE', '\u0CAF', '\u0CB0','\u0CB2','\u0C97', '\u0C9C',
		'\u0CB5', '\u0CB8', '\u0CB9', '\u0CC7','\u0CBF', '\u0CCB', '\u0CC1', '\u0C95', '\u0C95', 
		'\u0CB5','\u0C9C','\u0C9C',
		'.','?',
		'\u0CE6','\u0CE7','\u0CE8','\u0CE9','\u0CEA','\u0CEB','\u0CEC','\u0CED','\u0CEE','\u0CEF' );
	for(count1=0;count1<83;count1++)
	{
		loc=as_kannada.indexOf(ChangeWith[count1],0);
		while (loc!=-1)
		{
			as_kannada= as_kannada.replace(ChangeWith[count1],ChangeWith_kannada[count1]);
			loc = as_kannada.indexOf(ChangeWith[count1],loc+1);
		}
	}
	for(c=0;c<as_kannada.length;c++)
	{
		if(as_kannada.substring(c,c+1)=='\u094D')
		{
			as_kannada=as_kannada.substring(0,c)+'\u0CCD'+as_kannada.substring(c+1,as_kannada.length);
		}
		if(as_kannada.substring(c,c+1)=='\u0902')
		{
			as_kannada=as_kannada.substring(0,c)+'\u0C82'+as_kannada.substring(c+1,as_kannada.length);
		}
		if(as_kannada.substring(c,c+1)=='\u0943')
		{
			as_kannada=as_kannada.substring(0,c)+'\u0CC3'+as_kannada.substring(c+1,as_kannada.length);
		}
	}
	return as_kannada;
}
	
function hinditopunjabi(as_punjabi)
{
	var ChangeWith=new Array ('\u0938' + '\u093F' + '\u0902' + '\u0939', '\u0938' + '\u094D' + '\u0938','\u0959','\u090B','\u0937',
		'\u0907', '\u0908', '\u0906', '\u090F','\u0910', '\u0913', '\u0914', '\u0909','\u090A', '\u091B', 
		'\u0915' + '\u094D' + '\u0937','\u0917'+ '\u094D' + '\u092F', '\u0905', '\u0907', '\u0908', '\u0909', '\u090A', '\u095B', '\u0916',
        '\u093E','\u0947', '\u0948', '\u094B', '\u094C','\u0941', '\u0942','\u0915', 
		'\u091F','\u0920','\u0921','\u0922','\u0923',
		'\u0918', '\u091A', '\u091D', '\u0925', '\u0927', '\u092B','\u092D', '\u0936', '\u0940', '\u0940',
		'\u0924', '\u0926','\u0928', '\u092A', '\u095E', '\u092C','\u092E', '\u092F', '\u0930','\u0932','\u0917', '\u091C',
		'\u0935', '\u0938', '\u0939', '\u0947','\u093F', '\u094A', '\u0941', '\u0915', '\u0958', 
		'\u0935','\u095B','\u095B',
		'\u0970','\u097D',
		'\u0966','\u0967','\u0968','\u0969','\u096A','\u096B','\u096C','\u096D','\u096E','\u096F' );
		
		var ChangeWith_punjabi=new Array ('\u0A38' + '\u0A3F' + '\u0A02' + '\u0A39', '\u0A38' + '\u0A4D' + '\u0A35','\u0A16','\u0A0B','\u0A36',
		'\u0A07', '\u0A08', '\u0A06', '\u0A0F','\u0A10', '\u0A13', '\u0A14', '\u0A09','\u0A0A', '\u0A1B', 
		'\u0A15' + '\u0A4D' + '\u0A37','\u0A17'+ '\u0A4D' + '\u0A5F', '\u0A05', '\u0A07', '\u0A08', '\u0A09', '\u0A0A', '\u0A1C', '\u0A16',
        '\u0A3E','\u0A47', '\u0A48', '\u0A4B', '\u0A4C','\u0A41', '\u0A42','\u0A15', 
		'\u0A1F','\u0A20','\u0A21','\u0A22','\u0A23',
		'\u0A18', '\u0A1A', '\u0A1D', '\u0A25', '\u0A27', '\u0A2B','\u0A2D', '\u0A36', '\u0A40', '\u0A40',
		'\u0A24', '\u0A26','\u0A28', '\u0A2A', '\u0A2B', '\u0A2C','\u0A2E', '\u0A2F', '\u0A30','\u0A32','\u0A17', '\u0A1C',
		'\u0A35', '\u0A38', '\u0A39', '\u0A47','\u0A3F', '\u0A4B', '\u0A41', '\u0A15', '\u0A15', 
		'\u0A35','\u0A1C','\u0A1C',
		'.','?',
		'\u0A66','\u0A67','\u0A68','\u0A69','\u0A6A','\u0A6B','\u0A6C','\u0A6D','\u0A6E','\u0A6F' );
		for(count1=0;count1<83;count1++)
		{
		loc=as_punjabi.indexOf(ChangeWith[count1],0);
			while (loc!=-1)
			{
				as_punjabi= as_punjabi.replace(ChangeWith[count1],ChangeWith_punjabi[count1]);
				loc = as_punjabi.indexOf(ChangeWith[count1],loc+1);
			}
		}
		for(c=0;c<as_punjabi.length;c++)
		{
			if(as_punjabi.substring(c,c+1)=='\u094D')
			{
				as_punjabi=as_punjabi.substring(0,c)+'\u0A4D'+as_punjabi.substring(c+1,as_punjabi.length);
			}
			if(as_punjabi.substring(c,c+1)=='\u0902')
			{
				as_punjabi=as_punjabi.substring(0,c)+'\u0A02'+as_punjabi.substring(c+1,as_punjabi.length);
			}
			if(as_punjabi.substring(c,c+1)=='\u0943')
			{
				as_punjabi=as_punjabi.substring(0,c)+'\u0A30'+as_punjabi.substring(c+1,as_punjabi.length);
			}
		}
return as_punjabi;
}
function region(arg,ses)
{
	
var op=new Array ("hindi","bengali","gujrati","malayalam",
	"tamil","telugu","oriya","kannada","punjabi");
	var s1=ses;
	switch(s1)
	{
	case op[0]:val=fetch_dic(arg); break;
	case op[1]:val=hinditobangali(fetch_dic(arg));break;
	case op[2]:val=hinditogujrati(fetch_dic(arg));break;
	case op[3]:val=hinditomalayalam(fetch_dic(arg));break;
	case op[4]:val=fetch_dic_tamil(arg);break;
	case op[5]:val=hinditotelugu(fetch_dic(arg));break;
	case op[6]:val=hinditooriya(fetch_dic(arg));break;
	case op[7]:val=hinditokannada(fetch_dic(arg));break;
	case op[8]:val=hinditopunjabi(fetch_dic(arg));break;
	default : alert("INVALIDE CHOICE TRY AGAIN...");
	}
//onBlur="JavaScript:reid.value=region(eeid.value);"
//onBlur="conv1()"
//onBlur="conv()"
return val;
}
