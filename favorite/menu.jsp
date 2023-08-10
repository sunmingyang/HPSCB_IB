<%@ include file = "/common/Include.jsp" %>
<head>
<META NAME="Author" CONTENT="Shailendra Mishra">
<META NAME="Date" CONTENT="Tuesday, 22-April-2008">
<META NAME="Description" CONTENT="This jsp will make tree view and check those menu, which r already in s_favorite table.">
<META NAME="Instruction" CONTENT="Do not make changes till you dont know how it is working!!!">
<!--   Shailendra Mishra:- Note: Dont Disturb codes position ie. code execution sequence!! 
								 It metters for this script. 
		This java script is supports follwing browser: 
		M.S. internet explorer 3+,safari,opera, netscape, gecko, aol, hotjava, mozilla.
-->
<style>
 td, body {
	font-family:Tahoma, Arial, Helvetica; 
	font-size:11px; 
	font-weight:bold
	}
	.tree {
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 11px;
	padding: 10px;
	white-space: nowrap;
	}
	.tree a {
	color: navy;
	text-decoration: none;
	}
  	.tree a:hover {
	color: #345373;
	}
</style>
<%!
	String [][] sTreeData = null;
	int len=0;
%>
<%
if(session.getAttribute("myTreeData")!=null)
{
	sTreeData =(String[][])session.getAttribute("myTreeData");
	session.removeAttribute("myTreeData");
	len=sTreeData.length-1;
	System.out.println("sTreeData [row][col]: ["+sTreeData.length+"]["+sTreeData[0].length+"]");
}
%>
<%
int j=0;
String acsData[][] = null;
String acs_name="";
if(session.getAttribute("acslist")!=null)
{
acsData = (String[][])session.getAttribute("acslist");
System.out.println("ACS List Lenght -->" +acsData[0].length); 
}
%>
<script src="ua.js"></script>
<script src="ftiens4.js"></script>
<SCRIPT type="text/javascript">
/** Shailendra Mishra: Work Description---
	well i can do this at text.jsp too where the same code working, 
	but if text.jsp load before menu.jsp then?? 
	obviously an error will occour or script will not work!!! So leave it here ;-)
	and dont remove salreadyAddFavorite session.
  */

<%
if(session.getAttribute("salreadyAddFavorite")!=null)
{
	String favData[][] = null;//This session contains already added menues in fav list.
	favData = (String[][])session.getAttribute("salreadyAddFavorite");
	for(int i = 0 ; i<favData.length;i++)
	{ 
%>			parent.favList[<%=i%>]="<%=favData[i][0]%>";
<%
	}
}
%>

/** Shailendra Mishra: Work Description---
	Here I m making tree actually, there may be two conditions while making:
	1. node may be a folder, or
	2. node may be a file!!!
	   I've used mnu_next no to verify it's a Folder or File, 
	   if mnu_next < 1000 then it must be a Folder which having childs, else it is a File. ;-)
	Now for each above conditions there may be two more conditions:
	1. node may be a child of root node ie.: foldersTree variable , or
	2. node may be a child of a child node of root node ie.: child variable of foldersTree variable.
I couldn't think better then this but if u r having a better idea then plz let me know at exclusive_shailendra@rediffmail.com.
*/
 USETEXTLINKS = 1  
 STARTALLOPEN = 0
 HIGHLIGHT	  = 0
 PRESERVESTATE= 0 
 GLOBALTARGET ="R"
