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
div#search.modern-ui input#qotbtnrasearch.myButton {
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
div#search.modern-ui input#qotbtnrasearch.myButton:hover {
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
    $("#qotdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null }); 
}); 

function qotloadSearch1() {
    var msdocno = document.getElementById("msdocno").value || "";
    var Cl_names = document.getElementById("Cl_names").value || "";
    var Cl_salper = document.getElementById("Cl_salper").value || "";
    var Cl_enqno = document.getElementById("Cl_enqno").value || "";
    var qottype = document.getElementById("qottype").value || "";
    var Cl_mobnos = document.getElementById("Cl_mobnos").value || "";
    
    // Safely pull from jqxDateTimeInput with a standard DOM fallback
    var qotdate = "";
    if ($('#qotdate').length && typeof $('#qotdate').jqxDateTimeInput === 'function') {
        qotdate = $('#qotdate').jqxDateTimeInput('val') || "";
    } else {
        var dateEl = document.getElementById("qotdate");
        qotdate = dateEl ? dateEl.value : "";
    }

    getdata1(Cl_names, msdocno, Cl_enqno, qotdate, qottype, Cl_mobnos, Cl_salper);
}

function getdata1(Cl_names, msdocno, Cl_enqno, qotdate, qottype, Cl_mobnos, Cl_salper) {
    // Safely fetch mode of pay from parent container
    var trans = $('#cmbmodeofpay').length ? $('#cmbmodeofpay').val() : "";
    var tranid = 0;
    
    if (trans === 'cash') {
        tranid = 1;
    } else if (trans === 'credit') {
        tranid = 2;
    }
    
    // Upgraded to robust URL encoding instead of manual space replacement
    $("#refreshdivmas").load('subMastersearch.jsp?Cl_names=' + encodeURIComponent(Cl_names) + 
                             '&msdocno=' + encodeURIComponent(msdocno) + 
                             '&Cl_enqno=' + encodeURIComponent(Cl_enqno) + 
                             '&qotdate=' + encodeURIComponent(qotdate) + 
                             '&qottype=' + encodeURIComponent(qottype) + 
                             '&tranid=' + tranid + 
                             '&Cl_mobnos=' + encodeURIComponent(Cl_mobnos) + 
                             '&Cl_salper=' + encodeURIComponent(Cl_salper));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="23%" /> 
                <col width="8%" /> <col width="25%" /> 
                <col width="12%" /> <col width="22%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="msdocno" id="msdocno" value='<s:property value="msdocno"/>'></td>
                
                <td class="lbl-right">Name</td>
                <td><input type="text" name="Cl_names" id="Cl_names" value='<s:property value="Cl_names"/>'></td>
                
                <td class="lbl-right">Sales Person</td>
                <td>
                    <input type="text" name="Cl_salper" id="Cl_salper" value='<s:property value="Cl_salper"/>'>
                    <input type="hidden" name="Cl_enqno" id="Cl_enqno" value='<s:property value="Cl_enqno"/>'>
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td><div id="qotdate" name="qotdate"></div></td>
                
                <td class="lbl-right">Type</td>
                <td>
                    <select name="qottype" id="qottype">
                        <option value="">--select--</option>
                        <option value="DIR">DIR</option>
                        <option value="SOR">SOR</option>
                        <option value="DEL">DEL</option>
                    </select>
                </td>
                
                <td class="lbl-right">MOB</td>
                <td><input type="text" name="Cl_mobnos" id="Cl_mobnos" value='<s:property value="Cl_mobnos"/>'></td>
            </tr>
            
            <tr>
                <td colspan="5"></td>
                <td align="right" valign="middle" style="padding-top: 10px;">
                    <input type="button" name="qotbtnrasearch" id="qotbtnrasearch" class="myButton" value="Search" onclick="qotloadSearch1(); return false;">
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