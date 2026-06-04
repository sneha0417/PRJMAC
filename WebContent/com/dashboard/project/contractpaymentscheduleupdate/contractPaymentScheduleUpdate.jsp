<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/resample.js"></script>
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

</style>
<style>

/* ===== GLOBAL RESET ===== */
html, body, form {
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden; /* Prevents the whole page from double-scrolling */
    background-color: #f4f7f9;
    font-family: Tahoma, Arial, sans-serif; /* Safe native fonts */
}

#mainBG, .hidden-scrollbar {
    height: 100%;
}

table, td, th, input, select, textarea, button, span, div, label, p {
    font-family: inherit; /* Allows your app's native fonts to cascade properly */
}

/* ===== THE FIXED SIDEBAR ===== */
.fixed-sidebar-container {
    position: fixed; 
    top: 0;                   
    bottom: 0; 
    left: 0;
    width: 310px; 
    overflow-y: auto; 
    background: #fff;
    border-right: 1px solid #e1e8ed;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 10; /* POPUP FIX: Search windows will float over this */
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
    padding-bottom: 100px; 
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

/* SCROLL FIX: Added a dedicated padding class for the right side */
.main-content-padding {
    padding: 15px;
    padding-bottom: 150px; /* Massive safe buffer to guarantee bottom scrolling */
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

/* Forces a tighter, balanced vertical gap between rows */
.release-filter-table td {
    padding-bottom: 8px !important; 
    vertical-align: middle;
}

/* Removes the padding from the very last row */
.release-filter-table tr:last-child td {
    padding-bottom: 0 !important;
}

/* WIDENED LABELS */
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

/* ===== UNIFORM INPUTS & SPACIOUS HEIGHT ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
.release-filter-table select {
    width: 100%;
    height: 28px; /* SPACIOUS FIX: 28px height */
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

/* ===== STRICT DISABLED & READONLY STYLING (THE REAL FIX) ===== */
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

/* ===== SEARCH INFRASTRUCTURE (No Clear Button) ===== */
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
.search-input-wrapper input[type="text"]:not(:disabled):not([readonly]),
.search-input-wrapper input[type="text"][readonly="false"] {
    cursor: pointer !important; 
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
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="finsdate"],
.release-filter-table div[id^="stdate"],
.release-filter-table div[id^="enddate"] {
    width: 100%;
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
    margin-top: 5px;
}
.btn-submit:hover {
    background: #1d4ed8;
}
.btn-secondary {
    background: #64748b;
}
.btn-secondary:hover {
    background: #475569;
}
.release-actions {
    display: flex;
    gap: 8px;
    justify-content: center;
    margin-top: 15px;
}
.release-actions .btn-submit {
    flex: 1;
}
</style>
<script type="text/javascript">

	$(document).ready(function () {
		 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#finsdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy", value: null, enableBrowserBoundsDetection: true});
		 $("#stdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#enddate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
		 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Client Search', position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsWindow').jqxWindow('close');
		 
		 $('#contractDetailsWindow').jqxWindow({width: '40%', height: '50%',  maxHeight: '60%' ,maxWidth: '40%' , title: 'Contract Search', position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#contractDetailsWindow').jqxWindow('close');
		 
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate ').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
		 
	     $('#todate').on('change', function (event) {
				
			   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
			   var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
			 	 
			   if(fromdates>todates){
				   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			   	   return false;
			  }   
		 });
	     
		 $('#txtclientname').dblclick(function(){
			 accountsSearchContent('clientAccountDetailsSearch.jsp');
	     });
		 
		 $('#txtcontract').dblclick(function(){
			 if($('#cmbcontracttype').val()=='ALL'){
				   $.messager.alert('Message','Choose a Contract Type.','warning');   
				   return false;
			 }
			 contractSearchContent('contractDetailsSearch.jsp?contracttype='+$('#cmbcontracttype').val());
	     });
		 
		 $('#isproformainv').val(0);
	});
	
	function accountsSearchContent(url) {
	    $('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#accountDetailsWindow').jqxWindow('setContent', data);
		$('#accountDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function contractSearchContent(url) {
	    $('#contractDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#contractDetailsWindow').jqxWindow('setContent', data);
		$('#contractDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function isNumber(evt) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
         {
          $.messager.alert('Message',' Enter Numbers Only ','warning');    
            return false;
         }
        return true;
    }
	
	function funExportBtn(){
			JSONToCSVCon(dataExcelExport, 'ContractPaymentScheduleUpdate', true);
	} 
	
	function getClientAccount(event){
        var x= event.keyCode;
        if(x==114){
        	accountsSearchContent('clientAccountDetailsSearch.jsp');
        }
        else{}
        }
	
	function getContract(event){
        var x= event.keyCode;
        if(x==114){
        	if($('#cmbcontracttype').val()=='ALL'){
				   $.messager.alert('Message','Choose a Contract Type.','warning');   
				   return false;
			 }
			 contractSearchContent('contractDetailsSearch.jsp?contracttype='+$('#cmbcontracttype').val());
        }
        else{}
        }
	
	function funreload(event){
		
		 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); 
		 	 
		 if(fromdates>todates){
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		   	   return false;
		  }
		  
	     var branch = document.getElementById("cmbbranch").value;
		 var fromdate= $("#fromdate").val();
		 var todate= $("#todate").val();
		 var contracttype=$('#cmbcontracttype').val();
		 var contract= $("#txtcontracttrno").val();
		 var clientid=$('#txtclientaccountdocno').val();
		 
		 $("#overlay, #PleaseWait").show();
		 
		 $("#contractPaymentScheduleUpdateDiv").load("contractPaymentScheduleUpdateGrid.jsp?branch="+branch+"&fromdate="+fromdate+"&todate="+todate+"&contracttype="+contracttype+"&contract="+contract+"&clientid="+clientid);
		
		}
	
	function  funClearData(){
		 $('#cmbbranch').val('a');
   	     $('#fromdate').val(new Date());
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate ').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     $('#todate').val(new Date());
	     
		 $('#txtclientname').val('');
		 $('#txtclientaccountdocno').val('');
		 $('#cmbcontracttype').val('ALL');
		 $('#txtcontract').val('');
		 $('#txtcontracttrno').val('');
		 $('#txtselectedcontract').val('');
		 $('#txtcntrval').val('');
		 $('#isproformainv').val(0);
		 
		 if (document.getElementById("txtclientname").value == "") {
		        $('#txtclientname').attr('placeholder', 'Press F3 to Search'); 
		 }
		 
		 if (document.getElementById("txtcontract").value == "") {
		        $('#txtcontract').attr('placeholder', 'Press F3 to Search'); 
		 }
		 
		 $("#contractPaymentScheduleUpdateGridID").jqxGrid('clear');$("#contractPaymentScheduleUpdateGridID").jqxGrid('addrow', null, {});$("#contractPaymentScheduleUpdateGridID").jqxGrid('clearselection');
		 disable();
	}
	
	function disable(){
		$('#installments').val('');$('#paydueafter').val('');$('#cmbpaytype').val('1');$('#finsdate').val(null);$('#stdate').val(new Date());$('#enddate').val(new Date());
		$('#installments').attr('readonly', true);
		$('#paydueafter').attr('readonly', true);
		$('#cmbpaytype').attr('disabled', true);
		$('#btnAdd').attr('disabled', true);
		$('#finsdate').jqxDateTimeInput({disabled: true});
		$('#stdate').jqxDateTimeInput({disabled: true});
		$('#enddate').jqxDateTimeInput({disabled: true});
		$("#paymentDetailsGridID").jqxGrid('clear');$("#paymentDetailsGridID").jqxGrid({ disabled: true});$("#paymentDetailsGridID").jqxGrid('clearselection');
	}
	
	function funPaymentFill(){
		
		var startdate=$("#finsdate").val();
		var enddate=$("#enddate").val();
		var amount=$("#txtcntrval").val();
		var instno=$("#installments").val();
		var cmbpaytype=$("#cmbpaytype").val();
		var paydueafter=$("#paydueafter").val();

		if($('#installments').val()==''){
			   $.messager.alert('Message','Installment is Mandatory.','warning');   
			   return false;
		 }
		
		if($('#paydueafter').val()==''){
			   $.messager.alert('Message','Due After is Mandatory.','warning');   
			   return false;
		 }
		
		if($('#cmbpaytype').val()==''){
			   $.messager.alert('Message','Frequency is Mandatory.','warning');   
			   return false;
		 }
		
		if($('#finsdate').jqxDateTimeInput('getDate')==null){
			   $.messager.alert('Message','First Inst Date is Mandatory.','warning');   
			   return false;
		}
		
		if($('#finsdate').jqxDateTimeInput('getDate')!=null){
		
	  		var date=new Date($('#finsdate').jqxDateTimeInput('getDate'));
	  		var status=checkInstdate(date);
	  		
	  		if(status){
	  			
	  			 $("#paymentDetailDiv").load("paymentDetailsGrid.jsp?startdate="+startdate+"&enddate="+enddate+"&amount="+amount+"&instno="+instno+"&cmbpaytype="+cmbpaytype+"&paydueafter="+paydueafter+"&gridload=1");
	  		}
	  		
	  	}
	 
	}
	
	function checkInstdate(date){
		 var date1=new Date(date);
		 date1.setHours(0,0,0,0);
		 var stdate=new Date($('#stdate').jqxDateTimeInput('getDate'));
		 var enddate=new Date($('#enddate').jqxDateTimeInput('getDate'));
		 enddate.setHours(0,0,0,0);
		 
		 if(date1<stdate){
			 $.messager.alert('Message','First Inst Date Should not less than Start Date.','warning');   
			 return false;
		 }
		 else if(date1>enddate){
			 $.messager.alert('Message','First Inst Date Should not greater than End Date.','warning');   
			 return false;
		 }
		 
		 else{
			 return true;
		 }
	}
	
	function firstdatechange(){
		
		var date=new Date($('#finsdate').jqxDateTimeInput('getDate'));
  		checkInstdate(date);
  		
	  }
	
	function funPaymentUpdate(){
		
		var rows = $("#paymentDetailsGridID").jqxGrid('getrows');
		if(rows.length==0){
			$("#overlay, #PleaseWait").hide();
			 $.messager.alert('Message','Payments are Unavailable.','warning');   
			 return false;
		}
		
		var gridarray=new Array();
		for(var i=0 ; i < rows.length ; i++){
			
		 	   var chks=rows[i].amount;
			   if(typeof(chks) != "undefined" && typeof(chks) != "NaN" && chks != "" && chks != "0.00"){
				
				   var dueafterser="";
				    
				    if (rows[i].terms =="LEGAL DOCUMENT") {
				    	dueafterser=99;
					}
				    if (rows[i].terms =="SERVICE") {
				    	dueafterser=rows[i].service;
					}
				    if (rows[i].terms =="PROFORMA INVOICE") {
				    	dueafterser=98;
				    	document.getElementById("isproformainv").value=1;
					}
				 $('#hiddesc').val(rows[i].desc1);
						    
			     if ($(hiddesc).val().indexOf('"') >= 0) { $(hiddesc).val($(hiddesc).val().replace(/["']/g, ''));};
			      
				   gridarray.push(rows[i].duedate+" :: "+rows[i].amount+" :: "+rows[i].runtotal+" :: "+$(hiddesc).val()+" :: "+rows[i].terms+" :: "+dueafterser+" :: "+rows[i].service+" :: "+rows[i].rowno+" :: "+rows[i].invtrno+" :: ");
			 }
		}
		
			   $.messager.confirm('Message', 'Do you want to save changes?', function(r){
			        
			     	if(r==false)
			     	  {
			     		return false; 
			     	  }
			     	else {
			     		 $("#overlay, #PleaseWait").show();
			     		 var docno=$('#txtselectedcontract').val();
			     		 saveGridData(docno,gridarray);	
			     	}
			 });
		
		
	}
	
	function saveGridData(docno,gridarray) {
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
				var items=x.responseText;
				items = items.split('***');
				var val = items[0];
				var docno = items[1];
				
				if(parseInt(val)>0){
					$.messager.alert('Message', ' Updated Successfully.', function(r){
					});
					
					$('#txtselectedcontract').val('');
					$('#txtcntrval').val('');
					$('#isproformainv').val(0);
					disable();funreload(event);
				
				} else {
					$.messager.alert('Message', ' Failed.', function(r){
					});
					$("#overlay, #PleaseWait").hide();
				}
		  }
		}
			
		
	x.open("GET","saveData.jsp?docno="+docno+"&gridarray="+encodeURIComponent(gridarray),true);
	x.send();
	}
	
</script>
</head>
<body onload="getBranch();disable();">
<div id="mainBG" class="homeContent" data-type="background"> 
<form id="frmcontractPaymentScheduleUpdate" action="saveContractPaymentScheduleUpdate" method="post" autocomplete="off" style="height: 100%; margin: 0;">
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
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="txtclientname" name="txtclientname" readonly="readonly" placeholder="Double click to search" value='<s:property value="txtclientname"/>' onkeydown="getClientAccount(event);" ondblclick="getClientAccount(event);" />
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Type</td>
                        <td>
                            <select id="cmbcontracttype" name="cmbcontracttype" value='<s:property value="cmbcontracttype"/>'>
                                <option value="ALL">ALL</option>
                                <option value="AMC">AMC</option>
                                <option value="SJOB">SJOB</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Contract</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="txtcontract" name="txtcontract" readonly="readonly" placeholder="Double click to search" value='<s:property value="txtcontract"/>' onkeydown="getContract(event);" ondblclick="getContract(event);" />
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <div class="card-header">Payment Details</div>
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Installments</td>
                        <td><input type="text" id="installments" name="installments" value='<s:property value="installments"/>'/></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Due After</td>
                        <td><input type="text" id="paydueafter" name="paydueafter" value='<s:property value="paydueafter"/>'/></td>
                    </tr>
                    <tr>
                        <td class="label-cell">First Inst. On</td>
                        <td><div id="finsdate" name="finsdate" onchange="firstdatechange();" value='<s:property value="finsdate" />'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Frequency</td>
                        <td>
                            <select name="cmbpaytype" id="cmbpaytype" value='<s:property value="cmbpaytype"/>'>
                                <option value="1">DAYS</option>
                                <option value="2">MONTHS</option>
                                <option value="3">YEAR</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Start Date</td>
                        <td><div id="stdate" name="stdate" value='<s:property value="stdate" />'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">End Date</td>
                        <td><div id="enddate" name="enddate" value='<s:property value="enddate" />'></div></td>
                    </tr>
                </table>

                <div class="release-actions">
                    <button type="button" class="btn-submit" id="btnAdd" name="btnAdd" onclick="funPaymentFill();">Fill</button>
                </div>
            </div>

            <div class="release-actions" style="margin-top: 20px;">
                <button type="button" class="btn-submit btn-secondary" name="clear" id="clear" onclick="funClearData();">Clear</button>
                <button type="button" class="btn-submit" id="btnPaymentUpdate" name="btnPaymentUpdate" onclick="funPaymentUpdate();">Update</button>
            </div>

            <input type="hidden" id="txtclientaccountdocno" name="txtclientaccountdocno" value='<s:property value="txtclientaccountdocno"/>'/>
            <input type="hidden" id="txtcontracttrno" name="txtcontracttrno" value='<s:property value="txtcontracttrno"/>'/>
            <input type="hidden" id="txtcntrval" name="txtcntrval" value='<s:property value="txtcntrval"/>'/>
            <input type="hidden" id="txtselectedcontract" name="txtselectedcontract" value='<s:property value="txtselectedcontract"/>'/>
            <input type="hidden" id="isproformainv" name="isproformainv" value='<s:property value="isproformainv"/>'/>
            <input type="hidden" id="hiddesc" name="hiddesc" value='<s:property value="hiddesc"/>'/>

        </div>
    </div>

</td>

<td style="vertical-align: top; padding: 0; background: #fff; height: 100%;">
    
    <div style="position: relative; height: 100%; width: 100%;">
        
        <div class="scrollable-column">
            <div class="main-content-padding">
                <table width="100%">
                    <tr>
                        <td style="padding-bottom: 20px;">
                            <div id="contractPaymentScheduleUpdateDiv">
                                <jsp:include page="contractPaymentScheduleUpdateGrid.jsp"></jsp:include>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="paymentDetailDiv">
                                <jsp:include page="paymentDetailsGrid.jsp"></jsp:include>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
    </div>
    
</td>
</tr>
</table>
<div style="height: 200px; width: 100%; clear: both; float: none; display: block;"></div>
</div>
</form>

<div id="accountDetailsWindow">
    <div></div><div></div>
</div>
<div id="contractDetailsWindow">
    <div></div><div></div>
</div>

</div> 
</body>
</html>