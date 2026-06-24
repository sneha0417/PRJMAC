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

<style>
/* ===== MASTER LAYOUT ===== */
html, body, #mainBG, .hidden-scrollbar {
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

/* Sidebar Component */
.sidebar-filters {
    width: 330px;
    flex: 0 0 330px;
    background: #fff;
    border-right: 1px solid #e1e8ed;
    display: flex;
    flex-direction: column;
    height: 90%;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 2;
        overflow-y: auto;
    
}

.sidebar-fixed-top {
    padding: 15px 20px;
    border-bottom: 1px solid #f0f4f8;
}

.sidebar-scroll-content {
    flex: 1;
    padding: 15px 20px 25px;
}

/* Cards Layout Rules */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 12px;
    margin-bottom: 12px;
}

/* Internal Presentation Tables */
.filter-table {
    width: 100%;
    border-spacing: 0 10px;
}

.filter-table .label-cell {
    text-align: right;
    padding-right: 12px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    width: 90px;
}

/* ===== UNIFORM 24px INPUTS & SELECTS ===== */
input[type="text"], select,
.filter-table input[type="text"],
.filter-table select {
    width: 100%;
    height: 24px !important;             
    padding: 2px 8px !important;         
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px !important;       
    font-size: 12px !important;          
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    outline: none;
}

/* Select specific styling */
select {
    padding: 2px 24px 2px 8px !important; 
    font-family: inherit;
    cursor: pointer;
    appearance: none;
    -webkit-appearance: none;
    background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%234e5e71' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 6px center;
    background-size: 12px;
}



/* jqx Date Container Mapping Rules */
.filter-table div[id^="date"] {
    width: 100%;
}

/* ===== MASTER 30px BUTTON SYSTEM OVERRIDES ===== */
.myButton, .myButtons, .mySaveButton {
    width: 100%;
    height: 30px !important;            
    padding: 0 12px !important;
    border: none !important;
    border-radius: 4px !important;
    font-size: 13px !important;
    font-weight: 600 !important;
    cursor: pointer;
    line-height: 30px !important;
    white-space: nowrap;
    text-align: center;
    transition: all 0.2s ease;
    box-shadow: none !important;
    text-shadow: none !important;
    display: inline-block;
    box-sizing: border-box;
    color: #fff !important;
}

/* WPS Format (Primary Blue) */
.myButton {
    background: #2563eb !important;
}
.myButton:hover {
    background: #1d4ed8 !important;
}

/* Save (Success Green) */
.mySaveButton {
	background: #2563eb;
	}
.mySaveButton:hover {
    background: #005c97;
     border-color: #2563eb;                
    transform: scale(1.08);                
    box-shadow: 0 6px 16px rgba(37, 99, 235, 0.25);
    z-index: 2;
}

/* Clear (Secondary Slate) */
.myButtons {
    background: #64748b !important;
}
.myButtons:hover {
    background: #475569 !important;
}

/* Disabled button state */
.myButtons:disabled, .mySaveButton:disabled, .myButton:disabled {
    background: #9ca3af !important;
    color: #f3f4f6 !important;
    cursor: not-allowed;
}

/* Button Group Alignment */
.button-row {
    display: flex;
    gap: 8px;
    margin-top: 10px;
}

/* Workspace Panels */
.main-content-wrapper {
    flex: 1;
    width: 100%;
    display: flex;
    flex-direction: column;
    padding: 15px 20px;
    background: #fff;
    height: 100vh;
    box-sizing: border-box;
}

.scrollable-grid-area {
    flex: 1;
    width: 100%;
    overflow: auto;
}
</style>	

