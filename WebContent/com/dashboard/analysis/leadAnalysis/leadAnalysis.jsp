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

 <style type="text/css">
.myButtons {
	display: inline-block;
	margin-right:4px;
	margin-left:4px; 
  margin-bottom: 0;
  font-weight: normal;
  line-height: 1.3;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  color: #fff;
  background-color: grey;
}
.myButtons:hover {
	  color: #fff;
  background-color: #31b0d5;
  
}
.myButtons:active {
  color: #fff;
  background-color: #31b0d5;
  
}
.myButtons:focus {
  color: #fff;
  background-color: grey;
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

/* ===== FLEX ROW FOR BUTTONS NEXT TO INPUTS ===== */
.input-with-button-row {
    display: flex;
    gap: 6px;
    align-items: center;
    width: 100%;
}
.input-with-button-row select, 
.input-with-button-row input {
    flex: 1; /* Takes up remaining space */
}

/* Legacy Button Styling Override (For the + button) */
button.bicon {
    height: 28px;
    width: 28px;
    background: #f8fafc;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    margin: 0;
    font-weight: bold;
    color: #334155;
    font-size: 16px;
}
button.bicon:hover { background: #e2e8f0; }

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

/* ===== BUTTONS ===== */
.btn-submit {
    width: 100%;
    height: 30px;
    padding: 0 12px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    line-height: 30px;
}
.btn-submit:hover { background: #1d4ed8; }
.btn-secondary { background: #64748b; }
.btn-secondary:hover { background: #475569; }

/* jqx date containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}
</style>
<script type="text/javascript">

	$(document).ready(function () {
	
		 
		  $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     $("body").prepend('<div id="overlaysub" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWaitsub' style='display: none;position:absolute; z-index: 1;top:290px;left:115px;'><img src='../../../../icons/31load.gif'/></div>");
		 
	     $('#filterSearchwindow').jqxWindow({width: '50%', height: '55%',  maxHeight: '60%' ,maxWidth: '40%' , title: 'Salesman Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		  $('#filterSearchwindow').jqxWindow('close');
		
		  var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate)); 
	});

	function funExportBtn(){
		/*  if (document.getElementById('rsumm').checked) {
			 
			 JSONToCSVCon(excelsummarydata,'Service Invoice Details(Summary)',true);
			  
			 }
			 
			 if (document.getElementById('rdet').checked) {
				 
				 JSONToCSVCon(exceldetaildata,'Service Invoice Details(Detail)',true);
				 
				 } */
		
		 }
	
	
	function funreload(event){

		}
	
	function setprodSearch(){
		var grpval=$('#grpby').val().trim();
		var value=$('#filterby').val().trim();
		if(grpval=="")
			{
			 $.messager.alert('Message','Select Group By ','warning');
			 return 0;
			}
		else{
			getfilterVal(value,grpval);
		}

	}
	

	     function getfilterVal(value,grpval){
	    	 branchid=document.getElementById("cmbbranch").value; 
			 frmdate=$('#fromdate').jqxDateTimeInput('val');
			 todate=$('#todate').jqxDateTimeInput('val');
				 
		 $('#filterSearchwindow').jqxWindow('open');
			 		// changeContent('contractMastersearch.jsp');  
			 		 SalesmanSearchContent('filterDetailsSearch.jsp?val='+value+"&grpval="+grpval+"&todate="+todate+"&fromdate="+frmdate+"&branchval="+branchid, $('#filterSearchwindow'));
			    	
			 	 }
			    	 
			function SalesmanSearchContent(url) {
				 $.get(url).done(function (data) {
				$('#filterSearchwindow').jqxWindow('setContent', data);
			           	}); 
			 	}
	
	
	function funClearData(){
		
		 document.getElementById("grpby").value="";
		 document.getElementById("filterby").value="";
		 document.getElementById("cmbbranch").value="a";
		 
		 $("#jqxLeadCount").jqxGrid('clear'); 
		 $("#jqxleaddataGrid").jqxGrid('clear');
		 
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
                        <td class="label-cell" id="lblgrpby">Group By</td>
                        <td>
                            <select name="grpby" id="grpby">
                                <option value="">--Select--</option>
                                <option value="salm">SALESMAN</option>
                                <option value="status">STATUS</option>
                                <option value="type">TYPE</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Filter By</td>
                        <td>
                            <div class="input-with-button-row">
                                <select name="filterby" id="filterby">
                                    <option value="">--Select--</option>
                                    <option value="salm">SALESMAN</option>
                                    <option value="status">STATUS</option>
                                    <option value="type">TYPE</option>
                                </select>
                                <button type="button" name="btnadditem" id="additem" class="bicon" onClick="setprodSearch();">+</button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id="Countgrid">
                    <jsp:include page="Countgrid.jsp"></jsp:include>
                </div>
            </div>

            <div style="margin-top: 15px;">
                <button type="button" class="btn-submit btn-secondary" name="btnclear" id="btnclear" onclick="funClearData();">Clear</button>
            </div>

        </div>
    </div>

    <div class="main-column">
        <div class="main-content-padding">
            <table width="100%">
                <tr>
                    <td style="padding-bottom: 20px;">
                        <div id="leadDiv">
                            <jsp:include page="leadAnalysisGrid.jsp"></jsp:include>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

</div> 
</div>

<div id="filterSearchwindow">
    <div></div>
</div>

</body>
</html>