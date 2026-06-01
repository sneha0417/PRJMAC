<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%-- <jsp:include page="../../../../includes.jsp"></jsp:include> --%> 
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
    padding: 10px;
    box-sizing: border-box;
    width: 100%;
    background-color: #ffffff !important;
    color: #333333 !important; /* Forced text color to guarantee visibility */
}

/* Strict weight enforcement for injected content */
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select {
    font-weight: 400 !important; 
    color: #333333 !important; /* Forces all table text to be visible dark grey */
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
    color: #333333 !important; /* Forces input text to be visible */
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

/* Table Alignment - 8 Column Layout */
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
    font-weight: 600 !important;
    white-space: nowrap; 
    padding-right: 5px;
}

/* =========================================================
   BULLETPROOF BUTTON UI: Dark Blue + Hover
   Targeting ID #btnmainSearchExt directly to override body.css
========================================================= */
div#search.modern-ui input#btnmainSearchExt.myButton {
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
    font-weight: 600 !important;
    line-height: 24px !important;
    transition: background-color 0.2s ease !important;
    width: 100px !important; /* Neatly sized for the right corner */
    box-sizing: border-box !important;
    float: right; /* Aligns perfectly to the right */
}

/* The Hover State */
div#search.modern-ui input#btnmainSearchExt.myButton:hover {
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
    /* Initialize JQX Date widget to match UI standards */
    $("#msearchdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString: "dd.MM.yyyy", value: null, theme: 'light' });

    /* Force internal alignment for JQX widgets to prevent layout breaks */
    setTimeout(function () {
        $(".jqx-datetimeinput").css({"margin-top": "0px", "border-color": "#cccccc", "border-radius": "3px", "background-color": "#ffffff"});
        $(".jqx-datetimeinput").find("input").css({
            "margin-top": "0px", "line-height": "24px", "font-size": "12px", 
            "font-family": "inherit", "padding": "0 6px", "box-sizing":"border-box", 
            "background-color": "#ffffff", "color": "#333333"
        });
        $(".jqx-datetimeinput").find(".jqx-action-button").css({"top": "0px", "height": "24px"});
    }, 50);
    
    getStatus();
}); 

function masterloadSearch() {
    var reftype = document.getElementById("cmbsearchrtype").value || "";
    /* Safe fetch for JQX Date Value */
    var searchdate = $('#msearchdate').jqxDateTimeInput('val') || "";
    var fleetno = document.getElementById("msearchfleetno").value || "";
    var docno = document.getElementById("msearchdocno").value || "";
    var regno = document.getElementById("msearchregno").value || "";
    var status = document.getElementById("cmbsearchstatus").value || "";

    getdata(reftype, searchdate, fleetno, docno, regno, status);
}

function getStatus() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function() {
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText;
            items = items.split('***');
            var statusItems = items[0].split(",");
            var statusIdItems = items[1].split(",");
            var optionsstatus = '<option value="">--Select--</option>';
            for (var i = 0; i < statusItems.length; i++) {
                optionsstatus += '<option value="' + statusIdItems[i] + '">'
                        + statusItems[i] + '</option>';
            }
            $("select#cmbsearchrtype").html(optionsstatus);
        }
    }
    x.open("GET", "getStatus.jsp", true);
    x.send();
}

/* FIXED: Removed the duplicate 'reftype' parameter from the original function signature */
function getdata(reftype, searchdate, fleetno, docno, regno, status){
    /* Securely encode all variables for the URL */
    $("#mainrefreshdiv").load('subMainSearch.jsp?reftype=' + encodeURIComponent(reftype) + 
                              '&msearchdate=' + encodeURIComponent(searchdate) + 
                              '&mfleetno=' + encodeURIComponent(fleetno) + 
                              '&mdocno=' + encodeURIComponent(docno) + 
                              '&mregno=' + encodeURIComponent(regno) + 
                              '&status=' + encodeURIComponent(status));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">
    
    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="8%" />  <col width="17%" /> <col width="8%" />  <col width="17%" /> <col width="8%" />  <col width="17%" /> <col width="10%" /> <col width="15%" /> </colgroup>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="msearchdocno" id="msearchdocno"></td>
                
                <td class="lbl-right">Ref Type</td>
                <td>
                    <select name="cmbsearchrtype" id="cmbsearchrtype">
                        <option value="">--Select--</option>
                    </select>
                </td>
                
                <td class="lbl-right">Status</td>
                <td>
                    <select name="cmbsearchstatus" id="cmbsearchstatus">
                        <option value="">--Select--</option>
                        <option value="1">IN</option>
                        <option value="0">OUT</option>
                    </select>
                </td>
                
                <td colspan="2" style="padding-left: 10px;">
                    <input type="button" name="btnmainSearchExt" id="btnmainSearchExt" class="myButton" value="Search" onclick="masterloadSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">Date</td>
                <td>
                    <div id="msearchdate" name="msearchdate"></div>
                </td>
                
                <td class="lbl-right">Fleet No</td>
                <td><input type="text" name="msearchfleetno" id="msearchfleetno"></td>
                
                <td class="lbl-right">Reg No</td>
                <td><input type="text" name="msearchregno" id="msearchregno"></td>
                
                <td colspan="2"></td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="mainrefreshdiv">
            <jsp:include page="subMainSearch.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>