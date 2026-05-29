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
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important;
    color: #333333 !important; /* Forced text color to guarantee visibility */
}

/* Strict weight enforcement for injected content */
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select {
    font-weight: 400 !important; 
    color: #333333 !important; /* Forces all table text to be visible dark grey */
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
    color: #333333 !important; /* Forces input text to be visible */
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
    border-spacing: 5px 12px; /* Slightly increased vertical spacing for stacked labels */
    width: 100%;
    table-layout: fixed; 
}

.modern-ui td {
    vertical-align: top; /* Align everything to top so labels sit evenly */
}

/* NEW: Top-Aligned Labels */
.modern-ui .lbl-top { 
    color: #333333 !important; 
    font-size: 12px; 
    font-weight: 600 !important;
    display: block;
    margin-bottom: 4px; /* Space between label and input */
    text-align: left;
}

/* =========================================================
   BULLETPROOF BUTTON UI: Dark Blue + Hover
   Targeting ID #btnsearch directly to override body.css
========================================================= */
div#search.modern-ui input#btnsearch.myButton {
    height: 24px !important; 
    padding: 0 24px !important;
    background-color: #205fd3 !important; /* Solid Dark Blue */
    background-image: none !important;
    color: #ffffff !important; /* White text for button */
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
div#search.modern-ui input#btnsearch.myButton:hover {
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
    // Initialization code if needed
}); 

function loadSiteSearch() {
    var site = document.getElementById("txtsitesname").value || "";
    var contractElem = document.getElementById("txtcontracttrno");
    var contract = contractElem ? contractElem.value : "";
    var check = 1;
    
    getdata(site, contract, check);
}

function getdata(site, contract, check) {
    /* Securely encode variables for the URL */
    $("#refreshsitediv").load('siteDetailsSearchGrid.jsp?site=' + encodeURIComponent(site) + 
                              '&contract=' + encodeURIComponent(contract) + 
                              '&check=' + check);
}
</script>
</head>

<body>
<div id="search" class="modern-ui">
    
    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="40%" /> 
                <col width="40%" />
                <col width="20%" />
            </colgroup>
            
            <tr>
                <td>
                    <span class="lbl-top">Site</span>
                    <input type="text" name="txtsitesname" id="txtsitesname" value='<s:property value="txtsitesname"/>'>
                </td>
                
                <td>
                    <span class="lbl-top">Contract</span>
                    <input type="text" name="txtcontracttrno" id="txtcontracttrno" value='<s:property value="txtcontracttrno"/>'>
                </td>
                
                <td align="center" style="padding-left: 10px;">
                    <span class="lbl-top">&nbsp;</span>
                    <input type="button" name="btnsearch" id="btnsearch" class="myButton" value="Search" onclick="loadSiteSearch(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshsitediv">
            <jsp:include page="siteDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>