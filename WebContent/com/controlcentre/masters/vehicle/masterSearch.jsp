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
div#search.modern-ui input#btninvsearch.myButton {
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
div#search.modern-ui input#btninvsearch.myButton:hover {
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
    $("#searchdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null });
}); 

function mainloadSearch() {
    var fleetno = document.getElementById("searchfleet").value || "";
    var docno = document.getElementById("searchdocno").value || "";
    var regno = document.getElementById("searchregno").value || "";
    var fleetname = document.getElementById("searchfleetname").value || "";
    var engine = document.getElementById("searchengine").value || "";
    var chassis = document.getElementById("searchchassis").value || "";
    
    // Safely pull from jqxDateTimeInput with a standard DOM fallback
    var searchdate = "";
    if ($('#searchdate').length && typeof $('#searchdate').jqxDateTimeInput === 'function') {
        searchdate = $('#searchdate').jqxDateTimeInput('val') || "";
    } else {
        var dateEl = document.getElementById("searchdate");
        searchdate = dateEl ? dateEl.value : "";
    }

    getdata(fleetno, docno, regno, fleetname, searchdate, engine, chassis);
}

function getdata(fleetno, docno, regno, fleetname, searchdate, engine, chassis) {
    // Upgraded to robust URL encoding
    $("#srefreshdiv").load('subMainSearch.jsp?fleetno=' + encodeURIComponent(fleetno) + 
                           '&docno=' + encodeURIComponent(docno) + 
                           '&regno=' + encodeURIComponent(regno) + 
                           '&fleetname=' + encodeURIComponent(fleetname) + 
                           '&searchdate=' + encodeURIComponent(searchdate) + 
                           '&id=1' + 
                           '&engine=' + encodeURIComponent(engine) + 
                           '&chassis=' + encodeURIComponent(chassis));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="8%" /> <col width="17%" /> 
                <col width="10%" /> <col width="25%" /> 
                <col width="8%" /> <col width="12%" />
                <col width="8%" /> <col width="12%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Fleet No</td>
                <td><input type="text" name="searchfleet" id="searchfleet" value='<s:property value="searchfleet"/>'></td>
                
                <td class="lbl-right">Fleet Name</td>
                <td><input type="text" name="searchfleetname" id="searchfleetname" value='<s:property value="searchfleetname"/>'></td>
                
                <td class="lbl-right">Engine No</td>
                <td><input type="text" name="searchengine" id="searchengine" value='<s:property value="searchengine"/>'></td>
                
                <td class="lbl-right">Chassis No</td>
                <td><input type="text" name="searchchassis" id="searchchassis" value='<s:property value="searchchassis"/>'></td>
            </tr>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="searchdocno" id="searchdocno" value='<s:property value="searchdocno"/>'></td>
                
                <td class="lbl-right">Date</td>
                <td><div id="searchdate" name="searchdate"></div></td>
                
                <td class="lbl-right">Reg No</td>
                <td><input type="text" name="searchregno" id="searchregno" value='<s:property value="searchregno"/>'></td>
                
                <td colspan="2" align="right" valign="middle">
                    <input type="button" name="btninvsearch" id="btninvsearch" class="myButton" value="Search" onclick="mainloadSearch(); return false;">
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="srefreshdiv">
            <jsp:include page="subMainSearch.jsp"></jsp:include> 
        </div>
    </div>
    
</div>
</body>
</html>