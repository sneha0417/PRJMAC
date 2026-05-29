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

function loadContractSearch() {
    var contractNo = document.getElementById("txtcontractsno").value || "";
    var contractDetails = document.getElementById("txtcontractsdetails").value || "";
    var areass = document.getElementById("txtarea").value || "";
    var sitess = document.getElementById("txtsite1").value || "";
    
    /* Safe fallbacks for missing HTML elements from the original JS */
    var brchElem = document.getElementById("brchName");
    var branch = brchElem ? brchElem.value : "";
    
    var cTypeElem = document.getElementById("cmbcontracttype");
    var contractType = cTypeElem ? cTypeElem.value : "";
    
    var clDocElem = document.getElementById("txtclientdocno");
    var cldocno = clDocElem ? clDocElem.value : "";
    
    var check = 1;
    
    getdata(contractDetails, contractNo, branch, contractType, cldocno, check, areass, sitess);
}
    
function getdata(contractDetails, contractNo, branch, contractType, cldocno, check, area, site) {
    /* Securely encode variables for the URL */
    $("#refreshcontractdiv").load('contractDetailsSearchGrid.jsp?contractdetails=' + encodeURIComponent(contractDetails) + 
                                  '&contractno=' + encodeURIComponent(contractNo) + 
                                  '&branch=' + encodeURIComponent(branch) + 
                                  '&contracttype=' + encodeURIComponent(contractType) + 
                                  '&cldocno=' + encodeURIComponent(cldocno) + 
                                  '&check=' + check + 
                                  '&area=' + encodeURIComponent(area) + 
                                  '&site=' + encodeURIComponent(site));
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
                    <span class="lbl-top">Contract No.</span>
                    <input type="text" name="txtcontractsno" id="txtcontractsno" value='<s:property value="txtcontractsno"/>'>
                </td>
                
                <td>
                    <span class="lbl-top">Ref No</span>
                    <input type="text" name="txtcontractsdetails" id="txtcontractsdetails" value='<s:property value="txtcontractsdetails"/>'>
                </td>
                
                <td></td>
            </tr>
            
            <tr>
                <td>
                    <span class="lbl-top">Site</span>
                    <input type="text" name="txtsite1" id="txtsite1" value='<s:property value="txtsite1"/>'>
                </td>
                
                <td>
                    <span class="lbl-top">Area</span>
                    <input type="text" name="txtarea" id="txtarea" value='<s:property value="txtarea"/>'>
                </td>
                
                <td align="center" style="padding-left: 10px;">
                    <span class="lbl-top">&nbsp;</span>
                    <input type="button" name="btnsearch" id="btnsearch" class="myButton" value="Search" onclick="loadContractSearch(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshcontractdiv">
            <jsp:include page="contractDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>