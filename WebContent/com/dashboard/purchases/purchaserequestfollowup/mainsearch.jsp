<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
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

/* Strict weight enforcement */
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

/* Date Picker Alignment */
.modern-ui .jqx-datetime-input {
    height: 24px !important;
    width: 100% !important;
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
   BULLETPROOF BUTTON UI
========================================================= */
div#search.modern-ui input#searchs.myButton {
    height: 24px !important; 
    padding: 0 24px !important;
    background-color: #205fd3 !important;
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

div#search.modern-ui input#searchs.myButton:hover {
    background-color: #124096 !important;
}

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
    // Initializing the date picker
    $("#datess1").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null });
}); 

function loadSearchs() {
    var docnoss = document.getElementById("docnoss").value || "";
    var refnoss = document.getElementById("refnoss").value || "";
    var datess = $("#datess1").val() || "";
    var descriptionss = document.getElementById("descriptionss").value.trim();
    var aa = "yes";
    
    getdata(docnoss, datess, aa, descriptionss, refnoss);
}

function getdata(docnoss, datess, aa, descriptionss, refnoss) {
    // Upgraded to robust URL encoding
    $("#refreshdivs").load('Subsearch.jsp?docnoss=' + encodeURIComponent(docnoss) + 
                           '&datess=' + encodeURIComponent(datess) + 
                           '&aa=' + encodeURIComponent(aa) + 
                           '&descriptions=' + encodeURIComponent(descriptionss) + 
                           '&refnoss=' + encodeURIComponent(refnoss));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="8%" /> <col width="20%" /> 
                <col width="8%" /> <col width="20%" />
                <col width="8%" /> <col width="20%" />
                <col width="16%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="docnoss" id="docnoss" value='<s:property value="docnoss"/>'></td>
                
                <td class="lbl-right">Ref No</td>
                <td><input type="text" name="refnoss" id="refnoss" value='<s:property value="refnoss"/>'></td>
                
                <td class="lbl-right">Date</td>
                <td><div id="datess1" name="datess1"></div></td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="searchs" id="searchs" class="myButton" value="Search" onclick="loadSearchs(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Description</td>
                <td colspan="5"><input type="text" name="descriptionss" id="descriptionss" value='<s:property value="descriptionss"/>'></td>
                <td></td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdivs">
            <jsp:include page="Subsearch.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>