<script type="text/javascript">

	$(document).ready(function () {
		
		 // UI Config: standardized dimensions to 100% width and 24px height
		 $("#date").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy", enableBrowserBoundsDetection: true});
		
		 /* Searching Window */
     	 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Account Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
  		 $('#accountDetailsWindow').jqxWindow('close');
  		 
  		 $('#establishedCodeDetailsWindow').jqxWindow({width: '25%', height: '58%',  maxHeight: '70%' ,maxWidth: '30%' , title: 'Establishment Code Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 		 $('#establishedCodeDetailsWindow').jqxWindow('close');
  		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
		 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
	     $('#txtaccount').dblclick(function(){
	    	 accountSearchContent("accountDetailsSearch.jsp");
		 });
	     
	     $('#txtbankaccount').dblclick(function(){
	    	 accountSearchContent("bankAccountDetailsSearch.jsp");
		 });
	     
	     $('#txtestablishmentcode').dblclick(function(){
	    	 establishedCodeSearchContent("establishmentCodeDetailsSearch.jsp");
		 });
	     
	     $("#salaryPaymentDetailsGridID").jqxGrid({ height: 532 });
	     $('#salaryPaymentDetailsGridID').jqxGrid({ selectionmode: 'singlerow'});
	     $("#salaryPaymentDetailsGridID").jqxGrid({ disabled: true});
	     $('#btnSaveSalaryPayment').attr('disabled', true );
	     $('#btnSifSalaryPayment').attr('disabled', true );
	     $('#date').jqxDateTimeInput({disabled: true});
	});
	
	function accountSearchContent(url) {
	 	$('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#accountDetailsWindow').jqxWindow('setContent', data);
		$('#accountDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function establishedCodeSearchContent(url) {
	 	$('#establishedCodeDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#establishedCodeDetailsWindow').jqxWindow('setContent', data);
		$('#establishedCodeDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	 function getYear() {
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					var items = x.responseText;
					items = items.split('####');
					var yearItems = items[0].split(",");
					var yearIdItems = items[1].split(",");
					$('#excelconfig').val(items[2].split(","));
					var optionsyear = '<option value="">--Select--</option>';
					for (var i = 0; i < yearItems.length; i++) {
						optionsyear += '<option value="' + yearIdItems[i] + '">'
								+ yearItems[i] + '</option>';
					}
					$("select#cmbyear").html(optionsyear);
					if($('#hidcmbyear').val()){
						document.getElementById("cmbyear").value=document.getElementById("hidcmbyear").value;
						funreload(event);
					  }
				} else {
				}
			}
			x.open("GET", "getYear.jsp", true);
			x.send();
		}
	
	function getPayrollCategory() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var payrollcategoryItems = items[0].split(",");
				var payrollcategoryIdItems = items[1].split(",");
				var optionspayrollcategory = '<option value="">--Select--</option>';
				for (var i = 0; i < payrollcategoryItems.length; i++) {
					optionspayrollcategory += '<option value="' + payrollcategoryIdItems[i] + '">'
							+ payrollcategoryItems[i] + '</option>';
				}
				$("select#cmbempcategory").html(optionspayrollcategory);
				
			} else {
			}
		}
		x.open("GET", "getPayrollCategory.jsp", true);
		x.send();
	}
	
	function getSalesAgent() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var salesAgentItems = items[0].split(",");
				var salesAgentIdItems = items[1].split(",");
				var optionssalesagent = '<option value="">--Select--</option>';
				for (var i = 0; i < salesAgentItems.length; i++) {
					 optionssalesagent += '<option value="' + salesAgentIdItems[i] + '">'
							+ salesAgentItems[i] + '</option>';
				}
				$("select#cmbempagentid").html(optionssalesagent);
				
			} else {
			}
		}
		x.open("GET", "getSalesAgent.jsp", true);
		x.send();
	}
	
	function getAccount(event){
        var x= event.keyCode;
        if(x==114){
        	accountSearchContent("accountDetailsSearch.jsp");
        }
        else{}
        }
	
	function getBankAccount(event){
        var x= event.keyCode;
        if(x==114){
        	accountSearchContent("bankAccountDetailsSearch.jsp");
        }
        else{}
        }
	
	function getEstablishmentCode(event){
        var x= event.keyCode;
        if(x==114){
        	establishedCodeSearchContent("establishmentCodeDetailsSearch.jsp");
        }
        else{}
        }

	function  funClearInfo(){
		$('#cmbbranch').val('a');$('#cmbyear').val('');$('#cmbmonth').val('');$('#txtestablishmentcode').val('');
	    $('#txtaccount').val('');$('#txtaccountname').val('');$('#txtaccountdocno').val('');$('#date').val(new Date());$('#hiddate').val('');
	    $('#cmbempcategory').val('');$('#cmbempagentid').val('');
	    $('#txtbankaccount').val('');$('#txtbankaccountname').val('');$('#txtbankaccountdocno').val('');
	    $('#txtdrtotal').val('');$('#txtcrtotal').val('');$('#gridlength').val('');
	    $("#salaryPaymentDetailsGridID").jqxGrid('clearselection');$("#salaryPaymentDetailsGridID").jqxGrid('clear');$("#salaryPaymentDetailsGridID").jqxGrid('addrow', null, {});$("#salaryPaymentDetailsGridID").jqxGrid({ disabled: true});
	    $("#postedSalaryGridID").jqxGrid('clear');$("#salaryPaymentJVGridID").jqxGrid('clear');$("#salaryPaymentJVGridID").jqxGrid({ disabled: true});
	    $('#date').jqxDateTimeInput({disabled: true});$('#btnSaveSalaryPayment').attr('disabled', true );
	    
		if (document.getElementById("txtaccount").value == "") {
	        $('#txtaccount').attr('placeholder', 'Press F3 to Search'); 
	        $('#txtaccountname').attr('placeholder', 'Employee Name');
	    }
		
		if (document.getElementById("txtbankaccountdocno").value == "") {
	        $('#txtbankaccount').attr('placeholder', 'Press F3 to Search'); 
	        $('#txtbankaccountname').attr('placeholder', 'Bank Account');
	    }
		
		if (document.getElementById("txtestablishmentcode").value == "") {
	        $('#txtestablishmentcode').attr('placeholder', 'Press F3 to Search'); 
	    }
		
	 }
	
	function funreload(event){
		 var branchval = document.getElementById("cmbbranch").value;
		 var year = $('#cmbyear').val();
		 var month = $('#cmbmonth').val();
		 var category = $('#cmbempcategory').val();
		 var agent = $('#cmbempagentid').val();
		 var establishmentcode = $('#txtestablishmentcode').val();
		 
		 if($('#cmbyear').val()==''){
			 $.messager.alert('Message','Please Choose a Year.','warning');
			 return 0;
		 }
		
		if($('#cmbmonth').val()==''){
			 $.messager.alert('Message','Please Choose a Month.','warning');
			 return 0;
		 } 
		
		 $("#overlay, #PleaseWait").show();
		 
		 $('#btnSifSalaryPayment').attr('disabled', true );
		 $('#date').val(new Date());$('#date').jqxDateTimeInput({disabled: true});$('#btnSaveSalaryPayment').attr('disabled', true );
		 $("#salaryPaymentDetailsGridID").jqxGrid('clearselection');$("#salaryPaymentDetailsGridID").jqxGrid('clear');
		 $("#salaryPaymentDetailsGridID").jqxGrid('addrow', null, {});$("#salaryPaymentDetailsGridID").jqxGrid({ disabled: true});
		 $("#salaryPaymentJVGridID").jqxGrid('clear');$("#salaryPaymentJVGridID").jqxGrid({ disabled: true});$('#txtselectedemployees').val('');
		 $("#postedSalaryDiv").load("postedSalaryGrid.jsp?branchval="+branchval+'&year='+year+'&month='+month+'&category='+category+'&agent='+agent+'&establishmentCode='+establishmentcode.replace(/ /g, "%20")+'&check=1');
	}
	
	function funCalculate(){
		
		if($('#cmbyear').val()==''){
			 $.messager.alert('Message','Please Choose a Year.','warning');
			 return 0;
		 }
		
		if($('#cmbmonth').val()==''){
			 $.messager.alert('Message','Please Choose a Month.','warning');
			 return 0;
		 } 
		
		if($('#txtaccountdocno').val()==''){
			 $.messager.alert('Message','Please Choose a Payable Account & Then Calculate.','warning');
			 return 0;
		 } 
		
		var rows = $('#salaryPaymentJVGridID').jqxGrid('getrows');
    	var rowlength= rows.length;
		if(rowlength!=0){
			$.messager.alert('Message','Already calculated.Submit Again. ','warning');
			return 0;
		} else{
			$("#salaryPaymentJVGridID").jqxGrid('clear');
			$('#txtselectedemployees').val('');
		} 
		
		$("#overlay, #PleaseWait").show();
		
		$("#salaryPaymentJVGridID").jqxGrid({ disabled: false});
		
		var rows = $("#salaryPaymentDetailsGridID").jqxGrid('getrows');
		
		if(rows.length==1 && (rows[0].empdocno=="undefined" || rows[0].empdocno==null || rows[0].empdocno=="")){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select Items to be Calculated.');
			return false;
		}
		
		var selectedrows=$("#salaryPaymentDetailsGridID").jqxGrid('selectedrowindexes');
		selectedrows = selectedrows.sort(function(a,b){return a - b});
		
		if(selectedrows.length==0){
			$("#overlay, #PleaseWait").hide();
			$.messager.alert('Warning','Select Items to be Calculated.');
			return false;
		}
		
		var i=0;var tempemp="",tempemp1="";
        var j=0,k=0;
	    for (i = 0; i < rows.length; i++) {
				if(selectedrows[j]==i){
					
					if(i==0){
						tempemp=rows[i].empdocno;
						k=1;
					}
					else{
						if(k==0){
							tempemp=rows[i].empdocno;
							k=1;
						} else {
							tempemp=tempemp+","+rows[i].empdocno;
						}
					}
					tempemp1=tempemp;
					
				j++; 
			  }
            }
	     $('#txtselectedemployees').val(tempemp1);
		
	     var year = $('#cmbyear').val();
  		 var month = $('#cmbmonth').val();
  		 var bankaccount = $('#txtaccountdocno').val();
  		 var employees = $('#txtselectedemployees').val();
  		 var paymentPosting = $('#date').val();
  		
  		 $("#overlay, #PleaseWait").show();
  		 $("#salaryPaymentJVGridID").jqxGrid('clear');$("#salaryPaymentJVGridID").jqxGrid({ disabled: false});
  		 $('#btnSaveSalaryPayment').attr('disabled', false );
  		
  		 $("#JVTDiv").load("salaryPaymentJVGrid.jsp?year="+year+'&month='+month+'&bankaccount='+bankaccount+'&employees='+employees+'&paymentPosting='+paymentPosting+'&check=1');
	}
	
	function funNotify(){	
    	
		   var rows = $('#salaryPaymentJVGridID').jqxGrid('getrows');
	       var rowlength= rows.length;
		   if(rowlength==0){
				$.messager.alert('Message','Please Calculate & Save Again. ','warning');
				return 0;
		   } 
		  
		   $.messager.confirm('Confirm', 'Do you want to save changes?', function(r){
	 		if (r){
	 				
	 			/* Salary Payment Grid  Saving*/
			 	var rows = $("#salaryPaymentJVGridID").jqxGrid('getrows');
			 	var length=0;
					 for(var i=0 ; i < rows.length ; i++){
						var chk=rows[i].docno;
						if(typeof(chk) != "undefined" && typeof(chk) != "NaN" && chk != ""){
							newTextBox = $(document.createElement("input"))
						    .attr("type", "dil")
						    .attr("id", "test"+length)
						    .attr("name", "test"+length)
							.attr("hidden", "true");
							length=length+1;
							
							var amount="0",baseamount="0",id="1";
							if((rows[i].credit!=null) && (rows[i].credit!='undefined') &&  (rows[i].credit!='NaN') && (rows[i].credit!="") && (rows[i].credit!=0)){
								 amount=rows[i].credit*-1;
								 baseamount=rows[i].baseamount*-1;
								 id=-1;
							}
							
							if((rows[i].debit!=null) && (rows[i].debit!='undefined') && (rows[i].debit!='NaN') && (rows[i].debit!="") && (rows[i].debit!=0)){
								 amount=rows[i].debit;
								 baseamount=rows[i].baseamount;
								 id=1;
							}
								
				    newTextBox.val(rows[i].docno+"::"+rows[i].description+":: "+rows[i].currencyid+":: "+rows[i].rate+":: "+baseamount+":: "+amount+":: 0::"+id+":: 0:: 0");
				    newTextBox.appendTo('form');
				 }
				}
	 		 	$('#gridlength').val(length);
			 	/* Salary Payment Grid  Saving Ends*/
	 		
			 document.getElementById("mode").value='A';
			 $("#overlay, #PleaseWait").show();
			 document.getElementById("frmDashboardSalaryPayment").submit();
			 
	 		 }
	 		});
		 
		return 1;
	}
	
	function setValues(){
		getYear();
		
		document.getElementById("cmbmonth").value=document.getElementById("hidcmbmonth").value;
	  
		  if($('#msg').val()!=""){
			 $.messager.alert('Message',$('#msg').val());
			 $('#txtdrtotal').val('');$('#txtcrtotal').val('');$('#gridlength').val('');
		 }
	}
	
	function funExportBtn(){
		var method=document.getElementById("excelconfig").value;
		
		if(method==1){
		JSONToCSVCon(dataexcel, 'SalaryPayment', true);
		}
		else{
		JSONToCSVCon(data1, 'SalaryPayment', true);
		}
	} 
	
	function funWPSFormat(){
		
		if($('#txtestablishmentcode').val()==''){
			$("#salaryPaymentDetailsGridID").jqxGrid('clearselection');$("#salaryPaymentDetailsGridID").jqxGrid('clear');$("#salaryPaymentDetailsGridID").jqxGrid('addrow', null, {});
			 $.messager.alert('Message','Establishment Code is Mandatory.','warning');
			 return 0;
		 }
		
		if($('#txtbankaccountdocno').val()==''){
			$("#salaryPaymentDetailsGridID").jqxGrid('clearselection');$("#salaryPaymentDetailsGridID").jqxGrid('clear');$("#salaryPaymentDetailsGridID").jqxGrid('addrow', null, {});
			 $.messager.alert('Message','Bank Account is Mandatory.','warning');
			 return 0;
		 }
		
		var rows = $("#salaryPaymentDetailsGridID").jqxGrid('getrows');
		if(rows.length==1 && (rows[0].empdocno=="undefined" || rows[0].empdocno==null || rows[0].empdocno=="")){
			$.messager.alert('Warning','Please Submit & Click again.');
			return false;
		}
		
		JSONToSIFCon(dataSIF, 'SalaryPayment', true);
	}
	
