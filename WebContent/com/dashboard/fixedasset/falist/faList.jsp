<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>

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
.release-filter-table div[id^="periodupto"] {
    width: 100%;
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
</style>

<script type="text/javascript">

$(document).ready(function () {
	
	 $("#periodupto").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $('#assetwindow').jqxWindow({ width: '40%', height: '60%',  maxHeight: '60%' ,maxWidth: '40%' , title: 'Asset Group Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#assetwindow').jqxWindow('close');
	  
	 $('#assetgrp').dblclick(function(){
		 $('#assetwindow').jqxWindow('open');
		 $('#assetwindow').jqxWindow('focus');
		 assetSearchContent('assetGroupSearch.jsp', $('#assetwindow'));
	 });
});

function getAssetGroup(event){
	var x= event.keyCode;
	if(x==114){
		$('#assetwindow').jqxWindow('open');
		$('#assetwindow').jqxWindow('focus');
		assetSearchContent('assetGroupSearch.jsp', $('#assetwindow'));
	}
	else{}
}

function assetSearchContent(url) {
	$.get(url).done(function (data) {
		$('#assetwindow').jqxWindow('setContent', data);
	}); 
}

function funreload(event){
	$("#falistdiv").load("faListGrid.jsp?branch="+document.getElementById("cmbbranch").value+"&assetgroup="+document.getElementById("hidassetgrp").value+'&check=1');
}

function setValues(){
	if($('#msg').val()!=""){
		$.messager.alert('Message',$('#msg').val());
	}
}

function funExportBtn(){
	JSONToCSVCon(exportdata, 'Fixed Asset List', true);
}

</script>
</head>
<body onload="getBranch();setValues();">
<form id="frmFAList" action="frmFAList" method="post">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">

    <!-- ===== SIDEBAR ===== -->
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
                        <td class="label-cell">Period Upto</td>
                        <td><div id="periodupto"></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Asset Group</td>
                        <td><input type="text" name="assetgrp" id="assetgrp" readonly placeholder="Press F3 to Search" onKeyDown="getAssetGroup(event);"></td>
                    </tr>
                </table>
                <input type="hidden" name="hidassetgrp" id="hidassetgrp">
                <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'>
                <input type="hidden" name="msg" id="msg" value='<s:property value="msg"/>'>
            </div>
        </div>
    </div>

    <!-- ===== MAIN CONTENT ===== -->
    <div class="main-content-area">
        <div id="falistdiv"><jsp:include page="faListGrid.jsp"></jsp:include></div>
    </div>

</div>

<div id="assetwindow">
    <div></div>
</div>

</div>
</form>
</body>
</html>
