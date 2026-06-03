
<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 
<script type="text/javascript">

$(document).ready(function () {
	$("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1001; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:200;right:600;'><img src='../../../../icons/31load.gif'/></div>");    
	$("#regexpdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	$("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	var curfromdate=$('#fromdate').jqxDateTimeInput('getDate');
	var onemonthbackdate=new Date(curfromdate.setMonth(curfromdate.getMonth()-1));
	$('#fromdate').jqxDateTimeInput('setDate', onemonthbackdate);
	$('#clientwindow').jqxWindow({ width: '62%', height: '65%',  maxHeight: '85%' ,maxWidth: '80%' , title: 'Client Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	$('#clientwindow').jqxWindow('close'); 
	$('#client').dblclick(function(){
		$('#clientwindow').jqxWindow('open');
		$('#clientwindow').jqxWindow('focus');
	 	clientSearchContent('clientMasterSearch.jsp', $('#clientwindow'));
	});
});

function getClient(event){
	var x= event.keyCode;
   	if(x==114){
   		$('#clientwindow').jqxWindow('open');
 		$('#clientwindow').jqxWindow('focus');
 		clientSearchContent('clientMasterSearch.jsp', $('#clientwindow'));
   }
   else{
   }
}
function clientSearchContent(url) {
	$.get(url).done(function (data) {
   		$('#clientwindow').jqxWindow('setContent', data);
	}); 
}
function funreload(event)
{
	 var barchval = document.getElementById("cmbbranch").value;
	 var exdate = $('#regexpdate').val();
	 var fromdate = $('#fromdate').jqxDateTimeInput('val');
	 var cldocno=$('#cldocno').val();
	 $("#overlay, #PleaseWait").show(); 
	 $("#explistdiv").load("registrationExpairyGrid.jsp?barchval="+barchval+'&exdate='+exdate+'&fromdate='+fromdate+'&id=1&cldocno='+cldocno);
}
	
function changeAttachContent(url) {
	$.get(url).done(function (data) {
		    $('#windowattach').jqxWindow('open');
		  
			$('#windowattach').jqxWindow('setContent',data);
			 $('#windowattach').jqxWindow('bringToFront');
}); 
}

function funExportBtn(){
	  
	   
	   
	   if(parseInt(window.parent.chkexportdata.value)=="1")
		 {
		 JSONToCSVCon(expdata, 'Registration Expiry', true);
		 }
	 else
		 {
		 $("#regexpgrid").jqxGrid('exportdata', 'xls', 'Registration Expiry');
		 }
		   
	   
	   
	   
	 }


</script>
<style>
/* ===== GLOBAL RESET & STRICT FONT ENFORCER ===== */
html, body, table, td, th, input, select, textarea, button, span, div, label {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif !important;
}

body {
    background-color: #f4f7f9;
}

/* ===== THE NUCLEAR FIX: FIXED SIDEBAR ===== */
/* Detaches the sidebar from the table and locks it strictly to the viewport */
.fixed-sidebar-container {
    position: fixed; 
    top: 0;                   
    bottom: 0; /* Locks to the exact bottom of the browser */
    left: 0;
    width: 310px; 
    overflow-y: auto; /* Guarantees a scrollbar */
    background: #fff;
    border-right: 1px solid #e1e8ed;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 9999; 
}

.fixed-sidebar-container::-webkit-scrollbar {
    width: 6px;
}
.fixed-sidebar-container::-webkit-scrollbar-track {
    background: transparent;
}
.fixed-sidebar-container::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

.sidebar-content-padding {
    padding: 15px;
    padding-bottom: 100px; /* Massive padding guarantees scrolling past the bottom */
}

/* ===== INDEPENDENT SCROLLABLE RIGHT COLUMN ===== */
.scrollable-column {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    overflow-y: auto;
}
.scrollable-column::-webkit-scrollbar {
    width: 8px;
}
.scrollable-column::-webkit-scrollbar-track {
    background: #f0f4f8;
}
.scrollable-column::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

/* Cards */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px 12px;
    margin-bottom: 15px;
}

/* Tables */
.release-filter-table {
    width: 100%;
    border-spacing: 0 12px; 
}

/* WIDENED LABELS */
.release-filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 11.5px; 
    color: #4e5e71;
    font-weight: 600;
    width: 110px; 
    white-space: nowrap; 
    line-height: 1.2;
}

/* ===== UNIFORM INPUTS ===== */
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

input[readonly], select[readonly], textarea[readonly],
input:disabled, select:disabled, textarea:disabled {
    background-color: #f8fafc !important; 
    color: #555;
    cursor: default;
}

/* ===== SEARCH INFRASTRUCTURE ===== */
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

/* Sleek SVG Clear Button */
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

/* jqx date containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="regexpdate"] {
    width: 100%;
}
</style>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<table width="100%" cellspacing="0" cellpadding="0" style="height: 100%;">
<tr>

<td width="310" style="width: 310px; min-width: 310px; padding: 0;">
    
    <div class="fixed-sidebar-container">
        <div class="sidebar-content-padding">
            
            <div class="filter-card">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">From</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id="regexpdate" name="regexpdate" value='<s:property value="regexpdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div style="display: flex; width: 100%; align-items: center; gap: 4px;">
                                <div class="search-input-wrapper" style="flex: 1;">
                                    <input type="text" name="client" id="client" readonly="readonly" placeholder="Double click to search" onKeyDown="getClient(event);" ondblclick="getClient(event);">
                                    <div class="search-icon"></div>
                                </div>
                                <button type="button" class="btn-clear-inline" id="clear" title="Clear" onclick="document.getElementById('client').value=''; document.getElementById('cldocno').value='';"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="#64748b" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                </button>
                            </div>
                            <input type="hidden" name="cldocno" id="cldocno">
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id="pieChart1" style="width: 100%; height: 170px;"></div>
            </div>

        </div>
    </div>

</td>

<td style="height: 100%; vertical-align: top; position: relative; padding: 0; background: #fff;">
    <div class="scrollable-column">
        <div style="padding: 15px;">
            <div id="explistdiv">
                <jsp:include page="registrationExpairyGrid.jsp"></jsp:include>
            </div>
        </div>
    </div>
</td>

</tr>
</table>

<div id="clientwindow">
    <div></div>
</div>

</div>
</div>
</body>
</html>