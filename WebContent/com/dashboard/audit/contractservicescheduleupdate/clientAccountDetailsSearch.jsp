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

	<script type="text/javascript">
	$(document).ready(function () {}); 

 	function loadSearch() {

 		var partyname=document.getElementById("txtpartyname").value;
 		var accNo=document.getElementById("txtaccountno").value;
 		var contactNo=document.getElementById("txtcontactno").value;
 		
		getdata(partyname,accNo,contactNo);
	}
	function getdata(partyname,accNo,contactNo){
		 $("#clientaccountdiv").load('clientAccountDetailsSearchGrid.jsp?atype=AR&partyname='+partyname.replace(/ /g, "%20")+'&accNo='+accNo+'&contactNo='+contactNo);
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

/* Search Button Fix */

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
                <col width="8%">
                <col width="30%">
                <col width="8%">
                <col width="22%">
                <col width="10%">
                <col width="15%">
                <col width="7%">
            </colgroup>

            <tr>

                <td class="lbl-right">
                    Name
                </td>

                <td>
                    <input type="text"
                           name="txtpartyname"
                           id="txtpartyname"
                           value='<s:property value="txtpartyname"/>'>
                </td>

                <td class="lbl-right">
                    Account
                </td>

                <td>
                    <input type="text"
                           name="txtaccountno"
                           id="txtaccountno"
                           value='<s:property value="txtaccountno"/>'>
                </td>

                <td class="lbl-right">
                    Contact No.
                </td>

                <td>
                    <input type="text"
                           name="txtcontactno"
                           id="txtcontactno"
                           value='<s:property value="txtcontactno"/>'>
                </td>

                <td align="right">

<button type="button"
        id="btnsearch"
        onclick="loadSearch();"
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

        <div id="clientaccountdiv">
            <jsp:include page="clientAccountDetailsSearchGrid.jsp"></jsp:include>
        </div>

    </div>

</div>

</body>
</html>