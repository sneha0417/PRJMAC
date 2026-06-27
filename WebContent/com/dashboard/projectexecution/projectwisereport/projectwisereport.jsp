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
input[readonly]:not([readonly="false"]), 
select[readonly]:not([readonly="false"]),
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

/* Cleaner Clear Control Component */
.btn-clear-inline {
    background: transparent;
    border: none;
    cursor: pointer;
    padding: 2px 2px 2px 6px; 
    display: flex;
    align-items: center;
    justify-content: center;
}
.btn-clear-inline svg {
    opacity: 0.6;
    transition: opacity 0.2s;
}
.btn-clear-inline:hover svg {
    opacity: 1;
    stroke: #dc2626;
}

/* Form Layout Container Blocks for JQX widgets */
.release-filter-table div[id^="frmdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
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

/* Grid Cards */
.grid-card {
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.02);
}
</style>

<script type="text/javascript">

$(document).ready(function () {
    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
            
    $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
    $('#clientsearch1').jqxWindow('close');
          
    // Enforced 24px JQX Criteria
    $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
    $("#frmdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
    
    var todates=new Date($('#todate').jqxDateTimeInput('getDate'));
    var onemounth=new Date(new Date(todates).setMonth(todates.getMonth()-1)); 
        
    $('#todate').jqxDateTimeInput('setDate', new Date());
    $('#frmdate').jqxDateTimeInput('setDate', onemounth);
    
    $('#txtclient').dblclick(function(){
        $('#clientsearch1').jqxWindow('open');
        clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
    });
});

function getclinfo(event){
    var x= event.keyCode;
    if(x==114){
        $('#clientsearch1').jqxWindow('open');
        clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    
    }
} 

function clientSearchContent(url) {
    $.get(url).done(function (data) {
        $('#clientsearch1').jqxWindow('setContent', data);
    }); 
}

function funExportBtn(){
    JSONToCSVCon(exdata,'ProjectWiseBalanceReport',true);
}

function funreload() {
    var clientid=$('#clientid').val();
    var date=$('#todate').val();
    var frmdate=$('#frmdate').val();
    var barchval = document.getElementById("cmbbranch").value;
    var dtype=$('#cmbreftype').val();
    var cstatus=$('#cmbstatus').val();
    var id=1,check=1;
    
    if(dtype==""){
        $.messager.alert('Message',"select a Contract Type");
        return 0;
    }
    
    $("#overlay, #PleaseWait").show();
    if(id>0){
        $("#projectwisediv").load("projectWiseDetails.jsp?clientid="+clientid+"&date="+date+"&barchval="+barchval+"&dtype="+dtype+"&id="+id+"&cstatus="+cstatus+"&frmdate="+frmdate+"&check="+check);
    }
}
    
function funClear(){
    $("#jqxprojectwiseGrid").jqxGrid('clear');
    $("#jqxprojectwiseGrid").jqxGrid('addrow', null, {});
    
    document.getElementById("txtclient").value="";
    document.getElementById("clientid").value="0";
    $("#txtclient").attr("placeholder", "press F3 for Search");
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
                        <td class="label-cell">From Date</td>
                        <td><div id='frmdate' name='frmdate' value='<s:property value="frmdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To Date</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div style="display: flex; align-items: center; gap: 4px; width: 100%;">
                                <div class="search-input-wrapper" style="flex: 1;">
                                    <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' onKeyDown="getclinfo(event);" ondblclick="getclinfo(event);" readonly="readonly" placeholder="Double click to search">
                                    <div class="search-icon"></div>
                                </div>
                                <button type="button" class="btn-clear-inline" id="clear" title="Clear" onclick="funClear()"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Contr. Type</td>
                        <td>
                            <select id="cmbreftype" name="cmbreftype" value='<s:property value="cmbreftype"/>'>
                                <option value=""></option>
                                <option value="AMC">AMC</option>
                                <option value="SJOB">SJOB</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Contr. Status</td>
                        <td>
                            <select id="cmbstatus" name="cmbstatus" value='<s:property value="cmbstatus"/>'>
                                <option value=""></option>
                                <option value="1">HOLD</option>
                                <option value="2">CLOSED</option>
                                <option value="3">COMPLETED</option>
                                <option value="4">STARTED</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>

        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-card">
            <div id="projectwisediv">
                <jsp:include page="projectWiseDetails.jsp"></jsp:include> 
            </div>
        </div>
    </div>

</div> 

<div id="clientsearch1">
    <div></div>
</div> 

</div>
</div>
</body>
</html>