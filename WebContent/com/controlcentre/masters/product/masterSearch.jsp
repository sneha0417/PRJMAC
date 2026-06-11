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
div#search.modern-ui input#mbtnrasearch.myButton {
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
div#search.modern-ui input#mbtnrasearch.myButton:hover {
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

function mainloadSearch() {
    var name = document.getElementById("name").value || "";
    var brand = document.getElementById("brand").value || "";
    var cat = document.getElementById("cat").value || "";
    var pcode = document.getElementById("pcode").value || "";
    var subcat = document.getElementById("subcat").value || "";
    
    getdata(name, brand, cat, pcode, subcat);
}

function getdata(name, brand, cat, pcode, subcat) {
    // Upgraded to robust URL encoding instead of manual space replacement
    $("#srefreshdiv").load('submainSearch.jsp?name=' + encodeURIComponent(name) + 
                           '&brand=' + encodeURIComponent(brand) + 
                           '&cat=' + encodeURIComponent(cat) + 
                           '&pcode=' + encodeURIComponent(pcode) + 
                           '&subcat=' + encodeURIComponent(subcat));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="12%" /> <col width="21%" /> 
                <col width="10%" /> <col width="21%" /> 
                <col width="12%" /> <col width="24%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Product Name</td>
                <td colspan="2"><input type="text" name="name" id="name" value='<s:property value="name"/>'></td>
                
                <td class="lbl-right">Product Code</td>
                <td colspan="2"><input type="text" name="pcode" id="pcode" value='<s:property value="pcode"/>'></td>
            </tr>
            
            <tr>
                <td class="lbl-right">Brand</td>
                <td><input type="text" name="brand" id="brand" value='<s:property value="brand"/>'></td>
                
                <td class="lbl-right">Category</td>
                <td><input type="text" name="cat" id="cat" value='<s:property value="cat"/>'></td>
                
                <td class="lbl-right">Sub Category</td>
                <td><input type="text" name="subcat" id="subcat" value='<s:property value="subcat"/>'></td>
            </tr>
            
            <tr>
                <td colspan="5"></td>
                <td align="right" valign="middle" style="padding-top: 10px;">
                    <input type="button" name="mbtnrasearch" id="mbtnrasearch" class="myButton" value="Search" onclick="mainloadSearch(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="srefreshdiv">
            <jsp:include page="submainSearch.jsp"></jsp:include> 
        </div>
    </div>
    
</div>
</body>
</html>