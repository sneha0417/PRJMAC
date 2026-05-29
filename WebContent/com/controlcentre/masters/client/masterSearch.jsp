<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%--   <jsp:include page="../../../../includes.jsp"></jsp:include>   --%> 
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
   BULLETPROOF BUTTON UI: Dark Blue + Hover
   Targeting ID directly to override body.css
========================================================= */
div#search.modern-ui input#mbtnrasearch.myButton {
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
    var sclname = document.getElementById("SCl_name").value || "";
    var smob = document.getElementById("Sl_mob").value || "";
    var rno = document.getElementById("rno").value || "";
    var contact = document.getElementById("contact").value || "";

    getdata(sclname, smob, rno, contact);
}

function getdata(sclname, smob, rno, contact) {
    /* Securely encode variables for the URL */
    $("#srefreshdiv").load('submainSearch.jsp?sclname=' + encodeURIComponent(sclname) + 
                           '&smob=' + encodeURIComponent(smob) + 
                           '&rno=' + encodeURIComponent(rno) + 
                           '&contact=' + encodeURIComponent(contact));
} 
</script>
</head>

<body>
<div id="search" class="modern-ui">
    
    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="30%" /> 
                <col width="10%" /> <col width="30%" />
                <col width="20%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Name</td>
                <td><input type="text" name="SCl_name" id="SCl_name" value='<s:property value="SCl_name"/>'></td>
                
                <td class="lbl-right">MOB</td>
                <td><input type="text" name="Sl_mob" id="Sl_mob" value='<s:property value="Sl_mob"/>'></td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="mbtnrasearch" id="mbtnrasearch" class="myButton" value="Search" onclick="mainloadSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Doc NO</td>
                <td><input type="text" name="rno" id="rno" value='<s:property value="rno"/>'></td>
                
                <td class="lbl-right">Contact</td>
                <td><input type="text" name="contact" id="contact" value='<s:property value="contact"/>'></td>
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