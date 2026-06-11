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
    border-spacing: 10px 8px; 
    width: 100%;
}

.modern-ui .lbl-right { 
    text-align: right; 
    color: #333333 !important; 
    font-size: 12px; 
    font-weight: bold !important;
    white-space: nowrap; 
}

/* Standardized Modern UI Button */
div#search.modern-ui input.myButton {
    height: 24px !important; 
    padding: 0 24px !important;
    background-color: #205fd3 !important;
    background-image: none !important;
    color: #ffffff !important;
    border: none !important;
    border-radius: 4px !important; 
    cursor: pointer !important;
    font-family: Arial, sans-serif !important; 
    font-size: 12px !important;
    font-weight: bold !important;
    width: auto !important;
    line-height: 24px !important;
    transition: background-color 0.2s ease !important;
}

div#search.modern-ui input.myButton:hover {
    background-color: #124096 !important;
}

.modern-ui .grid-container {
    background-color: #ffffff !important;
    border: 1px solid #cccccc;
    border-radius: 4px;
    overflow: hidden;
    min-height: 200px;
}
</style>

<script type="text/javascript">
function loadSearch() {
    var vndname = document.getElementById("txtvendorsname").value || "";
    var vndaccno = document.getElementById("txtaccountno").value || "";
    var vndmob = document.getElementById("txtmobile").value || "";
    var vndtel = document.getElementById("txttelephone").value || "";
    getdata(vndname, vndaccno, vndmob, vndtel);
}

function getdata(vndname, vndaccno, vndmob, vndtel) {
    $("#refreshdiv").load('vndMainSearchGrid.jsp?vndname=' + encodeURIComponent(vndname) + 
                          '&vndaccno=' + encodeURIComponent(vndaccno) + 
                          '&vndmob=' + encodeURIComponent(vndmob) + 
                          '&vndtel=' + encodeURIComponent(vndtel));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">

    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="8%" /> <col width="60%" /> <col width="32%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Name</td>
                <td><input type="text" name="txtvendorsname" id="txtvendorsname" value='<s:property value="txtvendorsname"/>'></td>
                <td align="center">
                    <input type="button" name="btnsearch" id="btnsearch" class="myButton" value="Search" onclick="loadSearch(); return false;">
                </td>
            </tr>
            
            <tr>
                <td class="lbl-right">A/C No.</td>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="25%"><input type="text" name="txtaccountno" id="txtaccountno" value='<s:property value="txtaccountno"/>'></td>
                            <td class="lbl-right" width="10%">Mob No.</td>
                            <td width="25%"><input type="text" name="txtmobile" id="txtmobile" value='<s:property value="txtmobile"/>'></td>
                            <td class="lbl-right" width="10%">Tel No.</td>
                            <td width="25%"><input type="text" name="txttelephone" id="txttelephone" value='<s:property value="txttelephone"/>'></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="refreshdiv">
            <jsp:include page="vndMainSearchGrid.jsp"></jsp:include>
        </div>
    </div>
    
</div>
</body>
</html>