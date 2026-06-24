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
body, html {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden; 
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif !important;
    background-color: #f4f7f9;
}

#mainBG, .hidden-scrollbar {
    height: 100%;
}

table, td, th, input, select, textarea, button, span, div, label {
    font-family: inherit !important;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
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
    padding: 15px 20px 80px; 
}

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

/* Right Content Area */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto;
    background: #f4f7f9;
    padding: 15px;
    box-sizing: border-box;
}
.main-content-area::-webkit-scrollbar {
    width: 8px;
}
.main-content-area::-webkit-scrollbar-track {
    background: #f0f4f8;
}
.main-content-area::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

/* UI Cards Panels */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 15px;
}
.grid-card {
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.02);
}
.card-header {
    font-size: 12px; 
    font-weight: 600; 
    color: #4e5e71; 
    margin-bottom: 12px; 
    text-transform: uppercase; 
    letter-spacing: 0.5px;
    border-bottom: 1px solid #e3e8ee;
    padding-bottom: 8px;
}

/* Layout Form Filter Grids */
.release-filter-table {
    width: 100%;
    border-spacing: 0 10px; 
}

.release-filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 11.5px; 
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

.release-filter-table input[type="radio"],
.release-filter-table input[type="checkbox"] {
    width: auto;
    height: auto;
    margin: 0;
    vertical-align: middle;
    cursor: pointer;
}

/* Readonly fields styling setup */
input[readonly], select[readonly],
input:disabled, select:disabled,
.release-filter-table input[readonly] {
    background-color: #f3f6f9 !important; 
    color: #555;
    cursor: default;
}

/* Specific Financial Field Overrides */
.financial-input {
    text-align: right;
    font-weight: 600;
    color: #0f172a !important;
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

/* Form Layout Container Blocks for JQX widgets */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="date"] {
    width: 100%;
}

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    width: 100%;
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

.btn-danger {
    background-color: #dc2626;
}

.btn-danger:hover {
    background-color: #b91c1c;
}

.release-actions {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-top: 15px;
}

.action-row {
    display: flex;
    gap: 8px;
}
.action-row button {
    flex: 1;
}

/* Flexible Grid Splitter */
.grid-split-container {
    display: flex;
    gap: 15px;
}
.grid-split-container .grid-card {
    margin-bottom: 0;
}
.grid-panel-40 {
    flex: 0 0 calc(40% - 7.5px);
    min-width: 0; 
}
.grid-panel-60 {
    flex: 0 0 calc(60% - 7.5px);
    min-width: 0;
}
</style>

