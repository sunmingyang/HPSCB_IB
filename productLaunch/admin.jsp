<%@ include file="/common/Include.jsp" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="easycbs.bancmateib.common.DateTime.DateTimeFunction" %>
<%
String AdminName=(String)session.getAttribute("AdminName");
%>
<style>
div.ex {
		  width:100%;
        padding:1px;
        border:5px solid gray;
        margin:0px;
	    text-align: left;
}
</style>



<script type="text/javascript">
//function detail()
//{
//var first=document.getElementById("textbox1").value;
//var discr=document.getElementById("textbox2").value;
//var pdf=document.getElementById("textbox3").value;
//var image=document.getElementById("image1").value;
//alert("image"+image);
//}

function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
function redirectPage(){
	debugger;
	var first=document.getElementById("textbox1").value;
	var discr=document.getElementById("textbox2").value;
    var pdf=document.getElementById("textbox3").value;
    var image2=document.getElementById('image').value;
	var img3 =document.getElementById('image1').value;
	var img4 =document.getElementById('image2').value;
	var img5 =document.getElementById('image3').value;
	var img6 =document.getElementById('image4').value;

	   
	//var conf =window.open("index.jsp?first1="+first+ "&discr1="+discr +"&PDF1="+pdf+"&fileName="+img3,"Dialog Arguments Value","dialogHeight:435px; dialogWidth: 590px; dialogTop: 150px; dialogLeft: 150px; edge: Raised; center: Yes; help: Yes; resizable: Yes; status: No; title: No;");

		document.forms[0].action="<%=request.getContextPath()%>/AccountInfoAction.do?action=productLauch&first="+first+"&discr1="+discr +"&PDF1="+pdf+"&fileName="+image2+"&image="+img3+"&image11="+img4+"&image22="+img5+"&image33="+img6;
	
		document.forms[0].submit();
}

</script>
<tiles:insert page="/common/siteLayout.jsp" flush="true">
<tiles:put name="title" value="Internet banking"/>
<tiles:put name="header" value="/common/header.jsp"/>
<tiles:put name="line" value="/common/line.html"/>
<tiles:put name="page_header" type="String" >
&nbsp;<font color="#99FF00"><b><%if(AdminName!=null) out.print(AdminName);%>!</b></font>
</tiles:put>
<tiles:put name="header_marquee" value="/common/header_marquee.jsp"/>
<tiles:put name="footer_jsp" value="/common/footer.jsp"/>
<tiles:put name="menu_tab" value="/common/menu_tab.jsp?menumode=su&src1=Productlaunch"/>
<tiles:put name="menu" value="/common/user_left.jsp?mode=StatusLogReport&src=Productlaunch"/>
<tiles:put name="footerEnd_jsp" value="/common/footerEnd.jsp"/>

<tiles:put name="content" type="String">

<html:form action= "/reports/StatusLogAction" >

<body  bgcolor="Pink">
<center>
<form align="center" >
<div class="ex">
<table align="center" colspan="0" width="50%">
<tr ><td>
<label for ="First namel">Product name</label></td>
 <td>
	 <b>:&nbsp;</b>
	 <input type="text" name="textbox1" id="textbox1" /><br></td></tr>



	    <tr><td>
<label for ="Discriptionl"> Product Discription</label></td>
 <td colspan=2>
	 <b>:&nbsp;</b>
	 <textarea row="150" style="margin: 0px; width: 367px; height: 76px;" cols="50"  name="textbox2" id="textbox2"/></textarea></br></td></tr>


<tr><td><label for ="imagel">Product Image</label></td>
 <td>
	 <b>:&nbsp;</b>
	 <input type='file' onchange="readURL(this);"  id="image" onclick="showImg()"/><br/></td></tr>

   <!--  <img id="blah" src="#" alt="your image" /><br> -->

<tr><td>
<label for ="PDF downloadl"> Product PDF download</label></td>
 <td>
	 <b>:&nbsp;</b>
<input type="text" name="textbox3" id="textbox3" /><br></td></tr>
<tr><td>
<label for ="imagel">Product PPT</label></td>
 <td>
	 <b>:&nbsp;</b>
<input type='file' id="image1" onchange="readURL(this)"/><br/></td></tr>
<tr>
<td></td>
 <td>
	 <b>:&nbsp;</b>
	 <input type='file' id="image2" onchange="readURL(this)"/><br/></td></tr>
<tr>
<td></td>
 <td>
	 <b>:&nbsp;</b>
	 <input type='file' id="image3" onchange="readURL(this)"/><br/></td></tr>
<tr>
<td></td>
 <td>
	 <b>:&nbsp;</b>
	 <input type='file' id="image4" onchange="readURL(this)"/><br/></td></tr>
   <!--  <img id="blah" src="#" alt="your image" /><br> -->
  

</table>
</div>
<table width="100%" border="0" cellpadding="0">

<tr><td align="center">
<input type="button" align="center" name="button" id="button1" style="margin-top: 20px;width:100px" value ="submit" onclick="redirectPage()" ></td></tr>

</table>
</center>
</body>
</html:form>
</tiles:put>
</tiles:insert>
