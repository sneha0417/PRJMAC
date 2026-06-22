<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>GatewayERP(i) - Cash Receipt</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function() {
		 $("#btnvaluechange").hide();
		 
		 $("#jqxCashReceiptDate").jqxDateTimeInput({ width: '100%', height: '40px', formatString:"dd.MM.yyyy"});
		 $("#maindate").jqxDateTimeInput({ width: '125px', height: '15px', formatString:"dd.MM.yyyy"});
		 
		 $('#accountDetailsToWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsToWindow').jqxWindow('close');  
		 
		 $('#accountDetailsFromWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsFromWindow').jqxWindow('close');
		 
		 $('#cashReceiptGridWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#cashReceiptGridWindow').jqxWindow('close');
		 
		 $('#costTypeSearchGridWindow').jqxWindow({width: '25%', height: '58%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'Cost Type Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
 		 $('#costTypeSearchGridWindow').jqxWindow('close');
 		 
 		 $('#costCodeSearchWindow').jqxWindow({width: '25%', height: '58%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'Cost Code Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#costCodeSearchWindow').jqxWindow('close');
		 
		 $('#jqxCashReceiptDate').on('change', function (event) {
				 var receiptdate = $('#jqxCashReceiptDate').jqxDateTimeInput('getDate');
				 var validdate=funDateInPeriod(receiptdate);
				 if(parseInt(validdate)==0){
					document.getElementById("errormsg").innerText="Transaction prior or after Account Period is not valid.";
					return 0;	
		         }
			 });
			 
		  $('#txtfromaccid').dblclick(function(){
			  var date = $('#jqxCashReceiptDate').jqxDateTimeInput('getDate');
			  $("#maindate").jqxDateTimeInput('val', date);
			  accountFromSearchContent(<%=contextPath+"/"%>+"com/finance/accountsDetailsSearch.jsp?date="+date);
			  });
		 
		  $('#txttoaccid').dblclick(function(){
			  var date = $('#jqxCashReceiptDate').jqxDateTimeInput('getDate');
			  $("#maindate").jqxDateTimeInput('val', date);
			  accountToSearchContent(<%=contextPath+"/"%>+"com/finance/clientAccountDetailsSearch.jsp?atype="+$('#cmbtotype').val()+"&date="+date);
			  });  
	});
	
	function CashSearchContent(url) {
		$('#cashReceiptGridWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#cashReceiptGridWindow').jqxWindow('setContent', data);
		$('#cashReceiptGridWindow').jqxWindow('bringToFront');
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
	
	 function funwarningopen(){
		 $.messager.confirm('Confirm', 'Transaction will affect Links to the applied Bank Reconcilations & Prepayments.', function(r){
			    if (r){
			    	$("#mode").val("EDIT");
					 $('#txtfromaccid').attr('readonly', true);$('#txtfromaccname').attr('readonly', true);$('#txtfromamount').attr('readonly', false);$('#txtdescription').attr('readonly', false);
					 $('#txttoaccid').attr('readonly', true);$('#txttoaccname').attr('readonly', true);$('#txttoamount').attr('readonly', false);$('#txtfromrate').attr('readonly', false);
				     $('#txtfrombaseamount').attr('readonly', true);$('#txttorate').attr('readonly', false);$('#txttobaseamount').attr('readonly', true);$('#txtapplyinvoiceamt').attr('readonly', true);
				     $('#txtapplyinvoiceapply').attr('readonly', true);$('#txtapplyinvoicebalance').attr('readonly', true);$('#txtdrtotal').attr('readonly', true);$('#txtcrtotal').attr('readonly', true);
					 $('#frmCashReceipt select').attr('disabled', false);$("#jqxApplyCashReceiptInvoicing").jqxGrid({ disabled: false});$("#jqxCashReceipt").jqxGrid({ disabled: false});  
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
	  
	 function funReadOnly(){
			$('#frmCashReceipt input').attr('readonly', true );
			$('#frmCashReceipt select').attr('disabled', true);
			$('#jqxCashReceiptDate').jqxDateTimeInput({disabled: true});
			$("#jqxApplyCashReceiptInvoicing").jqxGrid({ disabled: true});
			$("#jqxCashReceipt").jqxGrid({ disabled: true});
			$("#btnvaluechange").hide();
	 }
	 function funRemoveReadOnly(){
			$('#frmCashReceipt input').attr('readonly', false );
			$('#frmCashReceipt select').attr('disabled', false);
			$('#jqxCashReceiptDate').jqxDateTimeInput({disabled: false});
			$('#docno').attr('readonly', true);
			$('#txtfromaccid').attr('readonly', true );
			$('#txtfromaccname').attr('readonly', true );
			$('#txttoaccid').attr('readonly', true );
			$('#txttoaccname').attr('readonly', true );
			$('#txtapplyinvoiceamt').attr('readonly', true );
			$('#txtapplyinvoiceapply').attr('readonly', true );
			$('#txtapplyinvoicebalance').attr('readonly', true );
			$('#txtdrtotal').attr('readonly', true );
			$('#txtcrtotal').attr('readonly', true );
			$("#jqxApplyCashReceiptInvoicing").jqxGrid({ disabled: false}); 
			$("#jqxCashReceipt").jqxGrid({ disabled: false});

			var date = $('#jqxCashReceiptDate').val();
		    getCurrencyId(date);
		    
			if ($("#mode").val() == "E") {
             $("#btnvaluechange").show();
             $('#frmCashReceipt input').attr('readonly', true );
             $('#frmCashReceipt select').attr('disabled', true);
             $("#jqxApplyCashReceiptInvoicing").jqxGrid({ disabled: true});
			    $("#jqxCashReceipt").jqxGrid({ disabled: true});
             $('#txtrefno').attr('readonly', false );
             $('#txtdescription').attr('readonly', false );
             $("#jqxCashReceipt").jqxGrid('addrow', null, {"docno": "","type": "","accounts": "","accountname1": "","currency": "","currencyid": "","rate": "","costtype": "","costgroup": "","costcode": "","dr": true,"amount1": "","baseamount1": "","description": "","grtype": "","currencytype": "","sr_no":""});
			  }
			 else{
				$("#btnvaluechange").hide();
			} 
			
			if ($("#mode").val() == "A") {
				$('#jqxCashReceiptDate').val(new Date());
				$("#jqxCashReceipt").jqxGrid('clear'); 
				$("#jqxCashReceipt").jqxGrid('addrow', null, {"docno": "","type": "","accounts": "","accountname1": "","currency": "","currencyid": "","rate": "","costtype": "","costgroup": "","costcode": "","dr": true,"amount1": "","baseamount1": "","description": "","grtype": "","currencytype": "","sr_no":""});
				$("#jqxApplyCashReceiptInvoicing").jqxGrid('clear');
				$("#jqxApplyCashReceiptInvoicing").jqxGrid('addrow', null, {});
			}
	 }
	 
	 function funSearchLoad(){
		changeContent('crvMainSearch.jsp'); 
	 }
		
	 function funChkButton() {
			/* funReset(); */
		}
	 
	 function funFocus()
	    {
	    	$('#jqxCashReceiptDate').jqxDateTimeInput('focus'); 	    		
	    }
	 
	   $(function(){
	        $('#frmCashReceipt').validate({
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
		  
		    var receiptdate = $('#jqxCashReceiptDate').jqxDateTimeInput('getDate');
			var validdate=funDateInPeriod(receiptdate);
			if(parseInt(validdate)==0){
				document.getElementById("errormsg").innerText="Transaction prior or after Account Period is not valid.";
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
	    	    
	    	 /* Cash Receipt Grid  Saving*/
	 		  var rows = $("#jqxCashReceipt").jqxGrid('getrows');
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
	 					
	 				newTextBox.val(rows[i].docno+"::"+rows[i].currencyid+"::"+rows[i].rate+"::"+rows[i].dr+"::"+amount+"::"+rows[i].description+"::"+baseamount+"::0:: "+rows[i].costtype+":: "+rows[i].costcode);
	 				newTextBox.appendTo('form');
				     }
	 				}
			        $('#gridlength').val(length);
	 	 		   /* Cash Receipt Grid  Saving Ends*/	 
	 	 		
	 	 		/* Applying Invoice Grid Saving */
	 	 		var rows = $("#jqxApplyCashReceiptInvoicing").jqxGrid('getrows');
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
	 					
	 				newTextBox.val(rows[i].applying+"::"+parseFloat((rows[i].out_amount+rows[i].applying)*-1)+"::"+rows[i].currency+"::"+rows[i].tranid+"::"+rows[i].acno);
	 				newTextBox.appendTo('form');
	 				}
	 			 }
	 			$('#applylength').val(lengthapply);
	 			 /* Applying Invoice Grid Saving Ends*/
	 			 
	 			 /* Applying Invoice Grid Updating */
	 		 		var rows = $("#jqxApplyCashReceiptInvoicing").jqxGrid('getrows');
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
	 				 /* Applying Invoice Grid Updating Ends*/
	 				 
	 			  if ($("#mode").val() == "E") {
			         $('#frmCashReceipt select').attr('disabled', false); 
			      }
				 
	 				 
	    		return 1;
		} 
</script>

<style>
    /* --- 1. THE LIGHT, AIRY AESTHETIC --- */
    :root {
        /* Premium Background */
        --bg-color: #FFFFFF; 
        
        /* THE VISIBLE UNIFORM LIGHT GRADIENTRecipe */
        /* Change these two variables to switch from Sky Blue to Light Green or Orange */
        --card-gradient-start: #E0F2FE; /* Faint Sky Blue */
        --card-gradient-end: #FFFFFF;
        
        --brand-blue: #0284C7; /* Solid blue for highlights/borders */
        --gradient-primary: linear-gradient(135deg, var(--card-gradient-start), var(--card-gradient-end));
        
        /* Typo & Borders */
        --text-main: #1E293B; 
        --text-muted: #64748B;
        --border-light: rgba(2, 132, 199, 0.15); /* Blue-tinted soft border */
        
        /* Interactivity Physics */
        --shadow-sm: 0 4px 10px rgba(0, 0, 0, 0.03);
        --shadow-hover: 0 20px 40px -10px rgba(2, 132, 199, 0.12);
        --radius-btn: 12px;
        --radius-input: 12px;
        --radius-card: 20px;

        /* Native JQX Grid Modernization */
        --jqx-grid-row-height: 42px; 
        --jqx-grid-column-height: 50px; 
        --jqx-grid-show-column-lines: 0; 
        --jqx-list-item-height: 36px;
        --jqx-grid-filter-menu-items-height: 36px;
        --jqx-dropdown-animation: transform;
        --jqx-border-radius: 12px; 
        --jqx-font-family: 'Plus Jakarta Sans', sans-serif;
        --jqx-font-size: 14px; 
    }

    body {
        margin: 0;
        padding: 0;
        background-color: var(--bg-color);
        font-family: 'Plus Jakarta Sans', sans-serif;
        color: var(--text-main);
        min-height: 100vh;
        overflow-y: auto !important;
        overflow-x: hidden;
        -webkit-font-smoothing: antialiased;
    }

    /* --- JQXGrid Deep Light Theme Layer --- */
    .jqx-widget, .jqx-widget-content { 
        font-family: 'Plus Jakarta Sans', sans-serif !important; 
        font-size: 13px !important; 
        color: #1E293B !important; 
        background: transparent !important; /* Let card gradient show through */
        border-color: #E0F2FE !important; 
    }
    .jqx-widget-header { 
        background: rgba(224, 242, 254, 0.5) !important; 
        color: var(--brand-blue) !important; 
        font-weight: 800 !important; 
        border-color: #E0F2FE !important; 
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    .jqx-fill-state-hover { 
        background: rgba(2, 132, 199, 0.08) !important; 
        border-color: #0284C7 !important; 
        color: #0284C7 !important; 
    }
    .jqx-fill-state-pressed { 
        background: rgba(2, 132, 199, 0.15) !important; 
        border-color: #0284C7 !important; 
        color: #0284C7 !important; 
    }
    .jqx-input { 
        border-radius: var(--radius-input) !important; 
        border: 1px solid #E0F2FE !important; 
        background: #FFFFFF !important; 
        color: #1E293B !important;
    }
    .jqx-input:focus { 
        border-color: #0284C7 !important; 
        box-shadow: 0 0 0 4px rgba(2, 132, 199, 0.15) !important; 
    }

    /* --- 2. THE WOW ANIMATIONS --- */
    @keyframes flyDownHeader {
        from { opacity: 0; transform: translateY(-40px); }
        to { opacity: 1; transform: translateY(0); }
    }
    @keyframes elasticRise {
        from { opacity: 0; transform: translateY(50px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Wrap cards to separate structural entry from hover physics */
    .entrance-wrapper {
        opacity: 0;
        animation: elasticRise 0.9s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }
    .stagger-1 { animation-delay: 0.1s; }
    .stagger-2 { animation-delay: 0.2s; }
    .stagger-3 { animation-delay: 0.3s; }
    .stagger-4 { animation-delay: 0.4s; }

    /* --- 3. FIXING THE LEGACY HEADER --- */
    .legacy-header-wrapper {
        background-color: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        padding: 18px 40px;
        border-bottom: 1px solid #E2E8F0;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.03);
        margin-bottom: 32px;
        position: sticky;
        top: 0;
        z-index: 1000;
        animation: flyDownHeader 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }

    /* Force legacy title to be bold & modern */
    .legacy-header-wrapper h1, 
    .legacy-header-wrapper h2, 
    .legacy-header-wrapper h3,
    .legacy-header-wrapper font[size], 
    .legacy-header-wrapper strong,
    .legacy-header-wrapper b {
        color: var(--brand-blue) !important;
        font-family: 'Plus Jakarta Sans', sans-serif !important;
        font-size: 26px !important;
        font-weight: 800 !important;
        letter-spacing: -0.02em !important;
        margin: 0 !important;
    }

    /* Modernize Legacy Buttons */
    .legacy-header-wrapper button, 
    .legacy-header-wrapper input[type="button"], 
    .legacy-header-wrapper input[type="submit"],
    .legacy-header-wrapper .myButton {
        font-family: 'Plus Jakarta Sans', sans-serif !important;
        font-weight: 700 !important;
        font-size: 13px !important;
        padding: 10px 22px !important;
        border-radius: var(--radius-btn) !important;
        background: #FFFFFF !important;
        color: var(--brand-blue) !important;
        border: 1px solid #E0F2FE !important;
        cursor: pointer !important;
        transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1) !important;
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        margin: 4px 6px !important; 
        box-shadow: 0 4px 12px rgba(0,0,0,0.03) !important;
    }

    .legacy-header-wrapper button:hover, 
    .legacy-header-wrapper .myButton:hover {
        background: var(--brand-blue) !important;
        color: #FFFFFF !important;
        border-color: transparent !important;
        transform: translateY(-3px) scale(1.02) !important;
        box-shadow: 0 10px 20px rgba(2, 132, 199, 0.2) !important;
    }

    /* --- 4. FLUID WORKSPACE LAYOUT --- */
    .app-container {
        max-width: 1600px;
        margin: 0 auto;
        padding: 0 40px 50px 40px;
        display: flex;
        flex-direction: column;
        gap: 32px;
    }

    .grid { display: grid; gap: 24px; }
    .grid-2 { grid-template-columns: repeat(2, 1fr); }
    .grid-3 { grid-template-columns: repeat(3, 1fr); }
    .grid-4 { grid-template-columns: repeat(4, 1fr); }
    .grid-split { grid-template-columns: 1fr 1fr; gap: 32px; }

    /* --- 5. THE UNIFORM LIGHT GRADIENT GLASS CARDS (Hover Lift) --- */
    .glass-card {
        /* Apply the uniform sky blue gradient infused into the panel */
        background: var(--gradient-primary);
        backdrop-filter: blur(20px); /* Heavy frosted glass effect */
        -webkit-backdrop-filter: blur(20px);
        border: 1px solid #FFFFFF; /* Specular border for thickness */
        border-radius: var(--radius-card);
        padding: 34px;
        box-shadow: var(--shadow-sm);
        transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.4s ease;
    }

    /* Crisp, snappy lift toward the user */
    .glass-card:hover {
        transform: translateY(-8px) scale(1.005);
        box-shadow: var(--shadow-hover);
        border-color: rgba(255, 255, 255, 0.8);
    }

    .card-title {
        font-size: 18px;
        font-weight: 800;
        color: var(--text-main);
        margin: 0 0 28px 0;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .card-title::before {
        content: '';
        display: block;
        width: 8px;
        height: 24px;
        background: var(--brand-blue);
        border-radius: 4px;
    }

    /* --- 6. LUMINOUS FORM CONTROLS --- */
    .form-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }

    .form-label {
        font-size: 12px;
        font-weight: 700;
        color: var(--text-muted);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        transition: color 0.3s ease;
    }

    .form-control {
        width: 100%;
        padding: 12px 16px;
        background-color: #FFFFFF;
        border: 1px solid #E0F2FE;
        border-radius: var(--radius-input);
        font-family: inherit;
        font-size: 15px;
        font-weight: 500;
        color: var(--text-main);
        box-sizing: border-box;
        transition: all 0.3s ease;
        height: 46px;
    }

    .form-control:hover:not([readonly]):not(:disabled) {
        border-color: #0284C7;
    }

    /* Luminous blue focus ring */
    .form-control:focus {
        outline: none;
        background-color: #FFFFFF;
        border-color: #0284C7;
        box-shadow: 0 0 0 4px rgba(2, 132, 199, 0.15);
    }

    .form-group:focus-within .form-label {
        color: var(--brand-blue);
    }

    /* Dashed status for read-only systemic inputs */
    .form-control[readonly], 
    .form-control[tabindex="-1"] {
        background-color: #F8FAFC;
        color: var(--text-muted);
        cursor: not-allowed;
        border: 1px dashed #E0F2FE;
    }

    .text-right { text-align: right !important; }

    /* Button inside the form */
    .btn-form {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0 24px;
        height: 46px;
        border-radius: var(--radius-btn);
        font-family: inherit;
        font-weight: 700;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
        border: 1px solid #E0F2FE;
        background: #FFFFFF;
        color: var(--brand-blue);
        white-space: nowrap;
    }

    .btn-form:hover {
        background: var(--brand-blue);
        color: #FFFFFF;
        border-color: transparent;
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(2, 132, 199, 0.2);
    }

    /* --- 7. CYBER CONTAINER BOUNDARIES FOR GRIDS --- */
    .grid-container {
        border: 1px solid #E0F2FE;
        border-radius: var(--radius-input);
        overflow: hidden;
        margin-bottom: 28px;
        background: #FFFFFF;
        transition: box-shadow 0.3s ease;
    }

    .grid-container:hover {
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    }

    /* --- 8. TOTALS DISPLAY DECORATORS --- */
    .totals-area {
        display: flex;
        justify-content: flex-end;
        gap: 24px;
        padding-top: 24px;
        border-top: 2px dashed rgba(2, 132, 199, 0.3);
        margin-top: 24px;
    }

    .total-field {
        display: flex;
        align-items: center;
        gap: 16px;
        width: 320px;
    }

    .total-field .form-label {
        width: 120px;
        text-align: right;
        color: var(--text-main);
    }

    /* High glow styling for numerical totals */
    .total-field .form-control {
        font-weight: 900;
        font-size: 18px;
        color: var(--brand-blue);
        border: 2px solid rgba(2, 132, 199, 0.3);
        background-color: rgba(2, 132, 199, 0.03);
        height: 54px;
        box-shadow: inset 0 2px 6px rgba(2, 132, 199, 0.05);
    }

    .hidden-system { display: none !important; }

    @media (max-width: 1200px) {
        .grid-split { grid-template-columns: 1fr; }
    }
</style>

</head>
<body onload="setValues();">

<div class="legacy-header-wrapper">
    <jsp:include page="../../../../header.jsp"></jsp:include>
</div>

<div class="app-container">

    <form id="frmCashReceipt" action="saveCashReceipt" method="post" autocomplete="off">
        
        <div class="entrance-wrapper stagger-1">
            <div class="glass-card">
                <h3 class="card-title">Document Details</h3>
                <div class="grid grid-4">
                    <div class="form-group">
                        <label class="form-label">Receipt Date</label>
                        <div id="jqxCashReceiptDate" name="jqxCashReceiptDate" onchange="datechange();" onblur="datechange();" value='<s:property value="jqxCashReceiptDate"/>'></div>
                        <input type="hidden" id="hidjqxCashReceiptDate" name="hidjqxCashReceiptDate" value='<s:property value="hidjqxCashReceiptDate"/>'/>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Reference No.</label>
                        <input type="text" class="form-control" id="txtrefno" name="txtrefno" value='<s:property value="txtrefno"/>'/>
                    </div>
                    
                    <div class="form-group" style="grid-column: span 2;">
                        <label class="form-label">Document No.</label>
                        <div style="display: flex; gap: 16px;">
                            <input type="text" class="form-control" id="docno" name="txtcashreceiptdocno" value='<s:property value="txtcashreceiptdocno"/>' tabindex="-1" style="flex: 1;"/>
                            <button class="btn-form" type="button" id="btnvaluechange" name="btnvaluechange" onclick="funwarningopen();">Value Change</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="grid grid-split entrance-wrapper stagger-2">
            
            <div class="glass-card">
                <h3 class="card-title">Cash Details</h3>
                
                <div class="grid grid-2" style="margin-bottom: 24px;">
                    <div class="form-group">
                        <label class="form-label">Cash Account</label>
                        <input type="text" class="form-control" id="txtfromaccid" name="txtfromaccid" placeholder="[F3] Search" value='<s:property value="txtfromaccid"/>' onkeydown="getAcc(event);"/>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Account Name</label>
                        <input type="text" class="form-control" id="txtfromaccname" name="txtfromaccname" value='<s:property value="txtfromaccname"/>' tabindex="-1"/>
                        <input type="hidden" id="txtfromdocno" name="txtfromdocno" value='<s:property value="txtfromdocno"/>'/>
                    </div>
                </div>

                <div class="grid grid-2" style="margin-bottom: 24px;">
                    <div class="form-group">
                        <label class="form-label">Currency</label>
                        <select class="form-control" id="cmbfromcurrency" name="cmbfromcurrency" value='<s:property value="cmbfromcurrency"/>' onchange="getRate(this.value,$('#jqxCashReceiptDate').val());">
                            <option></option>
                        </select>
                        <input type="hidden" id="hidcmbfromcurrency" name="hidcmbfromcurrency" value='<s:property value="hidcmbfromcurrency"/>'/>
                        <input type="hidden" id="hidfromcurrencytype" name="hidfromcurrencytype" value='<s:property value="hidfromcurrencytype"/>'/>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Exchange Rate</label>
                        <input type="text" class="form-control text-right" id="txtfromrate" name="txtfromrate" value='<s:property value="txtfromrate"/>' onblur="funRoundAmt(this.value,this.id);getBaseAmountFrom();getDrTotal();" tabindex="-1"/>
                    </div>
                </div>

                <div class="grid grid-2" style="margin-bottom: 24px;">
                    <div class="form-group">
                        <label class="form-label">Amount</label>
                        <input type="text" class="form-control text-right" id="txtfromamount" name="txtfromamount" value='<s:property value="txtfromamount"/>' onblur="funRoundAmt(this.value,this.id);getBaseAmountFrom();getDrTotal();" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Base Amount</label>
                        <input type="text" class="form-control text-right" id="txtfrombaseamount" name="txtfrombaseamount" value='<s:property value="txtfrombaseamount"/>' tabindex="-1"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Description / Memo</label>
                    <input type="text" class="form-control" id="txtdescription" name="txtdescription" value='<s:property value="txtdescription"/>'/>
                </div>
            </div>

            <div class="glass-card">
                <h3 class="card-title">Payment Source</h3>
                
                <div class="grid grid-3" style="margin-bottom: 24px;">
                    <div class="form-group">
                        <label class="form-label">Type</label>
                        <select class="form-control" id="cmbtotype" name="cmbtotype" onchange="clearClientInfo();" value='<s:property value="cmbtotype"/>'>
                            <option value="AR">AR</option>
                            <option value="AP">AP</option>
                        </select>
                        <input type="hidden" id="hidcmbtotype" name="hidcmbtotype" value='<s:property value="hidcmbtotype"/>'/>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Account ID</label>
                        <input type="text" class="form-control" id="txttoaccid" name="txttoaccid" placeholder="[F3] Search" value='<s:property value="txttoaccid"/>' onkeydown="getAccType(event);"/>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Account Name</label>
                        <input type="text" class="form-control" id="txttoaccname" name="txttoaccname" value='<s:property value="txttoaccname"/>' tabindex="-1"/>
                        <input type="hidden" id="txttodocno" name="txttodocno" value='<s:property value="txttodocno"/>'/>
                        <input type="hidden" id="txttotranid" name="txttotranid" value='<s:property value="txttotranid"/>'/>
                        <input type="hidden" id="txttotrno" name="txttotrno" value='<s:property value="txttotrno"/>'/>
                    </div>
                </div>

                <div class="grid grid-2" style="margin-bottom: 24px;">
                    <div class="form-group">
                        <label class="form-label">Currency</label>
                        <select class="form-control" id="cmbtocurrency" name="cmbtocurrency" value='<s:property value="cmbtocurrency"/>' onchange="getRatevalue(this.value,$('#jqxCashReceiptDate').val());">
                            <option></option>
                        </select>
                        <input type="hidden" id="hidcmbtocurrency" name="hidcmbtocurrency" value='<s:property value="hidcmbtocurrency"/>'/>
                        <input type="hidden" id="hidtocurrencytype" name="hidtocurrencytype" value='<s:property value="hidtocurrencytype"/>'/>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Exchange Rate</label>
                        <input type="text" class="form-control text-right" id="txttorate" name="txttorate" value='<s:property value="txttorate"/>' onblur="funRoundAmt(this.value,this.id);getBaseAmountTo();getCrTotal();" tabindex="-1"/>
                    </div>
                </div>

                <div class="grid grid-2">
                    <div class="form-group">
                        <label class="form-label">Amount</label>
                        <input type="text" class="form-control text-right" id="txttoamount" name="txttoamount" value='<s:property value="txttoamount"/>' onblur="funRoundAmt(this.value,this.id);getBaseAmountTo();getCrTotal();getAmount();" onfocus="this.oldvalue = this.value;" onchange="funPaymentAmount(this);this.oldvalue = this.value;" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">Base Amount</label>
                        <input type="text" class="form-control text-right" id="txttobaseamount" name="txttobaseamount" value='<s:property value="txttobaseamount"/>' tabindex="-1"/>
                    </div>
                </div>
            </div>

        </div>

        <div class="entrance-wrapper stagger-3">
            <div class="glass-card">
                <h3 class="card-title">Apply Invoices</h3>
                
                <div class="grid-container" id="jqxApplyInvoicing1">
                    <jsp:include page="applyCashReceiptInvoicingGrid.jsp"></jsp:include>
                </div>
                
                <div class="grid grid-3">
                    <div class="form-group">
                        <label class="form-label">Allocation Amount</label>
                        <input type="text" class="form-control text-right" id="txtapplyinvoiceamt" name="txtapplyinvoiceamt" value='<s:property value="txtapplyinvoiceamt"/>'/>
                        <input type="hidden" id="txtvalidation" name="txtvalidation" value='<s:property value="txtvalidation"/>'/>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Total Applied</label>
                        <input type="text" class="form-control text-right" id="txtapplyinvoiceapply" name="txtapplyinvoiceapply" value='<s:property value="txtapplyinvoiceapply"/>' tabindex="-1"/>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Remaining Balance</label>
                        <input type="text" class="form-control text-right" id="txtapplyinvoicebalance" name="txtapplyinvoicebalance" value='<s:property value="txtapplyinvoicebalance"/>' tabindex="-1"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="entrance-wrapper stagger-4">
            <div class="glass-card">
                <h3 class="card-title">Receipt Lines</h3>
                
                <div class="grid-container" id="jqxCashReceiptGrid">
                    <jsp:include page="cashReceiptGrid.jsp"></jsp:include>
                </div>
                
                <div class="totals-area">
                    <div class="total-field">
                        <label class="form-label">Debit Total (Dr.)</label>
                        <input type="text" class="form-control text-right" id="txtdrtotal" name="txtdrtotal" value='<s:property value="txtdrtotal"/>'/>
                    </div>
                    <div class="total-field">
                        <label class="form-label">Credit Total (Cr.)</label>
                        <input type="text" class="form-control text-right" id="txtcrtotal" name="txtcrtotal" value='<s:property value="txtcrtotal"/>' tabindex="-1"/>
                    </div>
                </div>
            </div>
        </div>

        <div style="display:none;">
            <input type="hidden" id="mode" name="mode"/>
            <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
            <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
            <input type="hidden" name="txtforsearch" id="txtforsearch" value="0"/>
            <div id="maindate" name="maindate" value='<s:property value="maindate"/>'></div>
            <input type="hidden" id="hidmaindate" name="hidmaindate" value='<s:property value="hidmaindate"/>'/>
            <input type="hidden" id="gridlength" name="gridlength"/>
            <input type="hidden" id="applylength" name="applylength"/>
            <input type="hidden" id="applylengthupdate" name="applylengthupdate"/>
        </div>

    </form>
</div>

<div id="cashReceiptGridWindow"><div></div><div></div></div>  
<div id="accountDetailsFromWindow"><div></div><div></div></div>  
<div id="accountDetailsToWindow"><div></div><div></div></div> 
<div id="costTypeSearchGridWindow"><div></div><div></div></div> 
<div id="costCodeSearchWindow"><div></div><div></div></div> 

</body>
</html>