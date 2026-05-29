<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>

<script type="text/javascript">
	$(document).ready(function() {
		 
		$('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		$('#accountDetailsWindow').jqxWindow('close');
		
		 $('#openingBalanceGridWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#openingBalanceGridWindow').jqxWindow('close');
		 
		 $('#txtaccid').dblclick(function(){
			  accountSearchContent("clientAccountDetailsSearch.jsp?atype="+$('#cmbacctype').val());
	     });
	});
	
	function accountSearchContent(url) {
	 	$('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#accountDetailsWindow').jqxWindow('setContent', data);
		$('#accountDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function OpeningSearchContent(url) {
		$('#openingBalanceGridWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#openingBalanceGridWindow').jqxWindow('setContent', data);
		$('#openingBalanceGridWindow').jqxWindow('bringToFront');
	}); 
	} 

	function getAcc(event){
	    var x= event.keyCode;
	    if(x==114){
	    	accountSearchContent("clientAccountDetailsSearch.jsp?atype="+$('#cmbacctype').val());
	       }
	    }
	
	function funExcelBtn() {
		  if ($("#mode").val() == "view") {
		  	 if(parseInt(window.parent.chkexportdata.value)=="1") {
			  	JSONToCSVCon(data1, 'AccountsOpening', true);
			 } else {
				 $("#jqxAppliedAccounts").jqxGrid('exportdata', 'xls', 'AccountsOpening');
			 }
		  }
	  }
	  
	function funReadOnly(){
		$('#frmAccountsOpening input').attr('readonly', true );
		$('#frmAccountsOpening select').attr('disabled', true);
		//$('#jqxAccountOpeningDate').jqxDateTimeInput({disabled: true});
	 	$("#jqxAppliedAccounts").jqxGrid({ disabled: true});
	}

	function funRemoveReadOnly(){
	    $('#frmAccountsOpening input').attr('readonly', false );
		$('#frmAccountsOpening select').attr('disabled', false);
		//$('#jqxAccountOpeningDate').jqxDateTimeInput({disabled: false});
		$('#txtaccountcurrency').attr('readonly', true );
		$('#txtaccid').attr('readonly', true );
		$('#txtaccname').attr('readonly', true );
	    $('#txtdebittotal').attr('readonly', true );
	    $('#txtcredittotal').attr('readonly', true );
	    $('#txtnettotal').attr('readonly', true );
		$("#jqxAppliedAccounts").jqxGrid({ disabled: false});
		
		 if ($("#mode").val() == "A") {
			 $("#jqxAppliedAccounts").jqxGrid('clear');
			 $("#jqxAppliedAccounts").jqxGrid('addrow', null, {});
		}  
		
	}

	function funSearchLoad(){
	 	 changeContent('opnMainSearch.jsp', $('#window'));  
	}

	function funChkButton(){
		/* funReset(); */
	}

	function funFocus(){
		//$('#jqxAccountOpeningDate').jqxDateTimeInput('focus'); 
		document.getElementById("cmbacctype").focus();
	}

	function funNotify(){	
	  
	   /* Validation */
		 valid=document.getElementById("txtvalidation").value;
		 if(valid==1){
			 document.getElementById("errormsg").innerText="Invalid Transaction !!!";
			 return 0;
		 } 
		document.getElementById("errormsg").innerText="";
	  /* Validation Ends*/
			
	/* Accounts Invoice Grid Saving */
   	 var rows = $("#jqxAppliedAccounts").jqxGrid('getrows');
   	 var length=0;
		 for(var i=0 ; i < rows.length ; i++){
			var chk=rows[i].doc_no;
			var chks=rows[i].baseamount;
			if(typeof(chk) == "undefined" && (typeof(chks) != "undefined" && typeof(chks) != "NaN" && chks != "")){
				document.getElementById("errormsg").innerText="Doc No is Mandatory.";
				return 0;
			}
			document.getElementById("errormsg").innerText="";
			
			if(typeof(chk) != "undefined"){
				length=length+1;
				newTextBox = $(document.createElement("input"))
			    .attr("type", "dil")
			    .attr("id", "test"+i)
			    .attr("name", "test"+i)
				.attr("hidden", "true");
				
			var amount,baseamount,id;
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
			
			newTextBox.val(rows[i].doc_no+"::"+rows[i].date+":: "+rows[i].description+":: "+amount+":: "+baseamount+":: "+id+":: "+rows[i].tr_no);
			newTextBox.appendTo('form');
			}
		 }
		 $('#gridlength').val(length);
		/* Accounts Invoice Grid Saving Ends */
			 
			return 1;
	} 


	function setValues(){
	  
	  document.getElementById("cmbacctype").value=document.getElementById("hidcmbacctype").value;
	  
	  if($('#msg').val()!=""){
		   $.messager.alert('Message',$('#msg').val());
		  }
	  document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
	  funSetlabel(); 
		
	  var indexVal = document.getElementById("txttrno").value;
	  if(indexVal>0){
      $("#jqxAppliedAccountsGrid").load("accountsInvoiceGrid.jsp?txttrno2="+indexVal); 
		 }
	}
	
	function clearAccountInfo(){
		$('#txtdocno').val('');$('#txtaccid').val('');$('#txtaccname').val('');$('#txtaccountcurrency').val('');$('#txtaccountcurrencyid').val('');$('#txtrate').val('');
		$('#hidcurrencytype').val('');$('#txtdebittotal').val('');$('#txtcredittotal').val('');$('#txtnettotal').val('');$('#txtbaseamount').val('');$('#txtvalidation').val('');
		$("#jqxAppliedAccounts").jqxGrid('clear'); 
		$("#jqxAppliedAccounts").jqxGrid('addrow', null, {});
	} 

