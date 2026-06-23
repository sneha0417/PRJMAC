<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>GatewayERP(i) | Bank Receipt</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
/* =========================================================
   PREMIUM ROYAL BLUE THEME (Matches Login & Dashboard UI)
========================================================= */
:root {
    --bg-page: #EEF4FF;
    --navy-blue: #12355B;
    --royal-blue: #2563EB;
    --sky-blue: #60A5FA;
    --white: #FFFFFF;
    --text-dark: #1E293B;
    --text-muted: #64748B;
    --border-color: #E2E8F0;
    --input-bg: #F8FAFC;
    
    --font-family: 'Inter', sans-serif;
    --shadow-sm: 0 2px 4px rgba(10, 35, 66, 0.05);
    --shadow-md: 0 4px 10px rgba(10, 35, 66, 0.08);
    --shadow-card: 0 10px 25px rgba(10, 35, 66, 0.1);
}

body {
    background-color: var(--bg-page);
    font-family: var(--font-family);
    color: var(--text-dark);
    margin: 0;
    padding: 20px;
    box-sizing: border-box;
    overflow-y: auto !important;
}

#mainBG {
    background: var(--white);
    border-radius: 20px;
    padding: 25px 30px;
    max-width: 100%;
    margin: 0 auto;
    box-shadow: var(--shadow-card);
    border: 1px solid var(--border-color);
}

.modern-ui {
    font-family: var(--font-family); 
    color: var(--text-dark);
    font-size: 13px; 
    width: 100%;
}

/* Master Input Heights & Styling */
.modern-ui input[type="text"],
.modern-ui select { 
    height: 32px !important; 
    border: 1px solid var(--border-color); 
    border-radius: 6px; 
    padding: 0 10px;
    font-family: var(--font-family);
    font-size: 13px;
    box-sizing: border-box; 
    background-color: var(--input-bg); 
    color: var(--text-dark);
    width: 100%;
    transition: all 0.2s ease;
}