<script type="text/javascript">
	$(document).ready(function () {
		 // 24px UI standardization
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
		 $("#date").jqxDateTimeInput({ width: '100%', height: '24px', formatString:"dd.MM.yyyy"});
		 
		 $('#manPowerGridWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Employee Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#manPowerGridWindow').jqxWindow('close');
		 
		 $('#jobDetailsWindow').jqxWindow({width: '50%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Job Search',position: { x: 250, y: 120 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	     $('#jobDetailsWindow').jqxWindow('close');
	     
	     $('#consumedDetailsWindow').jqxWindow({width: '50%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%',position: { x: 250, y: 120 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	     $('#consumedDetailsWindow').jqxWindow('close');
	     
	     $('#assignedDetailsWindow').jqxWindow({width: '50%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%',position: { x: 250, y: 120 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	     $('#assignedDetailsWindow').jqxWindow('close');
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		 
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	     document.getElementById("rdjobno").checked=true;
	     $('#txtemployee').attr('disabled', true);
         $('#txtjobno').attr('disabled', false);
	     $('#cmbjobtype').attr('disabled', false);
         $('#btnSaving').attr('disabled', true);
		 
         $("#deployTechnicianDetailsGridId").jqxGrid('clear');$("#deployTechnicianDetailsGridId").jqxGrid("addrow", null, {});$("#deployTechnicianDetailsGridId").jqxGrid({ disabled: true});
	     $("#manPowerAssignedGridID").jqxGrid('clear');$("#manPowerAssignedGridID").jqxGrid("addrow", null, {"consumed":"View"});$("#manPowerAssignedGridID").jqxGrid({ disabled: true});
	     
	     $('#txtemployee').dblclick(function(){
	    	 manPowerSearchContent('employeeDetailsSearch.jsp?id=0');
		 });
	     
	     $('#txtjobno').dblclick(function(){
	    	 if($('#cmbjobtype').val()=='' || $('#cmbjobtype').val()=='0'){
	     		  $.messager.alert('Message','Job Type is Mandatory.','warning');
	     		  return;
	     	   }
	    	 jobSearchContent('jobDetailsSearch.jsp?dtype='+$('#cmbjobtype').val());
	      });
	});
	
	function manPowerSearchContent(url) {
		$('#manPowerGridWindow').jqxWindow('open');
		$.get(url).done(function (data) {
            $('#manPowerGridWindow').jqxWindow('setContent', data);
            $('#manPowerGridWindow').jqxWindow('bringToFront');
	    }); 
	}
	
	function jobSearchContent(url) {
		$('#jobDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
            $('#jobDetailsWindow').jqxWindow('setContent', data);
            $('#jobDetailsWindow').jqxWindow('bringToFront');
	    }); 
	}
	
	function consumedDetailsContent(url) {
		$('#consumedDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
            $('#consumedDetailsWindow').jqxWindow('setContent', data);
            $('#consumedDetailsWindow').jqxWindow('bringToFront');
	    }); 
	}
	
	function assignedDetailsContent(url) {
		$('#assignedDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
            $('#assignedDetailsWindow').jqxWindow('setContent', data);
            $('#assignedDetailsWindow').jqxWindow('bringToFront');
	    }); 
	}

	function getEmployee(event){
        var x= event.keyCode;
        if(x==114){
        	manPowerSearchContent('employeeDetailsSearch.jsp?id=0');
        }
    }
	
	function getJob(event){
        var x= event.keyCode;
        if(x==114){
        	if($('#cmbjobtype').val()=='' || $('#cmbjobtype').val()=='0'){
	     		  $.messager.alert('Message','Job Type is Mandatory.','warning');
	     		  return;
	     	}
	    	jobSearchContent('jobDetailsSearch.jsp?dtype='+$('#cmbjobtype').val());
        }
    }
	
	function getManPowerConsumed(costtype,costcode){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  				if(!(isNaN(items))){
	  			    var budget = $('#txtbudget').val();
	      		    var balance = parseFloat(budget) - parseFloat(items);
	           	    funRoundAmt(items,"txtconsumed");
	           	    funRoundAmt(balance,"txtbalance");
  				} else if(isNaN(items)){
  	            	 funRoundAmt(0.00,"txtconsumed");
  	            	 funRoundAmt(0.00,"txtbalance");
  	        	}
  		    }
  		}
  		x.open("GET", "getManPowerConsumed.jsp?costtype="+costtype+'&costcode='+costcode, true);
  		x.send();
   }
	
	function funreload(event){
		 var branchval = document.getElementById("cmbbranch") ? document.getElementById("cmbbranch").value : "";
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 
		 $("#overlay, #PleaseWait").show();
		 $('#btnSaving').attr('disabled', true);
		 $("#deployTechnicianDetailsGridId").jqxGrid('clear');$("#deployTechnicianDetailsGridId").jqxGrid("addrow", null, {});$("#deployTechnicianDetailsGridId").jqxGrid({ disabled: true});
	     $("#manPowerAssignedGridID").jqxGrid('clear');$("#manPowerAssignedGridID").jqxGrid("addrow", null, {"consumed":"View"});$("#manPowerAssignedGridID").jqxGrid({ disabled: true});
	     
         document.getElementById("txtbudget").value="";document.getElementById("txtconsumed").value="";document.getElementById("txtbalance").value="";
	     document.getElementById("txtcosttype").value="";document.getElementById("txtcostcode").value="";document.getElementById("txtsite").value="";
		 
         $("#deployTechnicianGridDiv").load("deployTechnicianGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&check=1');
	}

	function funExportBtn(){
		 if(parseInt(window.parent.chkexportdata.value)=="1") {
		  	JSONToCSVCon(data, 'DeployTechnician', true);
		 } else {
			 $("#deployTechnicianGridID").jqxGrid('exportdata', 'xls', 'DeployTechnician');
		 }
	}
	
	function funClearInfo(){
		$('#fromdate').val(new Date());
		var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	    var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	    var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	    $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	    $('#todate').val(new Date());
		document.getElementById("rdjobno").checked=true;
		$('#date').val(new Date());
		
		document.getElementById("txtbudget").value="";document.getElementById("txtconsumed").value="";document.getElementById("txtbalance").value="";
		document.getElementById("txtcosttype").value="";document.getElementById("txtcostcode").value="";document.getElementById("txtsite").value="";
		document.getElementById("txtemployee").value="";document.getElementById("txtemployeedocno").value="";document.getElementById("cmbjobtype").value="amc";
		document.getElementById("txtjobid").value="";document.getElementById("txtjobno").value="";
		
		if (document.getElementById("txtjobid").value == "") {
	        $('#txtjobno').attr('placeholder', 'Press F3 to Search'); 
	    }
		if (document.getElementById("txtemployeedocno").value == "") {
	        $('#txtemployee').attr('placeholder', 'Press F3 to Search'); 
	    }
		
		$("#deployTechnicianGridID").jqxGrid('clear');
		$("#deployTechnicianDetailsGridId").jqxGrid('clear');
		$("#deployTechnicianDetailsGridId").jqxGrid("addrow", null, {}); 
		$("#deployTechnicianDetailsGridId").jqxGrid({ disabled: true});
		
		$("#manPowerAssignedGridID").jqxGrid('clear');
		$("#manPowerAssignedGridID").jqxGrid("addrow", null, {"consumed":"View"}); 
		$("#manPowerAssignedGridID").jqxGrid({ disabled: true});
		$('#btnSaving').attr('disabled', true);
	}
	
	function funSaving(event){
		 var costtype = $('#txtcosttype').val();
		 var costcode = $('#txtcostcode').val();
		 var site = $('#txtsite').val();
		 var budget = $('#txtbudget').val();
		 var consumed = $('#txtconsumed').val();
		 var balance = $('#txtbalance').val();
		 
		 if(costtype==''){
			 $.messager.alert('Message','Please select an item.','warning');
			 return 0;
		 }
		 if(costcode==''){
			 $.messager.alert('Message','Please select an item.','warning');
			 return 0;
		 }
		 
		 var rows = $("#manPowerAssignedGridID").jqxGrid('getrows');
		 var gridarray=new Array();
		 for(var i=0;i<rows.length;i++){
			var chk=rows[i].actualhrs;
			var chks=rows[i].empdocno;
		    if(typeof(chk) != "undefined" && typeof(chk) != "NaN" && chk != "" && chk != "0"){
		    	if(typeof(chks) != "undefined" && typeof(chks) != "NaN" && chks != "" && chks != "0"){
					var date=$('#manPowerAssignedGridID').jqxGrid('getcelltext',rows[i],'date');
					var empid=$('#manPowerAssignedGridID').jqxGrid('getcelltext',rows[i],'empdocno');
					var intime=$('#manPowerAssignedGridID').jqxGrid('getcelltext',rows[i],'intime');
					var outtime=$('#manPowerAssignedGridID').jqxGrid('getcelltext',rows[i],'outtime');
					var hrs=$('#manPowerAssignedGridID').jqxGrid('getcelltext',rows[i],'hrs');
					var actualhrs=$('#manPowerAssignedGridID').jqxGrid('getcelltext',rows[i],'actualhrs');
					var stdcost=$('#manPowerAssignedGridID').jqxGrid('getcelltext',rows[i],'stdcost');
					var total=$('#manPowerAssignedGridID').jqxGrid('getcelltext',rows[i],'total');
					
					gridarray.push(date+":: "+empid+":: "+intime+":: "+outtime+":: "+hrs+":: "+actualhrs+":: "+stdcost+":: "+total+":: "+costtype+":: "+costcode+":: "+site.replace(/,/g , "#"));
		    	}
		    }
		 }
		 	
         $.messager.confirm('Message', 'Do you want to save changes?', function(r){
            if(r==false){
                return false; 
            } else {
                saveGridData(costtype,costcode,budget,consumed,balance,gridarray);	
            }
		 });
	}
	
	function saveGridData(costtype,costcode,budget,consumed,balance,gridarray) {
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
            if (x.readyState==4 && x.status==200) {
                var items=x.responseText;
                items = items.split('***');
                var val = items[0];
                var docno = items[1];
                
                if(parseInt(val)>0){
                    $.messager.alert('Message', ' Record Successfully Saved.', function(r){});
                    
                    var costtype = $('#txtcosttype').val('');
                    var costcode = $('#txtcostcode').val('');
                    var site = $('#txtsite').val('');
                    var budget = $('#txtbudget').val('');
                    var consumed = $('#txtconsumed').val('');
                    var balance = $('#txtbalance').val('');
                    $("#deployTechnicianDetailsGridId").jqxGrid('clear');
                    $("#deployTechnicianDetailsGridId").jqxGrid("addrow", null, {}); 
                    $("#deployTechnicianDetailsGridId").jqxGrid({ disabled: true});
                    $("#manPowerAssignedGridID").jqxGrid('clear');
                    $("#manPowerAssignedGridID").jqxGrid("addrow", null, {"consumed":"View"}); 
                    $("#manPowerAssignedGridID").jqxGrid({ disabled: true});
                    $('#btnSaving').attr('disabled', true);
                    funreload(event);
                } else if(parseInt(val)==-1){
                    $.messager.alert('Message','Already Exists.');
                    return 0;
                } else {
                    $.messager.alert('Message','Failed');
                    return 0;
                }
            }
		}
	    x.open("GET","saveData.jsp?costtype="+costtype+"&costcode="+costcode+"&budget="+budget+"&consumed="+consumed+"&balance="+balance+"&gridarray="+gridarray,true);
	    x.send();
	}
	
	function funPrintDetails(){
		 var date = $('#date').val();
		 var employeedocno = $('#txtemployeedocno').val();
		 var jobno = $('#txtjobid').val();
		
         var url=document.URL;
         var reurl=url.split("deployTechnician.jsp");
        
         var win= window.open(reurl[0]+"printDeployTechnician?date="+date+'&employeedocno='+employeedocno+'&jobno='+jobno,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
         win.focus();
	}
	
	function funRadioType(){
		if(document.getElementById("rdjobno").checked==true){
			document.getElementById("txtemployee").value="";document.getElementById("txtemployeedocno").value="";
			document.getElementById("txtjobid").value="";document.getElementById("txtjobno").value="";document.getElementById("cmbjobtype").value="amc";
			$('#txtjobno').attr('disabled', false);$('#cmbjobtype').attr('disabled', false);$('#txtemployee').attr('disabled', true);
			if (document.getElementById("txtjobid").value == "") {
		        $('#txtjobno').attr('placeholder', 'Press F3 to Search'); 
		    }
		} else if(document.getElementById("rdemployee").checked==true){
			document.getElementById("txtemployee").value="";document.getElementById("txtemployeedocno").value="";
			document.getElementById("txtjobid").value="";document.getElementById("txtjobno").value="";document.getElementById("cmbjobtype").value="amc";
			$('#txtemployee').attr('disabled', false);$('#txtjobno').attr('disabled', true);$('#cmbjobtype').attr('disabled', true);
			if (document.getElementById("txtemployeedocno").value == "") {
		        $('#txtemployee').attr('placeholder', 'Press F3 to Search'); 
		    }
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
            <div class="filter-card" style="padding: 10px; margin-bottom: 0;">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>
        </div>

        <div class="sidebar-scroll-content">
            
            <div class="filter-card" style="display: none;" id="branchdiv_wrapper">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Branch</td>
                        <td>
                            <select id="cmbbranch" name="cmbbranch" onchange="funreload(event);">
                                <option value="">--Select--</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Period From</td>
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <div class="card-header">Financials</div>
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Budget</td>
                        <td><input type="text" class="financial-input" id="txtbudget" name="txtbudget" readonly value='<s:property value="txtbudget"/>'/></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Consumed</td>
                        <td><input type="text" class="financial-input" id="txtconsumed" name="txtconsumed" readonly value='<s:property value="txtconsumed"/>'/></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Balance</td>
                        <td><input type="text" class="financial-input" id="txtbalance" name="txtbalance" readonly value='<s:property value="txtbalance"/>'/></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <div class="card-header">Assignment Targeting</div>
                
                <div style="display: flex; justify-content: center; gap: 15px; margin-bottom: 12px;">
                    <div style="display: flex; align-items: center; gap: 5px;">
                        <input type="radio" id="rdjobno" onchange="funRadioType();" name="rdo" value="rdjobno" style="margin: 0; cursor: pointer;">
                        <label for="rdjobno" style="font-size: 12px; font-weight: 600; color: #4e5e71; margin: 0; cursor: pointer;">Job</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 5px;">
                        <input type="radio" id="rdemployee" onchange="funRadioType();" name="rdo" value="rdemployee" style="margin: 0; cursor: pointer;">
                        <label for="rdemployee" style="font-size: 12px; font-weight: 600; color: #4e5e71; margin: 0; cursor: pointer;">Employee</label>
                    </div>
                </div>

                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Date</td>
                        <td><div id="date" name="date" value='<s:property value="date"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Job Type</td>
                        <td>
                            <select id="cmbjobtype" name="cmbjobtype" value='<s:property value="cmbjobtype"/>'>
                                <option value="amc">AMC</option>
                                <option value="sjob">SJOB</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Job No</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="txtjobno" name="txtjobno" readonly="readonly" placeholder="Press F3 to Search" onkeydown="getJob(event);" value='<s:property value="txtjobno"/>'/>
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="txtjobid" name="txtjobid" value='<s:property value="txtjobid"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Employee</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="txtemployee" name="txtemployee" readonly="readonly" placeholder="Press F3 to Search" onkeydown="getEmployee(event);" value='<s:property value="txtemployee"/>'/>
                                <div class="search-icon"></div>
                            </div>
                            <input type="hidden" id="txtemployeedocno" name="txtemployeedocno" value='<s:property value="txtemployeedocno"/>'/>
                        </td>
                    </tr>
                </table>
                
                <div class="release-actions">
                    <button type="button" id="btnSaving" name="btnSaving" class="btn-primary" onclick="funSaving(event);">Save Assignments</button>
                    
                    <div class="action-row">
                        <button type="button" class="btn-primary btn-secondary" name="clear" id="clear" onclick="funClearInfo();">Clear</button>
                        <button type="button" id="btnPrint" name="btnPrint" class="btn-primary btn-secondary" onclick="funPrintDetails();">Print</button>
                    </div>
                </div>
                
                <input type="hidden" id="txtcosttype" name="txtcosttype" readonly value='<s:property value="txtcosttype"/>'/>
                <input type="hidden" id="txtcostcode" name="txtcostcode" readonly value='<s:property value="txtcostcode"/>'/>
                <input type="hidden" id="txtsite" name="txtsite" readonly value='<s:property value="txtsite"/>'/>

            </div>
        </div>
    </div>

    <div class="main-content-area">
        
        <div class="grid-card" style="margin-bottom: 15px;">
            <div class="card-header">Deploy Technician Data</div>
            <div id="deployTechnicianGridDiv">
                <jsp:include page="deployTechnicianGrid.jsp"></jsp:include>
            </div>
        </div>

        <div class="grid-split-container">
            <div class="grid-card grid-panel-40">
                <div class="card-header">Technician Details</div>
                <div id="deployTechnicianDetailsGridDiv">
                    <jsp:include page="deployTechnicianDetailsGrid.jsp"></jsp:include>
                </div>
            </div>
            
            <div class="grid-card grid-panel-60">
                <div class="card-header">Man Power Assigned</div>
                <div id="manPowerAssignedGridDiv">
                    <jsp:include page="manPowerAssignedGrid.jsp"></jsp:include>
                </div>
            </div>
        </div>

    </div>

</div>

<div id="manPowerGridWindow"><div></div><div></div></div> 
<div id="jobDetailsWindow"><div></div><div></div></div> 
<div id="consumedDetailsWindow"><div></div><div></div></div>
<div id="assignedDetailsWindow"><div></div><div></div></div>

</div>
</div>
</body>
</html>