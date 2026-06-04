<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>

<link href="<%=contextPath%>/css/body.css" media="screen" rel="stylesheet" type="text/css" />

<style>
/* =========================================================
   SCOPED UI: Pure White Panel (Strict Weight Control)
========================================================= */
body, html {
    margin: 0;
    padding: 0;
    background-color: #ffffff !important;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
}

.modern-ui {
    font-size: 12px;
    color: #333;
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important;
}

/* Strict weight enforcement for injected content */
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select {
    font-weight: 400 !important; 
}

/* Master Input Styles */
.modern-ui input[type="text"],
.modern-ui select {
    height: 24px !important;
    border: 1px solid #cccccc; 
    border-radius: 3px;
    padding: 2px 6px;
    font-size: 12px; 
    font-family: inherit;
    box-sizing: border-box;
    background-color: #ffffff;
    color: #333;
    width: 100%;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus {
    border-color: #2563eb;
    outline: none;
}

/* Panel Styling */
.modern-ui .search-panel {
    background-color: #ffffff !important;
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 15px 10px;
    margin-bottom: 15px;
    width: 100%;
    box-sizing: border-box;
}

/* Table Alignment */
.modern-ui table {
    border-collapse: separate;
    border-spacing: 5px 8px; 
    width: 100%;
    table-layout: fixed; 
}

.modern-ui td {
    vertical-align: middle;
}

.modern-ui .lbl-right { 
    text-align: right; 
    color: #333;
    font-size: 12px; 
    font-weight: 600 !important;
    white-space: nowrap; 
    padding-right: 5px;
}

/* =========================================================
   BULLETPROOF BUTTON UI: Dark Blue + Hover (24px Height)
========================================================= */
div#search.modern-ui input#searchbtn.myButton {
    height: 24px !important; 
    padding: 0 24px !important;
    background-color: #205fd3 !important; /* Solid Dark Blue */
    background-image: none !important;
    color: #ffffff !important;
    border: none !important;
    border-radius: 4px !important; 
    cursor: pointer !important;
    font-family: Arial, sans-serif !important; 
    font-size: 12px !important;
    font-weight: 600 !important;
    line-height: 24px !important;
    transition: background-color 0.2s ease !important;
    width: 100% !important;
    box-sizing: border-box !important;
}

/* The Hover State */
div#search.modern-ui input#searchbtn.myButton:hover {
    background-color: #124096 !important; /* Noticeably darker blue on hover */
}

/* Grid Container */
.modern-ui .grid-container {
    background-color: #ffffff !important;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    width: 100%;
    min-height: 200px;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
    // Standardizing the jqx widget to match the new 24px UI height
    $("#msearchdate").jqxDateTimeInput({
        width: '100%',
        height: '24px',
        formatString: "dd.MM.yyyy",
        value: null
    });
}); 

function mainSearch() {
    var docno = document.getElementById("msearchdocno").value || "";
    
    // Safely pull from jqxDateTimeInput with a standard DOM fallback
    var date = "";
    if ($('#msearchdate').length && typeof $('#msearchdate').jqxDateTimeInput === 'function') {
        date = $('#msearchdate').jqxDateTimeInput('val') || "";
    } else {
        var dateEl = document.getElementById("msearchdate");
        date = dateEl ? dateEl.value : "";
    }
    
    var client = document.getElementById("msearchclient").value || "";
    var type = document.getElementById("msearchcmbtype").value || "";
    var acno = document.getElementById("msearchacno").value || "";
    var mobile = document.getElementById("msearchmobile").value || "";
    
    // Safely pull from brchName if it exists on the parent page
    var branchEl = document.getElementById("brchName");
    var branch = branchEl ? branchEl.value : "";
    
    getmaindata(docno, date, client, type, acno, mobile, branch);
}

function getmaindata(docno, date, client, type, acno, mobile, branch) {
    // Upgraded to robust URL encoding. Includes the hardcoded id=1 parameter.
    $("#srefreshdiv").load('assetSalesSearch.jsp?docno=' + encodeURIComponent(docno) + 
                           '&date=' + encodeURIComponent(date) + 
                           '&client=' + encodeURIComponent(client) + 
                           '&type=' + encodeURIComponent(type) + 
                           '&acno=' + encodeURIComponent(acno) + 
                           '&mobile=' + encodeURIComponent(mobile) + 
                           '&branch=' + encodeURIComponent(branch) + 
                           '&id=1');
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="8%" /> <col width="17%" /> 
                <col width="8%" /> <col width="17%" />
                <col width="8%" /> <col width="22%" />
                <col width="20%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="msearchdocno" id="msearchdocno"></td>
                
                <td class="lbl-right">Date</td>
                <td><div id="msearchdate"></div></td>
                
                <td class="lbl-right">Type</td>
                <td>
                    <select name="msearchcmbtype" id="msearchcmbtype">
                        <option value="">--Select--</option>
                        <option value="S">Sale</option>
                        <option value="L">Total Loss</option>
                    </select>
                </td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 15px;">
                    <input type="button" name="searchbtn" id="searchbtn" class="myButton" value="Search" onclick="mainSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Client</td>
                <td><input type="text" name="msearchclient" id="msearchclient"></td>
                
                <td class="lbl-right">A/c No</td>
                <td><input type="text" name="msearchacno" id="msearchacno"></td>
                
                <td class="lbl-right">Mobile</td>
                <td><input type="text" name="msearchmobile" id="msearchmobile"></td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="srefreshdiv">
            <jsp:include page="assetSalesSearch.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>