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

<style type="text/css">
/* ===== MASTER LAYOUT ===== */
body, html, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden; /* Prevents whole-page scrolling, delegates to specific panes */
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
}

/* Sidebar (LEFT SIDE ONLY) */
.sidebar-filters {
    width: 350px;
    flex: 0 0 350px;
    background: #fff;
    border-right: 1px solid #e1e8ed;
    display: flex;
    flex-direction: column;
    height: 100%;
    overflow-y: auto; /* Independent Sidebar Scrollbar */
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 2;
}

.sidebar-fixed-top {
    padding: 15px 20px;
    border-bottom: 1px solid #f0f4f8;
}

.sidebar-scroll-content {
    flex: 1;
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
    width: 80px;
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

/* Readonly / disabled look - NO BAN ICON */
input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default; /* Forces normal cursor instead of not-allowed */
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* Main Buttons replacing old .myButtons */
.btn-submit {
    flex: 1;
    height: 30px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
    width: 100%;
}
.btn-submit:hover:not(:disabled) { background: #1d4ed8; }
.btn-submit:disabled { background: #9ca3af; }
.btn-submit:active:not(:disabled) { transform: scale(0.98); }

.btn-secondary { background: #64748b; }
.btn-secondary:hover:not(:disabled) { background: #475569; }

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 15px;
    justify-content: center;
}

/* Main Content Area (RIGHT SIDE) */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto; /* Independent Main Content Scrollbar */
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}
/* Universal rule: Targets ANY div whose ID contains the word "time" */
div[id*="time"] {
    width: 50px !important;
    min-width: 50px !important;
    max-width: 50px !important;
}

/* Universal rule: Targets ANY div whose ID contains the word "date" */
div[id*="date"] {
    width: 100px !important;
    min-width: 100px !important;
    max-width: 100px !important;
}


</style>

<script type="text/javascript">
$(document).ready(function () {
	$("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	$("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	$('#accountSearchwindow').jqxWindow({ width: '50%', height: '62%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Account Search' ,position: { x: 150, y: 60 }, keyboardCloseKey: 27});
	$('#accountSearchwindow').jqxWindow('close');
	
    // Enforced 100% width and 24px height
	$("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	$("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	
    var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	$('#todate').on('change', function (event) {
		var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
		// out date
		var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		if(fromdates>todates){
			$.messager.alert('Message','To Date Less Than From Date  ','warning');   
			return false;
		}   
	});
	 
	$('#account').dblclick(function(){
		$('#accountSearchwindow').jqxWindow('open');
		accountSearchContent('accountsDetailsSearch.jsp?');
	});   
});

function funExportBtn(){
	$("#orderlist").jqxGrid('exportdata', 'xls', 'Puchase Cancel List');
}

function getaccountdetails(event){
	var x= event.keyCode;
	if(x==114){
	    $('#accountSearchwindow').jqxWindow('open');
	    accountSearchContent('accountsDetailsSearch.jsp?');    
    }
}  

function accountSearchContent(url) {
    $.get(url).done(function (data) {
        $('#accountSearchwindow').jqxWindow('setContent', data);
	}); 
}

function funreload(event) {
	var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
	// out date
	var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
	 	 
	if(fromdates>todates){
		$.messager.alert('Message','To Date Less Than From Date  ','warning');   
	    return false;
	} else {
	    var barchval = document.getElementById("cmbbranch").value;
        var fromdate= $("#fromdate").val();
	    var todate= $("#todate").val();
	    var statusselect=$("#statusselect").val();
	    var acno=$("#acno").val();
	 
	    $("#overlay, #PleaseWait").show();
	    $("#listdiv").load("orderlistGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&statusselect="+statusselect+"&acno="+acno);
	}
}

function funcleardata() {
	document.getElementById("acno").value="";
	document.getElementById("account").value="";
	document.getElementById("accname").value="";
	document.getElementById("statusselect").value="All";
	
	if (document.getElementById("account").value == "") {
	    $('#account').attr('placeholder', 'Press F3 TO Search'); 
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
                        <td class="label-cell">Account</td>
                        <td>
                            <input type="text" name="account" id="account" value='<s:property value="account"/>' readonly="readonly" placeholder="Press F3 To Search" onKeyDown="getaccountdetails(event);" >  
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="accname" name="accname" value='<s:property value="accname"/>' readonly="readonly">
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" class="btn-submit btn-secondary" name="clear" id="clear" onclick="funcleardata()">Clear</button>
                </div>
                
                <div id='paychaaaaa' style="width: 100%; height: 150px; margin-top:15px;"></div>
                
                <div style="display: none;">
                    <input type="hidden" id="statusselect" name="statusselect" value='<s:property value="statusselect"/>'>
                    <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
                </div>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <table width="100%">
            <tr>
                 <td><div id="listdiv"><jsp:include page="orderlistGrid.jsp"></jsp:include></div></td>
            </tr>
        </table>
    </div>

</div>

<div id="accountSearchwindow">
   <div></div>
</div> 

</div>
</body>
</html>