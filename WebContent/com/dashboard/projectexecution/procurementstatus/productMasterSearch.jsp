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
div#search.modern-ui input#btnsearch.myButton {
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
    // Initialization code
}); 

function loadSearch() {
    var productsname = document.getElementById("txtproductsname").value || "";
    var brandsname = document.getElementById("txtbrandsname").value || "";
    var cldocnos = document.getElementById("txtcldocnos").value || "";
    var estdates = document.getElementById("txtestdates").value || "";
    var gridprdname = document.getElementById("txtgridprdname").value || "";
    var gridunit = document.getElementById("txtgridunit").value || "";
    var id = "1";
    
    getdata(productsname, brandsname, cldocnos, estdates, id, gridprdname, gridunit);
}

function getdata(productsname, brandsname, cldocnos, estdates, id, gridprdname, gridunit) {
    // Upgraded to encodeURIComponent for safety
    $("#refreshProductDiv").load('productSearch.jsp?productsname=' + encodeURIComponent(productsname) + 
                                 '&brandsname=' + encodeURIComponent(brandsname) + 
                                 '&cldocnos=' + encodeURIComponent(cldocnos) + 
                                 '&estdates=' + encodeURIComponent(estdates) + 
                                 '&id=' + encodeURIComponent(id) + 
                                 '&gridprdname=' + encodeURIComponent(gridprdname) + 
                                 '&gridunit=' + encodeURIComponent(gridunit));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="12%" /> <col width="30%" /> 
                <col width="10%" /> <col width="30%" />
                <col width="18%" /> 
            </colgroup>
            
            <tr>
                <td class="lbl-right">Product-Id</td>
                <td><input type="text" name="txtproductsname" id="txtproductsname" value='<s:property value="txtproductsname"/>'></td>
                
                <td class="lbl-right">Brand</td>
                <td>
                    <input type="text" name="txtbrandsname" id="txtbrandsname" value='<s:property value="txtbrandsname"/>'>
                    <input type="hidden" name="txtcldocnos" id="txtcldocnos" value='<s:property value="txtcldocnos"/>'>
                    <input type="hidden" name="txtestdates" id="txtestdates" value='<s:property value="txtestdates"/>'>
                </td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 15px;">
                    <input type="button" name="btnsearch" id="btnsearch" class="myButton" value="Search" onclick="loadSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Product Name</td>
                <td><input type="text" name="txtgridprdname" id="txtgridprdname" value='<s:property value="txtgridprdname"/>'></td>
                
                <td class="lbl-right">Unit</td>
                <td><input type="text" name="txtgridunit" id="txtgridunit" value='<s:property value="txtgridunit"/>'></td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshProductDiv">
            <jsp:include page="productSearch.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>