foldersTree = gFld("<bean:message bundle= "<%=lang%>" key= "6339"/>", "");
<%
if(sTreeData!=null)
{
	for(int i=0;i<len;i++)
	{
	  if(sTreeData[i][0]!=null)
	  {
		if(Integer.parseInt(sTreeData[i][3])<1000)//means it is a folder
		{
			if(sTreeData[i][1].equals("0")) // to add folder in root : foldersTree
			{
%>                
				aux<%=sTreeData[i][0]%> = insFld(foldersTree, gFld("<%=sTreeData[i][2]%>", "Shailendra"));
				aux<%=sTreeData[i][0]%>.xID="<%=sTreeData[i][0]%>";
<%
			}// end if of check root
			else // to add folder in sub node
			{
%>
				aux<%=sTreeData[i][0]%> = insFld(aux<%=sTreeData[i][1]%>, gFld("<%=sTreeData[i][2]%>", "Shailendra"));
				aux<%=sTreeData[i][0]%>.xID="<%=sTreeData[i][0]%>";
<%
			}// else of check root  
		}// end mnunext if
		else //it is a file.
		{
			if(sTreeData[i][1].equals("0")) // to add file in root : foldersTree
			{
%>
				insDoc(foldersTree, gLnk("S", "<%=sTreeData[i][2]%>", '<%=sTreeData[i][3]+"~"+sTreeData[i][4]%>'));
<%
			}   		
			else // to add file in sub node 
			{
%>
				insDoc(aux<%=sTreeData[i][1]%>, gLnk("S", "<%=sTreeData[i][2]%>", "<%=sTreeData[i][3]+"~"+sTreeData[i][4]%>"));
<%
			}// end else of check root for file
		}// end mnunext if's else
	  }// end if sTreeData[i][3]!= null 
	}// end for loop
}//end if for null check
%>
foldersTree.treeID = "L1" 
foldersTree.xID = "bigtree"
</script>
<NOSCRIPT> 
	A tree for site navigation will open here if you enable JavaScript in your browser.
</NOSCRIPT>
</head>

<tiles:insert page="/common/siteLayout.jsp" flush="true">
<%if(request.getParameter("row")==null){ %>
<tiles:put name="menu" value="/common/user_left.jsp?mode=&src=corporatebanking"/>
<%}%>
<tiles:put name="menu" value="/common/user_left.jsp?mode=&src=corporatebanking"/>
		<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
			 <html:form action="/jsp/login.do">
		<tiles:put name="header" value="/common/header.jsp"/>
		<tiles:put name="line" value="/common/line.html"/>
		<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
		<tiles:put name="menu_tab" value="/common/menu_tab.jsp?src=corporatebanking"/>
		<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>
		<tiles:put name="content" type="String">
		<tiles:put name="page_header" type="String">
		</tiles:put>


<html:form  action = "/menu/AddFavoriteClassProcess.do" >

<body onload="setAcs();">
<div style="position:absolute; top:0; left:0;display:none "><table border="0"><tr><td><font size="-2">
<a href="http://www.wetem#exclusive_shailendra@rediffmail.com/"></a></font></td></tr></table></div>
<!--DropDown To Show ACS(Ritu VAshistha--Menu Freezing task) -->
 <label> Select ACS </label></br></br>
 <html:select property = "cbUsrcsSName" styleId="cbUsrcsSName" onchange="getuserid();"  styleClass = "form-control" />   
 <script>
 function setAcs(){
	 document.getElementById("tree").style.display = "none";
	//debugger;     
 <%
     for (j = 0; j < acsData.length; j++) {      
	 %>
     var select = document.getElementById('cbUsrcsSName');
     var opt = document.createElement('option');
     opt.textContent = '<%=acsData[j][1]%>';
     opt.value = '<%=acsData[j][1]%>';
	 select.appendChild(opt);
  	 <%  }    %>    
	 }    
	 </script>
<!--End-->
<br>
<table name = "maintable" id="maintable">
</table>
<input type = "hidden" id = "aA"/>
<div class="tree" id ="tree" >
<script type="text/javascript">
 initializeDocument();
</script>
</div>
<table>
				<tr>
					<td height=20>
					<input type="button" name ="save" id="save" value="<bean:message bundle='<%=lang%>' key='86'/>" onclick = "sendData()" style="width:100">
					</td>
					<td height=20>
					<input type="button" name ="Cancel" 
					value="<bean:message bundle='<%=lang%>' key='87'/>" 
					onClick= "doCancle()" style="width:100"  >
					</td>
				</tr>
			</table>
	</html:form>
</body>
	</tiles:put>
	</html:form>
    </tiles:insert>
</html>