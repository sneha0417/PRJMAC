
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
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 

<style type="text/css">
 
.myButtons {
	-moz-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	-webkit-box-shadow:inset 0px -1px 3px 0px #91b8b3;
	box-shadow:inset 0px -1px 3px 0px #91b8b3;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #768d87), color-stop(1, #6c7c7c));
	background:-moz-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-webkit-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-o-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:-ms-linear-gradient(top, #768d87 5%, #6c7c7c 100%);
	background:linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#768d87', endColorstr='#6c7c7c',GradientType=0);
	background-color:#768d87;
	border:1px solid #566963;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	
	font-size:8pt;
	
	padding:3px 17px;
	text-decoration:none;
	text-shadow:0px -1px 0px #2b665e;
}
.myButtons:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #6c7c7c), color-stop(1, #768d87));
	background:-moz-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-webkit-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-o-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:-ms-linear-gradient(top, #6c7c7c 5%, #768d87 100%);
	background:linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6c7c7c', endColorstr='#768d87',GradientType=0);
	background-color:#6c7c7c;
}
.myButtons:active {
	position:relative;
	top:1px;
}

.bicon {
    background-color: #ECF8E0;
	width: 1em;
	height: 1em;
	border: none;
}

.hidden-scrollbar {
    overflow: auto;
    height: 550px; 
}

</style>
<style>
/* ===== GLOBAL RESET ===== */
html, body {
    height: 100%; /* Respects the ERP Header */
    margin: 0;
    padding: 0;
    overflow: hidden; /* Prevents the whole page from double-scrolling */
    background-color: #f4f7f9;
    font-family: Tahoma, Arial, sans-serif; 
}

#mainBG, .hidden-scrollbar {
    height: 100%;
    position: relative; /* Crucial: Locks the absolute columns inside the window */
}

table, td, th, input, select, textarea, button, span, div, label, p {
    font-family: inherit; 
}

/* ===== THE ABSOLUTE LAYOUT (THE ULTIMATE SCROLL & POPUP FIX) ===== */
.sidebar-column {
    position: absolute;
    top: 0;
    bottom: 0; /* Pins exactly to the bottom of the available screen */
    left: 0;
    width: 310px;
    overflow-y: auto; /* Independent scrollbar */
    background: #fff;
    border-right: 1px solid #e1e8ed;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 10; /* FIXED: Low enough to let search popups/calendars float over! */
}

.sidebar-column::-webkit-scrollbar { width: 6px; }
.sidebar-column::-webkit-scrollbar-track { background: transparent; }
.sidebar-column::-webkit-scrollbar-thumb { background-color: #cbd5e1; border-radius: 10px; }

.sidebar-content-padding {
    padding: 15px;
    padding-bottom: 80px; 
}

.main-column {
    position: absolute;
    top: 0;
    bottom: 0; 
    left: 310px; 
    right: 0;
    overflow-y: auto; 
    background: #fff;
}

.main-column::-webkit-scrollbar { width: 8px; }
.main-column::-webkit-scrollbar-track { background: #f0f4f8; }
.main-column::-webkit-scrollbar-thumb { background-color: #cbd5e1; border-radius: 10px; }

.main-content-padding {
    padding: 15px;
    padding-bottom: 80px; 
}

/* ===== CARDS & HEADERS ===== */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px 12px;
    margin-bottom: 15px;
}

.card-header {
    font-size: 13px; 
    font-weight: 700; 
    color: #334155; 
    margin-bottom: 15px; 
    border-bottom: 1px solid #e3e8ee;
    padding-bottom: 6px;
}

/* ===== TABLES & ROW SPACING ===== */
.release-filter-table {
    width: 100%;
    border-spacing: 0; 
}

.release-filter-table td {
    padding-bottom: 4px !important; /* Tighter vertical spacing */
    vertical-align: middle;
}

.release-filter-table tr:last-child td {
    padding-bottom: 0 !important;
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

/* ===== UNIFORM INPUTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
.release-filter-table select {
    width: 100%;
    height: 28px; 
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

/* ===== STRICT DISABLED & READONLY STYLING ===== */
input:disabled, select:disabled, textarea:disabled,
input[readonly]:not([readonly="false"]), 
select[readonly]:not([readonly="false"]), 
textarea[readonly]:not([readonly="false"]) {
    background-color: #e2e8f0 !important; 
    color: #64748b !important; 
    cursor: not-allowed !important; 
    border-color: #cbd5e1 !important;
    opacity: 1 !important;
}

input:not(:disabled):not([readonly]), 
input[readonly="false"], input[disabled="false"],
select:not(:disabled):not([readonly]), 
select[readonly="false"], select[disabled="false"],
textarea:not(:disabled):not([readonly]),
textarea[readonly="false"], textarea[disabled="false"] {
    cursor: auto !important; 
    background-color: #ffffff !important; 
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
}
.search-input-wrapper input[type="text"][readonly],
.search-input-wrapper input[type="text"][readonly="readonly"] {
    background-color: #ffffff !important; 
    color: #333 !important;
    cursor: pointer !important; 
    border-color: #ccd6e0 !important;
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

/* jqx date containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}
</style>
<script type="text/javascript">

$(document).ready(function () {
	
	/* $('#loadsalikdata').hide();
	  $('#loadtrafficdata').hide(); */
	 
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
			  
	     $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	     $('#clientsearch1').jqxWindow('close');
	     
	     $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate)); 
	 
     $('#txtclient').dblclick(function(){
		   
    	 $('#clientsearch1').jqxWindow('open');
    	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
		   		
		 });
	 
    
});