</script>
</head>
<body onload="getBranch();setValues();getYear();getPayrollCategory();getSalesAgent();">
<form id="frmDashboardSalaryPayment" action="saveDashboardSalaryPayment" method="post">
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
            
            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Year</td>
                        <td>
                            <select id="cmbyear" name="cmbyear" value='<s:property value="cmbyear"/>'>
                                <option value="">--Select--</option>
                            </select>
                            <input type="hidden" id="hidcmbyear" name="hidcmbyear" value='<s:property value="hidcmbyear"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Month</td>
                        <td>
                            <select id="cmbmonth" name="cmbmonth" value='<s:property value="cmbmonth"/>'>
                                <option value="">--Select--</option>
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                            <input type="hidden" id="hidcmbmonth" name="hidcmbmonth" value='<s:property value="hidcmbmonth"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Agent Id</td>
                        <td>
                            <select id="cmbempagentid" name="cmbempagentid" value='<s:property value="cmbempagentid"/>'></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Category</td>
                        <td>
                            <select id="cmbempcategory" name="cmbempcategory" value='<s:property value="cmbempcategory"/>'></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Est.Code</td>
                        <td>
                            <input type="text" id="txtestablishmentcode" name="txtestablishmentcode" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtestablishmentcode"/>' onkeydown="getEstablishmentCode(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Payable</td>
                        <td>
                            <input type="text" id="txtaccount" name="txtaccount" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtaccount"/>' onkeydown="getAccount(event);"/>
                            <input type="hidden" id="txtaccountdocno" name="txtaccountdocno" value='<s:property value="txtaccountdocno"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtaccountname" name="txtaccountname" readonly="readonly" placeholder="Payable Account" tabindex="-1" value='<s:property value="txtaccountname"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Payment</td>
                        <td>
                            <div id="date" name="date" value='<s:property value="date"/>'></div>
                            <input type="hidden" id="hiddate" name="hiddate" readonly="readonly" value='<s:property value="hiddate"/>'/>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card" style="padding: 8px;">
                <div id="postedSalaryDiv"><jsp:include page="postedSalaryGrid.jsp"></jsp:include></div>
            </div>

            <div class="filter-card">
                <table class="filter-table">
                    <tr>
                        <td class="label-cell">Bank</td>
                        <td>
                            <input type="text" id="txtbankaccount" name="txtbankaccount" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtbankaccount"/>' onkeydown="getBankAccount(event);"/>
                            <input type="hidden" id="txtbankaccountdocno" name="txtbankaccountdocno" value='<s:property value="txtbankaccountdocno"/>'/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtbankaccountname" name="txtbankaccountname" readonly="readonly" placeholder="Bank Account" tabindex="-1" value='<s:property value="txtbankaccountname"/>'/>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <input type="button" class="myButtons" name="clear" id="clear" value="Clear" onclick="funClearInfo();">
                <div class="button-row">
                    <input type="button" class="myButton" id="btnSifSalaryPayment" name="btnSifSalaryPayment" value="WPS Format" onclick="funWPSFormat();">
                    <input type="button" class="mySaveButton" id="btnSaveSalaryPayment" name="btnSaveSalaryPayment" value="Save" onclick="funNotify();">
                </div>
            </div>

            <div style="display:none;">
                <input type="hidden" id="txtselectedemployees" name="txtselectedemployees" value='<s:property value="txtselectedemployees"/>'/>
                <input type="hidden" name="txtdrtotal" id="txtdrtotal" value='<s:property value="txtdrtotal"/>'>
                <input type="hidden" name="txtcrtotal" id="txtcrtotal" value='<s:property value="txtcrtotal"/>'>
                <input type="hidden" id="gridlength" name="gridlength" value='<s:property value="gridlength"/>'/>
                <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'>
                <input type="hidden" name="msg" id="msg" value='<s:property value="msg"/>'>
                <input type="hidden" name="excelconfig" id="excelconfig" value='<s:property value="excelconfig"/>'>
            </div>

        </div>
    </div>

    <div class="main-content-wrapper">
        <div class="scrollable-grid-area">
            <div id="salaryPaymentDetailsDiv">
                <jsp:include page="salaryPaymentGrid.jsp"></jsp:include>
            </div>
            <div id="JVTDiv" hidden="true" style="margin-top: 20px;">
                <jsp:include page="salaryPaymentJVGrid.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>

<div id="accountDetailsWindow"><div></div></div>
<div id="establishedCodeDetailsWindow"><div></div></div>

</div> 
</form>
</body>
</html>