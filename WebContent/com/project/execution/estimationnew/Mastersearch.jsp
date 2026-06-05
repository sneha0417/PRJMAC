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
div#search.modern-ui input#btnrasearch.myButton {
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
div#search.modern-ui input#btnrasearch.myButton:hover {
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
    $("#datess").jqxDateTimeInput({ 
        width: '100%', 
        height: '24px', 
        formatString: "dd.MM.yyyy",
        value: null
    }); 
}); 

function loadSearch() {
    var Cl_names = document.getElementById("Cl_names").value || "";
    var msdocno = document.getElementById("msdocno").value || ""; 
    
    // Safely pull from jqxDateTimeInput with a standard DOM fallback
    var dates = "";
    if ($('#datess').length && typeof $('#datess').jqxDateTimeInput === 'function') {
        dates = $('#datess').jqxDateTimeInput('val') || "";
    } else {
        var dateEl = document.getElementById("datess");
        dates = dateEl ? dateEl.value : "";
    }
    
    var reftype = document.getElementById("reftype").value || ""; 
    var refno = document.getElementById("refno").value || ""; 
    
    getdata1(Cl_names, msdocno, dates, reftype, refno);
}

function getdata1(Cl_names, msdocno, dates, reftype, refno) {
    var id = 1;
    // Upgraded to robust URL encoding instead of manual space replacement
    $("#refreshdivmas").load('subMastersearch.jsp?Cl_namess=' + encodeURIComponent(Cl_names) + 
                             '&msdocno=' + encodeURIComponent(msdocno) + 
                             '&dates=' + encodeURIComponent(dates) + 
                             '&id=' + id + 
                             '&reftype=' + encodeURIComponent(reftype) + 
                             '&refno=' + encodeURIComponent(refno));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="15%" /> 
                <col width="10%" /> <col width="30%" />
                <col width="10%" /> <col width="25%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Docno</td>
                <td><input type="text" name="msdocno" id="msdocno" value='<s:property value="msdocno"/>'></td>
                
                <td class="lbl-right">Client</td>
                <td><input type="text" name="Cl_names" id="Cl_names" value='<s:property value="Cl_names"/>'></td>
                
                <td class="lbl-right">Date</td>
                <td><div id="datess" name="datess"></div></td>
            </tr>
            
            <tr>
                <td class="lbl-right">Ref Type</td>
                <td>
                    <select name="reftype" id="reftype">
                        <option value="">--select--</option>
                        <option value="DIR" <s:if test="%{reftype == 'DIR'}">selected</s:if>>DIR</option>
                        <option value="ENQ" <s:if test="%{reftype == 'ENQ'}">selected</s:if>>ENQ</option>
                    </select>
                </td>
                
                <td class="lbl-right">Ref Doc No</td>
                <td><input type="text" name="refno" id="refno" value='<s:property value="refno"/>'></td>
                
                <td></td>
                
                <td align="right" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="btnrasearch" id="btnrasearch" class="myButton" value="Search" onclick="loadSearch(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdivmas">
            <jsp:include page="subMastersearch.jsp"></jsp:include> 
        </div>
    </div>
    
</div>
</body>
</html>