function getclinfo(event){
	 var x= event.keyCode;
	 if(x==114){
	  $('#clientsearch1').jqxWindow('open');
	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    }
	 else{
		 }
	 } 
     function clientSearchContent(url) {
           
               $.get(url).done(function (data) {
  
	           $('#clientsearch1').jqxWindow('setContent', data);

    	}); 
         	}

     function funExportBtn(){
			
    	   //$("#jqxprojectwiseGrid").jqxGrid('exportdata', 'xls', 'ProjectWise Balance Report');
    	   
    //	   JSONToCSVCon(exceldata,'Service Scheduler',true);
    	 

    }

function funreload()
{

     var id=1;
  
    if(id>0){
    	
    	gridload(id);
    }
     
	}
	
		

	 function gridload(id){
		 
		 var clientid=$('#clientid').val();
		 frmdate=$('#fromdate').jqxDateTimeInput('val');
		 todate=$('#todate').jqxDateTimeInput('val');
		 var barchval = document.getElementById("cmbbranch").value;
	 
		 $("#qutDetGrid").jqxGrid('clear'); 
			
		 $("#overlay, #PleaseWait").show();
			 $("#qotdiv").load("quotGrid.jsp?barchval="+barchval+"&fromdate="+frmdate+"&todate="+todate+"&clientid="+clientid+"&id="+id);
		
		 
	 }

	function funPrint()
	{
		
	}
</script>
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

    <div class="sidebar-column">
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
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' onKeyDown="getclinfo(event);" ondblclick="getclinfo(event);" readonly="readonly" placeholder="Double click to search">
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>

        </div>
    </div>

    <div class="main-column">
        <div class="main-content-padding">
            <table width="100%">
                <tr>
                    <td style="padding-bottom: 20px;">
                        <div id="qotdiv">
                            <jsp:include page="quotGrid.jsp"></jsp:include>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 20px;">
                        <div id="qotsubdiv">
                            <jsp:include page="quotsubGrid.jsp"></jsp:include>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="padding-bottom: 20px;">
                        <div class="filter-card" style="background: #ffffff;">
                            <div class="card-header">Site Details</div>
                            <div id="qotsitediv">
                                <jsp:include page="siteGrid.jsp"></jsp:include>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="filter-card" style="background: #ffffff;">
                            <div class="card-header">Revision Details</div>
                            <div id="qotrevisiondiv">
                                <jsp:include page="revisionGrid.jsp"></jsp:include>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</div> 
</div>

<div id="clientsearch1">
    <div></div>
</div> 

</body>
</html>