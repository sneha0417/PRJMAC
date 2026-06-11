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
   BULLETPROOF BUTTON UI: Standard (Blue) & Submit (Steel)
========================================================= */
/* Primary Search Button */
div#search.modern-ui input.myButton {
    height: 24px !important; 
    padding: 0 15px !important;
    background-color: #205fd3 !important; 
    background-image: none !important;
    color: #ffffff !important; 
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

div#search.modern-ui input.myButton:hover {
    background-color: #124096 !important; 
}

/* Secondary Submit Button (Modernized from Legacy Gradient) */
div#search.modern-ui input.myButtons {
    height: 24px !important; 
    padding: 0 15px !important;
    background-color: #476e9e !important; /* Flat Steel Blue */
    background-image: none !important;
    color: #ffffff !important; 
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

div#search.modern-ui input.myButtons:hover {
    background-color: #325075 !important; 
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

function loadSearchss() {
    var docnoss = document.getElementById("docnoss").value || "";
    var refnosss = document.getElementById("refnosss").value || "";
    
    // Safely pull from jqxDateTimeInput with a standard DOM fallback
    var datess = "";
    if ($('#datess').length && typeof $('#datess').jqxDateTimeInput === 'function') {
        datess = $('#datess').jqxDateTimeInput('val') || "";
    } else {
        var dateEl = document.getElementById("datess");
        datess = dateEl ? dateEl.value : "";
    }

    var aa = "yes";
    getdatas(docnoss, refnosss, datess, aa);
}

function getdatas(docnoss, refnosss, datess, aa) {
    // Safely pull values from parent container elements
    var clientid = document.getElementById("clientid") ? document.getElementById("clientid").value : "";
    var locaid = document.getElementById("locationid") ? document.getElementById("locationid").value : "";
    var reftype = $('#cmbreftype').length ? $('#cmbreftype').val() : "";
    var trans = $('#cmbmodeofpay').length ? $('#cmbmodeofpay').val() : "";
    
    var tranid = 0;
    if (trans === 'cash') {
        tranid = 1;
    } else if (trans === 'credit') {
        tranid = 2;
    }

    // Upgraded to robust URL encoding
    $("#refsearch").load('subrefnosearch.jsp?docnoss=' + encodeURIComponent(docnoss) + 
                         '&datess=' + encodeURIComponent(datess) + 
                         '&refnosss=' + encodeURIComponent(refnosss) + 
                         '&aa=' + encodeURIComponent(aa) + 
                         '&clientid=' + encodeURIComponent(clientid) + 
                         '&reftype=' + encodeURIComponent(reftype) + 
                         '&tranid=' + tranid + 
                         '&locaid=' + encodeURIComponent(locaid));
}

function searchdata() {
    // Safety check to ensure the grid exists before calling methods
    if (!$('#reqMastersearch').length) return;
    
    var rows = $('#reqMastersearch').jqxGrid('getrows');
    if (!rows) return;

    var temp = "";
    var temp2 = "";
    var aa = 0;
    
    for (var i = 0; i < rows.length; i++) {
        if (rows[i].chk == true) {
            aa = 1;
        }
    } 
          
    if (parseInt(aa) == 0) {
        var errorEl = document.getElementById("errormsg");
        if (errorEl) errorEl.innerText = "Choose at least one request";
        return 0;
    }
          
    for (var i = 0; i < rows.length; i++) {
        if (rows[i].chk == true) {
            temp = temp + rows[i].voc_no + ",";
            temp2 = temp2 + rows[i].doc_no + ",";
        }
    }
          
    var refMasterDoc = document.getElementById("refmasterdocno");
    var rRefNo = document.getElementById("rrefno");
    
    if (refMasterDoc) refMasterDoc.value = temp2.replace(/,\s*$/, "");
    if (rRefNo) rRefNo.value = temp.replace(/,\s*$/, "");
           
    if ($('#refnosearchwindow').length) {
        $('#refnosearchwindow').jqxWindow('close'); 
    }
    
    $.messager.confirm('Message', 'Do you want to Import?', function(r) {
        if (r == false) {
            if ($("#prodsearchtype").length) $("#prodsearchtype").val("1");
            if ($("#jqxInvoiceReturn").length) {
                $("#jqxInvoiceReturn").jqxGrid('clear');
                $("#jqxInvoiceReturn").jqxGrid('addrow', null, {});
            }
            return false; 
        } else {
            if ($("#prodsearchtype").length) $("#prodsearchtype").val("2");
            
            var chk = "req";
            var from = "pro";
            var reftype = $("#cmbreftype").length ? $("#cmbreftype").val() : "";
            var refDocVal = document.getElementById("refmasterdocno") ? document.getElementById("refmasterdocno").value : "";
            var locidVal = document.getElementById("locationid") ? document.getElementById("locationid").value : "";
            
            $("#invoiceDiv").load("invoiceReturnGrid.jsp?enqdoc=" + encodeURIComponent(refDocVal) + 
                                  "&chk=" + encodeURIComponent(chk) + 
                                  "&from=" + encodeURIComponent(from) + 
                                  "&cond=1&reftype=" + encodeURIComponent(reftype) + 
                                  '&locaid=' + encodeURIComponent(locidVal)); 
        }
    });  
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="8%" /> <col width="17%" /> 
                <col width="8%" /> <col width="17%" /> 
                <col width="8%" /> <col width="17%" />
                <col width="25%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="docnoss" id="docnoss" value='<s:property value="docnoss"/>'></td>
                
                <td class="lbl-right">Date</td>
                <td><div id="datess" name="datess"></div></td>
                
                <td class="lbl-right">RefNo</td>
                <td><input type="text" name="refnosss" id="refnosss" value='<s:property value="refnosss"/>'></td>
                
                <td align="right" valign="middle">
                    <input type="button" name="searchss" id="searchss" class="myButton" value="Search" onclick="loadSearchss(); return false;" style="margin-right: 5px;">
                    <input type="button" name="searchs" id="searchs" class="myButtons" value="Submit" onclick="searchdata(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refsearch">
            <jsp:include page="subrefnosearch.jsp"></jsp:include> 
        </div>
    </div>
    
</div>
</body>
</html>