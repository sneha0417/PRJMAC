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
div#search.modern-ui input#cntrbtnrasearch.myButton {
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
    width: 50% !important;
    box-sizing: border-box !important;
}

/* The Hover State */
div#search.modern-ui input#cntrbtnrasearch.myButton:hover {
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
    // Initializing the jqxDateTimeInput widget mapped to the modern-ui height
    $("#cntrdates").jqxDateTimeInput({ 
        width: '100%', 
        height: '24px', 
        formatString: "dd.MM.yyyy", 
        value: null 
    }); 
}); 

function cntrloadSearch() {
    // Safely pull values
    var cntrdates = $('#cntrdates').val() || (document.getElementById("cntrdates") ? document.getElementById("cntrdates").value : "");
    var Cl_namess = document.getElementById("Cl_names").value || "";
    var Cl_mobno = document.getElementById("Cl_mobno").value || "";
    var msdocno = document.getElementById("msdocno").value || ""; 
    
    // Safely pull cmbcontracttype which is missing from this specific HTML view but may exist on parent
    var cmbElement = document.getElementById("cmbcontracttype");
    var dtype = cmbElement ? cmbElement.value : ($('#cmbcontracttype').val() || "");
    
    getdata(Cl_namess, msdocno, Cl_mobno, cntrdates, dtype);
}

function getdata(Cl_names, msdocno, Cl_mobno, cntrdates, dtype) {
    // Upgraded to robust URL encoding
    $("#refreshdivmas").load('contractsubMastersearch.jsp?Cl_names=' + encodeURIComponent(Cl_names) + 
                             '&msdocno=' + encodeURIComponent(msdocno) + 
                             '&Cl_mobno=' + encodeURIComponent(Cl_mobno) + 
                             '&cntrdate=' + encodeURIComponent(cntrdates) + 
                             '&dtype=' + encodeURIComponent(dtype));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="15%" /> 
                <col width="10%" /> <col width="35%" />
                <col width="10%" /> <col width="20%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Docno</td>
                <td><input type="text" name="msdocno" id="msdocno" value='<s:property value="msdocno"/>'></td>
                
                <td class="lbl-right">Name</td>
                <td><input type="text" name="Cl_names" id="Cl_names" value='<s:property value="Cl_names"/>'></td>
                
                <td class="lbl-right">MOB</td>
                <td><input type="text" name="Cl_mobno" id="Cl_mobno" value='<s:property value="Cl_mobno"/>'></td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td><div id="cntrdates" name="cntrdates"></div></td>
                
                <td colspan="2"></td> <td colspan="2" align="right" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="cntrbtnrasearch" id="cntrbtnrasearch" class="myButton" value="Search" onclick="cntrloadSearch(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdivmas">
            <jsp:include page="contractsubMastersearch.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>