<%@ include file = "/common/Include.jsp" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%! String color="red";
%>
<%
System.out.println("IN JSP CODE::::RITU-->"); 
int i=0;
String acsData[][] = null;
String acs_name="";
if(session.getAttribute("acslist")!=null)
{
acsData = (String[][])session.getAttribute("acslist");
System.out.println("IN salreadyAddFavorite Lenght -->" +acsData[0][0]+" "+acsData[0][1]);
System.out.println("IN salreadyAddFavorite Lenght -->" +acsData[1][0]+" "+acsData[1][1]);
System.out.println("IN salreadyAddFavorite Lenght -->" +acsData[2][0]+" "+acsData[2][1]);
System.out.println("IN salreadyAddFavorite Lenght -->" +acsData[3][0]+" "+acsData[3][1]);
System.out.println("IN salreadyAddFavorite Lenght -->" +acsData[4][0]+" "+acsData[4][1]);
System.out.println("IN salreadyAddFavorite Lenght -->" +acsData[0].length); 
}
%>
  
<html>
<head>
<META NAME="Author" CONTENT="Shailendra Mishra">
<META NAME="Date" CONTENT="Tuesday, 12-Februry-2008">
<META NAME="Description" CONTENT="This jsp will show added text in favorite menu.">
<META NAME="Instruction" CONTENT="Do not make change till you dont know how it is working!!!">
<script src="ftiens4.js"></script>
<!--  Note: Dont Disturb codes position!! It metter for this code.
			And do not add any comment in between html:form /html:form
-->


<script src = "<%=request.getContextPath()%>/scripts/Home.js"></script>
<STYLE>
INPUT.fancy
{
    border-top: activeborder 1px solid;
    border-right: activeborder 1px solid;
    border-bottom: activeborder 2px solid;
    border-left: activeborder 1px solid;
    height: 20px;
    font-family: 'Courier New';
    font-size: 11px;
	cursor:"default";
}
</STYLE>
</head>
<!--DropDown To Show ACS(Ritu VAshistha--Menu Freezing task) -->
<body style topmargin="0" leftmargin="0" onload="setAcs();">
<html:form  action = "/menu/AddFavoriteClassProcess.do" >
<!--DropDown To Show ACS(Ritu VAshistha--Menu Freezing task) -->

 <html:select property = "cbUsrcsSName" styleId="cbUsrcsSName"  styleClass = "form-control" />  

 <script>
 function setAcs(){
	 document.getElementById("favMenuDiv").style.display = "none";
	  document.getElementById("table1").style.display = "none";
	    document.getElementById("cbUsrcsSName").style.display = "none";
		document.getElementById("action").style.display = "none";
		//debugger;  
 <%
     for (i = 0; i < acsData.length; i++) {  
	 %>
     var select = document.getElementById('cbUsrcsSName');
     var opt = document.createElement('option');
     opt.textContent = '<%=acsData[i][1]%>';
     opt.value = '<%=acsData[i][0]%>';
	 select.appendChild(opt);
  	 <%  }    %>  
	 }    
	 </script>
<!--End-->


<table border="0" id = "table1">
	<tr>
		<td>
			<fieldset style="float: left; margin: 0.6em 0.5em;">
			<legend><bean:message bundle = '<%=lang%>' key = "6340"/></legend>
			<div id="favMenuDiv" style="overflow:auto;height:350px;width:400px;">
			<table border="0" name="favMenuTable" id="favMenuTable">
				<%
				System.out.println("IN JSP CODE::::RITU-->"); 
				String favData[][] = null;
				String fav_name="";
				if(session.getAttribute("salreadyAddFavorite1")!=null)
				{
					favData = (String[][])session.getAttribute("salreadyAddFavorite");
						System.out.println("IN salreadyAddFavorite Lenght -->" +favData.length); 
					for(i = 0 ; i<favData.length;i++)
					{
					    	System.out.println("fav_name RITU:::::::::" +fav_name);
						    fav_name = favData[i][0] + "/" + favData[i][1];
				%>
				<tr>
					<td valign="bottom">
						<input type="hidden" name='mnuNext<%=favData[i][0]%>' id='mnuNext<%=favData[i][0]%>' value='<%=favData[i][1]%>' >  
						<script>
						document.write("<input type='text' name='txt<%=favData[i][0]%>'  id='txt<%=favData[i][0]%>' readonly tabindex='-1' size='70' value='<%=fav_name%>' style='border:none;border-collapse:collapse;margin:2px; font-weight:bold;font-size:7pt;color:navy;background-color:\""+document.bgColor+"\";CURSOR:default;' > ");
						</script>
						</td> 
				</tr>
				<tr colspan=2>
					<td valign="top">
					<script>
					document.write("<input type='text' name='line<%=favData[i][0]%>'  id='line<%=favData[i][0]%>' readonly tabindex='-1' size='70' value='**************************************************' style='border:none;font-weight:bold;font-size:7pt;color:navy;background-color:\""+document.bgColor+"\";CURSOR:default;' > ");
					</script>
					</td>
				</tr>
			<%
				}
			} else {
			%>
			<tr>
					<td valign="bottom">
						<input type="hidden" name='mnuNext' id='mnuNext' value='' >  
						<script>
						document.write("<input type='text' name='txt'  id='txt' readonly tabindex='-1' size='70' value='<%=fav_name%>' style='border:none;border-collapse:collapse;margin:2px; font-weight:bold;font-size:7pt;color:navy;background-color:\""+document.bgColor+"\";CURSOR:default;' > ");
						</script>
						
					</td>
				</tr>
				<tr colspan=2>
					<td valign="top">
					<script>
					document.write("<input type='text' name='line'  id='line' readonly tabindex='-1' size='70' value='**************************************************' style='border:none;font-weight:bold;font-size:7pt;color:navy;background-color:\""+document.bgColor+"\";CURSOR:default;' > ");
					</script>
					</td>
				</tr>
			
			<%			
			}
			%>
			</table>
			</div>
			</fieldset>
		</td>
	</tr>
	</table>
	<tr>
		<td>
			<table id = "action">
				<tr>
					<td height=20>
					<input type="button" name ="save" id="save" value="<bean:message bundle='<%=lang%>' key='86'/>" onclick = "sendData()"  disabled=true style="width:100">
					</td>
					<td height=20>
					<input type="button" name ="Cancel" 
					value="<bean:message bundle='<%=lang%>' key='87'/>" 
					onClick= "doCancle()" style="width:100"  >
					</td>
				</tr>
			</table>
			<html:hidden styleId="menuitem" property="menuitem" />
		</td>
	</tr>
