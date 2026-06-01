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

/* Table Alignment - 5 Column Layout */
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
   Targeting ID #btnsearch directly to override body.css
========================================================= */
div#search.modern-ui input#btnsearch.myButton {
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
    // Initialization code if needed
}); 

function loadSearch() {
    var employeeName = document.getElementById("txtpartyname").value || "";
    var empId = document.getElementById("txtpartyid").value || "";
    var contactNo = document.getElementById("txtcontactno").value || "";
    
    /* Extra safe fallback for cross-frame element to prevent crashing */
    var employeebranchchk = "";
    try {
        if (window.parent && window.parent.employeebranchchk) {
            employeebranchchk = window.parent.employeebranchchk.value || "";
        }
    } catch(e) {
        console.warn("Parent frame access denied or element missing.");
    }
    
    /* Safe fallback for missing brchName element */
    var brchElem = document.getElementById("brchName");
    var brhid = brchElem ? brchElem.value : "";
    
    getdata(employeeName, empId, contactNo, employeebranchchk, brhid);
}

function getdata(employeeName, empId, contactNo, employeebranchchk, branch) {
    /* Securely encode all variables for the URL */
    $("#refreshdiv").load('employeeDetailsSearchGrid.jsp?employeename=' + encodeURIComponent(employeeName) + 
                          '&empid=' + encodeURIComponent(empId) + 
                          '&branchid=' + encodeURIComponent(branch) + 
                          '&contactno=' + encodeURIComponent(contactNo) + 
                          '&employeebranchchk=' + encodeURIComponent(employeebranchchk));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">
    
    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> 
                <col width="30%" /> 
                <col width="10%" /> 
                <col width="30%" /> 
                <col width="20%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Name</td>
                <td colspan="3"><input type="text" name="txtpartyname" id="txtpartyname" value='<s:property value="txtpartyname"/>'></td>
                
                <td align="center" rowspan="2" valign="middle" style="padding-left: 10px;">
                    <input type="button" name="btnsearch" id="btnsearch" class="myButton" value="Search" onclick="loadSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">ID#</td>
                <td><input type="text" name="txtpartyid" id="txtpartyid" value='<s:property value="txtpartyid"/>'></td>
                
                <td class="lbl-right">Contact No.</td>
                <td>
                    <input type="text" name="txtcontactno" id="txtcontactno" value='<s:property value="txtcontactno"/>'>
                    <input type="hidden" name="txtatype" id="txtatype" value='<s:property value="txtatype"/>'>
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdiv">
            <jsp:include page="employeeDetailsSearchGrid.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>