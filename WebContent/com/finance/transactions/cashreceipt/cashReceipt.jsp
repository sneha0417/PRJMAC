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
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

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
	  
	  function setValues(){
		  $('#jqxCashReceiptDate').jqxDateTimeInput({disabled: false});
		  var date = $('#jqxCashReceiptDate').val();
		  getCurrencyId(date);
		  $('#jqxCashReceiptDate').jqxDateTimeInput({disabled: true});
		  
		  document.getElementById("cmbtotype").value=document.getElementById("hidcmbtotype").value;
		  
		  if($('#hidjqxCashReceiptDate').val()){
				 $("#jqxCashReceiptDate").jqxDateTimeInput('val', $('#hidjqxCashReceiptDate').val());
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
	         	 $("#jqxCashReceiptGrid").load("cashReceiptGrid.jsp?txtcashpaydocno2="+indexVal+"&check="+check);
			 }
	         var indexVal1 = document.getElementById("txttodocno").value;
	         var indexVal2 = document.getElementById("txttotrno").value;
	         if(indexVal1>0){
	         	 var check=1;
	         	 $("#jqxApplyInvoicing1").load("applyCashReceiptInvoicingGrid.jsp?txttoaccid1="+indexVal1+"&txttotrno1="+indexVal2+"&check="+check); 
	         }
		}
	  
	  function getDrTotal(){
		  var fromamount = $('#txtfrombaseamount').val();
		  
		  if(!isNaN(fromamount)){
			  
		  var dr=0.0,cr=0.0,dr1=0.0;
  	      var rows = $('#jqxCashReceipt').jqxGrid('getrows');
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
        	    var rows = $('#jqxCashReceipt').jqxGrid('getrows');
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
        	  var date = $('#jqxCashReceiptDate').jqxDateTimeInput('getDate');
        	  $("#maindate").jqxDateTimeInput('val', date);
        	  accountFromSearchContent(<%=contextPath+"/"%>+"com/finance/accountsDetailsSearch.jsp?date="+date);
          }
          else{
           }
          }
	  
	  function getAccType(event){
          var x= event.keyCode;
          if(x==114){
        	  var date = $('#jqxCashReceiptDate').jqxDateTimeInput('getDate');
        	  $("#maindate").jqxDateTimeInput('val', date);
        	  accountToSearchContent(<%=contextPath+"/"%>+"com/finance/clientAccountDetailsSearch.jsp?atype="+$('#cmbtotype').val()+"&date="+date);
          }
          else{
           }
          }
	  
	  function funPrintBtn() {
			
			if (($("#mode").val() == "view") && $("#docno").val()!="") {
		        var url=document.URL;
		        var reurl=url.split("saveCashReceipt");
		        $("#docno").prop("disabled", false);  
		     
		        $.messager.confirm('Confirm', 'Do you want to have header?', function(r){
					if (r){
						 var win= window.open(reurl[0]+"printCashReceipt?docno="+document.getElementById("docno").value+"&branch="+document.getElementById("brchName").value+"&header=1","_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
					     win.focus();
					 }
					else{
						var win= window.open(reurl[0]+"printCashReceipt?docno="+document.getElementById("docno").value+"&branch="+document.getElementById("brchName").value+"&header=0","_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
					    win.focus();
					}
		        });
		     }
		    else {
				$.messager.alert('Message','Select a Document....!','warning');
				return;
			}
      }
	  
	  function clearClientInfo(){
		  $("#txttodocno").val('');$("#txttoaccid").val('');$("#txttoaccname").val('');$("#txtapplyinvoiceapply").val(0.00);
		  $("#jqxApplyCashReceiptInvoicing").jqxGrid('clear');
		  $("#jqxApplyCashReceiptInvoicing").jqxGrid('addrow', null, {});
		  var atype=$('#cmbtotype').val();
      	  if(atype != "AR"){
      		$("#jqxApplyCashReceiptInvoicing").jqxGrid({ disabled: true});
      	   }else if(atype == "AR"){
      		$("#jqxApplyCashReceiptInvoicing").jqxGrid({ disabled: false});
      	   }
	  }
	  
	  function datechange(){
		  var date = $('#jqxCashReceiptDate').jqxDateTimeInput('getDate');
		  var validdate=funDateInPeriod(date);
		  if(parseInt(validdate)==0){
			document.getElementById("errormsg").innerText="Transaction prior or after Account Period is not valid.";
			return 0;	
		  }
		  $("#maindate").jqxDateTimeInput('val', date);
	  }
	  
</script>

<style>
    /* --- 1. CORE VARIABLES (Cancer Platform Palette) --- */
    :root {
        --bg-color: #F8FAFC; 
        --white: #FFFFFF;
        
        /* The Exact Blue & Purple Gradient Palette */
        --blue-primary: #2563EB;
        --purple-primary: #7C3AED;
        --gradient-primary: linear-gradient(135deg, var(--blue-primary), var(--purple-primary));
        
        /* Typography */
        --text-main: #1E293B; 
        --text-muted: #64748B;
        --border-light: #E2E8F0;
        
        /* Soft Shadows & Geometry */
        --shadow-sm: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
        --shadow-hover: 0 20px 40px -8px rgba(37, 99, 235, 0.15); /* Satisfying lift shadow */
        --radius-btn: 8px;
        --radius-input: 8px;
        --radius-card: 16px;

        /* Modernized JQX Variables */
        --jqx-grid-row-height: 40px; 
        --jqx-grid-column-height: 48px; 
        --jqx-grid-show-column-lines: 0; 
        --jqx-list-item-height: 36px;
        --jqx-grid-filter-menu-items-height: 36px;
        --jqx-dropdown-animation: transform;
        --jqx-datetimeinput-dropdown-height: 300px;
        --jqx-datetimeinput-dropdown-width: 300px;
        --jqx-calendar-header-height: 48px;
        --jqx-calendar-title-height: 48px;
        --jqx-border-radius: 8px; 
        --jqx-font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        --jqx-font-size: 14px; 
        --jqx-action-button-size: 28px;
    }

    body {
        margin: 0;
        padding: 0;
        background-color: var(--bg-color);
        /* Subtle animated background gradient to give it life */
        background: linear-gradient(-45deg, #F8FAFC, #EFF6FF, #F5F3FF, #FFFFFF);
        background-size: 400% 400%;
        animation: breathingBackground 15s ease infinite;
        font-family: 'Inter', sans-serif;
        color: var(--text-main);
        min-height: 100vh;
        overflow-y: auto !important;
        overflow-x: hidden;
        -webkit-font-smoothing: antialiased;
    }

    /* --- JQXGrid Modernization Overrides --- */
    .jqx-widget, .jqx-widget-content { font-family: 'Inter', sans-serif !important; font-size: 13px !important; color: #1E293B !important; border-color: #E2E8F0 !important; }
    .jqx-widget-header { background: #F8FAFC !important; color: #475569 !important; font-weight: 700 !important; border-color: #E2E8F0 !important; }
    .jqx-fill-state-hover { background: #F1F5F9 !important; border-color: #CBD5E1 !important; color: #2563EB !important; }
    .jqx-fill-state-pressed { background: rgba(37, 99, 235, 0.05) !important; border-color: rgba(37, 99, 235, 0.3) !important; color: #2563EB !important; }
    .jqx-input { border-radius: 8px !important; border: 1px solid #E2E8F0 !important; background: #FFFFFF !important; }
    .jqx-input:focus { background: #FFFFFF !important; border-color: #2563EB !important; box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15) !important; }

    /* --- 2. FLY-IN AND ENTRANCE PHYSICS --- */
    
    /* Elegant Slide Down for Header */
    @keyframes slideDownHeader {
        from { opacity: 0; transform: translateY(-50px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* Fixed Slide Up for Cards (Animating Top instead of Transform to preserve hover functionality) */
    @keyframes slideUpFade {
        from { opacity: 0; top: 40px; }
        to { opacity: 1; top: 0px; }
    }

    @keyframes breathingBackground {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    /* Staggered card load-in */
    .animate-slide-up {
        position: relative;
        opacity: 0;
        animation: slideUpFade 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }
    .delay-1 { animation-delay: 0.1s; }
    .delay-2 { animation-delay: 0.2s; }
    .delay-3 { animation-delay: 0.3s; }
    .delay-4 { animation-delay: 0.4s; }

    /* --- 3. TARGETING & FIXING THE LEGACY HEADER (The Fly-in Target) --- */
    .legacy-header-wrapper {
        background-color: var(--white);
        padding: 16px 32px;
        border-bottom: 1px solid var(--border-light);
        box-shadow: 0 2px 6px rgba(0,0,0,0.02);
        margin-bottom: 32px;
        position: sticky;
        top: 0;
        z-index: 1000;
        animation: slideDownHeader 0.5s cubic-bezier(0.16, 1, 0.3, 1) forwards;
    }

    /* Turn the black header text into the requested gradient */
    .legacy-header-wrapper h1, 
    .legacy-header-wrapper h2, 
    .legacy-header-wrapper h3,
    .legacy-header-wrapper font[size], 
    .legacy-header-wrapper strong,
    .legacy-header-wrapper b {
        background: var(--gradient-primary) !important;
        -webkit-background-clip: text !important;
        -webkit-text-fill-color: transparent !important;
        font-family: 'Inter', sans-serif !important;
        font-size: 26px !important;
        font-weight: 800 !important;
        letter-spacing: -0.02em !important;
        margin: 0 !important;
    }

    /* Exclude inputs/dropdowns inside the header from the gradient */
    .legacy-header-wrapper input, 
    .legacy-header-wrapper select {
        -webkit-text-fill-color: initial !important;
        background: initial;
    }

    /* Modernize all legacy buttons inside the header */
    .legacy-header-wrapper button, 
    .legacy-header-wrapper input[type="button"], 
    .legacy-header-wrapper input[type="submit"],
    .legacy-header-wrapper .myButton {
        font-family: 'Inter', sans-serif !important;
        font-weight: 600 !important;
        font-size: 13px !important;
        padding: 8px 18px !important;
        border-radius: var(--radius-btn) !important;
        background: var(--white) !important;
        color: var(--blue-primary) !important;
        border: 1px solid rgba(37, 99, 235, 0.3) !important;
        cursor: pointer !important;
        transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1) !important;
        box-shadow: 0 2px 4px rgba(0,0,0,0.02) !important;
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        margin: 4px 6px !important; 
    }

    /* Hover animation for legacy buttons - Lifting up and glowing */
    .legacy-header-wrapper button:hover, 
    .legacy-header-wrapper input[type="button"]:hover, 
    .legacy-header-wrapper input[type="submit"]:hover,
    .legacy-header-wrapper .myButton:hover {
        background: var(--gradient-primary) !important;
        color: var(--white) !important;
        border-color: transparent !important;
        transform: translateY(-3px) !important;
        box-shadow: 0 6px 15px rgba(37, 99, 235, 0.25) !important;
    }

    /* --- 4. MAIN WORKSPACE CONTAINER --- */
    .app-container {
        max-width: 1500px;
        margin: 0 auto;
        padding: 0 32px 40px 32px;
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    /* --- 5. GRID LAYOUTS --- */
    .grid { display: grid; gap: 24px; }
    .grid-2 { grid-template-columns: repeat(2, 1fr); }
    .grid-3 { grid-template-columns: repeat(3, 1fr); }
    .grid-4 { grid-template-columns: repeat(4, 1fr); }
    .grid-split { grid-template-columns: 1fr 1fr; gap: 32px; }

    /* --- 6. MODERN CARDS WITH BUTTERY SMOOTH LIFT --- */
    .ui-card {
        background-color: var(--white);
        border: 1px solid var(--border-light);
        border-radius: var(--radius-card);
        padding: 32px;
        box-shadow: var(--shadow-sm);
        /* Critical: Use transition on transform to get the snappy lift */
        transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1), box-shadow 0.4s ease, border-color 0.4s ease;
    }

    .ui-card:hover {
        transform: translateY(-8px);
        border-color: rgba(124, 58, 237, 0.2);
        box-shadow: var(--shadow-hover);
    }

    .card-title {
        font-size: 18px;
        font-weight: 800;
        color: var(--text-main);
        margin: 0 0 24px 0;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .card-title::before {
        content: '';
        display: block;
        width: 6px;
        height: 20px;
        background: var(--gradient-primary);
        border-radius: 4px;
    }

    /* --- 7. IMMACULATE FORM CONTROLS & LABELS --- */
    .form-group {
        display: flex;
        flex-direction: column;
        gap: 6px;
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
        padding: 10px 14px;
        background-color: #F8FAFC;
        border: 1px solid var(--border-light);
        border-radius: var(--radius-input);
        font-family: inherit;
        font-size: 14px;
        font-weight: 500;
        color: var(--text-main);
        box-sizing: border-box;
        transition: all 0.3s ease;
        height: 42px;
    }

    .form-control:hover:not([readonly]):not(:disabled) {
        background-color: var(--white);
        border-color: #CBD5E1;
    }

    /* Clean Blue focus ring */
    .form-control:focus {
        outline: none;
        background-color: var(--white);
        border-color: var(--blue-primary);
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
    }

    .form-group:focus-within .form-label {
        color: var(--blue-primary);
    }

    .form-control[readonly], 
    .form-control[tabindex="-1"] {
        background-color: #F1F5F9;
        color: var(--text-muted);
        cursor: not-allowed;
        border: 1px dashed #CBD5E1;
    }

    .text-right { text-align: right !important; }

    /* Button specific for the form area (Value Change) */
    .btn-form {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 0 20px;
        height: 42px;
        border-radius: var(--radius-btn);
        font-family: inherit;
        font-weight: 600;
        font-size: 13px;
        cursor: pointer;
        transition: all 0.3s ease;
        border: 1px solid rgba(37, 99, 235, 0.3);
        background: var(--white);
        color: var(--blue-primary);
        white-space: nowrap;
    }

    .btn-form:hover {
        background: var(--gradient-primary);
        color: var(--white);
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(37, 99, 235, 0.25);
    }

    /* --- 8. DATA GRIDS & TOTALS --- */
    .grid-container {
        border: 1px solid var(--border-light);
        border-radius: var(--radius-input);
        overflow: hidden;
        margin-bottom: 24px;
        background: var(--white);
        transition: box-shadow 0.3s ease;
    }

    .grid-container:hover {
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
    }

    .totals-area {
        display: flex;
        justify-content: flex-end;
        gap: 24px;
        padding-top: 24px;
        border-top: 2px dashed var(--border-light);
        margin-top: 24px;
    }

    .total-field {
        display: flex;
        align-items: center;
        gap: 16px;
        width: 300px;
    }

    .total-field .form-label {
        width: 120px;
        text-align: right;
        color: var(--text-main);
    }

    .total-field .form-control {
        font-weight: 800;
        font-size: 16px;
        color: var(--purple-primary);
        border: 2px solid rgba(124, 58, 237, 0.2);
        background-color: rgba(124, 58, 237, 0.03);
        height: 48px;
    }

    .hidden-system { display: none !important; }

    /* --- 9. RESPONSIVENESS --- */
    @media (max-width: 1200px) {
        .grid-split { grid-template-columns: 1fr; }
    }
    @media (max-width: 900px) {
        .grid-4, .grid-3 { grid-template-columns: repeat(2, 1fr); }
    }
    /* =========================
   Gradient Heading
========================= */

#formdet{
    font-size:22px;
    font-weight:800;
    display:block;
    letter-spacing:-0.5px;

    background:linear-gradient(
        135deg,
        #2563EB 0%,
        #4F46E5 50%,
        #7C3AED 100%
    );

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
    background-clip:text;
    color:transparent;

    animation:titleFlyIn .9s cubic-bezier(.22,1,.36,1);
}

/* =========================
   Labels
========================= */

#full label.branch,
#full label.currency{
    font-weight:700 !important;
    font-size:14px;
    color:#253858;

    opacity:0;
    animation:fadeUp .8s ease forwards;
}

#full label.currency{
    animation-delay:.15s;
}

/* =========================
   Dropdowns
========================= */

#full select#brchName,
#full select#currency{
    height:38px !important;
    padding:4px 12px;
    font-size:14px;
    font-weight:600;

    border:1px solid #d6dff1;
    border-radius:10px;

    background:#fff;

    width:150px;
    box-sizing:border-box;

    transition:
        transform .3s ease,
        box-shadow .3s ease,
        border-color .3s ease;

    opacity:0;
    animation:flyIn .8s cubic-bezier(.22,1,.36,1) forwards;

    appearance:none;

    background-image:
        url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='14' height='14' viewBox='0 0 24 24'%3E%3Cpath fill='%23666' d='M7 10l5 5 5-5z'/%3E%3C/svg%3E");

    background-repeat:no-repeat;
    background-position:right 12px center;
    background-size:14px;
}

#full select#currency{
    animation-delay:.15s;
}

/* Hover */

#full select#brchName:hover,
#full select#currency:hover{
    transform:translateY(-2px);

    border-color:#4F46E5;

    box-shadow:
        0 10px 25px rgba(79,70,229,.15);
}

/* Focus */

#full select#brchName:focus,
#full select#currency:focus{
    outline:none;

    border-color:#4F46E5;

    box-shadow:
        0 0 0 4px rgba(124,58,237,.12),
        0 10px 30px rgba(79,70,229,.18);

    transform:translateY(-2px);
}

/* =========================
   Keyframes
========================= */

@keyframes titleFlyIn{
    from{
        opacity:0;
        transform:
            translateY(-35px)
            scale(.9);
    }
    to{
        opacity:1;
        transform:
            translateY(0)
            scale(1);
    }
}

@keyframes flyIn{
    from{
        opacity:0;
        transform:
            translateY(25px)
            scale(.95);
    }
    to{
        opacity:1;
        transform:
            translateY(0)
            scale(1);
    }
}

@keyframes fadeUp{
    from{
        opacity:0;
        transform:translateY(15px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}
#full select#brchName:hover,
#full select#currency:hover{
    border-color:transparent;

    background:
        linear-gradient(#fff,#fff) padding-box,
        linear-gradient(135deg,#2563EB,#7C3AED) border-box;

    border:1px solid transparent;
}

/* Labels */

html body #full label.branch,
html body #full label.currency{
    font-size:14px !important;
    font-family:'Inter',sans-serif !important;
    font-weight:700 !important;
    color:#253858 !important;

    letter-spacing:.3px !important;

    opacity:0;
    animation:fadeUp .8s ease forwards !important;
}

/* Dropdowns */

html body #full select#brchName,
html body #full select#currency{
    height:38px !important;
    min-width:150px !important;

    padding:0 38px 0 12px !important;

    font-size:14px !important;
    font-family:'Inter',sans-serif !important;
    font-weight:600 !important;

    border:1px solid #d6dff1 !important;
    border-radius:10px !important;

    background:#ffffff !important;

    appearance:none !important;
    -webkit-appearance:none !important;
    -moz-appearance:none !important;

    box-shadow:
        0 2px 8px rgba(0,0,0,.06) !important;

    transition:all .35s ease !important;

    background-image:url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24'%3E%3Cpath fill='%234F46E5' d='M7 10l5 5 5-5z'/%3E%3C/svg%3E") !important;

    background-repeat:no-repeat !important;
    background-position:right 12px center !important;
    background-size:16px !important;

    opacity:1 !important;
}

/* Hover */

html body #full select#brchName:hover,
html body #full select#currency:hover{

    transform:translateY(-2px) !important;

    border-color:#7C3AED !important;

    box-shadow:
        0 8px 25px rgba(124,58,237,.18) !important;
}

/* Focus */

html body #full select#brchName:focus,
html body #full select#currency:focus{

    outline:none !important;

    border-color:#4F46E5 !important;

    box-shadow:
        0 0 0 4px rgba(79,70,229,.15),
        0 10px 25px rgba(79,70,229,.15) !important;

    transform:translateY(-2px) !important;
}

/* Animations */

@keyframes fadeUp{
    from{
        opacity:0;
        transform:translateY(15px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

</style>

</head>
<body onload="setValues();">

<div class="legacy-header-wrapper">
    <jsp:include page="../../../../header.jsp"></jsp:include>
</div>

<div class="app-container">

    <form id="frmCashReceipt" action="saveCashReceipt" method="post" autocomplete="off">
        
        <div class="ui-card animate-slide-up delay-1">
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
                    <div style="display: flex; gap: 12px;">
                        <input type="text" class="form-control" id="docno" name="txtcashreceiptdocno" value='<s:property value="txtcashreceiptdocno"/>' tabindex="-1" style="flex: 1;"/>
                        <button class="btn-form" type="button" id="btnvaluechange" name="btnvaluechange" onclick="funwarningopen();">Value Change</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="grid grid-split">
            
            <div class="ui-card animate-slide-up delay-2">
                <h3 class="card-title">Cash Details</h3>
                
                <div class="grid grid-2" style="margin-bottom: 24px;">
                    <div class="form-group">
                        <label class="form-label">Cash Account</label>
                        <input type="text" class="form-control" id="txtfromaccid" name="txtfromaccid" placeholder="Press F3 to Search" value='<s:property value="txtfromaccid"/>' onkeydown="getAcc(event);"/>
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

            <div class="ui-card animate-slide-up delay-2">
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
                        <input type="text" class="form-control" id="txttoaccid" name="txttoaccid" placeholder="Press F3 to Search" value='<s:property value="txttoaccid"/>' onkeydown="getAccType(event);"/>
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

        <div class="ui-card animate-slide-up delay-3">
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

        <div class="ui-card animate-slide-up delay-4">
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