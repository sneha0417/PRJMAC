 <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
 
<% String contextPath=request.getContextPath();%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%> 
<style>
.formfont {
	font: 10px Tahoma;
	color: #404040;
	background: #E0ECF8;
	overflow:hidden;
}
</style>
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />

	<script type="text/javascript">
	$(document).ready(function () {
	 $("#dr_DOB").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy",value:null});
	}); 

 	function loadSearch() {
 		
 		var clname=document.getElementById("Cl_name").value;
 		var mob=document.getElementById("Cl_mob").value;
 		var lcno=document.getElementById("dr_Licence").value;
 		var passno=document.getElementById("dr_Passport").value;
 		var nation=document.getElementById("dr_Nation").value;
 		var dob=$('#dr_DOB').jqxDateTimeInput('val');
		var branch=document.getElementById("cmbbranch").value;
		getdata(clname,mob,lcno,passno,nation,dob,branch);

	}	
	function getdata(clname,mob,lcno,passno,nation,dob,branch){
		
		 $("#refreshdiv").load('clientSearchGrid.jsp?clname='+clname.replace(/ /g,"%20")+'&mob='+mob+'&lcno='+lcno+'&passno='+passno+'&nation='+nation+'&dob='+dob+'&branch='+branch+'&mode=1');
	
		}

	</script>
<style>
/* =========================================================
   MASTER SEARCH UI - PURE WHITE PANEL
========================================================= */

body, html{
    margin:0;
    padding:0;
    background:#ffffff !important;
    font-family:'Segoe UI',Tahoma,Verdana,sans-serif;
}

.modern-ui{
    padding:10px;
    font-size:12px;
    color:#333;
    background:#ffffff;
}

.modern-ui .search-panel{
    background:#ffffff;
    border:1px solid #d6d6d6;
    border-radius:4px;
    padding:12px;
    margin-bottom:12px;
}

.modern-ui table{
    width:100%;
    border-collapse:collapse;
}

.modern-ui td{
    padding:6px;
    vertical-align:middle;
}

.modern-ui .lbl-right{
    text-align:right;
    white-space:nowrap;
    font-size:12px;
    font-weight:500;
    padding-right:8px;
    color:#333;
}

.modern-ui input[type=text],
.modern-ui select{
    width:100%;
    height:26px !important;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 6px;
    font-size:12px;
    box-sizing:border-box;
    background:#fff;
}

.modern-ui input[type=text]:focus,
.modern-ui select:focus{
    border-color:#2563eb;
    outline:none;
}

.modern-ui .search-btn{
    width:110px;
    height:30px;
    background:#205fd3 !important;
    background-image:none !important;
    color:#ffffff !important;
    border:none !important;
    border-radius:4px;
    font-size:12px;
    font-weight:600;
    cursor:pointer;
}

.modern-ui .search-btn:hover{
    background:#184fb4 !important;
}

.modern-ui .grid-container{
    background:#ffffff;
    border:1px solid #cccccc;
    border-radius:4px;
    overflow:hidden;
    min-height:250px;
}
body,
html{
    background:#ffffff !important;
}

#search{
    background:#ffffff !important;
}

.modern-ui{
    background:#ffffff !important;
}

.modern-ui .search-panel{
    background:#ffffff !important;
    border:1px solid #d6d6d6;
}

/* jqx window content override */

.jqx-widget-content,
.jqx-window-content,
.jqx-fill-state-normal{
    background:#ffffff !important;
}
</style>

<body>

<div id="search" class="modern-ui">

    <div class="search-panel">

        <table>

            <colgroup>
                <col width="10%">
                <col width="23%">
                <col width="10%">
                <col width="23%">
                <col width="10%">
                <col width="24%">
            </colgroup>

            <!-- Row 1 -->

            <tr>

                <td class="lbl-right">Name</td>

                <td>
                    <input type="text"
                           name="Cl_name"
                           id="Cl_name"
                           value='<s:property value="Cl_name"/>'>
                </td>

                <td class="lbl-right">Mobile</td>

                <td>
                    <input type="text"
                           name="Cl_mob"
                           id="Cl_mob"
                           value='<s:property value="Cl_mob"/>'>
                </td>

                <td class="lbl-right">Nationality</td>

                <td>
                    <input type="text"
                           id="dr_Nation"
                           name="dr_Nation"
                           value='<s:property value="dr_Nation"/>'>
                </td>

            </tr>

            <!-- Row 2 -->

            <tr>

                <td class="lbl-right">Licence #</td>

                <td>
                    <input type="text"
                           name="dr_Licence"
                           id="dr_Licence"
                           value='<s:property value="dr_Licence"/>'>
                </td>

                <td class="lbl-right">Passport #</td>

                <td>
                    <input type="text"
                           name="dr_Passport"
                           id="dr_Passport"
                           value='<s:property value="dr_Passport"/>'>
                </td>

                <td class="lbl-right">DOB</td>

                <td>
                    <table style="width:100%;border-collapse:collapse;">
                        <tr>
                            <td style="padding:0;">
                                <div id="dr_DOB"
                                     name="dr_DOB"
                                     value='<s:property value="dr_DOB"/>'>
                                </div>

                                <input type="hidden"
                                       name="hiddr_DOB"
                                       id="hiddr_DOB"
                                       value='<s:property value="hiddr_DOB"/>'>
                            </td>

                            <td style="width:120px;padding-left:10px;">
                                <input type="button"
                                       name="btnrasearch"
                                       id="btnrasearch"
                                       value="Search"
                                       class="search-btn"
                                       onclick="loadSearch();">
                            </td>
                        </tr>
                    </table>
                </td>

            </tr>

        </table>

    </div>

    <div class="grid-container">

        <div id="refreshdiv">

            <jsp:include page="clientSearchGrid.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>