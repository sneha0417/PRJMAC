<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String contextPath=request.getContextPath();
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  

<style type="text/css">
/* ===== MASTER LAYOUT COMPLIANT WITH REFERENCE UI ===== */
body, html {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden; 
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif !important;
    background-color: #f4f7f9;
}

#mainBG, .hidden-scrollbar {
    height: 100%;
}

table, td, th, input, select, textarea, button, span, div, label {
    font-family: inherit !important;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
}

/* Sidebar Wrapper Layout */
.sidebar-filters {
    width: 330px;
    flex: 0 0 330px;
    background: #fff;
    border-right: 1px solid #e1e8ed;
    display: flex;
    flex-direction: column;
    height: 100%;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 2;
}

.sidebar-fixed-top {
    padding: 15px 20px;
    border-bottom: 1px solid #f0f4f8;
}

.sidebar-scroll-content {
    flex: 1;
    overflow-y: auto;
    padding: 15px 20px 80px; 
}

.sidebar-scroll-content::-webkit-scrollbar {
    width: 6px;
}
.sidebar-scroll-content::-webkit-scrollbar-track {
    background: transparent;
}
.sidebar-scroll-content::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

/* Right Content Area */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto;
    background: #f4f7f9;
    padding: 15px;
    box-sizing: border-box;
}
.main-content-area::-webkit-scrollbar {
    width: 8px;
}
.main-content-area::-webkit-scrollbar-track {
    background: #f0f4f8;
}
.main-content-area::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

/* UI Cards Panels */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 15px;
}
.grid-card {
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.02);
}
.card-header {
    font-size: 12px; 
    font-weight: 600; 
    color: #4e5e71; 
    margin-bottom: 12px; 
    text-transform: uppercase; 
    letter-spacing: 0.5px;
    border-bottom: 1px solid #e3e8ee;
    padding-bottom: 8px;
}

/* Layout Form Filter Grids */
.release-filter-table {
    width: 100%;
    border-spacing: 0 10px; 
}

.release-filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 11.5px; 
    color: #4e5e71;
    font-weight: 600;
    width: 90px;
    white-space: nowrap; 
    line-height: 1.2;
}

/* ===== ENFORCED UNIFORM 24px GRID INPUTS ELEMENTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
.release-filter-table select {
    width: 100%;
    height: 24px;
    padding: 2px 8px;
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff !important;
    box-shadow: none !important;
    box-sizing: border-box;
    color: #333;
    outline: none;
}

input:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 30px white inset !important;
}

/* Readonly fields styling setup */
input[readonly], select[readonly],
input:disabled, select:disabled,
.release-filter-table input[readonly] {
    background-color: #f3f6f9 !important; 
    color: #555;
    cursor: default;
}

/* Search Box Wrapper Controls */
.search-input-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    width: 100%;
}

.search-input-wrapper input[type="text"] {
    width: 100%;
    padding-right: 26px; 
    cursor: pointer;
}

.search-icon {
    position: absolute;
    right: 6px;
    width: 12px;
    height: 12px;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%23999" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>');
    background-size: cover;
    background-repeat: no-repeat;
    pointer-events: none; 
    opacity: 0.8;
}

