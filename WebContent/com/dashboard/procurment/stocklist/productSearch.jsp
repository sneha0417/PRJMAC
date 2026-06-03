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
div#search.modern-ui input#searchs.myButton {
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
    // Initialization code if needed
});   
           
function loadSearchss() {
    var docnoss = document.getElementById("docnoss").value || "";
    var prdid = document.getElementById("prdid").value || "";
    var prdname = document.getElementById("prdname").value || "";
    var aa = "yes";

    getdatas(docnoss, prdid, prdname, aa);
}

function getdatas(docnoss, prdid, prdname, aa) {
    // Upgraded to robust URL encoding
    $("#refsearch").load('productssubsearch.jsp?docnoss=' + encodeURIComponent(docnoss) + 
                         '&prdid=' + encodeURIComponent(prdid) + 
                         '&prdname=' + encodeURIComponent(prdname) + 
                         '&aa=' + encodeURIComponent(aa));
}  
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="25%" /> 
                <col width="15%" /> <col width="35%" />
                <col width="15%" />
            </colgroup>
            
            <tr> 
                <td class="lbl-right">Product</td>
                <td><input type="text" name="prdid" id="prdid" value='<s:property value="prdid"/>'></td>  
                
                <td class="lbl-right">Product Name</td>
                <td>
                    <input type="text" name="prdname" id="prdname" value='<s:property value="prdname"/>'>
                    <input type="hidden" name="docnoss" id="docnoss" value='<s:property value="docnoss"/>'>
                </td>
                 
                <td align="center" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="searchs" id="searchs" class="myButton" value="Search" onclick="loadSearchss(); return false;">
                </td>
            </tr> 
        </table>
    </div>
    
    <div class="grid-container">
        <div id="refsearch">
            <jsp:include page="productssubsearch.jsp"></jsp:include> 
        </div>
    </div>

</div>
</body>
</html>