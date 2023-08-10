//charachter in ascii sequence
var allowedChars = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~??+?+++¦€-?¯?????¦¦(¦·v˜?™?)???? ???¤?¦§?©?«­+®?°±???µ-·???»????????????????????????????????????????????????????????????????????";
//This code give Equi Ascii Code
function CharToDec(Character) 
{
	var pos = allowedChars.indexOf(Character.charAt(0));
	if(pos == -1) 
	{
		window.status += Character;
		pos = 0;
	}
	return pos+33;
}
//Convert Decimal no to Binary
function DecToBin(Decimal) 
{
	var i = 0;
	var Bin = "";
	while(Decimal > Math.pow(2, i)) 
	{i++;}

	for (var i = i; i >= 0; i--) 
	{
		if (Decimal >= Math.pow(2, i)) 
		{
			Decimal -= Math.pow(2, i);
			Bin += "1";
		} else 
			Bin += "0";
	}
return Bin;
}
function ExclusiveOr(input1, input2) 
{
	var output = "";
	while(input1.length < input2.length) 
	{
		input1 = "0" + input1;
	}
	while(input1.length > input2.length) 
	{
		input2 = "0" + input2;
	}
	if (input1.length == input2.length) 
	{
		for (var i=0; i<input1.length; i++) 
		{
			output += (input1.charAt(i) != input2.charAt(i)) ? "1" : "0";
		}
	} 
	else 
		alert("XOR Operation Error.");
	return output;
}
function BinToDec(Binary) 
{
	var Dec = 0;
	for(var i=0; i<=Binary.length; i++) 
	{
		Dec += Math.pow(2,i) * Binary.charAt((Binary.length - 1) - i);
	}
	return Dec;
}

function DecToChar(Decimal) 
{
	Decimal=Decimal-33;
	if (Decimal > allowedChars.length) 
	{
		Decimal = 0;
	}
	var pos = allowedChars.charAt(Decimal);
	return pos;
}
function BlockEncrypt(input1, input2) 
{
	var output = "";
	if (input1.length == input2.length) 
	{
		for (var i = 0; i < input1.length; i++) 
		{
			output += DecToChar(BinToDec(ExclusiveOr(DecToBin(CharToDec(input1.charAt(i))), DecToBin(CharToDec(input2.charAt(i))))));
		 }
	} else 
		alert("Block Encryption Error.");
	return output;
}

/*
New Encryption
*/
/*
New Encryption
*/
function EncryptString(plaintext, key) 
{
	
    var pt=plaintext.toUpperCase();
	var ky=key.toUpperCase();
	var p_len=1;p_len=pt.length;
	var k_len=2;k_len=ky.length;
    var r_len=(p_len>k_len)?p_len:k_len;
	ar1=new Array(p_len);
	ar2=new Array(k_len);
	res_ar=new Array(r_len);
    var encStr="";
//	var evtObj = document.createEvent("KeyboardEvent"); 
	for(i=0;i<p_len;i++)
	{
		ar1[i]=pt.charCodeAt(i);
	}
	for(i=0;i<k_len;i++)
		ar2[i]=ky.charCodeAt(i);

    for(i=0;i<r_len;i++)
	{
			if( i < ar1.length )
			{
				if( i < ar2.length)
					res_ar[i] = ar1[i]^ar2[i];
					//res_ar[i] = ExclusiveOr(ar1[i],ar2[i]);
				else
					res_ar[i] = ar1[i]^0;
			}
			else
				res_ar[i] = 0^ar2[i];
	
    			encStr = encStr + res_ar[i];
		}

		return encStr;
	}




function hashKey(key) 
{
	var hash = "";
	for (var i = 0; i < key.length; i++) 
	{
		hash += DecToChar((CharToDec(key.charAt(i)) + i) % allowedChars.length);
	}
	return hash;
}
