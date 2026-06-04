 <%@ taglib prefix="s" uri="/struts-tags" %>
 <% String contextPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />
<title>GatewayERP(i)</title>

<style type="text/css">
#search {
    background-color: #E0ECF8;
}
</style>
 <%

 String contracttype = request.getParameter("contracttype")==null?"0":request.getParameter("contracttype");
 String cldocno = request.getParameter("cldocno")==null?"0":request.getParameter("cldocno"); 

 
 %>
<script type="text/javascript">
	$(document).ready(function () {}); 

 	function loadContractSearch() {
 		 
 		var contractType=document.getElementById("cmbcontracttype").value;
 		var cldocno=1;
 		var contractno=document.getElementById("txtcontractsno").value;
 		var refno=1;
 
 		//alert(contractType);
		getdata(contractType,cldocno,contractno,refno);
	}
 	
	function getdata(contractType,cldocno,contractno,refno){
		 $("#refreshcontractdiv").load('contractDetailsSearchGrid.jsp?contracttype='+contractType+'&cldocno='+cldocno+'&contractno='+contractno.replace(/ /g, "%20")+'&refno='+refno);
	}

	</script>
<style>
/* =========================================================
   MASTER SEARCH UI - PURE WHITE PANEL
========================================================= */

body,
html{
    margin:0;
    padding:0;
    background:#ffffff !important;
    font-family:'Segoe UI',Tahoma,Verdana,sans-serif;
}

#search{
    background:#ffffff !important;
    padding:10px;
    font-size:12px;
    color:#333;
}

/* Search Panel */

.search-panel{
    background:#ffffff !important;
    border:1px solid #d6d6d6;
    border-radius:4px;
    padding:12px;
    margin-bottom:12px;
}

/* Layout */

.search-panel table{
    width:100%;
    border-collapse:collapse;
}

.search-panel td{
    padding:6px;
    vertical-align:middle;
}

/* Labels */

.lbl-right{
    text-align:right;
    white-space:nowrap;
    font-size:12px;
    font-weight:500;
    color:#333;
    padding-right:8px;
}

/* Inputs */

.search-panel input[type=text]{
    width:100%;
    height:26px !important;
    border:1px solid #cfcfcf;
    border-radius:3px;
    padding:2px 8px;
    box-sizing:border-box;
    background:#ffffff;
    font-size:12px;
}

.search-panel input[type=text]:focus{
    border-color:#2563eb;
    outline:none;
}

/* Search Button */

.myButton{
    width:110px !important;
    height:30px !important;
    background:#205fd3 !important;
    background-image:none !important;
    color:#ffffff !important;
    border:1px solid #205fd3 !important;
    border-radius:4px !important;
    font-size:12px !important;
    font-weight:600 !important;
    text-shadow:none !important;
    box-shadow:none !important;
    opacity:1 !important;
    cursor:pointer;
}

.myButton:hover{
    background:#184fb4 !important;
    color:#ffffff !important;
}

/* Grid */

.grid-container{
    background:#ffffff !important;
    border:1px solid #cccccc;
    border-radius:4px;
    overflow:hidden;
    min-height:250px;
}
/* FORCE BUTTON STYLE */

input.myButton,
button.myButton,
.myButton {

    min-width:110px !important;
    width:110px !important;
    height:30px !important;

    background:#205fd3 !important;
    background-image:none !important;

    color:#ffffff !important;
    font-size:12px !important;
    font-weight:600 !important;
    font-family:'Segoe UI',Tahoma,sans-serif !important;

    border:1px solid #205fd3 !important;
    border-radius:4px !important;

    text-shadow:none !important;
    box-shadow:none !important;

    opacity:1 !important;
    visibility:visible !important;

    cursor:pointer !important;
}

input.myButton:hover,
button.myButton:hover,
.myButton:hover {

    background:#184fb4 !important;
    background-image:none !important;
    color:#ffffff !important;
}
</style>

<body>

<div id="search">

    <!-- Search Panel -->

    <div class="search-panel">

        <table>

            <colgroup>
                <col width="12%">
                <col width="55%">
                <col width="33%">
            </colgroup>

            <tr>

                <td class="lbl-right">
                    Contract No.
                </td>

                <td>
                    <input type="text"
                           name="txtcontractsno"
                           id="txtcontractsno"
                           value='<s:property value="txtcontractsno"/>'>
                </td>

                <td align="left">

             <button type="button"
        id="btnsearch"
        onclick="loadContractSearch();"
        style="
            width:110px;
            height:30px;
            background:#205fd3;
            color:#ffffff;
            border:1px solid #205fd3;
            border-radius:4px;
            font-size:12px;
            font-weight:600;
            cursor:pointer;">
    Search
</button>

                </td>

            </tr>

        </table>

    </div>

    <!-- Grid -->

    <div class="grid-container">

        <div id="refreshcontractdiv">

            <jsp:include page="contractDetailsSearchGrid.jsp"></jsp:include>

        </div>

    </div>

</div>

</body>
</html>