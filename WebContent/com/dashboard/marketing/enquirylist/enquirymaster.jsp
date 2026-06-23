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
/* ===== MASTER LAYOUT ===== */
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

/* Sidebar */
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

/* Cards */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

/* Tables */
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
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
.release-filter-table select {
    width: 100%;
    height: 24px;             
    padding: 2px 8px;         
    border: 1px solid #ccd6e0;
    border-radius: 4px;       
    font-size: 12px;          
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
}

/* Readonly / disabled look */
input[readonly],
input:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* Modernized Clear Button */
.btn-clear {
    width: 100%;
    height: 28px;
    background: linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
    background-color: #768d87;
    border: 1px solid #566963;
    border-radius: 4px;
    color: #ffffff;
    font-size: 12px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
    display: flex;
    align-items: center;
    justify-content: center;
}

.btn-clear:hover {
    background: linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
    background-color: #6c7c7c;
}

.btn-clear:active {
    transform: translateY(1px);
}

/* Main Content Area */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow: auto;
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}
/* ===== STANDARDIZED BLUE BUTTON (AS PER IMAGE) ===== */
.btn-primary, .btn-clear {
    width: 100%;
    height: 28px;
    background-color: #1e6bf2; /* Exact vibrant blue from your image */
    border: none;
    border-radius: 8px;        /* Smooth rounded corners matching your upload */
    color: #ffffff;
    font-size: 12px;
    font-weight: 700;          /* Bold typography */
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
    display: flex;
    align-items: center;
    justify-content: center;
}

.btn-primary:hover, .btn-clear:hover {
    background-color: #1656c7; /* Subtle deep blue on hover */
}

.btn-primary:active, .btn-clear:active {
    transform: scale(0.98);    /* Tap/click feedback effect */
}
</style>

