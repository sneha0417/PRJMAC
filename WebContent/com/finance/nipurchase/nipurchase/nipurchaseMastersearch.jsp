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
   STRICTLY SCOPED UI (No Global Bleed, Bold Retained)
========================================================= */
.modern-ui {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
    font-size: 12px;
    font-weight: bold !important; /* Forces this component to be bold */
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important;
    color: #333333 !important; 
}

/* Strict weight enforcement for injected content */
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select {
    font-weight: bold !important; 
    color: #333333 !important; 
}

/* Master Input Styles */
.modern-ui input[type="text"],
.modern-ui select {
    height: 24px !important;
    border: 1px solid #cccccc; 
    border-radius: 3px;
    padding: 2px 6px;
    font-size: 12px; 
    font-weight: bold !important; /* Makes the typed text inside inputs bold */
    font-family: inherit;
    box-sizing: border-box;
    background-color: #ffffff;
    color: #333333 !important; 
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

/* Side-aligned labels */
.modern-ui .lbl-right { 
    text-align: right; 
    color: #333333 !important; 
    font-size: 12px; 
    font-weight: bold !important;
    white-space: nowrap; 
    padding-right: 5px;
}

/* =========================================================
   BULLETPROOF BUTTON UI: Dark Blue + Hover
========================================================= */
div#search.modern-ui input#searchs.myButton {
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
    font-weight: bold !important;
    line-height: 24px !important;
    transition: background-color 0.2s ease !important;
    width: auto !important;
    box-sizing: border-box !important;
}

/* The Hover State */
div#search.modern-ui input#searchs.myButton:hover {
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
    // Standardizing the jqxDateTimeInput to match the new 24px UI height
    $("#datess").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null }); 
});   

function loadSearchs() {
    var docnoss = document.getElementById("docnoss").value || "";
    var accountss = document.getElementById("accountss").value || "";
    var accnamess = document.getElementById("accnamess").value || "";
    var reftypess = document.getElementById("reftypess").value || "";
    var description = document.getElementById("description").value || "";
    
    // Safely pull from jqxDateTimeInput with a standard DOM fallback
    var datess = "";
    if ($('#datess').length && typeof $('#datess').jqxDateTimeInput === 'function') {
        datess = $('#datess').jqxDateTimeInput('val') || "";
    } else {
        var dateEl = document.getElementById("datess");
        datess = dateEl ? dateEl.value : "";
    }

    var aa = "yes"; // Hardcoded payload parameter from original logic
    
    getdata(docnoss, accountss, accnamess, datess, reftypess, aa, description);
}

function getdata(docnoss, accountss, accnamess, datess, reftypess, aa, description) {
    // Upgraded to robust URL encoding instead of manual space replacement
    $("#refreshdivs").load('submasterSearch.jsp?docnoss=' + encodeURIComponent(docnoss) + 
                           '&accountss=' + encodeURIComponent(accountss) + 
                           '&accnamess=' + encodeURIComponent(accnamess) + 
                           '&datess=' + encodeURIComponent(datess) + 
                           '&reftypess=' + encodeURIComponent(reftypess) + 
                           '&aa=' + encodeURIComponent(aa) + 
                           '&description=' + encodeURIComponent(description));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="20%" /> 
                <col width="10%" /> <col width="20%" /> 
                <col width="12%" /> <col width="28%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="docnoss" id="docnoss" value='<s:property value="docnoss"/>'></td>
                
                <td class="lbl-right">Account</td>
                <td><input type="text" name="accountss" id="accountss" value='<s:property value="accountss"/>'></td>
                
                <td class="lbl-right">Account Name</td>
                <td><input type="text" name="accnamess" id="accnamess" value='<s:property value="accnamess"/>'></td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td><div id="datess" name="datess"></div></td>
                
                <td class="lbl-right">Type</td>
                <td>
                    <select name="reftypess" id="reftypess">
                        <option value="">--select--</option>
                        <option value="DIR" <s:if test="%{reftypess == 'DIR'}">selected</s:if>>DIR</option>
                        <option value="NPO" <s:if test="%{reftypess == 'NPO'}">selected</s:if>>NPO</option>
                    </select>
                </td>
                
                <td class="lbl-right">Description</td>
                <td><input type="text" name="description" id="description" value='<s:property value="description"/>'></td>
            </tr>
            
            <tr>
                <td colspan="5"></td>
                <td align="right" valign="middle" style="padding-top: 10px;">
                    <input type="button" name="searchs" id="searchs" class="myButton" value="Search" onclick="loadSearchs(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdivs">
            <jsp:include page="submasterSearch.jsp"></jsp:include> 
        </div>
    </div>
    
</div>
</body>
</html>