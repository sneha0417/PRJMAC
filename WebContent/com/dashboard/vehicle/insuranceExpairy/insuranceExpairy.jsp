
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
	
	 $("#insuexpdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	  $('#invcomSearchwindow').jqxWindow({ width: '30%', height: '60%',  maxHeight: '75%' ,maxWidth: '50%' , title: ' Insurance Company Search' ,position: { x: 600, y: 60 }, keyboardCloseKey: 27});
	    $('#invcomSearchwindow').jqxWindow('close');

   
});


function funExportBtn(){
 
	  
 if(parseInt(window.parent.chkexportdata.value)=="1")
	 {
	 JSONToCSVCon(expdata, 'Insurance Expiry', true);
	 }
 else
	 {
	 $("#insexpgrid").jqxGrid('exportdata', 'xls', 'Insurance Expiry');
	 }
	   
	 }

function inscompanySearchContent(url) {
	 //alert(url);
		 $.get(url).done(function (data) {
			 
			 $('#invcomSearchwindow').jqxWindow('open');
		$('#invcomSearchwindow').jqxWindow('setContent', data);

	}); 
	}  

function funreload(event)
{
	 var barchval = document.getElementById("cmbbranch").value;
	 var exdate = $('#insuexpdate').val();
 
	  $("#insuexp").load("insuranceExpairyGrid.jsp?barchval="+barchval+'&exdate='+exdate);
	
	
	}


function changeAttachContent(url) {
	$.get(url).done(function (data) {
		    $('#windowattach').jqxWindow('open');
		  
			$('#windowattach').jqxWindow('setContent',data);
			 $('#windowattach').jqxWindow('bringToFront');
}); 
}


</script>
<style>
/* ===== GLOBAL RESET & STRICT FONT ENFORCER ===== */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden; /* Prevents the whole page from scrolling */
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif !important;
    background-color: #f4f7f9;
}

#mainBG, .hidden-scrollbar {
    height: 100%;
}

table, td, th, input, select, textarea, button, span, div, label {
    font-family: inherit !important;
}

/* ===== THE NUCLEAR FIX: FIXED SIDEBAR ===== */
/* Detaches the sidebar from the table and locks it strictly to the viewport */
.fixed-sidebar-container {
    position: fixed; 
    top: 0;                   
    bottom: 0; /* Locks to the exact bottom of the browser */
    left: 0;
    width: 310px; 
    overflow-y: auto; /* Guarantees an independent scrollbar */
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

/* jqx date containers */
.release-filter-table div[id^="insuexpdate"] {
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
                        <td class="label-cell">Up To</td>
                        <td><div id="insuexpdate" name="insuexpdate" value='<s:property value="insuexpdate"/>'></div></td>
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
            <table width="100%">
                <tr>
                    <td>
                        <div id="insuexp">
                            <jsp:include page="insuranceExpairyGrid.jsp"></jsp:include>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</td>

</tr>
</table>

<div id="invcomSearchwindow">
    <div></div>
</div> 

</div>
</div>
</body>
</html>