</script>

<style>

/* ================= MASTER UI ================= */

body,
input,
select,
textarea,
button,
table,
td,
th,
div,
span,
label,
.modern-ui {
    font-family: "Segoe UI", Tahoma, sans-serif !important;
    font-size: 12px;
    color: #333;
}

body {
    background: linear-gradient(135deg, #f5f7fa 0%, #dbe5f1 100%);
    margin: 0;
    padding: 24px 0;
    overflow-y: auto !important;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

#mainBG {
    background: #fff;
    border-radius: 14px;
    padding: 15px;
    box-shadow: 0 4px 24px rgba(0,0,0,0.06);
}

.modern-ui {
    padding: 5px 15px;
    box-sizing: border-box;
    width: 100%;
}

/* ================= SCROLL ================= */

.hidden-scrollbar {
    overflow: auto;
    max-height: 530px;
    padding-right: 4px;
}

.hidden-scrollbar::-webkit-scrollbar {
    width: 6px;
}

.hidden-scrollbar::-webkit-scrollbar-thumb {
    background: #cbd5e1;
    border-radius: 10px;
}

/* ================= INPUTS ================= */

.modern-ui input[type="text"],
.modern-ui select {
    height: 24px !important;
    border: 1px solid #b8c6d8;
    border-radius: 3px;
    padding: 2px 6px;
    background: #fff;
    width: 100%;
    box-sizing: border-box;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus {
    border-color: #2563eb;
    outline: none;
}

.modern-ui input[readonly],
.modern-ui input:disabled,
.modern-ui select:disabled {
    background: #f8f9fa !important;
    color: #6b7280 !important;
    border-color: #dbe1ea !important;
}

/* ================= LABELS ================= */

.modern-ui .lbl-right {
    text-align: right;
    color: #2f2f2f;
    font-size: 12px;
    font-weight: 600;
    white-space: nowrap;
}

/* ================= LAYOUT ================= */

.modern-ui .field-row {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 10px;
    flex-wrap: wrap;
}

/* ================= PANELS ================= */

.modern-ui .middle-panel {
    border: 1px solid #c7d2df;
    border-radius: 4px;
    background: #fff;
    padding: 20px 12px 12px 12px;
    position: relative;
    margin-bottom: 15px;
    margin-top: 12px;
}

.modern-ui .middle-panel-title {
    position: absolute;
    top: -12px;
    left: 10px;
    background: #fff;
    padding: 0 8px;
    color: #0056b3;
    font-size: 13px;
    font-weight: 700;
    border-left: 3px solid #0056b3;
}

/* ================= GRID ================= */

.grid-container {
    border: 1px solid #c7d2df;
    border-radius: 4px;
    overflow: hidden;
    background: #fff;
}

/* ================= TOTAL BOXES ================= */

.total-box {
    width: 110px !important;
    text-align: right;
}

/* ================= DISABLED ================= */

button:disabled,
button[disabled],
input[type="button"]:disabled,
input[type="submit"]:disabled,
a.disabled,
a[disabled],
.disabled,
.l-btn-disabled,
.ui-state-disabled,
.btn-disabled,
[disabled="disabled"],
[disabled="true"] {
    background: #e2e8f0 !important;
    background-image: none !important;
    color: #94a3b8 !important;
    border: 1px solid #cbd5e1 !important;
    cursor: not-allowed !important;
    pointer-events: none !important;
    box-shadow: none !important;
}

/* ================= LEGACY RESET ================= */

fieldset {
    border: none;
    margin: 0;
    padding: 0;
    background: transparent !important;
}

legend {
    display: none;
}

</style>

</head>
<body onload="setValues();">

<div id="mainBG" class="homeContent" data-type="background">

<form id="frmAccountsOpening"
      action="saveAccountsOpening"
      method="post"
      autocomplete="off">

<jsp:include page="../../../../header.jsp"></jsp:include>

<div class="modern-ui hidden-scrollbar">

    <!-- ACCOUNT DETAILS -->
    <div class="middle-panel">

        <span class="middle-panel-title">Account Details</span>

        <div class="field-row">

            <label class="lbl-right" style="width:70px;">Account</label>

            <select id="cmbacctype"
                    name="cmbacctype"
                    style="width:110px;"
                    onchange="clearAccountInfo();"
                    value='<s:property value="cmbacctype"/>'>

                <option value="BANK">Bank</option>
                <option value="GL">GL</option>
                <option value="AR">AR</option>
                <option value="AP">AP</option>
                <option value="HR">HR</option>

            </select>

            <input type="hidden"
                   id="hidcmbacctype"
                   name="hidcmbacctype"
                   value='<s:property value="hidcmbacctype"/>'/>

            <input type="text"
                   id="txtaccid"
                   name="txtaccid"
                   style="width:140px;"
                   placeholder="Press F3 to Search"
                   value='<s:property value="txtaccid"/>'
                   onkeydown="getAcc(event);"/>

            <input type="text"
                   id="txtaccname"
                   name="txtaccname"
                   style="flex:1;"
                   tabindex="-1"
                   value='<s:property value="txtaccname"/>'/>

            <input type="hidden"
                   id="txtdocno"
                   name="txtdocno"
                   value='<s:property value="txtdocno"/>'/>

            <label class="lbl-right" style="width:70px;">Currency</label>

            <input type="text"
                   id="txtaccountcurrency"
                   name="txtaccountcurrency"
                   readonly="readonly"
                   style="width:80px;"
                   value='<s:property value="txtaccountcurrency"/>'
                   tabindex="-1"/>

            <input type="hidden"
                   id="txtaccountcurrencyid"
                   name="txtaccountcurrencyid"
                   value='<s:property value="txtaccountcurrencyid"/>'/>

            <input type="hidden"
                   id="hidcurrencytype"
                   name="hidcurrencytype"
                   value='<s:property value="hidcurrencytype"/>'/>

            <label class="lbl-right" style="width:50px;">Rate</label>

            <input type="text"
                   id="txtrate"
                   name="txtrate"
                   style="width:90px; text-align:right;"
                   value='<s:property value="txtrate"/>'/>

        </div>

    </div>

    <!-- GRID -->
    <div class="middle-panel">

        <span class="middle-panel-title">
            Opening Invoice / Cheque / Other Details
        </span>

        <div id="jqxAppliedAccountsGrid" class="grid-container">

            <jsp:include page="accountsInvoiceGrid.jsp"></jsp:include>

        </div>

    </div>

    <!-- TOTALS -->
    <div class="middle-panel">

        <span class="middle-panel-title">Totals</span>

        <div class="field-row" style="justify-content:flex-end; margin-bottom:0;">

            <label class="lbl-right">Debit Total</label>

            <input type="text"
                   id="txtdebittotal"
                   name="txtdebittotal"
                   class="total-box"
                   value='<s:property value="txtdebittotal"/>'
                   tabindex="-1"/>

            <input type="hidden"
                   id="txtvalidation"
                   name="txtvalidation"
                   value='<s:property value="txtvalidation"/>'/>

            <label class="lbl-right" style="margin-left:12px;">Credit Total</label>

            <input type="text"
                   id="txtcredittotal"
                   name="txtcredittotal"
                   class="total-box"
                   value='<s:property value="txtcredittotal"/>'
                   tabindex="-1"/>

            <label class="lbl-right" style="margin-left:12px;">Net Total</label>

            <input type="text"
                   id="txtnettotal"
                   name="txtnettotal"
                   class="total-box"
                   value='<s:property value="txtnettotal"/>'
                   tabindex="-1"/>

            <label class="lbl-right" style="margin-left:12px;">Base Amount</label>

            <input type="text"
                   id="txtbaseamount"
                   name="txtbaseamount"
                   class="total-box"
                   value='<s:property value="txtbaseamount"/>'
                   tabindex="-1"/>

        </div>

    </div>

    <!-- HIDDEN FIELDS -->
    <div style="display:none;">

        <input type="hidden" id="mode" name="mode"/>

        <input type="hidden"
               id="deleted"
               name="deleted"
               value='<s:property value="deleted"/>'/>

        <input type="hidden"
               id="msg"
               name="msg"
               value='<s:property value="msg"/>'/>

        <input type="hidden"
               id="txttrno"
               name="txttrno"
               value='<s:property value="txttrno"/>'/>

        <input type="hidden"
               id="gridlength"
               name="gridlength"/>

        <input type="hidden"
               id="applylength"
               name="applylength"/>

        <input type="hidden"
               id="applylengthupdate"
               name="applylengthupdate"/>

    </div>

</div>

</form>

<!-- WINDOWS -->

<div id="accountDetailsWindow">
    <div></div>
    <div></div>
</div>

<div id="openingBalanceGridWindow">
    <div></div>
    <div></div>
</div>

</div>

</body>
</html>