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
    cursor: default !important; /* Forces normal cursor instead of not-allowed */
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* Range input layout */
.range-group {
    display: flex;
    align-items: center;
    gap: 5px;
}
.range-group input[type="text"] {
    width: 45%;
    text-align: right;
}
.range-group span {
    font-weight: bold;
    color: #4e5e71;
}

/* ===== BLUE BUTTONS ===== */
.btn-submit {
    flex: 1;
    height: 30px;
    background: #007bff; /* Primary Blue */
    color: #fff;
    border: none;
    border-radius: 4px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
    width: 100%;
}
.btn-submit:hover:not(:disabled) { background: #0056b3; /* Darker Blue on Hover */ }
.btn-submit:disabled { background: #9ca3af; cursor: default !important; }
.btn-submit:active:not(:disabled) { transform: scale(0.98); }

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

/* Header for the grid */
.accname {
	color: black;
	background-color: #E0ECF8;
	width: 100%;
	font-family: comic sans ms;
    display: inline-block;
    padding: 5px 10px;
    margin-bottom: 10px;
    border-radius: 4px;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
         // Standardized to 100% width and 24px height
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsWindow').jqxWindow('close');
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		 
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	     $('#txtaccid').dblclick(function(){
	      	  if($('#cmbtype').val()==''){
     			 $.messager.alert('Message','Account Type is Mandatory.','warning');
     			 return 0;
     		  }
	      	  
	      	  if($('#cmbtype').val()==null){
	      			 $.messager.alert('Message','Account Search Not Available.','warning');
	      			 return 0;
	      	   }
			  accountsSearchContent('accountsDetailsSearch.jsp');
		 });
	});
	
	function accountsSearchContent(url) {
	    $('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#accountDetailsWindow').jqxWindow('setContent', data);
		$('#accountDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function getDocumentType() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var dtypeItems = items[0].split(",");
				var menuItems = items[1].split(",");
				var optionssalutn = '<option value="">--Select--</option>';
				for (var i = 0; i < menuItems.length; i++) {
					optionssalutn += '<option value="' + dtypeItems[i] + '">'
							+ menuItems[i] + '</option>';
				}
				$("select#cmbdoctype").html(optionssalutn);
				if ($('#hidcmbdoctype').val() != null) {
					$('#cmbdoctype').val($('#hidcmbdoctype').val());
				}
			} else {
			}
		}
		x.open("GET", "getDocumentType.jsp", true);
		x.send();
	} 
	
	function getAccTypeFrom(event){
        var x= event.keyCode;
        if(x==114){
          if($('#cmbtype').val()==''){
   			 $.messager.alert('Message','Account Type is Mandatory.','warning');
   			 return 0;
   		  }
          if($('#cmbtype').val()==null){
 			 $.messager.alert('Message','Account Search Not Available.','warning');
 			 return 0;
 	      }
       	  accountsSearchContent('accountsDetailsSearch.jsp');
        }
        else{}
        }
		
	function funExportBtn(){
		 var dtype=$('#cmbdoctype').val();
		 if(dtype=='BPV'){
			 
			 $("#bankDiv").excelexportjs({
					containerid: "bankDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxBankVoucher",
					columns: getColumns("jqxBankVoucher"),
					worksheetName: "BankPaymentVoucher"
				});
		 }
       if(dtype=='BRV'){
			 
			 $("#bankDiv").excelexportjs({
					containerid: "bankDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxBankVoucher",
					columns: getColumns("jqxBankVoucher"),
					worksheetName: "BankReceiptVoucher"
				});
		 }
       if(dtype=='IBP'){
			 
			 $("#bankDiv").excelexportjs({
					containerid: "bankDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxBankVoucher",
					columns: getColumns("jqxBankVoucher"),
					worksheetName: "IBBankPaymentVoucher"
				});
		 }
       if(dtype=='IBR'){
			 
			 $("#bankDiv").excelexportjs({
					containerid: "bankDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxBankVoucher",
					columns: getColumns("jqxBankVoucher"),
					worksheetName: "IBBankReceiptVoucher"
				});
		 }
       if(dtype=='CPV'){
			 
			 $("#cashDiv").excelexportjs({
					containerid: "cashDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxCashVoucher",
					columns: getColumns("jqxCashVoucher"),
					worksheetName: "CashPaymentVoucher"
				});
		 }
       if(dtype=='CRV'){
			 
			 $("#cashDiv").excelexportjs({
					containerid: "cashDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxCashVoucher",
					columns: getColumns("jqxCashVoucher"),
					worksheetName: "CashReceiptVoucher"
				});
		 }
       if(dtype=='ICPV'){
			 
			 $("#cashDiv").excelexportjs({
					containerid: "cashDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxCashVoucher",
					columns: getColumns("jqxCashVoucher"),
					worksheetName: "IBCashPaymentVoucher"
				});
		 }
       if(dtype=='ICRV'){
			 
			 $("#cashDiv").excelexportjs({
					containerid: "cashDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxCashVoucher",
					columns: getColumns("jqxCashVoucher"),
					worksheetName: "IBCashReceiptVoucher"
				});
		 }
       if(dtype=='PC'){
			 
			 $("#cashDiv").excelexportjs({
					containerid: "cashDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxCashVoucher",
					columns: getColumns("jqxCashVoucher"),
					worksheetName: "PettyCashVoucher"
				});
		 }
       if(dtype=='FCR'){
			 
			 $("#cashDiv").excelexportjs({
					containerid: "cashDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxCashVoucher",
					columns: getColumns("jqxCashVoucher"),
					worksheetName: "FuelCardReimbursement"
				});
		 }
       if(dtype=='COT'){
			 
			 $("#contraDiv").excelexportjs({
					containerid: "contraDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxContraTransVoucher",
					columns: getColumns("jqxContraTransVoucher"),
					worksheetName: "ContraTransVoucher"
				});
		 }
       if(dtype=='CNO'){
			 
			 $("#creditDiv").excelexportjs({
					containerid: "creditDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxCreditDebitVoucher",
					columns: getColumns("jqxCreditDebitVoucher"),
					worksheetName: "CreditVoucher"
				});
		 }
       if(dtype=='DNO'){
			 
			 $("#creditDiv").excelexportjs({
					containerid: "creditDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxCreditDebitVoucher",
					columns: getColumns("jqxCreditDebitVoucher"),
					worksheetName: "DebitVoucher"
				});
		 }
       if(dtype=='JVT'){
			 
			 $("#journalDiv").excelexportjs({
					containerid: "journalDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxJournalVoucher",
					columns: getColumns("jqxJournalVoucher"),
					worksheetName: "JournalVoucher"
				});
		 }
       if(dtype=='IJV'){
			 
			 $("#journalDiv").excelexportjs({
					containerid: "journalDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxJournalVoucher",
					columns: getColumns("jqxJournalVoucher"),
					worksheetName: "IBJournalVoucher"
				});
		 }
       if(dtype=='PRIV'){
			 
			 $("#propertyDiv").excelexportjs({
					containerid: "propertyDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxPropertyInvoice",
					columns: getColumns("jqxPropertyInvoice"),
					worksheetName: "PropertyInvoice"
				});
		 }
       if(dtype=='SEC'){
			 
			 $("#securityChqDiv").excelexportjs({
					containerid: "securityChqDiv",
					datatype: 'json',
					dataset: null,
					gridId: "securityChequeList",
					columns: getColumns("securityChequeList"),
					worksheetName: "SecurityCheque"
				});
		 }
       if(dtype=='UCP'){
			 
			 $("#unclearedChqDiv").excelexportjs({
					containerid: "unclearedChqDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxUnclearedChequeVoucher",
					columns: getColumns("jqxUnclearedChequeVoucher"),
					worksheetName: "UnclearedChequePaymentVoucher"
				});
		 }
       if(dtype=='UCR'){
			 
			 $("#unclearedChqDiv").excelexportjs({
					containerid: "unclearedChqDiv",
					datatype: 'json',
					dataset: null,
					gridId: "jqxUnclearedChequeVoucher",
					columns: getColumns("jqxUnclearedChequeVoucher"),
					worksheetName: "UnclearedChequeReceiptVoucher"
				});
		 }
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

	function  funClearInfo(){
		
		$('#cmbbranch').val('a');
		$('#fromdate').val(new Date());
		var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	    var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	    var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	    $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	    $('#todate').val(new Date());
	    
	    document.getElementById("lbldoctype").innerHTML="";
	    document.getElementById("cmbdoctype").value="";
	    document.getElementById("txtdocrangefrom").value="";
		document.getElementById("txtdocrangeto").value="";
		document.getElementById("txtamtrangefrom").value="";
		document.getElementById("txtamtrangeto").value="";
		document.getElementById("cmbtype").value="";
		document.getElementById("txtaccid").value="";
		document.getElementById("txtaccname").value="";
		document.getElementById("txtdocno").value="";
		
		$("#jqxCashVoucher").jqxGrid('clear');$("#jqxBankVoucher").jqxGrid('clear');$("#jqxCreditDebitVoucher").jqxGrid('clear');$("#jqxJournalVoucher").jqxGrid('clear');
		$("#jqxContraTransVoucher").jqxGrid('clear');$("#securityChequeList").jqxGrid('clear');$("#jqxUnclearedChequeVoucher").jqxGrid('clear');$("#jqxPropertyInvoice").jqxGrid('clear');
		
		$("#jqxCashVoucher").jqxGrid('addrow', null, {});$("#jqxBankVoucher").jqxGrid('addrow', null, {});$("#jqxCreditDebitVoucher").jqxGrid('addrow', null, {});
		$("#jqxJournalVoucher").jqxGrid('addrow', null, {});$("#jqxContraTransVoucher").jqxGrid('addrow', null, {});$("#securityChequeList").jqxGrid('addrow', null, {});
		$("#jqxUnclearedChequeVoucher").jqxGrid('addrow', null, {});$("#jqxPropertyInvoice").jqxGrid('addrow', null, {});
		 
		$("#cashDiv").prop("hidden", false);$("#bankDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);
		$("#securityChqDiv").prop("hidden", true);$("#unclearedChqDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
		
		if (document.getElementById("txtaccid").value == "") {
		        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
		}
			
		}

	function docTypeInfo(){
		
		 	document.getElementById("lbldoctype").innerHTML="";
		    document.getElementById("txtdocrangefrom").value="";
			document.getElementById("txtdocrangeto").value="";
			document.getElementById("txtamtrangefrom").value="";
			document.getElementById("txtamtrangeto").value="";
			document.getElementById("cmbtype").value="";
			document.getElementById("txtaccid").value="";
			document.getElementById("txtaccname").value="";
			document.getElementById("txtdocno").value="";
			
			$("#jqxCashVoucher").jqxGrid('clear');$("#jqxBankVoucher").jqxGrid('clear');$("#jqxCreditDebitVoucher").jqxGrid('clear');$("#jqxJournalVoucher").jqxGrid('clear');
			$("#jqxContraTransVoucher").jqxGrid('clear');$("#securityChequeList").jqxGrid('clear');$("#jqxUnclearedChequeVoucher").jqxGrid('clear');$("#jqxPropertyInvoice").jqxGrid('clear');
			
			$("#jqxCashVoucher").jqxGrid('addrow', null, {});$("#jqxBankVoucher").jqxGrid('addrow', null, {});$("#jqxCreditDebitVoucher").jqxGrid('addrow', null, {});
			$("#jqxJournalVoucher").jqxGrid('addrow', null, {});$("#jqxContraTransVoucher").jqxGrid('addrow', null, {});$("#securityChequeList").jqxGrid('addrow', null, {});
			$("#jqxUnclearedChequeVoucher").jqxGrid('addrow', null, {});$("#jqxPropertyInvoice").jqxGrid('addrow', null, {});
			 
			$("#cashDiv").prop("hidden", false);$("#bankDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);
			$("#securityChqDiv").prop("hidden", true);$("#unclearedChqDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
			
			if($('#cmbdoctype').val()=='FCR'){
				$('#cmbtype').attr('disabled', true);
			}else{
				$('#cmbtype').attr('disabled', false);
			}
			
			if (document.getElementById("txtaccid").value == "") {
		        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
			}
	}
	
	function clearAccountInfo(){
		$('#txtdocno').val('');$('#txtaccid').val('');$('#txtaccname').val('');
		if (document.getElementById("txtaccid").value == "") {
	        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
		}
	} 
	
	function funreload(event){
		
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var acctype = $('#cmbtype').val();
		 var accdocno = $('#txtdocno').val();
		 var dtype=$('#cmbdoctype').val();
		 var docrangefrom=$('#txtdocrangefrom').val();
		 var docrangeto=$('#txtdocrangeto').val();
		 var amtrangefrom=$('#txtamtrangefrom').val();
		 var amtrangeto=$('#txtamtrangeto').val();
		 var chk=1;
		 
		if(dtype==''){
			 $.messager.alert('Message','Please Choose Document Type.','warning');
			 return 0;
		 }
		 
		 var documenttype='';
		  if(dtype=='CRV'){documenttype='Listing of Cash Receipt Voucher (CRV)';}if(dtype=='CPV'){documenttype='Listing of Cash Payment Voucher (CPV)';}
		 if(dtype=='BRV'){documenttype='Listing of Bank Receipt Voucher (BRV)';}if(dtype=='BPV'){documenttype='Listing of Bank Payment Voucher (BPV)';}
		 if(dtype=='CNO'){documenttype='Listing of Credit Note (CNO)';}if(dtype=='DNO'){documenttype='Listing of Debit Note (DNO)';}
		 if(dtype=='JVT'){documenttype='Listing of Journal Voucher (JVT)';}if(dtype=='IJV'){documenttype='Listing of IB-Journal Voucher (IJV)';}
		 if(dtype=='PC'){documenttype='Listing of Petty Cash (PC)';}if(dtype=='COT'){documenttype='Listing of Contra Trans (COT)';}
		 if(dtype=='SEC'){documenttype='Listing of Security Cheque (SEC)';}if(dtype=='UCP'){documenttype='Listing of Uncleared Cheque Payment (UCP)';}
		 if(dtype=='UCR'){documenttype='Listing of Uncleared Cheque Receipt (UCR)';}if(dtype=='FCR'){documenttype='Listing of Fuel Card Reimbursement (FCR)';}
		 if(dtype=='ICRV'){documenttype='Listing of IB-Cash Receipt Voucher (ICRV)';}if(dtype=='ICPV'){documenttype='Listing of IB-Cash Payment Voucher (ICPV)';}
		 if(dtype=='IBR'){documenttype='Listing of IB-Bank Receipt Voucher (IBR)';}if(dtype=='IBP'){documenttype='Listing of IB-Bank Payment Voucher (IBP)';}
		 if(dtype=='PRIV'){documenttype='Listing of Property Invoice (PRIV)';}if(dtype=='PRIV'){documenttype='Listing of Property Invoice (PRIV)';}
		 
		 $("#overlay, #PleaseWait").show();
		 
		 document.getElementById("lbldoctype").innerText=documenttype; 
		 if(dtype=='CRV' || dtype=='CPV' || dtype=='ICRV' || dtype=='ICPV' || dtype=='PC' || dtype=='FCR'){
			 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);$("#cashDiv").prop("hidden", false);$("#bankDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
				 $("#cashDiv").load("cashVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
						 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
		 } else if(dtype=='BRV' || dtype=='BPV' || dtype=='IBR' || dtype=='IBP'){
			 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", false);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
			 $("#bankDiv").load("bankVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&acctype='+acctype+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     } else if(dtype=='CNO' || dtype=='DNO'){
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", false);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
			 $("#creditDiv").load("creditVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     } else if(dtype=='COT'){
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", false);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
			 $("#contraDiv").load("contraTransVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     } else if(dtype=='SEC'){
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", false);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
			 $("#securityChqDiv").load("securityCheque.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     } else if(dtype=='UCP' || dtype=='UCR'){
			 $("#unclearedChqDiv").prop("hidden", false);$("#securityChqDiv").prop("hidden", true);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
			 $("#unclearedChqDiv").load("unclearedVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
	     }else if(dtype=='JVT' || dtype=='IJV'){
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#journalDiv").prop("hidden", false);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", true);
			 $("#journalDiv").load("journalVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
		 
		 }else {
	    	 $("#unclearedChqDiv").prop("hidden", true);$("#securityChqDiv").prop("hidden", true);$("#propertyDiv").prop("hidden", false);$("#contraDiv").prop("hidden", true);$("#creditDiv").prop("hidden", true);$("#bankDiv").prop("hidden", true);$("#cashDiv").prop("hidden", true);$("#journalDiv").prop("hidden", true);
			 $("#propertyDiv").load("propertyVoucher.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&accdocno='+accdocno+'&dtype='+dtype
					 +'&docrangefrom='+docrangefrom+'&docrangeto='+docrangeto+'&amtrangefrom='+amtrangefrom+'&amtrangeto='+amtrangeto+'&chk='+chk);
		 }
		 
		}
	
</script>
</head>
<body onload="getBranch();getDocumentType();">
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
                        <td class="label-cell">Period</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Dtype</td>
                        <td>
                            <select id="cmbdoctype" name="cmbdoctype" onchange="docTypeInfo();" value='<s:property value="cmbdoctype"/>'>
                                <option value="">--Select--</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Doc. Range</td>
                        <td>
                            <div class="range-group">
                                <input type="text" id="txtdocrangefrom" name="txtdocrangefrom" onkeypress="javascript:return isNumber(event)" value='<s:property value="txtdocrangefrom"/>'/>
                                <span>-</span>
                                <input type="text" id="txtdocrangeto" name="txtdocrangeto" onkeypress="javascript:return isNumber(event)" value='<s:property value="txtdocrangeto"/>'/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Amount Range</td>
                        <td>
                            <div class="range-group">
                                <input type="text" id="txtamtrangefrom" name="txtamtrangefrom" onkeypress="javascript:return isNumber(event)" onblur="funRoundAmt(this.value,this.id);" value='<s:property value="txtamtrangefrom"/>'/>
                                <span>-</span>
                                <input type="text" id="txtamtrangeto" name="txtamtrangeto" onkeypress="javascript:return isNumber(event)" onblur="funRoundAmt(this.value,this.id);" value='<s:property value="txtamtrangeto"/>'/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Type</td>
                        <td>
                            <select id="cmbtype" name="cmbtype" onchange="clearAccountInfo();" value='<s:property value="cmbtype"/>'>
                                <option value="">--Select--</option>
                                <option value="AP">AP</option>
                                <option value="AR">AR</option>
                                <option value="GL">GL</option>
                                <option value="HR">HR</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Account</td>
                        <td>
                            <input type="text" id="txtaccid" name="txtaccid" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtaccid"/>' onkeydown="getAccTypeFrom(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtaccname" name="txtaccname" readonly="readonly" value='<s:property value="txtaccname"/>' tabindex="-1"/>
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" class="btn-submit" name="clear" id="clear" onclick="funClearInfo();">Clear</button>
                </div>
                
                <div style="display: none;">
                    <input type="hidden" id="hidcmbdoctype" name="hidcmbdoctype" value='<s:property value="hidcmbdoctype"/>'/>
                    <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
                </div>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <label class="accname" name="lbldoctype" id="lbldoctype"></label>
        <table width="100%">
            <tr>
                 <td>
                     <div id="cashDiv"><jsp:include page="cashVoucher.jsp"></jsp:include></div>
                     <div id="bankDiv" hidden="true"><jsp:include page="bankVoucher.jsp"></jsp:include></div>
                     <div id="creditDiv" hidden="true"><jsp:include page="creditVoucher.jsp"></jsp:include></div>
                     <div id="journalDiv" hidden="true"><jsp:include page="journalVoucher.jsp"></jsp:include></div>
                     <div id="contraDiv" hidden="true"><jsp:include page="contraTransVoucher.jsp"></jsp:include></div>
                     <div id="securityChqDiv" hidden="true"><jsp:include page="securityCheque.jsp"></jsp:include></div>
                     <div id="propertyDiv" hidden="true"><jsp:include page="propertyVoucher.jsp"></jsp:include></div>
                     <div id="unclearedChqDiv" hidden="true"><jsp:include page="unclearedVoucher.jsp"></jsp:include></div>
                 </td>
            </tr>
        </table>
    </div>

</div>

<div id="accountDetailsWindow">
	<div></div><div></div>
</div>

</div> 
</body>
</html>