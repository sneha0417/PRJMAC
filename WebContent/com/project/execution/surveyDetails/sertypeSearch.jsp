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
.modern-ui input.myButton {
    height: 24px !important; 
    padding: 0 16px !important;
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
    box-sizing: border-box !important;
    margin-left: 5px;
}

/* The Hover State */
.modern-ui input.myButton:hover {
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

.error-text {
    color: #dc2626;
    font-weight: 600;
    font-size: 11px;
    padding-left: 10px;
}
</style>

<script type="text/javascript">
$(document).ready(function () { 
    // Initialization space for future jqx widgets
});   
       
function loadSearchss() {
    var servtypes = document.getElementById("txtservtypes").value || "";
    var sertypeidsEl = document.getElementById("sertypeids");
    var sertypeids = sertypeidsEl ? sertypeidsEl.value : "";
    var id = 1;

    getdatas(servtypes, sertypeids, id);
}

function getdatas(servtypes, sertypeids, id) {
    // Upgraded to robust URL encoding
    $("#refsearch").load('subsertypeSearch.jsp?sertype=' + encodeURIComponent(servtypes) + 
                         '&sertypeid=' + encodeURIComponent(sertypeids) + 
                         '&id=' + id);
}  

function searchdata() {
    var rows = $('#sertypeSearch').jqxGrid('getrows');
    var aa = 0;
    var sid = 0;
    
    for (var i = 0; i < rows.length; i++) {
        if (rows[i].chk == true) {
            aa = 1;
        }
    } 
    
    if (parseInt(aa) == 0) {
        var errorEl = document.getElementById("errormsg");
        if (errorEl) {
            errorEl.innerText = "Choose at least one Service Type";
        } else {
            alert("Choose at least one Service Type");
        }
        return 0;
    }
    
    for (var i = 0; i < rows.length; i++) {
        if (rows[i].chk == true) {
            sid = sid + rows[i].doc_no + ",";
        }
    }
    
    $("#servtypeDetailsDiv").load("servtypeDetailsGrid.jsp?sid=" + encodeURIComponent(sid));
    $('#sertypesearchwindow').jqxWindow('close'); 
}

function funUpdate() {
    var rows = $("#sertypeSearch").jqxGrid('selectedrowindexes');
    var aid = 0;
    var sertypeidsEl = document.getElementById("sertypeids");
    var sertypeids = sertypeidsEl ? sertypeidsEl.value : "";
    var selectedRecords = new Array();
    
    for (var m = 0; m < rows.length; m++) {
        var row = $("#sertypeSearch").jqxGrid('getrowdata', rows[m]);
        var rowlength = $("#servtypeDetailsGridID").jqxGrid('rows').records.length;
        
        if (rowlength == 0) {
            $("#servtypeDetailsGridID").jqxGrid('addrow', null, {});
            $('#servtypeDetailsGridID').jqxGrid('setcellvalue', m, "servtype", row.name);
            $('#servtypeDetailsGridID').jqxGrid('setcellvalue', m, "doc_no", row.doc_no);
            aid = aid + sertypeids + ",";
            aid = row.doc_no;
        } else {
            var totrow = 0;
            totrow = row.length + rowlength;
            var test = 0;
            for (var n = rowlength; n < totrow; n++) {
                var rowspec = $("#servtypeDetailsGridID").jqxGrid('getrowdata', n);
                if (rowspec.doc_no == row.doc_no) {
                    test = 1;
                    break;
                }
            }
            if (test == 0) {
                $("#servtypeDetailsGridID").jqxGrid('addrow', null, {});
                $('#servtypeDetailsGridID').jqxGrid('setcellvalue', n, "servtype", row.name);
                $('#servtypeDetailsGridID').jqxGrid('setcellvalue', n, "doc_no", row.doc_no);
                aid = aid + sertypeids + ",";
                aid = aid + row.doc_no + ",";
            }
        }
        selectedRecords[selectedRecords.length] = row;
    }
    
    if (sertypeidsEl) {
        sertypeidsEl.value = aid;
    }
    
    $('#sertypesearchwindow').jqxWindow('close');
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="15%" /> <col width="45%" /> 
                <col width="40%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Service Type</td>
                <td>
                    <input type="text" name="txtservtypes" id="txtservtypes" value='<s:property value="txtservtypes"/>'>
                    <input type="hidden" name="sertypeids" id="sertypeids" value='<s:property value="sertypeids"/>'>
                </td>
                
                <td align="right" valign="middle" style="padding-left: 15px;">
                    <span id="errormsg" class="error-text"></span>
                    <input type="button" name="searchss" id="searchss" class="myButton" value="Search" onclick="loadSearchss(); return false;">
                    <input type="button" name="searchs" id="searchs" class="myButton" value="Submit" onclick="funUpdate(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refsearch">
            <jsp:include page="subsertypeSearch.jsp"></jsp:include> 
        </div>
    </div>
    
</div>
</body>
</html>