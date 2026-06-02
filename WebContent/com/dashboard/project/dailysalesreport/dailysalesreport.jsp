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

/* Sidebar (LEFT SIDE ONLY) */
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
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* Checkbox Alignment */
.checkbox-row {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
}
.checkbox-row input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
}

/* Buttons */
.btn-submit {
    width: 100%;
    height: 30px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
    margin-top: 10px;
}

.btn-submit:hover:not(:disabled) {
    background: #1d4ed8;
}

.btn-submit:disabled {
    background: #9ca3af;
}

.btn-submit:active:not(:disabled) {
    transform: scale(0.98);
}

/* Main Content Area (RIGHT SIDE) */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow: auto;
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}

/* Preserved Legacy Classes */
.bicon {
    background-color: #ECF8E0;
	width: 1em;
	height: 1em;
	border: none;
}
</style>

<script type="text/javascript">
	$(document).ready(function () {
		 disable();
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
	     // Enforced 100% width and 24px height to match new UI standard
	     $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
			  
		 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
			  
		 $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
		 $('#todate').on('change', function (event) {
			   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			   var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
				 	 
			   if(fromdates>todates){
				   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			       return false;
			  }
		});
	});         
	
    function funreload(event){
	    var barchval = document.getElementById("cmbbranch").value;
	    var fromdate = $('#fromdate').val();
		var todate = $('#todate').val();
		$("#overlay, #PleaseWait").show();  
	    $("#dailyjobsDiv").load("dailyjobsgrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&check=1");
    }                
    
    function disable(){
		$('#btnprint').attr("disabled",true);
	}        
 	   
    function setValues(){
		if($('#msg').val()!=""){   
	   		$.messager.alert('Message','<center>'+$('#msg').val()+'</center>');
	   	}
	}
	   
	function funExportBtn(){
	    $("#dailyjobsDiv").excelexportjs({
			containerid: "dailyjobsDiv",   
			datatype: 'json',
			dataset: null,
			gridId: "jqxjobsgrid",
			columns: getColumns("jqxjobsgrid") ,   
			worksheetName:"JobWise Target"  
		});   
	} 
	
	/* function  funPrint(){
	    var url=document.URL;
		var reurl=url.split("dailysalesreport.jsp");
		var win= window.open(reurl[0]+"printdailysalesreport?todate="+$('#todate').val()+"&fromdate="+$('#fromdate').val()+"&branch="+document.getElementById("cmbbranch").value,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
		win.focus();
	}  
	function  funPrintSumm(){
	    var url=document.URL;
		var reurl=url.split("dailysalesreport.jsp");
		var win= window.open(reurl[0]+"printsummaryreport?todate="+$('#todate').val()+"&fromdate="+$('#fromdate').val()+"&branch="+document.getElementById("cmbbranch").value,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
		win.focus();   
    }
	function funPrintSetUp(){
	    if (document.getElementById('rsumm').checked){    
	   		funPrintSumm(); 
	   	}else{
	   		funPrint(); 
	   	}
	} */
</script>                      
</head>      
<body onload="getBranch();setValues();">         
<form id="frmdailysales" action="saveDailySales" method="post" autocomplete="off">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>    

<div class="master-container">
    
    <!-- Sidebar Filters (LEFT SIDE - MODERNIZED) -->
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
                </table>
                
                <!-- Hidden inputs -->
                <input type="text" name="gridtext" id="gridtext" style="display:none;" value='<s:property value="gridtext"/>'/>   
                <input type="text" name="gridtext1" id="gridtext1" style="display:none;" value='<s:property value="gridtext1"/>'/>
                
                <!-- Hidden elements based on legacy code -->
                <div class="checkbox-row" style="display:none; margin-top: 15px;">
                    <input type="checkbox" id="rsumm" name="summ" value="rsumm">
                    <label for="rsumm">Summary</label>
                </div>
                <button type="button" name="btnprint" id="btnprint" class="btn-submit" onclick="funPrintSetUp();" style="display:none;">Print</button>
            </div>
        </div>
    </div>

    <!-- Main Content Area (RIGHT SIDE - EXACT ORIGINAL HTML) -->
    <div class="main-content-area">
        <table width="100%"> 
            <tr><td>
                 <fieldset>
                    <legend>Sales</legend>
                 <div id="dailyjobsDiv"><jsp:include page="dailyjobsgrid.jsp"></jsp:include></div></fieldset></td></tr>
        </table> 
    </div>

</div>

</div> 
</div> 
</form>
</body>
</html>