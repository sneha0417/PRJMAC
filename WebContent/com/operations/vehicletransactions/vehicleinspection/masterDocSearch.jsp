<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
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
   SCOPED UI: Pure White Panel (BRV Standard)
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

/* Strict weight enforcement */
.modern-ui, .modern-ui table, .modern-ui td, .modern-ui input, .modern-ui select, .modern-ui button {
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
    font-family: inherit;
    white-space: nowrap; 
    padding-right: 5px;
}

/* Search Button */
.modern-ui .myButton {
    height: 28px;
    padding: 0 24px;
    background-color: #205fd3; 
    color: #ffffff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    font-weight: 600 !important;
    transition: background-color 0.2s;
    width: 100%;
}

.modern-ui .myButton:hover {
    background-color: #1a4eb8;
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
    $("#searchdate").jqxDateTimeInput({ 
        width: '100%', 
        height: '24px', 
        formatString: "dd.MM.yyyy", 
        value: null,
        theme: 'light'
    });

    setTimeout(function () {
        $(".jqx-datetimeinput").css({"margin-top": "0px", "border-color": "#cccccc", "border-radius": "3px", "background-color": "#ffffff"});
        $(".jqx-datetimeinput").find("input").css({
            "margin-top": "0px", "line-height": "24px", "font-size": "12px", 
            "font-family": "inherit", "padding": "0 6px", "box-sizing":"border-box", "background-color": "#ffffff"
        });
        $(".jqx-datetimeinput").find(".jqx-action-button").css({"top": "0px", "height": "24px"});
    }, 50);

    getGroup();
    getColor();
}); 

function getGroup() {
    $.get("../../../../com/controlcentre/masters/vehiclemaster/getGroup.jsp", function(data) {
        var items = data.split('####');
        var groupItems = items[0].split(",");
        var groupIdItems = items[1].split(",");
        var optionsgroup = '<option value="">--Select--</option>';
        for (var i = 0; i < groupItems.length; i++) {
            optionsgroup += '<option value="' + groupIdItems[i] + '">' + groupItems[i] + '</option>';
        }
        $("select#searchgroup").html(optionsgroup);
    });
}

function getColor() {
    $.get("../../../../com/controlcentre/masters/vehiclemaster/getColor.jsp", function(data) {
        var items = data.split('####');
        var colorItems = items[0].split(",");
        var colorIdItems = items[1].split(",");
        var optionscolor = '<option value="">--Select--</option>';
        for (var i = 0; i < colorItems.length; i++) {
            optionscolor += '<option value="' + colorIdItems[i] + '">' + colorItems[i] + '</option>';
        }
        $("select#searchcolor").html(optionscolor);
    });
}

function mainloadSearch() {
    var fleetno = document.getElementById("searchfleetno").value;
    var docno = document.getElementById("searchdocno").value;
    var regno = document.getElementById("searchregno").value;
    var color = document.getElementById("searchcolor").value;
    var group = document.getElementById("searchgroup").value;
    var searchdate = $('#searchdate').jqxDateTimeInput('val');
    var branch = $('#brchName').val() || "";
    
    getdata(searchdate, fleetno, docno, regno, color, group, branch);
}

function getdata(searchdate, fleetno, docno, regno, color, group, branch) {
    $("#srefreshdiv").load('fleetSearch.jsp?searchdate=' + encodeURIComponent(searchdate) + 
                           '&fleetno=' + encodeURIComponent(fleetno) + 
                           '&docno=' + encodeURIComponent(docno) + 
                           '&regno=' + encodeURIComponent(regno) + 
                           '&color=' + encodeURIComponent(color) + 
                           '&group=' + encodeURIComponent(group) + 
                           '&branch=' + encodeURIComponent(branch));
}
</script>
</head>

<body>
<div id="search" class="modern-ui">
    <div class="search-panel">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="10%" /> <col width="23%" /> 
                <col width="10%" /> <col width="23%" />
                <col width="10%" /> <col width="24%" />
            </colgroup>
            
            <tr>
                <td class="lbl-right">Doc No</td>
                <td><input type="text" name="searchdocno" id="searchdocno" value='<s:property value="searchdocno"/>'></td>
                
                <td class="lbl-right">Date</td>
                <td><div id="searchdate" name="searchdate"></div></td>
                
                <td class="lbl-right">Color</td>
                <td><select name="searchcolor" id="searchcolor"><option value="">--Select--</option></select></td>
            </tr>
            
            <tr>
                <td class="lbl-right">Fleet No</td>
                <td><input type="text" name="searchfleetno" id="searchfleetno"></td>
                
                <td class="lbl-right">Reg No</td>
                <td><input type="text" name="searchregno" id="searchregno"></td>
                
                <td class="lbl-right">Group</td>
                <td><select name="searchgroup" id="searchgroup"><option value="">--Select--</option></select></td>
            </tr>
            
            <tr>
                <td colspan="6" align="right">
                    <button type="button" name="btnSearchExt" id="btnSearchExt" class="myButton" onClick="mainloadSearch();">
                        Search
                    </button>
                </td>
            </tr>
        </table>
    </div>

    <div class="grid-container">
        <div id="srefreshdiv">
            <jsp:include page="docSearch.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>
</html>