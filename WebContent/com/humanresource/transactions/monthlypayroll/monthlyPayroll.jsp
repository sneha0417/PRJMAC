<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includeso.jsp"></jsp:include>
<script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script> 
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

.myProcessCalcButton {
	 background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #E0ECF8), color-stop(1, #81BEF7));
	 background:-moz-linear-gradient(top, #E0ECF8 5%, #81BEF7 100%);
	 background:-webkit-linear-gradient(top, #E0ECF8 5%, #81BEF7 100%);
	 background:-o-linear-gradient(top, #E0ECF8 5%, #81BEF7 100%);
	 background:-ms-linear-gradient(top, #E0ECF8 5%, #81BEF7 100%);
	 background:linear-gradient(to bottom, #E0ECF8 5%, #81BEF7 100%);
	 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#E0ECF8', endColorstr='#81BEF7',GradientType=0);
	 background-color:#E0ECF8;
	 -moz-border-radius:4px;
	 -webkit-border-radius:4px;
	 border-radius:4px;
	 display:inline-block;
	 cursor:pointer;
	 font-family:Verdana;
	 font-size:10px;
	 padding:4px 8px;
	 text-decoration:none;
}
.myProcessCalcButton:hover {
	 background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #81BEF7), color-stop(1, #E0ECF8));
	 background:-moz-linear-gradient(top, #81BEF7 5%, #E0ECF8 100%);
	 background:-webkit-linear-gradient(top, #81BEF7 5%, #E0ECF8 100%);
	 background:-o-linear-gradient(top, #81BEF7 5%, #E0ECF8 100%);
	 background:-ms-linear-gradient(top, #81BEF7 5%, #E0ECF8 100%);
	 background:linear-gradient(to bottom, #81BEF7 5%, #E0ECF8 100%);
	 filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#81BEF7', endColorstr='#E0ECF8',GradientType=0);
	 background-color:#81BEF7;
}
.myProcessCalcButton:active {
	 position:relative;
	 top:1px;
}

.mySaveButton {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #77d42a), color-stop(1, #5cb811));
	background:-moz-linear-gradient(top, #77d42a 5%, #5cb811 100%);
	background:-webkit-linear-gradient(top, #77d42a 5%, #5cb811 100%);
	background:-o-linear-gradient(top, #77d42a 5%, #5cb811 100%);
	background:-ms-linear-gradient(top, #77d42a 5%, #5cb811 100%);
	background:linear-gradient(to bottom, #77d42a 5%, #5cb811 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77d42a', endColorstr='#5cb811',GradientType=0);
	background-color:#77d42a;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #268a16;
	display:inline-block;
	cursor:pointer;
	font-family:Verdana;
	font-size:10px;
	font-weight:bold;
	padding:4px 8px;
	text-decoration:none;
	text-shadow:0px -1px 0px #aade7c;
}
.mySaveButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #5cb811), color-stop(1, #77d42a));
	background:-moz-linear-gradient(top, #5cb811 5%, #77d42a 100%);
	background:-webkit-linear-gradient(top, #5cb811 5%, #77d42a 100%);
	background:-o-linear-gradient(top, #5cb811 5%, #77d42a 100%);
	background:-ms-linear-gradient(top, #5cb811 5%, #77d42a 100%);
	background:linear-gradient(to bottom, #5cb811 5%, #77d42a 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5cb811', endColorstr='#77d42a',GradientType=0);
	background-color:#5cb811;
}
.mySaveButton:active {
	position:relative;
	top:1px;
}

.myConfirmButton {
	-moz-box-shadow: 0px 1px 0px 0px #fff6af;
	-webkit-box-shadow: 0px 1px 0px 0px #fff6af;
	box-shadow: 0px 1px 0px 0px #fff6af;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffec64), color-stop(1, #ffab23));
	background:-moz-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-webkit-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-o-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:-ms-linear-gradient(top, #ffec64 5%, #ffab23 100%);
	background:linear-gradient(to bottom, #ffec64 5%, #ffab23 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffec64', endColorstr='#ffab23',GradientType=0);
	background-color:#ffec64;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #ffaa22;
	display:inline-block;
	cursor:pointer;
	font-family:Verdana;
	font-size:10px;
	font-weight:bold;
	padding:4px 8px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffee66;
}
.myConfirmButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffab23), color-stop(1, #ffec64));
	background:-moz-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-webkit-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-o-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:-ms-linear-gradient(top, #ffab23 5%, #ffec64 100%);
	background:linear-gradient(to bottom, #ffab23 5%, #ffec64 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffab23', endColorstr='#ffec64',GradientType=0);
	background-color:#ffab23;
}
.myConfirmButton:active {
	position:relative;
	top:1px;
}

.bounce {
	color: #f35626;
    background-image: -webkit-linear-gradient(92deg,#f35626,#feab3a);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    -webkit-animation: hue 60s infinite linear,bounce 2s infinite; 
}

@-webkit-keyframes bounce {
  0%, 20%, 50%, 80%, 100% {
    -moz-transform: translateX(0);
    -ms-transform: translateX(0);
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
  40% {
    -moz-transform: translateX(-30px);
    -ms-transform: translateX(-30px);
    -webkit-transform: translateX(-30px);
    transform: translateX(-30px);
  }
  60% {
    -moz-transform: translateX(-15px);
    -ms-transform: translateX(-15px);
    -webkit-transform: translateX(-15px);
    transform: translateX(-15px);
  }
} 

@media (min-width: 15px) {
  .mega {
    font-size: 15px;
  }
}

@font-face {
  font-family: 'Roboto',comic sans ms,Tahoma;
  font-style: normal;
  font-weight: 100;
  unicode-range: U+0460-052F, U+20B4, U+2DE0-2DFF, U+A640-A69F;
}
  
@-webkit-keyframes hue {
  from {
    -webkit-filter: hue-rotate(0deg);
  }

  to {
    -webkit-filter: hue-rotate(-360deg);
  }
}

</style>

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
    height: 530px;
    padding-right: 5px;
}

.hidden-scrollbar::-webkit-scrollbar {
    width: 6px;
}

.hidden-scrollbar::-webkit-scrollbar-thumb {
    background: #c5d3e0;
    border-radius: 3px;
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

/* ================= BUTTONS ================= */

.myButton,
.myButtons,
.myProcessCalcButton,
.mySaveButton,
.myConfirmButton {
    height: 24px !important;
    line-height: 22px !important;
    padding: 0 12px;
    border-radius: 3px;
    border: none;
    cursor: pointer;
    font-size: 11px;
    font-weight: 600;
    transition: all 0.2s;
    white-space: nowrap;
    box-shadow: 0 1px 2px rgba(0,0,0,0.08);
}

.myButton,
.myButtons {
    background: linear-gradient(135deg, #0b45a2 0%, #2563eb 100%);
    color: #fff;
}

.myProcessCalcButton {
    background: linear-gradient(135deg, #e0ecf8 0%, #81bef7 100%);
    color: #0f172a;
}

.mySaveButton {
    background: linear-gradient(135deg, #77d42a 0%, #5cb811 100%);
    color: #fff;
}

.myConfirmButton {
    background: linear-gradient(135deg, #ffec64 0%, #ffab23 100%);
    color: #222;
}

/* ================= DISABLED ================= */

.myButton:disabled,
.myButtons:disabled,
.myProcessCalcButton:disabled,
.mySaveButton:disabled,
.myConfirmButton:disabled,
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

/* ================= GRID ================= */

.grid-container {
    border: 1px solid #c7d2df;
    border-radius: 4px;
    overflow: hidden;
    background: #fff;
}

/* ================= STATUS ================= */

.bounce {
    color: #d97706;
    font-weight: bold;
    font-size: 13px;
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
<script type="text/javascript">
      $(document).ready(function () {
    	  $('#btnClose').attr('disabled', true );$('#btnCreate').attr('disabled', true );$('#btnEdit').attr('disabled', true );
 		  $('#btnDelete').attr('disabled', true );$('#btnSearch').attr('disabled', true );$('#btnAttach').attr('disabled', true );
 		 
    	  /* Date */
    	  $("#payrollDate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
    	  $("#payrollPrintDate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
    	  
    	  /* Searching Window */
     	 $('#employeeDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Employee Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
  		 $('#employeeDetailsWindow').jqxWindow('close');
  		 
  		 $('#txtemployeeid').dblclick(function(){
  			employeeSearchContent("employeeDetailsSearch.jsp");
		  });
  		 
  		 $('#txtprintemployeeid').dblclick(function(){
   			employeeSearchContent("employeeDetailsSearch.jsp");
 		  });
  		 
  		$(".chckpayrollprocessprint").click(function() {
 	        selectedBox = this.id;

 	        $(".chckpayrollprocessprint").each(function() {
 	            if ( this.id == selectedBox )
 	            {
 	                this.checked = true;
 	            }
 	            else
 	            {
 	                this.checked = false;
 	            };        
 	        });
 	    }); 
  		 
  		 if($('#docno').val().trim()==''){
  			$('#mode').val('view');$('#docno').val('0');
  		 } else if(parseInt($('#docno').val().trim())==0){
  			$('#mode').val('A'); 
  		 } else if(parseInt($('#docno').val().trim())>0){
  			$('#mode').val('E'); 
  		 } else {
  			$('#mode').val('view');
  		 }
		 
		 $('#txtemployeeid').attr('readonly', true);
		 $('#txtemployeename').attr('readonly', true);
		 $('#txtprintemployeeid').attr('readonly', true);
		 $('#txtprintemployeename').attr('readonly', true);
		 $('#payrollDate').jqxDateTimeInput('focus'); 
		 $("#monthlyPayrollGridID").jqxGrid('clear');
		 $("#monthlyPayrollGridID").jqxGrid('addrow', null, {});
		 /* $("#monthlyPayrollGridID").jqxGrid({ disabled: true}); */
		 $('#btnSavePayRoll').attr('disabled', true );$('#btnConfirmed').attr('disabled', true );
		 document.getElementById("lblcurrentstatus").innerText="";
		 $('#hidchckpayrollprocess').val(1);document.getElementById("chckpayrollprocess").checked = true;
		 $('#hidchckpayrollprint').val(0);document.getElementById("chckpayrollprint").checked = false;
		 $('#hidchckpayslip').val(0);document.getElementById("chckpayslip").checked = false;

		 $('#payrollPrintDate').jqxDateTimeInput({disabled: true});
		 $('#cmbempprintcategory').attr('disabled', true);
		 $('#txtprintemployeeid').attr('disabled', true);
		 $('#txtprintemployeename').attr('disabled', true);
		 $('#chckpayslip').attr('disabled', true);
		 $('#btnPayrollPrint').attr('disabled', true );
		 $('#btnView').attr('disabled', true );
		 $('#clearPrint').attr('disabled', true );
		 
		 var date = $('#payrollDate').val();
    	 getPayrollDate(date);getPayrollCategory();getLeaveType();getAllowanceType();
    	 
    	 $('#payrollDate').focusout(function(){
    		 var date = $('#payrollDate').val();
    		 //alert(date);
        	 getPayrollDate(date);getPayrollDocNo(date);
		 });
    	 $('#payrollDate').on('close', function (event) { 
    		 var date = $('#payrollDate').val();
    		// alert(date);  
        	 getPayrollDate(date);getPayrollDocNo(date);
    	 }); 
    	 $('#payrollPrintDate').focusout(function(){
    		 var date = $('#payrollPrintDate').val();
    		 getPayrollPrintDate(date);getPayrollPrintDocNo(date);
		 });
    	 
      }); 
      
      function employeeSearchContent(url) {
		 	$('#employeeDetailsWindow').jqxWindow('open');
			$.get(url).done(function (data) {
			$('#employeeDetailsWindow').jqxWindow('setContent', data);
			$('#employeeDetailsWindow').jqxWindow('bringToFront');
		}); 
		}
      
     function getPayrollDate(date){
	  		var x = new XMLHttpRequest();
	  		x.onreadystatechange = function() {
	  			if (x.readyState == 4 && x.status == 200) {
	  				var items = x.responseText;
	  			    $('#payrollDate').val(items);
	  		}
	  		}
	  		x.open("GET", "getPayrollDate.jsp?date="+date, true);
	  		x.send();
	 }
     
     function getPayrollPrintDate(date){
	  		var x = new XMLHttpRequest();
	  		x.onreadystatechange = function() {
	  			if (x.readyState == 4 && x.status == 200) {
	  				var items = x.responseText;
	  			    $('#payrollPrintDate').val(items);
	  		}
	  		}
	  		x.open("GET", "getPayrollDate.jsp?date="+date, true);
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
				$("select#cmbempprintcategory").html(optionspayrollcategory);
				if ($('#hidcmbempcategory').val() != null) {
					$('#cmbempcategory').val($('#hidcmbempcategory').val());
				}
				if ($('#hidcmbempprintcategory').val() != null) {
					$('#cmbempprintcategory').val($('#hidcmbempprintcategory').val());
				}
			} else {
			}
		}
		x.open("GET", "getPayrollCategory.jsp", true);
		x.send();
	}
    
    function getLeaveType() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var leavetypeItems = items[0].split(",");
				var leavetypeIdItems = items[1].split(",");
				var leavetypeCountItems = items[2].split(",");
				
				for (var i = 0; i < leavetypeItems.length; i++) {
					
					if(i==0){
						$('#txtleavetype1').val(leavetypeItems[i]);
					} else if(i==1){
						$('#txtleavetype2').val(leavetypeItems[i]);
					} else if(i==2){
						$('#txtleavetype3').val(leavetypeItems[i]);
					} else if(i==3){
						$('#txtleavetype4').val(leavetypeItems[i]);
					} else if(i==4){
						$('#txtleavetype5').val(leavetypeItems[i]);
					} else if(i==5){
						$('#txtleavetype6').val(leavetypeItems[i]);
					} else if(i==6){
						$('#txtleavetype7').val(leavetypeItems[i]);
					} else if(i==7){
						$('#txtleavetype8').val(leavetypeItems[i]);
					} else if(i==8){
						$('#txtleavetype9').val(leavetypeItems[i]);
					} else {
						$('#txtleavetype10').val(leavetypeItems[i]);
					} 									
					$('#txtleavetypecount').val(leavetypeCountItems[i]);
				}
			} else {
			}
		}
		x.open("GET", "getLeaveType.jsp", true);
		x.send();
	}
    
    function getAllowanceType() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				var items = x.responseText;
				items = items.split('####');
				var allowancetypeItems = items[0].split(",");
				var allowancetypeIdItems = items[1].split(",");
				var allowancetypeCountItems = items[2].trim();

				for (var i = 0; i < allowancetypeItems.length; i++) {
					
					if(i==0){
						$('#txtallowancetype1').val(allowancetypeItems[i]);
					} else if(i==1){
						$('#txtallowancetype2').val(allowancetypeItems[i]);
					} else if(i==2){
						$('#txtallowancetype3').val(allowancetypeItems[i]);
					} else if(i==3){
						$('#txtallowancetype4').val(allowancetypeItems[i]);
					} else if(i==4){
						$('#txtallowancetype5').val(allowancetypeItems[i]);
					} else if(i==5){
						$('#txtallowancetype6').val(allowancetypeItems[i]);
					} else if(i==6){
						$('#txtallowancetype7').val(allowancetypeItems[i]);
					} else if(i==7){
						$('#txtallowancetype8').val(allowancetypeItems[i]);
					} else if(i==8){
						$('#txtallowancetype9').val(allowancetypeItems[i]);
					} else {
						$('#txtallowancetype10').val(allowancetypeItems[i]);
					} 									
				}
				$('#txtallowancetypecount').val(allowancetypeCountItems);
			} else {
			}
		}
		x.open("GET", "getAllowanceType.jsp", true);
		x.send();
	}
    
    function getLastPayrollDate(payrolldate){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  				 items = items.split('***');
  			     $('#txtchkgridload').val(items[0]);
  			     // alert($('#txtchkgridload').val());
  			     document.getElementById("errormsg").innerText="Payroll Processed till "+items[1]+".";
  			     
  			     if(parseInt($('#txtchkgridload').val())==1){
  			    	  $("#overlay, #PleaseWait").show();
  			    	  $('#txtchkgridload').val('');
  			    	  document.getElementById("lblcurrentstatus").innerText="Payroll to be Saved.";
  			    	  //$('#mode').val('A');
  			    	  funLoadGrid();
  			     } else if(parseInt($('#txtchkgridload').val())==0) {
					  $.messager.alert('Message','Payroll Process Pending for Last-Month.','warning');
					  $("#monthlyPayrollGridID").jqxGrid('clear'); 
			          $("#monthlyPayrollGridID").jqxGrid('addrow', null, {});
			          $("#monthlyPayrollGridID").jqxGrid({ disabled: true});
			          document.getElementById("lblcurrentstatus").innerText="Pending for Last-Month.";
			          $('#mode').val('view');
  					  return;
  				 } else if(parseInt($('#txtchkgridload').val())==2) {
					  $.messager.alert('Message','Already Payroll Processed.','warning');
					  $("#monthlyPayrollGridID").jqxGrid('clear'); 
			          $("#monthlyPayrollGridID").jqxGrid('addrow', null, {});
			          $("#monthlyPayrollGridID").jqxGrid({ disabled: true});
			          document.getElementById("lblcurrentstatus").innerText="Already Processed.";
			          $('#mode').val('E');
					  return;
				 } else if(parseInt($('#txtchkgridload').val())==3) {
					  $.messager.alert('Message','Enter Attendance & Process Payroll','warning');
					  $("#monthlyPayrollGridID").jqxGrid('clear'); 
			          $("#monthlyPayrollGridID").jqxGrid('addrow', null, {});
			          $("#monthlyPayrollGridID").jqxGrid({ disabled: true});
			          document.getElementById("lblcurrentstatus").innerText="";
			          $('#mode').val('view');
			          document.getElementById("errormsg").innerText="";
					  return;
				 } else if(parseInt($('#txtchkgridload').val())==4) {
					  document.getElementById("lblcurrentstatus").innerText="Payroll Processed.";
					  $('#mode').val('E');
					  $("#overlay, #PleaseWait").show();
 			    	  funLoadGrid();
				 } else if(parseInt($('#txtchkgridload').val())==5) {
					  $("#overlay, #PleaseWait").show();
					  document.getElementById("lblcurrentstatus").innerText="Payroll Confirmed.";
					  $('#mode').val('view');
 			    	  funLoadGrid();
				 }
  			     
  			   
  		}
		}
		x.open("GET", "getLastPayrolledDate.jsp?payrolldate="+payrolldate, true);
		x.send();
	}
    
    function getPayrollDocNo(payrolldate){
    	var employeebranchchk=window.parent.employeebranchchk.value; 
 		var branch=document.getElementById("brchName").value; 
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  			    $('#docno').val(items);
  			  
  			    if(items.trim()==''){
  	  				$('#mode').val('view');$('#docno').val('0');
  	  		 	} else if(parseInt(items.trim())==0){
  	  				$('#mode').val('A'); 
  	  		 	} else if(parseInt(items.trim())>0){
  	  				$('#mode').val('E'); 
  	  		 	} else {
  	  				$('#mode').val('view');
  	  		 	}
  		}
  		}
  		x.open("GET", "getPayrollDocNo.jsp?payrolldate="+payrolldate+'&branch='+branch+'&employeebranchchk='+employeebranchchk, true);
  		x.send();
    }
    
    function getPayrollPrintDocNo(payrolldate){ 
    	var employeebranchchk=window.parent.employeebranchchk.value; 
 		var branch=document.getElementById("brchName").value; 
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  			    $('#docno').val(items);
  			  
  			    if(items.trim()==''){
  	  				$('#docno').val('0');
  	  		 	}
  		}
  		}
  		x.open("GET", "getPayrollDocNo.jsp?payrolldate="+payrolldate+'&branch='+branch+'&employeebranchchk='+employeebranchchk, true);
  		x.send();
    }
    
    function getEmployeeId(event){
        var x= event.keyCode;
        if(x==114){
        	employeeSearchContent("employeeDetailsSearch.jsp");
        }
        else{}
        }

    function funExcelBtn(){
		 if(parseInt(window.parent.chkexportdata.value)=="1") {
			 JSONToCSVCon(data, 'MonthlyPayroll', true);
		 } else {
			 $("#monthlyPayrollGridID").jqxGrid('exportdata', 'xls', 'MonthlyPayroll');
		 }
	 }
	 
	 function funLoadGrid() {
		 
		  var mode = $('#mode').val();
		  var docno = $('#docno').val().trim(); 
		  var date = $('#payrollDate').jqxDateTimeInput('val');
		  var category = $('#cmbempcategory').val();
		  var empid = $('#txtemployeedocno').val();
		  var employeebranchchk=window.parent.employeebranchchk.value; 
	 	  var branch=document.getElementById("brchName").value;  
		  //alert("monthlyPayrollGrid.jsp?mode="+mode+"&docno="+docno+"&date="+date+"&category="+category+"&empid="+empid+"&check=1");
		  $("#payrollDiv").load("monthlyPayrollGrid.jsp?mode="+mode+"&docno="+docno+"&date="+date+"&category="+category+"&empid="+empid+"&check=1"+'&branch='+branch+'&employeebranchchk='+employeebranchchk);
		  /* $("#monthlyPayrollGridID").jqxGrid({ disabled: false}); */
	 	  $('#btnSavePayRoll').attr('disabled', false );$('#btnConfirmed').attr('disabled', true );
	 	  
	 	  if(mode=='E'){
	 		 $('#btnConfirmed').attr('disabled', false ); 
	 	  }
	 	  
	 	 if(mode=='view'){
	 		$('#btnSavePayRoll').attr('disabled', true );$('#btnConfirmed').attr('disabled', true ); 
	 	  }
    }
	 
	 function funLoadPrintGrid() {
		  var date = $('#payrollPrintDate').val();
		  var category = $('#cmbempprintcategory').val();
		  var empid = $('#txtprintemployeedocno').val();
		  var employeebranchchk=window.parent.employeebranchchk.value; 
	 	  var branch=document.getElementById("brchName").value;    
		  $("#overlay, #PleaseWait").show();
		  
		  $("#payrollPrintDiv").load("monthlyPayrollPrintGrid.jsp?date="+date+"&category="+category+"&empid="+empid+'&branch='+branch+'&employeebranchchk='+employeebranchchk+"&check=1");
		  $('#btnPayrollPrint').attr('disabled', false ); 
	 }
	 
	function funReadOnly(){} 
	
	function funRemoveReadOnly(){}
	
	function funSearchLoad(){}
	
	function funChkButton(){
		/* funReset(); */
	}
	 
	 function funNotify(){
		 	
  	 			/* Monthly Payroll Grid  Saving*/
  			 	var rows = $("#monthlyPayrollGridID").jqxGrid('getrows');
  			 	var length=0;
  					 for(var i=0 ; i < rows.length ; i++){
  						var chk=rows[i].employeedocno;
  						if(typeof(chk) != "undefined" && typeof(chk) != "NaN" && chk != ""){
  							newTextBox = $(document.createElement("input"))
  						    .attr("type", "dil")
  						    .attr("id", "test"+length)
  						    .attr("name", "test"+length)
  							.attr("hidden", "true");
  							length=length+1;
  								
  				    newTextBox.val(rows[i].employeedocno+":: "+rows[i].dates+":: "+rows[i].totaldays+":: "+rows[i].leave1+":: "+rows[i].leave2+":: "+rows[i].leave3+":: "+rows[i].leave4+":: "+rows[i].leave5+":: "+rows[i].leave6+":: "+rows[i].leave7+":: "+rows[i].leave8+":: "+rows[i].leave9+":: "+rows[i].leave10+":: "+rows[i].basic+":: "+rows[i].allowance1+":: "+rows[i].allowance2+":: "+rows[i].allowance3+":: "+rows[i].allowance4+":: "+rows[i].allowance5+":: "+rows[i].allowance6+":: "+rows[i].allowance7+":: "+rows[i].allowance8+":: "+rows[i].allowance9+":: "+rows[i].allowance10+":: "+rows[i].totalsalary+":: "+rows[i].ot+":: "+rows[i].hot+":: "+rows[i].overtime+":: "+rows[i].leavedeductions+":: "+rows[i].grosssalary+":: "+rows[i].additions+":: "+rows[i].deductions+":: "+rows[i].loan+":: "+rows[i].netsalary+":: "+rows[i].remarks+":: "+rows[i].earnbasic+":: "+rows[i].earnallowance1+":: "+rows[i].earnallowance2+":: "+rows[i].earnallowance3+":: "+rows[i].earnallowance4+":: "+rows[i].earnallowance5+":: "+rows[i].earnallowance6+":: "+rows[i].earnallowance7+":: "+rows[i].earnallowance8+":: "+rows[i].earnallowance9+":: "+rows[i].earnallowance10+":: "+rows[i].totalearnedsalary+":: "+rows[i].rowno);
  				    newTextBox.appendTo('form');
  				 }
  				}
  	 		 	$('#gridlength').val(length);
  			 	/* Monthly Payroll Grid  Saving Ends*/	
		 
 		 return 1;
		} 
	 
	 function funSearchLoad(){}
	 
	 function funFocus(){
		 $('#payrollDate').jqxDateTimeInput('focus'); 
	  }
	 
	 function setValues(){
		 	 checkPaySlip();checkPayrollPrint();checkPayrollProcess();
		 
			 if($('#msg').val()!=""){
				   $.messager.alert('Message',$('#msg').val());
				  }
			 
			 document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
			 funSetlabel();
            
             var indexVal = document.getElementById("docno").value;
			 if(indexVal> 0){
				 var employeebranchchk=window.parent.employeebranchchk.value;       
			 	 var branch=document.getElementById("brchName").value; 
	         	 $("#payrollDiv").load("monthlyPayrollGrid.jsp?docno="+indexVal+"&date="+$('#payrollDate').val()+'&branch='+branch+'&employeebranchchk='+employeebranchchk);
			 } 
		}
	 
	 function  funClearInfo(){
			
		    $('#payrollDate').val(new Date());
			document.getElementById("cmbempcategory").value="";
			document.getElementById("txtemployeeid").value="";
			document.getElementById("txtemployeedocno").value="";
			document.getElementById("txtemployeename").value="";
			document.getElementById("txtchkgridload").value="";
			document.getElementById("lblcurrentstatus").innerText="";
			$("#monthlyPayrollGridID").jqxGrid('clear');
			$("#monthlyPayrollGridID").jqxGrid({ disabled: true});
			$('#btnSavePayRoll').prop('disabled', true);$('#btnConfirmed').prop('disabled', true);
			
			 if (document.getElementById("txtemployeeid").value == "") {
			        $('#txtemployeeid').attr('placeholder', 'Press F3 to Search'); 
			        $('#txtemployeename').attr('placeholder', 'Employee Name');
			    }
			 
			 $('#payrollDate').jqxDateTimeInput('focus'); 
			 document.getElementById("errormsg").innerText="";
	}
	 
	 function  funClearPrintInfo(){
			
		    $('#payrollPrintDate').val(new Date());
			document.getElementById("cmbempprintcategory").value="";
			document.getElementById("txtprintemployeeid").value="";
			document.getElementById("txtprintemployeedocno").value="";
			document.getElementById("txtprintemployeename").value="";
			document.getElementById("lblcurrentstatus").innerText="";
			$("#monthlyPayrollPrintGridID").jqxGrid('clear');
			$("#monthlyPayrollPrintGridID").jqxGrid({ disabled: true});
			$('#btnView').prop('disabled', false);$('#clearPrint').prop('disabled', false);$('#btnPayrollPrint').prop('disabled', true);
			$('#hidchckpayslip').val(0);document.getElementById("chckpayslip").checked = false;
			
			 if (document.getElementById("txtprintemployeeid").value == "") {
			        $('#txtprintemployeeid').attr('placeholder', 'Press F3 to Search'); 
			        $('#txtprintemployeename').attr('placeholder', 'Employee Name');
			    }
			 
			 $('#payrollPrintDate').jqxDateTimeInput('focus'); 
			 document.getElementById("errormsg").innerText="";
	}
	 
	 function funProcessGrid(){
		 var date = $('#payrollDate').val();
		 getLastPayrollDate(date);
	 }
	 
	 function funSaveGrid(){
		 $('#btnSavePayRoll').attr('disabled', false );$('#btnConfirmed').attr('disabled', false );$('#btnSave').mousedown();
	 }
	 
	 function funConfirm(){
		 var alreadyProcessed = $('#txtpayrollalreadyprocessed').val();
		 var payrollRows = $("#monthlyPayrollGridID").jqxGrid('getrows');
		 if(parseInt(alreadyProcessed)!=parseInt(payrollRows.length)){
			 $.messager.alert('Message','Payroll Saving Pending For Some Employee(s).','warning');
			 return;
		 }
		 
		 $.messager.confirm('Confirm', 'Do you want to Post?', function(r){
	  	 		if (r){
	  	 			
	  	 			/* Monthly Payroll Grid  Saving*/
	  			 	var rows = $("#monthlyPayrollGridID").jqxGrid('getrows');
	  			 	var length=0;
	  					 for(var i=0 ; i < rows.length ; i++){
	  						var chk=rows[i].employeedocno;
	  						if(typeof(chk) != "undefined" && typeof(chk) != "NaN" && chk != ""){
	  							newTextBox = $(document.createElement("input"))
	  						    .attr("type", "dil")
	  						    .attr("id", "test"+length)
	  						    .attr("name", "test"+length)
	  							.attr("hidden", "true");
	  							length=length+1;
	  								
	  				    newTextBox.val(rows[i].employeedocno+":: "+rows[i].dates+":: "+rows[i].totaldays+":: "+rows[i].leave1+":: "+rows[i].leave2+":: "+rows[i].leave3+":: "+rows[i].leave4+":: "+rows[i].leave5+":: "+rows[i].leave6+":: "+rows[i].leave7+":: "+rows[i].leave8+":: "+rows[i].leave9+":: "+rows[i].leave10+":: "+rows[i].basic+":: "+rows[i].allowance1+":: "+rows[i].allowance2+":: "+rows[i].allowance3+":: "+rows[i].allowance4+":: "+rows[i].allowance5+":: "+rows[i].allowance6+":: "+rows[i].allowance7+":: "+rows[i].allowance8+":: "+rows[i].allowance9+":: "+rows[i].allowance10+":: "+rows[i].totalsalary+":: "+rows[i].ot+":: "+rows[i].hot+":: "+rows[i].overtime+":: "+rows[i].leavedeductions+":: "+rows[i].grosssalary+":: "+rows[i].additions+":: "+rows[i].deductions+":: "+rows[i].loan+":: "+rows[i].netsalary+":: "+rows[i].remarks);
	  				    newTextBox.appendTo('form');
	  				 }
	  				}
	  	 		 	$('#gridlength').val(length);
	  			 	/* Monthly Payroll Grid  Saving Ends*/	
	  			 	
	  	 			$('#mode').val('EDIT');
	  				$("#overlay, #PleaseWait").show();
	  				document.getElementById("frmMonthlyPayroll").submit();
	  	 	    }
		   });
	 }
	 
	 function funCheckPayrollProcess(){
		 $('#payrollDate').val(new Date());document.getElementById("cmbempcategory").value="";document.getElementById("txtemployeeid").value="";
		 document.getElementById("txtemployeedocno").value="";document.getElementById("txtemployeename").value="";document.getElementById("txtchkgridload").value="";
		 document.getElementById("lblcurrentstatus").innerText="";$("#monthlyPayrollGridID").jqxGrid({ disabled: true});document.getElementById("errormsg").innerText="";
		 $('#txtemployeeid').attr('placeholder', 'Press F3 to Search'); $('#txtemployeename').attr('placeholder', 'Employee Name');
		 $('#payrollPrintDate').val(new Date());document.getElementById("cmbempprintcategory").value="";document.getElementById("txtprintemployeeid").value="";
		 document.getElementById("txtprintemployeedocno").value="";document.getElementById("txtprintemployeename").value="";
		 $("#monthlyPayrollPrintGridID").jqxGrid({ disabled: true});$('#txtprintemployeeid').attr('placeholder', 'Press F3 to Search'); $('#txtprintemployeename').attr('placeholder', 'Employee Name');
				  
		 if(document.getElementById("chckpayrollprocess").checked == true){
			     $('#payrollDate').jqxDateTimeInput('focus'); $('#hidchckpayrollprocess').val(1);$('#hidchckpayrollprint').val(0);$('#payrollDate').jqxDateTimeInput({disabled: false});
			     $('#cmbempcategory').attr('disabled', false);$('#txtemployeeid').attr('disabled', false);$('#txtemployeename').attr('disabled', false);$("#payrollDiv").prop("hidden", false);
			     $("#payrollPrintDiv").prop("hidden", true);$('#clear').attr('disabled', false);$('#btnProcess').attr('disabled', false );$('#btnSavePayRoll').attr('disabled', true );$('#btnConfirmed').attr('disabled', true );
				 $('#payrollPrintDate').jqxDateTimeInput({disabled: true});$('#cmbempprintcategory').attr('disabled', true);$('#txtprintemployeeid').attr('disabled', true);$('#txtprintemployeename').attr('disabled', true);
				 $('#chckpayslip').attr('disabled', true);$('#btnPayrollPrint').attr('disabled', true );$('#btnView').attr('disabled', true );$('#clearPrint').attr('disabled', true );
		  } 
	  }
	
	 function funCheckPayrollPrint(){
		  $('#payrollDate').val(new Date());document.getElementById("cmbempcategory").value="";document.getElementById("txtemployeeid").value="";
		  document.getElementById("txtemployeedocno").value="";document.getElementById("txtemployeename").value="";document.getElementById("txtchkgridload").value="";
		  document.getElementById("lblcurrentstatus").innerText="";$("#monthlyPayrollGridID").jqxGrid({ disabled: true});document.getElementById("errormsg").innerText="";
		  $('#txtemployeeid').attr('placeholder', 'Press F3 to Search');$('#txtemployeename').attr('placeholder', 'Employee Name');
		  $('#payrollPrintDate').val(new Date());document.getElementById("cmbempprintcategory").value="";document.getElementById("txtprintemployeeid").value="";
		  document.getElementById("txtprintemployeedocno").value="";document.getElementById("txtprintemployeename").value="";$("#monthlyPayrollPrintGridID").jqxGrid({ disabled: true});
		  $('#txtprintemployeeid').attr('placeholder', 'Press F3 to Search'); $('#txtprintemployeename').attr('placeholder', 'Employee Name');
		  
		  if(document.getElementById("chckpayrollprint").checked == true){
			     $('#payrollPrintDate').jqxDateTimeInput('focus');$('#hidchckpayrollprint').val(1);$('#hidchckpayrollprocess').val(0);$('#payrollPrintDate').jqxDateTimeInput({disabled: false});
				 $('#cmbempprintcategory').attr('disabled', false);$('#txtprintemployeeid').attr('disabled', false);$('#txtprintemployeename').attr('disabled', false);$('#chckpayslip').attr('disabled', false);
				 $('#btnPayrollPrint').attr('disabled', true );$('#payrollDate').jqxDateTimeInput({disabled: true});$('#cmbempcategory').attr('disabled', true);$('#txtemployeeid').attr('disabled', true);
				 $('#txtemployeename').attr('disabled', true);$("#payrollDiv").prop("hidden", true); $("#payrollPrintDiv").prop("hidden", false);$('#clear').attr('disabled', true);$('#btnProcess').attr('disabled', true );
				 $('#btnSavePayRoll').attr('disabled', true );$('#btnConfirmed').attr('disabled', true );$('#btnView').attr('disabled', false );$('#clearPrint').attr('disabled', false );
				 
		  } 
	  }
	 
	 function checkPayrollProcess(){
		 if(document.getElementById("hidchckpayrollprocess").value==1){
			 document.getElementById("chckpayrollprocess").checked = true;
		 }
		 else if(document.getElementById("hidchckpayrollprocess").value==0){
			document.getElementById("chckpayrollprocess").checked = false;
		  }
		 }
	 
	 function funCheckPaySlip(){
		  if(document.getElementById("chckpayslip").checked == true){
		 		 $('#hidchckpayslip').val(1);
		  } else{
			  $('#hidchckpayslip').val(0);  
		  }
	  }
	
	 function checkPayrollPrint(){
		 if(document.getElementById("hidchckpayrollprint").value==1){
			 document.getElementById("chckpayrollprint").checked = true;
		 }
		 else if(document.getElementById("hidchckpayrollprint").value==0){
			document.getElementById("chckpayrollprint").checked = false;
		  }
		 }
	 
	function checkPaySlip(){
		 if(document.getElementById("hidchckpayslip").value==1){
			 document.getElementById("chckpayslip").checked = true;
		 }
		 else if(document.getElementById("hidchckpayslip").value==0){
			document.getElementById("chckpayslip").checked = false;
		  }
	}
	
	function payrollprintdatechange(){
   	     var date = $('#payrollPrintDate').val();
		 getPayrollPrintDate(date);getPayrollPrintDocNo(date);
	}

	 function funPayrollPrint() {
		   
		if($("#hidchckpayrollprint").val()=="1") {
			
		var rows=$("#monthlyPayrollPrintGridID").jqxGrid("getrows");
    	var selectedrows=$("#monthlyPayrollPrintGridID").jqxGrid('selectedrowindexes');
    	selectedrows = selectedrows.sort(function(a,b){return a - b});
    	
        var i=0;j=0;k=0;tempemps="";
	    for (i = 0; i < rows.length; i++) {
				if(selectedrows[j]==i){
				   if(k==0){
					 tempemps=rows[i].employeedocno;
					 k=1;
				   } else{
					tempemps=tempemps+","+rows[i].employeedocno;
				 }
			   j++; 
			}
         }
  		
  		 $('#txtselectedemployees').val(tempemps);
   		
		 if($("#hidchckpayslip").val()=="0") {
			 var empid = $('#txtprintemployeedocno').val();    
			 var url=document.URL;
			 var reurl=url.split("monthlypayroll");
			
		     $("#docno").prop("disabled", false);
			
				   $.messager.confirm('Confirm', 'Do you want to have header?', function(r){                                        
					if (r){
						 var win= window.open(reurl[0]+"monthlypayroll/printMonthlyPayroll?docno="+$("#docno").val()+"&empid="+empid+"&printcategory="+document.getElementById("cmbempprintcategory").value+"&branch="+document.getElementById("brchName").value+"&header=1","_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
					     win.focus();
					 }
					else{
						var win= window.open(reurl[0]+"monthlypayroll/printMonthlyPayroll?docno="+$("#docno").val()+"&empid="+empid+"&printcategory="+document.getElementById("cmbempprintcategory").value+"&branch="+document.getElementById("brchName").value+"&header=0","_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
					    win.focus();
					}
				   });
				   
		  } else if($("#hidchckpayslip").val()=="1") {
			   if(selectedrows.length==0){
					$("#overlay, #PleaseWait").hide();
					$.messager.alert('Warning','Select Employee(s) to be Printed.');
					return false;
				}
			   
			    var url=document.URL;
				var reurl=url.split("monthlypayroll");
				
				var win= window.open(reurl[0]+"monthlypayroll/printPaySlipViewer?employeedocno="+$("#txtselectedemployees").val()+"&branch="+document.getElementById("brchName").value+"&date="+document.getElementById("payrollPrintDate").value+"&allowancecount="+document.getElementById("txtallowancetypecount").value+"&docno="+document.getElementById("docno").value,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
			    win.focus();
				
		  }
		 }
	    }
	 function funPayrollprocessPrint(){
		  var mode = $('#mode').val();
		  var docno = $('#docno').val().trim(); 
		  var date = $('#payrollDate').jqxDateTimeInput('val');
		  var category = $('#cmbempcategory').val();
		  var empid = $('#txtemployeedocno').val();
	   		     var url=document.URL;
				 var reurl=url.split("monthlypayroll");
				 $("#docno").prop("disabled", false);
				        $.messager.confirm('Confirm', 'Do you want to have header?', function(r){      
						if (r){
							var win= window.open(reurl[0]+"monthlypayroll/printMonthlyPayroll2?branch="+document.getElementById("brchName").value+"&header="+1+"&mode="+mode+"&docno="+docno+"&date="+date+"&category="+category+"&empid="+empid+"&check=1","_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
						     win.focus();
						 }                    
						else{   
							var win= window.open(reurl[0]+"monthlypayroll/printMonthlyPayroll2?branch="+document.getElementById("brchName").value+"&header="+0+"&mode="+mode+"&docno="+docno+"&date="+date+"&category="+category+"&empid="+empid+"&check=1","_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
						    win.focus();
						}
					   });    
		    }
</script>

<style>
.hidden-scrollbar {
  overflow: auto;
  height: 530px;
}
</style>

</head>
<body onload="setValues();">

<div id="mainBG" class="homeContent" data-type="background">

<form id="frmMonthlyPayroll"
      action="saveMonthlyPayroll"
      method="post"
      autocomplete="off">

<jsp:include page="../../../../header.jsp"></jsp:include>

<div class="modern-ui hidden-scrollbar">

    <!-- TOP PANELS -->
    <div style="display:flex; gap:15px; margin-bottom:15px; align-items:stretch;">

        <!-- PROCESS PANEL -->
        <div class="middle-panel" style="flex:1; margin-bottom:0;">

            <span class="middle-panel-title">

                <input type="checkbox"
                       id="chckpayrollprocess"
                       name="chckpayrollprocess"
                       class="chckpayrollprocessprint"
                       onclick="funCheckPayrollProcess();">

                Process

                <input type="hidden"
                       id="hidchckpayrollprocess"
                       name="hidchckpayrollprocess"
                       value='<s:property value="hidchckpayrollprocess"/>'/>

            </span>

            <div style="text-align:center; margin-bottom:12px;">

                <label id="lblcurrentstatus"
                       name="lblcurrentstatus"
                       class="bounce">

                    <s:property value="lblcurrentstatus"/>

                </label>

            </div>

            <div class="field-row">

                <label class="lbl-right" style="width:90px;">Date</label>

                <div style="width:160px;">

                    <div id="payrollDate"
                         name="payrollDate"
                         value='<s:property value="payrollDate"/>'></div>

                    <input type="hidden"
                           id="hidpayrollDate"
                           name="hidpayrollDate"
                           value='<s:property value="hidpayrollDate"/>'/>

                </div>

            </div>

            <div class="field-row">

                <label class="lbl-right" style="width:90px;">Category</label>

                <select id="cmbempcategory"
                        name="cmbempcategory"
                        style="width:160px;"
                        value='<s:property value="cmbempcategory"/>'>

                    <option value="">--Select--</option>

                </select>

                <input type="hidden"
                       id="hidcmbempcategory"
                       name="hidcmbempcategory"
                       value='<s:property value="hidcmbempcategory"/>'/>

            </div>

            <div class="field-row">

                <label class="lbl-right" style="width:90px;">Employee</label>

                <input type="text"
                       id="txtemployeeid"
                       name="txtemployeeid"
                       style="width:160px;"
                       placeholder="Press F3 to Search"
                       value='<s:property value="txtemployeeid"/>'
                       onkeydown="getEmployeeId(event);"/>

                <input type="hidden"
                       id="txtemployeedocno"
                       name="txtemployeedocno"
                       value='<s:property value="txtemployeedocno"/>'/>

                <input type="text"
                       id="txtemployeename"
                       name="txtemployeename"
                       placeholder="Employee Name"
                       style="flex:1;"
                       tabindex="-1"
                       value='<s:property value="txtemployeename"/>'/>

            </div>

            <div class="field-row"
                 style="justify-content:center; margin-top:15px;">

                <input type="button"
                       class="myButtons"
                       name="clear"
                       id="clear"
                       value="Clear"
                       onclick="funClearInfo();">

                <input type="button"
                       class="myProcessCalcButton"
                       id="btnProcess"
                       name="btnProcess"
                       value="Process & Calc"
                       onclick="funProcessGrid();">

                <input type="button"
                       class="mySaveButton"
                       id="btnSavePayRoll"
                       name="btnSavePayRoll"
                       value="Save"
                       onclick="funSaveGrid();">

                <input type="button"
                       class="myConfirmButton"
                       id="btnConfirmed"
                       name="btnConfirmed"
                       value="Confirm"
                       onclick="funConfirm();">

                <input type="button"
                       class="myProcessCalcButton"
                       id="btnPayrollprocessPrint"
                       name="btnPayrollprocessPrint"
                       value="Print"
                       onclick="funPayrollprocessPrint();">

            </div>

        </div>

        <!-- PRINT PANEL -->
        <div class="middle-panel" style="flex:1; margin-bottom:0;">

            <span class="middle-panel-title">

                <input type="checkbox"
                       id="chckpayrollprint"
                       name="chckpayrollprint"
                       class="chckpayrollprocessprint"
                       onclick="funCheckPayrollPrint();">

                Print

                <input type="hidden"
                       id="hidchckpayrollprint"
                       name="hidchckpayrollprint"
                       value='<s:property value="hidchckpayrollprint"/>'/>

            </span>

            <div class="field-row">

                <label class="lbl-right" style="width:90px;">Date</label>

                <div style="width:160px;">

                    <div id="payrollPrintDate"
                         name="payrollPrintDate"
                         onchange="payrollprintdatechange();"
                         value='<s:property value="payrollPrintDate"/>'></div>

                    <input type="hidden"
                           id="hidpayrollPrintDate"
                           name="hidpayrollPrintDate"
                           value='<s:property value="hidpayrollPrintDate"/>'/>

                </div>

            </div>

            <div class="field-row">

                <label class="lbl-right" style="width:90px;">Category</label>

                <select id="cmbempprintcategory"
                        name="cmbempprintcategory"
                        style="width:160px;"
                        value='<s:property value="cmbempprintcategory"/>'>

                    <option value="">--Select--</option>

                </select>

                <input type="hidden"
                       id="hidcmbempprintcategory"
                       name="hidcmbempprintcategory"
                       value='<s:property value="hidcmbempprintcategory"/>'/>

            </div>

            <div class="field-row">

                <label class="lbl-right" style="width:90px;">Employee</label>

                <input type="text"
                       id="txtprintemployeeid"
                       name="txtprintemployeeid"
                       style="width:160px;"
                       placeholder="Press F3 to Search"
                       value='<s:property value="txtprintemployeeid"/>'
                       onkeydown="getEmployeeId(event);"/>

                <input type="hidden"
                       id="txtprintemployeedocno"
                       name="txtprintemployeedocno"
                       value='<s:property value="txtprintemployeedocno"/>'/>

                <input type="text"
                       id="txtprintemployeename"
                       name="txtprintemployeename"
                       placeholder="Employee Name"
                       style="flex:1;"
                       tabindex="-1"
                       value='<s:property value="txtprintemployeename"/>'/>

            </div>

            <div class="field-row"
                 style="justify-content:center;">

                <input type="checkbox"
                       id="chckpayslip"
                       name="chckpayslip"
                       onclick="funCheckPaySlip();">

                Pay Slip

                <input type="hidden"
                       id="hidchckpayslip"
                       name="hidchckpayslip"
                       value='<s:property value="hidchckpayslip"/>'/>

            </div>

            <div class="field-row"
                 style="justify-content:center; margin-top:15px;">

                <input type="button"
                       class="myButtons"
                       name="clearPrint"
                       id="clearPrint"
                       value="Clear"
                       onclick="funClearPrintInfo();">

                <input type="button"
                       class="myProcessCalcButton"
                       id="btnView"
                       name="btnView"
                       value="View"
                       onclick="funLoadPrintGrid();">

                <input type="button"
                       class="myProcessCalcButton"
                       id="btnPayrollPrint"
                       name="btnPayrollPrint"
                       value="Print"
                       onclick="funPayrollPrint();">

            </div>

        </div>

    </div>

    <!-- GRID -->
    <div class="middle-panel">

        <span class="middle-panel-title">Payroll Details</span>

        <div id="payrollDiv" class="grid-container">
            <jsp:include page="monthlyPayrollGrid.jsp"></jsp:include>
        </div>

        <div id="payrollPrintDiv"
             class="grid-container"
             hidden="true"
             style="margin-top:15px;">

            <jsp:include page="monthlyPayrollPrintGrid.jsp"></jsp:include>

        </div>

    </div>

    <!-- ALL HIDDEN FIELDS PRESERVED -->
    <div style="display:none;">

        <input type="hidden" id="mode" name="mode"/>
        <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>
        <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
        <input type="hidden" id="docno" name="txtmonthlypayrolldocno" value='<s:property value="txtmonthlypayrolldocno"/>'/>
        <input type="hidden" id="txtselectedemployees" name="txtselectedemployees" value='<s:property value="txtselectedemployees"/>'/>
        <input type="hidden" id="txtvalidation" name="txtvalidation" value='<s:property value="txtvalidation"/>'/>

        <input type="hidden" id="txtleavetype1" name="txtleavetype1" value='<s:property value="txtleavetype1"/>'/>
        <input type="hidden" id="txtleavetype2" name="txtleavetype2" value='<s:property value="txtleavetype2"/>'/>
        <input type="hidden" id="txtleavetype3" name="txtleavetype3" value='<s:property value="txtleavetype3"/>'/>
        <input type="hidden" id="txtleavetype4" name="txtleavetype4" value='<s:property value="txtleavetype4"/>'/>
        <input type="hidden" id="txtleavetype5" name="txtleavetype5" value='<s:property value="txtleavetype5"/>'/>
        <input type="hidden" id="txtleavetype6" name="txtleavetype6" value='<s:property value="txtleavetype6"/>'/>
        <input type="hidden" id="txtleavetype7" name="txtleavetype7" value='<s:property value="txtleavetype7"/>'/>
        <input type="hidden" id="txtleavetype8" name="txtleavetype8" value='<s:property value="txtleavetype8"/>'/>
        <input type="hidden" id="txtleavetype9" name="txtleavetype9" value='<s:property value="txtleavetype9"/>'/>
        <input type="hidden" id="txtleavetype10" name="txtleavetype10" value='<s:property value="txtleavetype10"/>'/>
        <input type="hidden" id="txtleavetypecount" name="txtleavetypecount" value='<s:property value="txtleavetypecount"/>'/>

        <input type="hidden" id="txtallowancetype1" name="txtallowancetype1" value='<s:property value="txtallowancetype1"/>'/>
        <input type="hidden" id="txtallowancetype2" name="txtallowancetype2" value='<s:property value="txtallowancetype2"/>'/>
        <input type="hidden" id="txtallowancetype3" name="txtallowancetype3" value='<s:property value="txtallowancetype3"/>'/>
        <input type="hidden" id="txtallowancetype4" name="txtallowancetype4" value='<s:property value="txtallowancetype4"/>'/>
        <input type="hidden" id="txtallowancetype5" name="txtallowancetype5" value='<s:property value="txtallowancetype5"/>'/>
        <input type="hidden" id="txtallowancetype6" name="txtallowancetype6" value='<s:property value="txtallowancetype6"/>'/>
        <input type="hidden" id="txtallowancetype7" name="txtallowancetype7" value='<s:property value="txtallowancetype7"/>'/>
        <input type="hidden" id="txtallowancetype8" name="txtallowancetype8" value='<s:property value="txtallowancetype8"/>'/>
        <input type="hidden" id="txtallowancetype9" name="txtallowancetype9" value='<s:property value="txtallowancetype9"/>'/>
        <input type="hidden" id="txtallowancetype10" name="txtallowancetype10" value='<s:property value="txtallowancetype10"/>'/>
        <input type="hidden" id="txtallowancetypecount" name="txtallowancetypecount" value='<s:property value="txtallowancetypecount"/>'/>

        <input type="hidden" id="txtchkgridload" name="txtchkgridload" value='<s:property value="txtchkgridload"/>'/>
        <input type="hidden" id="txtpayrollalreadyprocessed" name="txtpayrollalreadyprocessed" value='<s:property value="txtpayrollalreadyprocessed"/>'/>
        <input type="hidden" id="gridlength" name="gridlength"/>

    </div>

</div>

</form>

<div id="employeeDetailsWindow">
    <div></div>
</div>

</div>

</body>
</html>