/* Form Layout Container Blocks for JQX widgets */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
    $('#loadgriddata').show();
    $('#sumloadgriddata').hide();
    
    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

    // 24px UI standardization
    $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    $("#todate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    
    var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var onemounth = new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
        
    $('#clientsearch').jqxWindow({ width: '50%', height: '55%', maxHeight: '85%', maxWidth: '80%', title: 'Client Search', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
    $('#clientsearch').jqxWindow('close');  
     
    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
    $('#todate').on('change', function (event) {
        var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
        var todates = new Date($('#todate').jqxDateTimeInput('getDate'));
        
        if(fromdates > todates){
            $.messager.alert('Message','To Date Less Than From Date','warning');   
            return false;
        }   
    });
     
    $('#client_name').dblclick(function(){
        $('#clientsearch').jqxWindow('open');
        clientSearchContent('clientSearch.jsp?', $('#clientsearch'));
    });
});

function clientSearchContent(url) {
    $.get(url).done(function (data) {
        $('#clientsearch').jqxWindow('setContent', data);
    }); 
} 

function funExportBtn() {
    $("#loadgriddata").excelexportjs({
        containerid: "loadgriddata",   
        datatype: 'json',
        dataset: null,
        gridId: "jqxloaddataGrid",
        columns: getColumns("jqxloaddataGrid"),   
        worksheetName:"Job Progress Report"  
    });   
}

function funsumm() {
    var summtype = document.getElementById("summtype").value;
    if(summtype == "sal" || summtype == "daily" || summtype == "weekly") {
        $('#loadgriddata').hide();
        $('#sumloadgriddata').show();
    } else {
        $('#loadgriddata').show();
        $('#sumloadgriddata').hide();
    }
    
    if(summtype == "sal"){
        $('#jqxsumloaddataGrid').jqxGrid('hidecolumn', 'jdate');
        $('#jqxsumloaddataGrid').jqxGrid('showcolumn', 'sal_name');
        $('#jqxsumloaddataGrid').jqxGrid('showcolumn', 'disper');
    } else {
        $('#jqxsumloaddataGrid').jqxGrid('showcolumn', 'jdate');
        $('#jqxsumloaddataGrid').jqxGrid('hidecolumn', 'sal_name');
        $('#jqxsumloaddataGrid').jqxGrid('hidecolumn', 'disper');
    }
}

function funreload(event) {
    var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var todates = new Date($('#todate').jqxDateTimeInput('getDate'));
     
    if(fromdates > todates){
        $.messager.alert('Message','To Date Less Than From Date','warning');   
        return false;
    }
     	 
    var barchval = document.getElementById("cmbbranch") ? document.getElementById("cmbbranch").value : "";
    var fromdate = $("#fromdate").val();
    var todate = $("#todate").val();
    var rds;
    var type = document.getElementById("cmbjobtype").value;
    var summtype = document.getElementById("summtype").value;
    $("#overlay, #PleaseWait").show();
     
    if(summtype == "sal" || summtype == "daily" || summtype == "weekly") {
        $("#sumloadgriddata").load("sumgridDetails.jsp?barchval="+barchval+"&froms="+fromdate+"&tos="+todate+"&rds="+rds+"&summtype="+summtype+"&type="+type);
    } else {
        $("#loadgriddata").load("gridDetails.jsp?barchval="+barchval+"&froms="+fromdate+"&tos="+todate+"&type="+type+"&rds="+rds+"&summtype="+summtype);
    }	
}
</script>
</head>

<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-fixed-top">
            <div class="filter-card" style="padding: 10px; margin-bottom: 0;">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>
        </div>

        <div class="sidebar-scroll-content">
            
            <div class="filter-card" style="display: none;" id="branchdiv_wrapper">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Branch</td>
                        <td>
                            <select id="cmbbranch" name="cmbbranch" onchange="funreload(event);">
                                <option value="">--Select--</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">From</td>
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Job Type</td>
                        <td>
                            <select id="cmbjobtype" name="cmbjobtype" value='<s:property value="cmbjobtype"/>'>
                                <option value="all">ALL</option>
                                <option value="full">FULL</option>
                                <option value="partial">PARTIAL</option>
                            </select>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="label-cell">Summary</td>
                        <td>
                            <select id="summtype" name="summtype" onchange="funsumm();" value='<s:property value="summtype"/>'>
                                <option value="">Select</option>
                                <option value="job">Job wise</option>
                                <option value="sal">Salesman wise</option>
                                <option value="daily">Daily</option>
                                <option value="weekly">Weekly</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
            <input type="hidden" id="assigngrpid" name="assigngrpid" value='<s:property value="assigngrpid"/>'>
            <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>

        </div>
    </div>

    <div class="main-content-area">
        
        <div class="grid-card">
            <div class="card-header">Job Progress Data Results</div>
            
            <div id="loadgriddata">
                <jsp:include page="gridDetails.jsp"></jsp:include> 
            </div>
            
            <div id="sumloadgriddata"></div>
        </div>

    </div>

</div>

<div id="clientsearch"><div></div></div>
<div id="assigngrpwindow"><div></div></div>

</div>
</div>
</body>
</html>