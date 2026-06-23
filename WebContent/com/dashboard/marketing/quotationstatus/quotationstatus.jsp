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
body, html, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
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
    padding: 15px 20px 25px;
}

/* Sidebar Custom Scrollbar */
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

/* UI Cards Panels */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

/* Specific styling for the Action Cards (View/Add) */
.card-header {
    font-size: 11px; 
    font-weight: 600; 
    color: #4e5e71; 
    margin-bottom: 10px; 
    text-transform: uppercase; 
    letter-spacing: 0.5px;
    border-bottom: 1px solid #e3e8ee;
    padding-bottom: 5px;
}

.action-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    justify-content: center;
}

.action-grid button {
    flex: 1;
    min-width: 45%; 
}

.action-grid .btn-full {
    flex: 100%;
}

/* Layout Form Filter Grids */
.release-filter-table {
    width: 100%;
    border-spacing: 0 10px; 
}

.release-filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 12px; 
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

/* Form Layout Container Blocks for JQX widgets */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    height: 28px;
    background-color: #1e6bf2;
    border: none;
    border-radius: 8px;
    color: #ffffff;
    font-size: 12px;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 10px;
}

.btn-primary:hover {
    background-color: #1656c7;
}

.btn-primary:active {
    transform: scale(0.98);
}

.btn-primary:disabled {
    background-color: #9abaf5;
    cursor: not-allowed;
    transform: none;
}

.btn-secondary {
    background-color: #64748b;
}

.btn-secondary:hover {
    background-color: #475569;
}

/* Flexible Right Workspace Panel */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow: auto;
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

    $("body").prepend('<div id="overlaysub" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWaitsub' style='display: none;position:absolute; z-index: 1;top:330px;right:1180px;'><img src='../../../../icons/31load.gif'/></div>");
    
    // 24px UI Height enforcement criteria
    $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    $("#todate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    
    var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var onemounth = new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
        
    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
    
    $('#todate').on('change', function (event) {
        var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
        var todates = new Date($('#todate').jqxDateTimeInput('getDate')); //del date
        
        if(fromdates > todates){
            $.messager.alert('Message','To Date Less Than From Date ','warning');   
            return false;
        }   
    });
});

function funExportBtn(){
    $("#loadgriddata").excelexportjs({
        containerid: "loadgriddata",   
        datatype: 'json',
        dataset: null,
        gridId: "jqxloaddataGrid",
        columns: getColumns("jqxloaddataGrid") ,   
        worksheetName:"Quotation Status"  
    });   
}

function funreload(event) {
    var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var todates = new Date($('#todate').jqxDateTimeInput('getDate')); //del date
        
    if(fromdates > todates){
        $.messager.alert('Message','To Date Less Than From Date ','warning');   
        return false;
    }
        
    var barchval = document.getElementById("cmbbranch").value;
    var fromdate = $("#fromdate").val();
    var todate = $("#todate").val();
    
    $("#overlaysub, #PleaseWaitsub").show();
    $("#Countgrid").load("Countgrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate);
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

            <div class="filter-card" style="padding: 10px;">
                <div id="Countgrid">
                    <jsp:include page="Countgrid.jsp"></jsp:include>
                </div>
            </div>

            <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>

        </div>
    </div>

    <div class="main-content-area">
        <div id="loadgriddata">
            <jsp:include page="gridDetails.jsp"></jsp:include> 
        </div>
    </div>

</div>

</div>
</div>
</body>
</html>