select.form-control, .modern-ui select {
    cursor: pointer;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%2364748B'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 8px center;
    background-size: 1.2em;
    padding-right: 25px;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus { 
    border-color: var(--royal-blue); 
    outline: none;
    background-color: var(--white);
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
}

.modern-ui input[readonly],
.modern-ui input:disabled,
.modern-ui select:disabled { 
    background-color: #F1F5F9; 
    color: #94A3B8;
    cursor: not-allowed;
    border-color: #E2E8F0;
}

/* Layout Utilities */
.modern-ui .field-row { 
    display: flex;
    align-items: center; 
    gap: 12px;
    margin-bottom: 15px; 
    flex-wrap: wrap;
}

.modern-ui .lbl-right { 
    text-align: right; 
    color: var(--navy-blue);
    font-size: 13px; 
    font-weight: 600;
    white-space: nowrap; 
    padding-right: 5px;
}

/* Middle Section Panels - Clean Card Look */
.modern-ui .middle-panel {
    border: 1px solid var(--border-color); 
    padding: 25px 20px 15px 20px; 
    background: var(--white); 
    position: relative; 
    border-radius: 12px; 
    margin-bottom: 20px;
    margin-top: 15px;
    box-shadow: var(--shadow-sm);
}

.modern-ui .middle-panel-title { 
    position: absolute; 
    top: -12px;
    left: 15px; 
    background: var(--white); 
    padding: 0 10px; 
    color: var(--royal-blue);
    font-weight: 700; 
    font-size: 13px; 
    text-transform: uppercase;
    letter-spacing: 0.5px;
    z-index: 2; 
}

/* Custom Action Buttons */
.modern-ui .myButton {
    height: 32px !important;
    padding: 0 16px;
    font-family: var(--font-family);
    font-size: 12px;
    font-weight: 600;
    border-radius: 50px; /* Pill shape matching login */
    cursor: pointer;
    transition: all 0.2s ease;
    box-shadow: 0 4px 6px rgba(37, 99, 235, 0.2);
    border: none;
    background: var(--royal-blue);
    color: var(--white);
    white-space: nowrap;
    display: flex;
    align-items: center;
    justify-content: center;
}
.modern-ui .myButton:hover { 
    background: var(--navy-blue); 
    transform: translateY(-1px);
    box-shadow: 0 6px 10px rgba(18, 53, 91, 0.3);
}

/* Search Icon Wrapper */
.modern-ui .input-search-container {
    position: relative;
    display: flex;
}
.modern-ui .input-search-container input {
    padding-right: 30px !important;
}
.modern-ui .magnifier-icon {
    position: absolute;
    right: 8px; 
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: var(--sky-blue); 
    z-index: 10;
    transition: color 0.2s;
}
.modern-ui .magnifier-icon:hover { color: var(--royal-blue); }

/* Custom Checkbox */
.modern-ui input[type="checkbox"] {
    accent-color: var(--royal-blue);
    width: 16px;
    height: 16px;
    cursor: pointer;
}

/* Grid Wrappers */
.modern-ui .grid-container {
    border: 1px solid var(--border-color);
    border-radius: 8px;
    background: var(--white);
    overflow: hidden;
}

/* Validation Label */
.modern-ui .val-error { color: #EF4444; font-size: 12px; font-weight:600; }

/* Overriding jqxDateTimeInput to fit modern style */
.jqx-widget-content {
    font-family: var(--font-family) !important;
    border-color: var(--border-color) !important;
    border-radius: 6px !important;
}

/* Scrollbar Logic */
.hidden-scrollbar {
    overflow-y: auto;
    height: calc(100vh - 120px);
    padding-right: 8px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #CBD5E1; border-radius: 10px; }
.hidden-scrollbar::-webkit-scrollbar-track { background: transparent; }
</style>

<script type="text/javascript">
	$(document).ready(function() {
		 $("#btnvaluechange").hide();
		
		 $("#jqxBankReceiptDate").jqxDateTimeInput({ width: '120px', height: 32, formatString:"dd.MM.yyyy", theme: 'energyblue'});
		 $("#jqxChequeDate").jqxDateTimeInput({ width: '110px', height: 32, formatString:"dd.MM.yyyy", theme: 'energyblue'});
		 $("#maindate").jqxDateTimeInput({ width: '120px', height: 32, formatString:"dd.MM.yyyy"});

         /* Force internal alignment AFTER render for modern UI */
         setTimeout(function () {
             $("#jqxBankReceiptDate, #jqxChequeDate, #maindate").find("input").css({
                 "margin-top": "0px",
                 "line-height": "32px",
                 "font-size": "13px", 
                 "font-family": "Inter, sans-serif", 
                 "padding": "0 10px", 
                 "box-sizing":"border-box",
                 "background-color": "#F8FAFC"
             });
             $("#jqxBankReceiptDate, #jqxChequeDate, #maindate").find(".jqx-action-button").css({
                 "top": "0px",
                 "height": "32px"
             });
         }, 0);
		 
		 $('#accountDetailsToWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsToWindow').jqxWindow('close');  
		 
		 $('#accountDetailsFromWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsFromWindow').jqxWindow('close');
		 
		 $('#bankReceiptGridWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#bankReceiptGridWindow').jqxWindow('close');
		 
		 $('#costTypeSearchGridWindow').jqxWindow({width: '25%', height: '58%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'Cost Type Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#costTypeSearchGridWindow').jqxWindow('close');
		 
		 $('#costCodeSearchWindow').jqxWindow({width: '25%', height: '58%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'Cost Code Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#costCodeSearchWindow').jqxWindow('close');
		 
		 $('#printWindow').jqxWindow({width: '51%', height: '28%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Print',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#printWindow').jqxWindow('close');
		 
		 $('#jqxBankReceiptDate').on('change', function (event) {
				 var bankreceiptdate = $('#jqxBankReceiptDate').jqxDateTimeInput('getDate');
				 var validdate=funDateInPeriod(bankreceiptdate);
				 if(parseInt(validdate)==0){
					document.getElementById("errormsg").innerText="Transaction prior or after Account Period is not valid.";
					return 0;	
				 }
		 });
			 
		$('#txtfromaccid').dblclick(function(){
			  var date = $('#jqxBankReceiptDate').jqxDateTimeInput('getDate');
          	  $("#maindate").jqxDateTimeInput('val', date);
			  accountFromSearchContent(<%=contextPath+"/"%>+"com/finance/accountsDetailsSearch.jsp?date="+date);
		});
		 
		$('#txttoaccid').dblclick(function(){
			  var date = $('#jqxBankReceiptDate').jqxDateTimeInput('getDate');
          	  $("#maindate").jqxDateTimeInput('val', date);
			  accountToSearchContent(<%=contextPath+"/"%>+"com/finance/clientAccountDetailsSearch.jsp?atype="+$('#cmbtotype').val()+"&date="+date);
		});
		
	});
	
	function BankSearchContent(url) {
		$('#bankReceiptGridWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#bankReceiptGridWindow').jqxWindow('setContent', data);
		$('#bankReceiptGridWindow').jqxWindow('bringToFront');
	}); 
	} 
	
	function accountFromSearchContent(url) {
		    $('#accountDetailsFromWindow').jqxWindow('open');
			$.get(url).done(function (data) {
			$('#accountDetailsFromWindow').jqxWindow('setContent', data);
			$('#accountDetailsFromWindow').jqxWindow('bringToFront');
		}); 
		}
	
	function accountToSearchContent(url) {
		 	$('#accountDetailsToWindow').jqxWindow('open');
			$.get(url).done(function (data) {
			$('#accountDetailsToWindow').jqxWindow('setContent', data);
			$('#accountDetailsToWindow').jqxWindow('bringToFront');
		}); 
		}
	
	function costTypeSearchContent(url) {
	    $('#costTypeSearchGridWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#costTypeSearchGridWindow').jqxWindow('setContent', data);
		$('#costTypeSearchGridWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function costCodeSearchContent(url) {
	    $('#costCodeSearchWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#costCodeSearchWindow').jqxWindow('setContent', data);
		$('#costCodeSearchWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function BankPrintContent(url) {
		$('#printWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#printWindow').jqxWindow('setContent', data);
		$('#printWindow').jqxWindow('bringToFront');
	}); 
	} 
	
	function checkpdc(){
		 if(document.getElementById("hidchckpdc").value==1){
			 document.getElementById("chckpdc").checked = true;
		 }
		 else if(document.getElementById("hidchckpdc").value==0){
			document.getElementById("chckpdc").checked = false;
		  }
		 }
	
	 function funReadOnly(){
		    $('#frmBankReceipt input').attr('readonly', true );
			$('#frmBankReceipt select').attr('disabled', true);
			$('#chckpdc').attr('disabled', true);
			$('#jqxBankReceiptDate').jqxDateTimeInput({disabled: true});
			$('#jqxChequeDate').jqxDateTimeInput({disabled: true});
			$("#jqxApplyBankInvoicing").jqxGrid({ disabled: true});
			$("#jqxBankReceipt").jqxGrid({ disabled: true});
			$("#btnvaluechange").hide();

			 if(parseInt($("#pdcposttrno").val())!=0){
					 $("#btnEdit").attr('disabled', true);
					 $("#btnDelete").attr('disabled', true);
				 }
	 }
	 function funRemoveReadOnly(){
		    checkpdc();
			$('#frmBankReceipt input').attr('readonly', false );
			$('#frmBankReceipt select').attr('disabled', false);
			
			$('#txtfromaccid').attr('readonly', true );
			$('#txtfromaccname').attr('readonly', true );
			$('#txttoaccid').attr('readonly', true );
			$('#txttoaccname').attr('readonly', true );
			$('#txtapplyinvoiceamt').attr('readonly', true );
			$('#txtapplyinvoiceapply').attr('readonly', true );
			$('#txtapplyinvoicebalance').attr('readonly', true );
			$('#txtdrtotal').attr('readonly', true );
			$('#txtcrtotal').attr('readonly', true );
			$('#jqxBankReceiptDate').jqxDateTimeInput({disabled: false});
			$('#jqxChequeDate').jqxDateTimeInput({disabled: false});
			$('#docno').attr('readonly', true);
			$("#jqxApplyBankInvoicing").jqxGrid({ disabled: false}); 
			$("#jqxBankReceipt").jqxGrid({ disabled: false});
			
			var date = $('#jqxBankReceiptDate').val();
		    getCurrencyId(date);
			
			if ($("#mode").val() == "E") {
		    	$("#btnvaluechange").show();
		    	$('#frmBankReceipt input').attr('readonly', true );
		        $('#frmBankReceipt select').attr('disabled', true);
			    $('#chckpdc').attr('disabled', true);
		        $('#jqxChequeDate').jqxDateTimeInput({disabled: true});
		        $("#jqxApplyBankInvoicing").jqxGrid({ disabled: true});
		        $("#jqxBankReceipt").jqxGrid({ disabled: true});
		        $('#txtrefno').attr('readonly', false );
		        $('#txtdescription').attr('readonly', false );
		        $("#jqxBankReceipt").jqxGrid('addrow', null, {"docno": "","type": "","accounts": "","accountname1": "","currency": "","currencyid": "","rate": "","costtype": "","costgroup": "","costcode": "","dr": true,"amount1": "","baseamount1": "","description": "","grtype": "","currencytype": "","sr_no":""});
		    }
		    else{
			    $("#btnvaluechange").hide();
		    } 
			
			if ($("#mode").val() == "A") {
				$('#jqxBankReceiptDate').val(new Date());
				$('#jqxChequeDate').val(new Date());
				$("#jqxBankReceipt").jqxGrid('clear'); 
				$('#chckpdc').attr('disabled', false);
				$("#jqxBankReceipt").jqxGrid('addrow', null, {"docno": "","type": "","accounts": "","accountname1": "","currency": "","currencyid": "","rate": "","costtype": "","costgroup": "","costcode": "","dr": true,"amount1": "","baseamount1": "","description": "","grtype": "","currencytype": "","sr_no":""});
				$("#jqxApplyBankInvoicing").jqxGrid('clear');
				$("#jqxApplyBankInvoicing").jqxGrid('addrow', null, {});
			}
	 }
	 
	 function funSearchLoad(){
		changeContent('brvMainSearch.jsp'); 
	 }
		
	 function funChkButton() {
			/* funReset(); */
		}
	 
	 function funFocus()
	    {
	    	$('#jqxBankReceiptDate').jqxDateTimeInput('focus'); 	    		
	    }
	 
	  /* Validations */
	   $(function(){
	        $('#frmBankReceipt').validate({
	        	 rules: {
		                txtfromaccid:"required",
		                txtfromamount:{"required":true,number:true},
		                txttoamount:{number:true},
		                txtdescription:{maxlength:500}
		                 },
		       messages: {
		                 txtfromaccid:" *",
		                 txtfromamount:{required:" *",number:"Invalid"},
		                 txttoamount:{number:"Invalid"},
		                 txtdescription: {maxlength:"    Max 500 chars"}
		                 }
	        });});
	   
	  function funNotify(){
		  /* Validation */
		  
		    var bankreceiptdate = $('#jqxBankReceiptDate').jqxDateTimeInput('getDate');
			var validdate=funDateInPeriod(bankreceiptdate);
			if(parseInt(validdate)==0){
				document.getElementById("errormsg").innerText="Transaction prior or after Account Period is not valid.";
				return 0;	
		    }

			pdcchequevalid=document.getElementById("txtpdcdatevalidation").value;
			 if(pdcchequevalid==1){
				 document.getElementById("errormsg").innerText="Invalid Cheque Date !!!";
				 return 0;
			 }
			
			 valid=document.getElementById("txtvalidation").value;
			 if(valid==1){
				 document.getElementById("errormsg").innerText="Invalid Transaction !!!";
				 return 0;
			 }
			 
			 currency=document.getElementById("cmbfromcurrency").value;
			 if(currency==""){
				 document.getElementById("errormsg").innerText="Currency & Rate is Mandatory.";
				 return 0;
			 }
			 
			 currencyto=document.getElementById("cmbtocurrency").value;
			 acnoto=document.getElementById("txttoaccid").value;
			 if(currencyto=="" && acnoto!=""){
				 document.getElementById("errormsg").innerText="Currency & Rate is Mandatory.";
				 return 0;
			 }
		  
		    var drtot = parseFloat(document.getElementById("txtdrtotal").value);
	 		var crtot = parseFloat(document.getElementById("txtcrtotal").value);
	 		if(drtot>crtot || drtot<crtot){
	 		 document.getElementById("errormsg").innerText="Invalid Transaction !!! Credit and Debit should be Equal.";
             return 0;
	 		}
	 		
	 		if(drtot=="" || crtot=="" || drtot=="NaN" || crtot=="NaN" || drtot==0 || crtot==0 || drtot==0.0 || crtot==0.0 || drtot==0.00 || crtot==0.00){
	 			  document.getElementById("errormsg").innerText="Invalid Transaction !!! Credit and Debit should not be Zero.";
	              return 0;
		 		}
	    	
	    	document.getElementById("errormsg").innerText="";
	    		
	    /* Validation Ends*/
	     
	    $('#jqxChequeDate').jqxDateTimeInput({disabled: false});
	     
	    	/* Bank Receipt Grid  Saving*/
	 		  var rows = $("#jqxBankReceipt").jqxGrid('getrows');
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
	 					
	 					var amount,baseamount;
	 					if(rows[i].dr==true){
							 amount=rows[i].amount1*-1;
							 baseamount=rows[i].baseamount1*-1;
						}
						else if(rows[i].dr==false){
							 amount=rows[i].amount1;
							 baseamount=rows[i].baseamount1;
						}
	 					
	 				newTextBox.val(rows[i].docno+"::"+rows[i].currencyid+"::"+rows[i].rate+"::"+rows[i].dr+"::"+amount+"::"+rows[i].description+' CHQNO -'+$('#txtchequeno').val()+' CHQ DATE -'+$('#jqxChequeDate').jqxDateTimeInput('getText')+"::"+baseamount+"::0:: "+rows[i].costtype+":: "+rows[i].costcode);
	 				newTextBox.appendTo('form');
	 				 }
			        }
		            $('#gridlength').val(length);
	 	 		   /* Bank Receipt Grid  Saving Ends*/	 
	 	 		
	 	 		/* Applying Bank Invoice Grid Saving */
	 	 		var rows = $("#jqxApplyBankInvoicing").jqxGrid('getrows');
	 	 		var lengthapply=0;
	 			for(var i=0 ; i < rows.length ; i++){
		 				var chks=rows[i].applying;
		 				if(typeof(chks) != "undefined" && typeof(chks) != "NaN" && chks != ""){
	 					newTextBox = $(document.createElement("input"))
	 				    .attr("type", "dil")
	 				    .attr("id", "txtapply"+lengthapply)
	 				    .attr("name", "txtapply"+lengthapply)
	 				    .attr("hidden", "true");
	 					lengthapply=lengthapply+1;
	 					
	 				newTextBox.val(rows[i].applying+"::"+parseFloat(rows[i].out_amount+rows[i].applying)+"::"+rows[i].currency+"::"+rows[i].tranid+"::"+rows[i].acno);
	 				newTextBox.appendTo('form');
	 				}
	 			  }
	 			 $('#applylength').val(lengthapply);
	 			 /* Applying Bank Invoice Grid Saving Ends*/
	 			 
	 			 /* Applying Bank Invoice Grid Updating */
	 		 		var rows = $("#jqxApplyBankInvoicing").jqxGrid('getrows');
	 		 		var lengthupdate=0;	
	 				for(var i=0 ; i < rows.length ; i++){
		 					var chkd=rows[i].applying;
			 				if(typeof(chkd) != "undefined" && typeof(chkd) != "NaN" && chkd != ""){
	 						newTextBox = $(document.createElement("input"))
	 					    .attr("type", "dil")
	 					    .attr("id", "txtapplyupdate"+lengthupdate)
	 					    .attr("name", "txtapplyupdate"+lengthupdate)
	 					    .attr("hidden", "true");
	 						lengthupdate=lengthupdate+1;
	 						
	 					newTextBox.val(parseFloat(rows[i].out_amount-rows[i].applying)+"::"+rows[i].tranid);
	 					newTextBox.appendTo('form');
	 					}
	 				}
	 				$('#applylengthupdate').val(lengthupdate);
	 				 /* Applying Bank Invoice Grid Updating Ends*/
	 				 
	 				 $('#jqxBankReceiptDate').jqxDateTimeInput({disabled: false});
			         
			         if ($("#mode").val() == "E") {
			         	 $('#frmBankReceipt select').attr('disabled', false); 
			         }
	 				 
	    		return 1;
		} 
	  
	  function setValues(){
		  checkpdc();
		  
		  $('#jqxBankReceiptDate').jqxDateTimeInput({disabled: false});
		  var date = $('#jqxBankReceiptDate').val();
		  getCurrencyId(date);
		  $('#jqxBankReceiptDate').jqxDateTimeInput({disabled: true});
		  
		  document.getElementById("cmbtotype").value=document.getElementById("hidcmbtotype").value;
		  
		  if($('#hidjqxBankReceiptDate').val()){
				 $("#jqxBankReceiptDate").jqxDateTimeInput('val', $('#hidjqxBankReceiptDate').val());
			  }
		  
		  if($('#hidjqxChequeDate').val()){
				 $("#jqxChequeDate").jqxDateTimeInput('val', $('#hidjqxChequeDate').val());
			  }
		  
		  if($('#hidmaindate').val()){
				 $("#maindate").jqxDateTimeInput('val', $('#hidmaindate').val());
			  }
		  
		  if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
			
		  document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
		  funSetlabel();
		  
			 var indexVal = document.getElementById("docno").value;
			 if(indexVal>0){
				 var check=1;
	         	 $("#jqxBankReceiptGrid").load("bankReceiptGrid.jsp?txtbankreceiptdocno2="+indexVal+"&check="+check);
			 }
	         
	         var indexVal1 = document.getElementById("txttodocno").value;
	         var indexVal2 = document.getElementById("txttotrno").value;
	         if(indexVal1>0){
	         	 var check=1;
	         	 $("#bankApplyInvoicing1").load("applyBankReceiptInvoicingGrid.jsp?txttoaccid1="+indexVal1+"&txttotrno1="+indexVal2+"&check="+check); 
	         }
		}
  
	function funwarningopen(){
		$.messager.confirm('Confirm', 'Transaction will affect Links to the applied Bank Reconcilations & Prepayments.', function(r){
		    if (r){
		    	$("#mode").val("EDIT");
		    	$('#txtfromaccid').attr('readonly', true);$('#txtfromaccname').attr('readonly', true);$('#txtfromamount').attr('readonly', false);$('#txtchequeno').attr('readonly', false);$('#chckpdc').attr('disabled', false);
		    	$('#jqxChequeDate').jqxDateTimeInput({disabled: false});$('#txtdescription').attr('readonly', false);
		    	$('#txttoaccid').attr('readonly', true);$('#txttoaccname').attr('readonly', true);$('#txttoamount').attr('readonly', false);$('#txtfromrate').attr('readonly', false);
		    	$('#txtfrombaseamount').attr('readonly', true);$('#txttorate').attr('readonly', false);$('#txttobaseamount').attr('readonly', true);$('#txtapplyinvoiceamt').attr('readonly', true);
		    	$('#txtapplyinvoiceapply').attr('readonly', true);$('#txtapplyinvoicebalance').attr('readonly', true);$('#txtdrtotal').attr('readonly', true);$('#txtcrtotal').attr('readonly', true);
		    	$('#frmBankReceipt select').attr('disabled', false);$("#jqxApplyBankInvoicing").jqxGrid({ disabled: false});$("#jqxBankReceipt").jqxGrid({ disabled: false});  
		    }
		   });
	}
	
	function funPaymentAmount(txttoamount) {
	    if (parseFloat($("#txtapplyinvoiceapply").val())>0 && $("#mode").val()=="EDIT") {
	        if(parseFloat(txttoamount.value)<parseFloat(txttoamount.oldvalue)){
	        	$("#txttoamount").val(txttoamount.oldvalue);
	    		$.messager.alert('Message','Applied for '+txttoamount.oldvalue+'/-, Remove applied & then change the Payment Amount.','warning');
		    	return;
	        }
	    }
	  }
	  
	function getDrTotal(){
		  var fromamount = $('#txtfrombaseamount').val();
		  
		  if(!isNaN(fromamount)){
			  
		  var dr=0.0,cr=0.0,dr1=0.0;
  	      var rows = $('#jqxBankReceipt').jqxGrid('getrows');
	      var rowlength= rows.length;
	 		for(var i=0;i<=rowlength-1;i++) {
	 		
	 		  var value = rows[i].dr;
	          var baseamount = rows[i].baseamount1;
	          
	          if(typeof(baseamount) != "undefined" && typeof(baseamount) != "NaN" && baseamount != ""){
	         	  if(value==true){
               	   if(!isNaN(baseamount)){
               	      cr=cr+baseamount;
               	   }else if(isNaN(baseamount)){
                 		 baseamount=0.00;
                 		 cr=cr+baseamount;
                 	   }
                  }
                  else{
               	   if(!isNaN(baseamount)){
                    	 	dr=dr+baseamount;
                  	   }else if(isNaN(baseamount)){
                  		    baseamount=0.00;
                  		 	dr=dr+baseamount;
                  	   }
                    }
	 	       }
	 		}
	 		
	 		if(!isNaN(fromamount)){
                dr1=parseFloat(dr) + parseFloat(fromamount);
                funRoundAmt(dr1,"txtdrtotal");
             }
	      }
		  else if(isNaN(fromamount)){
			$('#txtdrtotal').val(0.00);
			$('#txtfrombaseamount').val(0.00);			
		}
	  } 
	  
	  function getCrTotal(){
		  var toamount = $('#txttobaseamount').val();
		  if(!isNaN(toamount)){
			  
			    var dr=0.0,cr=0.0,cr1=0.0;
        	    var rows = $('#jqxBankReceipt').jqxGrid('getrows');
    	        var rowlength= rows.length;
        		for(var i=0;i<=rowlength-1;i++) {
        		
        		var value = rows[i].dr;
                var baseamount = rows[i].baseamount1;
                
                if(typeof(baseamount) != "undefined" && typeof(baseamount) != "NaN" && baseamount != ""){
                	 if(value==true){
                  	   if(!isNaN(baseamount)){
                  	      cr=cr+baseamount;
                  	   }else if(isNaN(baseamount)){
                    		 baseamount=0.00;
                    		 cr=cr+baseamount;
                    	   }
                     }
                     else{
                  	   if(!isNaN(baseamount)){
                       	 	dr=dr+baseamount;
                      	   }else if(isNaN(baseamount)){
                      		    baseamount=0.00;
                      		 	dr=dr+baseamount;
                      	   }
                       }
        	       }
        		}
        		
        		if(!isNaN(toamount)){
                    cr1=parseFloat(cr) + parseFloat(toamount);
                    funRoundAmt(cr1,"txtcrtotal");
                    }
		  }
		  else if(isNaN(toamount)){
		  	$('#txtcrtotal').val(0.00);
		  	$('#txttoamount').val(0.00);
		  }
	  }
	  
	  function getAmount(){
		  var toamount = $('#txttoamount').val();
		  if(!isNaN(toamount)){
		  	funRoundAmt(toamount,"txtapplyinvoiceamt");
		  }
		  else if(isNaN(toamount)){
			  $('#txtapplyinvoiceamt').val(0.00);
			  $('#txttoamount').val(0.00);
			}
	  }
	  
	  function getAcc(event){
          var x= event.keyCode;
          if(x==114){
         	  var date = $('#jqxBankReceiptDate').jqxDateTimeInput('getDate');
         	  $("#maindate").jqxDateTimeInput('val', date);
			  accountFromSearchContent(<%=contextPath+"/"%>+"com/finance/accountsDetailsSearch.jsp?date="+date);
          }
          else{
           }
          }
	  
	  function getAccType(event){
          var x= event.keyCode;
          if(x==114){
         	  var date = $('#jqxBankReceiptDate').jqxDateTimeInput('getDate');
         	  $("#maindate").jqxDateTimeInput('val', date);
			  accountToSearchContent(<%=contextPath+"/"%>+"com/finance/clientAccountDetailsSearch.jsp?atype="+$('#cmbtotype').val()+"&date="+date);
          }
          else{
           }
          }
	  
	  function funCheck(a){
		  if(document.getElementById("chckpdc").checked != false){
		 		 $('#hidchckpdc').val(1);getAccounts();
		  }
		  else{
			  $('#hidchckpdc').val(0);  
		  }
	  }
	  
	  function getAccounts(){
	 		var x = new XMLHttpRequest();
	 		x.onreadystatechange = function() {
	 			if (x.readyState == 4 && x.status == 200) {
	 				var items = x.responseText;
	 			    $('#txtpdcacno').val(items);
	 		}
	 		}
	 		x.open("GET", "getAccounts.jsp", true);
	 		x.send();
	 }
	  
	  function funPrintBtn() {
			
		  if (($("#mode").val() == "view") && $("#docno").val()!="") {
				BankPrintContent('printVoucherWindow.jsp');
			  }
			else {
					$.messager.alert('Message','Select a Document....!','warning');
					return;
				}
      }
	  
	  function clearClientInfo(){
		  $("#txttodocno").val('');$("#txttoaccid").val('');$("#txttoaccname").val('');$("#txtapplyinvoiceapply").val(0.00);
		  $("#jqxApplyBankInvoicing").jqxGrid('clear');
		  $("#jqxApplyBankInvoicing").jqxGrid('addrow', null, {});
		  var atype=$('#cmbtotype').val();
      	  if(atype != "AR"){
      		$("#jqxApplyBankInvoicing").jqxGrid({ disabled: true});
      	   }else if(atype == "AR"){
      		$("#jqxApplyBankInvoicing").jqxGrid({ disabled: false});
      	   }
	  }
	  
	  function datechange(){
		  var date = $('#jqxBankReceiptDate').jqxDateTimeInput('getDate');
		  var validdate=funDateInPeriod(date);
		  if(parseInt(validdate)==0){
			document.getElementById("errormsg").innerText="Transaction prior or after Account Period is not valid.";
			return 0;	
		  }
		  $("#maindate").jqxDateTimeInput('val', date);
		  funPDCDate($('#hidchckpdc').val(),$('#jqxBankReceiptDate').jqxDateTimeInput('getDate'),$('#jqxChequeDate').jqxDateTimeInput('getDate'));
	  }
	  
</script>

</head>
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmBankReceipt" action="saveBankReceipt" method="post" autocomplete="off">
<jsp:include page="../../../../header.jsp"></jsp:include>

<div class='modern-ui hidden-scrollbar'>

    <div class="middle-panel">
        <span class="middle-panel-title"><i class="fa-solid fa-circle-info" style="margin-right: 5px;"></i> General Info</span>
        <div class="field-row" style="margin-bottom:0;">
            <label class="lbl-right" style="width:80px;">Date</label>
            <div style="width: 125px;">
                <div id="jqxBankReceiptDate" name="jqxBankReceiptDate" onchange="datechange();" onblur="datechange();" value='<s:property value="jqxBankReceiptDate"/>'></div>
                <input type="hidden" id="hidjqxBankReceiptDate" name="hidjqxBankReceiptDate" value='<s:property value="hidjqxBankReceiptDate"/>'/>
            </div>
            
            <label class="lbl-right" style="width:80px;">Ref. No.</label>
            <input type="text" id="txtrefno" name="txtrefno" value='<s:property value="txtrefno"/>' style="width:120px;" />
            
            <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No.</label>
            <input type="text" id="docno" name="txtbankreceiptdocno" value='<s:property value="txtbankreceiptdocno"/>' tabindex="-1" style="width:120px;" readonly />
            
            <button class="myButton" type="button" id="btnvaluechange" name="btnvaluechange" onclick="funwarningopen();" style="margin-left: 15px;">
                <i class="fa-solid fa-pen-to-square" style="margin-right: 6px;"></i> Value Change
            </button>
        </div>
    </div>

    <div style="display: flex; gap: 20px; margin-bottom: 20px;">
        <div class="middle-panel" style="flex: 1; margin-bottom: 0;">
            <span class="middle-panel-title"><i class="fa-solid fa-building-columns" style="margin-right: 5px;"></i> Bank</span>
            
            <div class="field-row">
                <label class="lbl-right" style="width:100px;">Bank Account</label>
                <div class="input-search-container" style="width: 120px;">
                    <input type="text" id="txtfromaccid" name="txtfromaccid" placeholder="Press F3" value='<s:property value="txtfromaccid"/>' onkeydown="getAcc(event);" />
                    <i class="fa-solid fa-magnifying-glass magnifier-icon" onclick="var d=$('#jqxBankReceiptDate').jqxDateTimeInput('getDate'); $('#maindate').jqxDateTimeInput('val', d); accountFromSearchContent('<%=contextPath%>/com/finance/accountsDetailsSearch.jsp?date='+d);"></i>
                </div>
                <input type="text" id="txtfromaccname" name="txtfromaccname" value='<s:property value="txtfromaccname"/>' style="flex:1;" tabindex="-1" readonly />
                <input type="hidden" id="txtfromdocno" name="txtfromdocno" value='<s:property value="txtfromdocno"/>' />
            </div>
            
            <div class="field-row">
                <label class="lbl-right" style="width:100px;">Currency</label>
                <select id="cmbfromcurrency" name="cmbfromcurrency" style="width:120px;" value='<s:property value="cmbfromcurrency"/>' onchange="getRate(this.value,$('#jqxBankReceiptDate').val());">
                    <option></option>
                </select>
                <input type="hidden" id="hidcmbfromcurrency" name="hidcmbfromcurrency" value='<s:property value="hidcmbfromcurrency"/>' />
                <input type="hidden" id="hidfromcurrencytype" name="hidfromcurrencytype" value='<s:property value="hidfromcurrencytype"/>' />
                
                <label class="lbl-right" style="width:80px; margin-left:auto;">Rate</label>
                <input type="text" id="txtfromrate" name="txtfromrate" style="width:120px; text-align:right;" value='<s:property value="txtfromrate"/>' onblur="funRoundAmt(this.value,this.id);getBaseAmountFrom();getDrTotal();" tabindex="-1" />
            </div>

            <div class="field-row">
                <label class="lbl-right" style="width:100px; display:flex; align-items:center; justify-content:flex-end;">
                    <input type="checkbox" id="chckpdc" name="chckpdc" onclick="funCheck();funPDCDate($('#hidchckpdc').val(),$('#jqxBankReceiptDate').jqxDateTimeInput('getDate'),$('#jqxChequeDate').jqxDateTimeInput('getDate'));" style="margin: 0 8px 0 0;"> PDC
                </label>
                <input type="hidden" id="hidchckpdc" name="hidchckpdc" value='<s:property value="hidchckpdc"/>'/>
                <input type="hidden" id="txtpdcacno" name="txtpdcacno" value='<s:property value="txtpdcacno"/>'/>

                <label class="lbl-right" style="width:75px; margin-left:auto;">Cheque No.</label>
                <input type="text" id="txtchequeno" name="txtchequeno" style="width:120px;" value='<s:property value="txtchequeno"/>' />

                <label class="lbl-right" style="width:80px; margin-left:auto;">Cheque Date</label>
                <div style="width: 120px;">
                    <div id="jqxChequeDate" name="jqxChequeDate" onchange="funPDCDate($('#hidchckpdc').val(),$('#jqxBankReceiptDate').jqxDateTimeInput('getDate'),$('#jqxChequeDate').jqxDateTimeInput('getDate'));" value='<s:property value="jqxChequeDate"/>'></div>
                    <input type="hidden" id="hidjqxChequeDate" name="hidjqxChequeDate" value='<s:property value="hidjqxChequeDate"/>'/>
                </div>
            </div>
            
            <div class="field-row">
                <label class="lbl-right" style="width:100px;">Amount</label>
                <input type="text" id="txtfromamount" name="txtfromamount" style="width:120px; text-align:right; font-weight: bold; color: var(--royal-blue);" value='<s:property value="txtfromamount"/>' onblur="funRoundAmt(this.value,this.id);getBaseAmountFrom();getDrTotal();" />
                
                <label class="lbl-right" style="width:80px; margin-left:auto;">Base Amount</label>
                <input type="text" id="txtfrombaseamount" name="txtfrombaseamount" style="width:120px; text-align:right;" value='<s:property value="txtfrombaseamount"/>' tabindex="-1" readonly />
            </div>
            
            <div class="field-row" style="margin-bottom:0;">
                <label class="lbl-right" style="width:100px;">Description</label>
                <input type="text" id="txtdescription" name="txtdescription" value='<s:property value="txtdescription"/>' style="flex:1;" />
            </div>
        </div>

        <div class="middle-panel" style="flex: 1; margin-bottom: 0;">
            <span class="middle-panel-title"><i class="fa-solid fa-money-bill-transfer" style="margin-right: 5px;"></i> Payment From</span>
            
            <div class="field-row">
                <label class="lbl-right" style="width:80px;">Type</label>
                <select id="cmbtotype" name="cmbtotype" style="width:80px;" onchange="clearClientInfo();" value='<s:property value="cmbtotype"/>'>
                    <option value="AR">AR</option>
                    <option value="AP">AP</option>
                </select>
                <input type="hidden" id="hidcmbtotype" name="hidcmbtotype" value='<s:property value="hidcmbtotype"/>' />
                
                <div class="input-search-container" style="width: 120px; margin-left: 10px;">
                    <input type="text" id="txttoaccid" name="txttoaccid" placeholder="Press F3" value='<s:property value="txttoaccid"/>' onkeydown="getAccType(event);" />
                    <i class="fa-solid fa-magnifying-glass magnifier-icon" onclick="var d=$('#jqxBankReceiptDate').jqxDateTimeInput('getDate'); $('#maindate').jqxDateTimeInput('val', d); accountToSearchContent('<%=contextPath%>/com/finance/clientAccountDetailsSearch.jsp?atype='+$('#cmbtotype').val()+'&date='+d);"></i>
                </div>
                <input type="text" id="txttoaccname" name="txttoaccname" value='<s:property value="txttoaccname"/>' style="flex:1;" tabindex="-1" readonly />
                <input type="hidden" id="txttodocno" name="txttodocno" value='<s:property value="txttodocno"/>' />
                <input type="hidden" id="txttotranid" name="txttotranid" value='<s:property value="txttotranid"/>' />
                <input type="hidden" id="txttotrno" name="txttotrno" value='<s:property value="txttotrno"/>' />
            </div>
            
            <div class="field-row">
                <label class="lbl-right" style="width:80px;">Currency</label>
                <select id="cmbtocurrency" name="cmbtocurrency" style="width:120px;" value='<s:property value="cmbtocurrency"/>' onchange="getRatevalue(this.value,$('#jqxBankReceiptDate').val());">
                    <option></option>
                </select>
                <input type="hidden" id="hidcmbtocurrency" name="hidcmbtocurrency" value='<s:property value="hidcmbtocurrency"/>' />
                <input type="hidden" id="hidtocurrencytype" name="hidtocurrencytype" value='<s:property value="hidtocurrencytype"/>' />
                
                <label class="lbl-right" style="width:80px; margin-left:auto;">Rate</label>
                <input type="text" id="txttorate" name="txttorate" style="width:120px; text-align:right;" value='<s:property value="txttorate"/>' onblur="funRoundAmt(this.value,this.id);getBaseAmountTo();getCrTotal();" tabindex="-1" />
            </div>
            
            <div class="field-row" style="margin-bottom:0;">
                <label class="lbl-right" style="width:80px;">Amount</label>
                <input type="text" id="txttoamount" name="txttoamount" style="width:120px; text-align:right; font-weight: bold; color: var(--royal-blue);" value='<s:property value="txttoamount"/>' onblur="funRoundAmt(this.value,this.id);getBaseAmountTo();getCrTotal();getAmount();" onfocus="this.oldvalue = this.value;" onchange="funPaymentAmount(this);this.oldvalue = this.value;" />
                
                <label class="lbl-right" style="width:80px; margin-left:auto;">Base Amount</label>
                <input type="text" id="txttobaseamount" name="txttobaseamount" style="width:120px; text-align:right;" value='<s:property value="txttobaseamount"/>' tabindex="-1" readonly />
            </div>
        </div>
    </div>

    <div class="middle-panel">
        <span class="middle-panel-title"><i class="fa-solid fa-file-invoice" style="margin-right: 5px;"></i> Apply Invoices</span>
        <div id="bankApplyInvoicing1" class="grid-container">
            <jsp:include page="applyBankReceiptInvoicingGrid.jsp"></jsp:include>
        </div>
        
        <div class="field-row" style="margin-top: 15px; justify-content: flex-end; margin-bottom:0;">
            <label class="lbl-right" style="width:60px;">Amount</label>
            <input type="text" id="txtapplyinvoiceamt" name="txtapplyinvoiceamt" style="width:120px; text-align:right; font-weight: bold;" value='<s:property value="txtapplyinvoiceamt"/>' readonly />
            <input type="hidden" id="txtvalidation" name="txtvalidation" value='<s:property value="txtvalidation"/>' />
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Applied</label>
            <input type="text" id="txtapplyinvoiceapply" name="txtapplyinvoiceapply" style="width:120px; text-align:right; color: #059669; font-weight: bold;" value='<s:property value="txtapplyinvoiceapply"/>' tabindex="-1" readonly />
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Balance</label>
            <input type="text" id="txtapplyinvoicebalance" name="txtapplyinvoicebalance" style="width:120px; text-align:right; color: #DC2626; font-weight: bold;" value='<s:property value="txtapplyinvoicebalance"/>' tabindex="-1" readonly />
        </div>
    </div>

    <div class="middle-panel">
        <span class="middle-panel-title"><i class="fa-solid fa-list-check" style="margin-right: 5px;"></i> Receipt Allocation</span>
        <div id="jqxBankReceiptGrid" class="grid-container">
            <jsp:include page="bankReceiptGrid.jsp"></jsp:include>
        </div>
        
        <div class="field-row" style="margin-top: 15px; justify-content: flex-end; margin-bottom:0;">
            <label class="lbl-right" style="width:60px;">Dr. Total</label>
            <input type="text" id="txtdrtotal" name="txtdrtotal" style="width:120px; text-align:right; font-weight: bold; background-color: #F1F5F9;" value='<s:property value="txtdrtotal"/>' readonly />
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Cr. Total</label>
            <input type="text" id="txtcrtotal" name="txtcrtotal" style="width:120px; text-align:right; font-weight: bold; background-color: #F1F5F9;" value='<s:property value="txtcrtotal"/>' tabindex="-1" readonly />
        </div>
    </div>

    <div style="display:none;">
        <input type="hidden" id="mode" name="mode"/>
        <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
        <input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
        <input type="hidden" name="txtforsearch" id="txtforsearch" value="0"/>
        <div id="maindate" name="maindate" value='<s:property value="maindate"/>'></div>
        <input type="hidden" id="hidmaindate" name="hidmaindate" value='<s:property value="hidmaindate"/>'/>
        <input type="hidden" id="txtpdcdatevalidation" name="txtpdcdatevalidation" value='<s:property value="txtpdcdatevalidation"/>'/>
        <input type="hidden" id="gridlength" name="gridlength"/>
        <input type="hidden" id="applylength" name="applylength"/>
        <input type="hidden" id="applylengthupdate" name="applylengthupdate"/>
        <input type="hidden" id="pdcposttrno" name="pdcposttrno"  value='<s:property value="pdcposttrno"/>'/>
    </div>

</div>
</form>
	
<div id="bankReceiptGridWindow">
	<div></div><div></div>
</div>  
				
<div id="accountDetailsFromWindow">
	<div></div><div></div>
</div>  
	 
<div id="accountDetailsToWindow">
	<div></div><div></div>
</div> 

<div id="costTypeSearchGridWindow">
	<div></div><div></div>
</div> 

<div id="costCodeSearchWindow">
	<div></div><div></div>
</div> 

<div id="printWindow">
	<div></div><div></div>
</div> 	
</div>
</body>
</html>