</table>
</html:form>
<script language="JavaScript">

// This function is calling from tree.js and will add a new input box in fav menu.
// Dont Disturb var positions it metters for this code!!! ... shailendra
//function addtext(mnuData,mnunext,row,mnusno)
function addtext(mnunext,mnusno,name)
{
	document.getElementById("save").disabled=false;//will enable ok button
	//here i m making a input text for show name
	var inputOne=document.createElement('input');
		inputOne.type="text";
		inputOne.value=''+name;
		inputOne.id='txt'+mnunext;
		inputOne.name='txt'+mnunext;
		inputOne.readonly=true; 
		inputOne.tabindex="-1";
		inputOne.size="70";
		inputOne.style.fontWeight="bold";
		inputOne.style.fontSize="7pt";
		inputOne.style.color="navy";
		inputOne.style.margin="2px";
		inputOne.style.backgroundColor=document.bgColor;
		inputOne.style.borderCollapse="collapse";
		inputOne.style.border="none";
		inputOne.style.cursor="default";
	
	//here i m making a input text for show *****, just for nice look ;-)
	var inputTwo=document.createElement('input');
		inputTwo.type="text";
		inputTwo.value='**************************************************';
		inputTwo.id='line'+mnunext;
		inputTwo.name='line'+mnunext;
		inputTwo.readonly=true; 
		inputTwo.tabindex="-1";
		inputTwo.size="70";
		inputTwo.style.fontWeight="bold";
		inputTwo.style.fontSize="7pt";
		inputTwo.style.color="navy";
		inputTwo.style.margin="2px";
		inputTwo.style.backgroundColor=document.bgColor;
		inputTwo.style.borderCollapse="collapse";
		inputTwo.style.border="none";
		inputTwo.style.cursor="default";

	//here i m making a input text for mnu_sno 
	var inputThree=document.createElement('input');
		inputThree.type="hidden";
		inputThree.value=mnusno;
		inputThree.id='mnuNext'+mnunext;
		inputThree.name='mnuNext'+mnunext;

	//this will insert a row <tr> into famMenuTable.
	var rowOne = document.getElementById("favMenuTable").insertRow();

	//this will insert a column <td> into recently inserted row: rowOne
	var cellOne= rowOne.insertCell();
		cellOne.valign="bottom";
		cellOne.appendChild(inputThree);// will contain mnuNext; this must be insert first before any other one, it cant be at any other place, coz i m using its position.
		cellOne.appendChild(inputOne);// will contain text which show hname/ename;
		//appendChild will add previously created textboxes into column <td>

	var rowTwo = document.getElementById("favMenuTable").insertRow();
	var cellTwo= rowTwo.insertCell();
		cellTwo.valign="top";
		cellTwo.appendChild(inputTwo);//will contain **** for view only!!!

}
// This function is calling from tree.js and will add a new input box in fav menu.
function removetext(mnunext)
{
	document.getElementById("save").disabled=false; //will enable ok button
	var favTable=document.getElementById("favMenuTable");
	var txtRowIndex=document.getElementById('txt'+mnunext).parentNode.parentNode.rowIndex;
	favTable.deleteRow(txtRowIndex);
	favTable.deleteRow(txtRowIndex);// after delete previous it autometically reset row index nos. hence it is same as previous!!!
}
// This function will make changes in data base.
/*
function 6/22/2016()
{
   //debugger;
	var FinalMnuData = new Array();
	var count=0;
	var favTable=document.getElementById("favMenuTable");
	//here i m making menues which are viewing at right side frame(text.jsp).
	for(rowNo=0;rowNo<favTable.rows.length;rowNo+=2)
	{
		FinalMnuData+='~'+favTable.rows[rowNo].firstChild.firstChild.value;
	}
	document.getElementById("menuitem").value=FinalMnuData;
	document.forms[0].action = "<%=request.getContextPath()%>/menu/AddFavoriteClassProcess.do";
	document.forms[0].target = "_parent";
	document.forms[0].submit();
}
*/
function doCancle()
{
	document.forms[0].action = "<%=request.getContextPath()%>/menu/FormOpen.do?from=cancel";
	document.forms[0].target = "_parent";
	document.forms[0].submit();
}
</script>
</body>
</html>