<script type="text/javascript">
$(document).ready(function () {
    $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
    $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

    // Enforced 100% width and 24px height to match reference UI standard
    $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    $("#todate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
    
    $('#clinfowindow').jqxWindow({ width: '30%', height: '55%', maxHeight: '85%', maxWidth: '80%', title: 'Client Search', position: { x: 200, y: 120 }, keyboardCloseKey: 27});
    $('#clinfowindow').jqxWindow('close');
    
    $('#sourcewindow').jqxWindow({ width: '25%', height: '60%', maxHeight: '62%', maxWidth: '60%', title: 'Source Search', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
    $('#sourcewindow').jqxWindow('close');
    
    $('#salmwindow').jqxWindow({ width: '25%', height: '60%', maxHeight: '62%', maxWidth: '60%', title: 'Sales Man Search', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
    $('#salmwindow').jqxWindow('close');
    
    $('#areawindow').jqxWindow({ width: '25%', height: '60%', maxHeight: '62%', maxWidth: '60%', title: 'Area Search', position: { x: 250, y: 120 }, keyboardCloseKey: 27});
    $('#areawindow').jqxWindow('close');
    
    var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var onemounth = new Date(new Date(fromdates).setMonth(fromdates.getMonth() - 1)); 
    
    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
    
    $('#todate').on('change', function (event) {
        var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
        var todates = new Date($('#todate').jqxDateTimeInput('getDate')); 
        
        if(fromdates > todates){
            $.messager.alert('Message','To Date Less Than From Date ','warning');   
            return false;
        }   
    });

    $('#clientname').dblclick(function(){
        $('#clinfowindow').jqxWindow('open');
        $('#clinfowindow').jqxWindow('focus');
        clinfoSearchContent('clientinfo.jsp'); 
    });
    
    $('#srcname').dblclick(function(){
        $('#sourcewindow').jqxWindow('open');
        sourcesearchContent('sourcesearch.jsp'); 
    });
    
    $('#salname').dblclick(function(){
        $('#salmwindow').jqxWindow('open');
        salmsearchContent('salmsearch.jsp'); 
    });
    
    $('#txtarea').dblclick(function(){
        $('#areawindow').jqxWindow('open');
        areaSearchContent('area.jsp'); 
    });
});

function getsalminfo(event){
    var x = event.keyCode;
    if(x == 114){
        $('#salmwindow').jqxWindow('open');
        salmsearchContent('salmsearch.jsp');
    }
} 

function salmsearchContent(url) {
    $.get(url).done(function (data) {
        $('#salmwindow').jqxWindow('open');
        $('#salmwindow').jqxWindow('setContent', data);
    }); 
}

function getsrcinfo(event){
    var x = event.keyCode;
    if(x == 114){
        $('#sourcewindow').jqxWindow('open');
        sourcesearchContent('sourcesearch.jsp');
    }
} 

function sourcesearchContent(url) {
    $.get(url).done(function (data) {
        $('#sourcewindow').jqxWindow('open');
        $('#sourcewindow').jqxWindow('setContent', data);
    }); 
}

function getclientinfo(event){
    var x = event.keyCode;
    if(x == 114){
        $('#clinfowindow').jqxWindow('open');
        clinfoSearchContent('clientinfo.jsp');
    }
}

function clinfoSearchContent(url) {
    $.get(url).done(function (data) {
        $('#clinfowindow').jqxWindow('setContent', data);
    }); 
}

function funExportBtn(){
    JSONToCSVCon(enqlistexcel, 'Enquiry List', true);
}

function funreload(event) {
    var fromdates = new Date($('#fromdate').jqxDateTimeInput('getDate'));
    var todates = new Date($('#todate').jqxDateTimeInput('getDate')); 
    
    if(fromdates > todates){
        $.messager.alert('Message','To Date Less Than From Date ','warning');   
        return false;
    } else {
        var barchval = document.getElementById("cmbbranch").value;
        var fromdate = $("#fromdate").val();
        var todate = $("#todate").val();
        var clientname = $("#cldocno").val();
        var srcno = $("#srcno").val();
        var salid = $("#salid").val();
        var areaid = $("#areaid").val();
        
        $("#Countgrid").load("Countgrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&srcno="+srcno+"&salid="+salid+"&clientname="+clientname+"&areaid="+areaid);
    }
}

function funClearData(){
    $('#clientname').val('');
    $('#cldocno').val('');
    $('#srcname').val('');
    $('#srcno').val('');
    $('#salname').val('');
    $('#salid').val('');
    $('#areaid').val('');
    $('#txtarea').val('');
    
    $('#clientname').attr('placeholder', 'Press F3 To Search');
    $('#srcname').attr('placeholder', 'Press F3 To Search');
    $('#salname').attr('placeholder', 'Press F3 To Search');
    $('#txtarea').attr('placeholder', 'Press F3 To Search');
}	

function getareas(event){
    var x = event.keyCode;
    if(x == 114){
        $('#areawindow').jqxWindow('open');
        areaSearchContent('area.jsp?getarea=0');
    }
}
        	 
function areaSearchContent(url) {
    $.get(url).done(function (data) {
        $('#areawindow').jqxWindow('setContent', data);
    }); 
}
</script>
</head>

<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">
    
    <div class="sidebar-filters">
        <div class="sidebar-fixed-top">
            <div class="filter-card" style="padding: 10px;">
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
   
                    <tr>
                        <td class="label-cell">Client</td>
                        <td><input type="text" id="clientname" name="clientname" readonly="readonly" placeholder="Press F3 To Search" value='<s:property value="clientname"/>' onKeyDown="getclientinfo(event);"></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Source</td>
                        <td><input type="text" id="srcname" name="srcname" readonly="readonly" placeholder="Press F3 To Search" value='<s:property value="srcname"/>' onKeyDown="getsrcinfo(event);"></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Sales Man</td>
                        <td><input type="text" id="salname" name="salname" readonly="readonly" placeholder="Press F3 To Search" value='<s:property value="salname"/>' onKeyDown="getsalminfo(event);"></td>
                    </tr>

                    <tr>
                        <td class="label-cell">Area</td>
                        <td><input type="text" id="txtarea" name="txtarea" readonly="readonly" placeholder="Press F3 To Search" value='<s:property value="txtarea"/>' onKeyDown="getareas(event);"/></td>
                    </tr>
                </table>
                
                <div style="margin-top: 15px; padding: 0 5px;">
                    <button type="button" class="btn-clear" onclick="funClearData();">Clear Filters</button>
                </div>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id="Countgrid"><jsp:include page="Countgrid.jsp"></jsp:include></div>
            </div>

            <input type="hidden" id="cldocno" name="cldocno">
            <input type="hidden" id="srcno" name="srcno">
            <input type="hidden" id="salid" name="salid">
            <input type="hidden" id="areaid" name="areaid">
        </div>
    </div>

    <div class="main-content-area">
        <div id="enqlistdiv">
            <jsp:include page="enquirylistGrid.jsp"></jsp:include>
        </div>
    </div>

</div>

<div id="clinfowindow"><div></div></div> 
<div id="sourcewindow"><div></div></div>
<div id="areawindow"><div></div></div>
<div id="salmwindow"><div></div></div>

</div>
</div>
</body>
</html>