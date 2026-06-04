<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>
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
    width: 90px;
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

/* Readonly / disabled look */
input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default !important;
}

/* jqx date/time containers */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* Radio & Checkbox Alignments */
.radio-group {
    display: flex;
    gap: 15px;
    justify-content: center;
    align-items: center;
    margin-bottom: 10px;
}
.radio-item {
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 12px;
    font-weight: 600;
    color: #4e5e71;
}
.radio-item input[type="radio"], 
.radio-item input[type="checkbox"] {
    width: auto;
    height: auto;
    margin: 0;
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
    text-align: center;
}
.btn-submit:hover:not(:disabled) { background: #0056b3; }
.btn-submit:disabled { background: #9ca3af; cursor: default !important; opacity: 0.7; }
.btn-submit:active:not(:disabled) { transform: scale(0.98); }

.btn-secondary {
    background: #6c757d;
}
.btn-secondary:hover:not(:disabled) { background: #5a6268; }

.button-group {
    display: flex;
    gap: 10px;
    margin-top: 15px;
    width: 100%;
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

.grid-container {
    margin-bottom: 20px;
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
	     
	     document.getElementById("rdpayment").checked=true;
	     document.getElementById("rdall").checked=true;
	     document.getElementById("chckunclrposted").checked = false;
	     $('#chckunclrposted').attr('disabled', true);
 		 $('#hidchckunclrposted').val('0');
	     
		 $('#txtaccid').dblclick(function(){
			 if($('#cmbtype').val()==''){
    			 $.messager.alert('Message','Please Choose Account Type.','warning');
    			 return 0;
    		 }
			  accountsSearchContent('accountsDetailsSearch.jsp');
			});
		 
			 document.getElementById('rdall').addEventListener('change', function (e) {
				 $('#cmbcriteria').attr('disabled', false);
				 document.getElementById("chckunclrposted").checked = false;
		 		 $('#hidchckunclrposted').val('0');
		 		 $('#chckunclrposted').attr('disabled', true);
			 });
			 
			 document.getElementById('rdpdc').addEventListener('change', function (e) {
				 $('#cmbcriteria').attr('disabled', false);
				 document.getElementById("chckunclrposted").checked = false;
		 		 $('#hidchckunclrposted').val('0');
		 		 $('#chckunclrposted').attr('disabled', true);
			 });
			 
			 document.getElementById('rduncleared').addEventListener('change', function (e) {
				 $('#cmbcriteria').attr('disabled', true);
				 $('#cmbcriteria').val('1');
		 		 document.getElementById("chckunclrposted").checked = false;
		 		 $('#hidchckunclrposted').val('0');
		 		 $('#chckunclrposted').attr('disabled', false);
			 });

	});
	
	function accountsSearchContent(url) {
	    $('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#accountDetailsWindow').jqxWindow('setContent', data);
		$('#accountDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function getAccTypeFrom(event){
        var x= event.keyCode;
        if(x==114){
    		if($('#cmbtype').val()==''){
    			 $.messager.alert('Message','Please Choose Account Type.','warning');
    			 return 0;
    		 }
      		accountsSearchContent('accountsDetailsSearch.jsp');
        }
        else{}
        }
	
	 function dateDisable(){
		 var posted=$('#cmbcriteria').val();
         if(posted==2){
        	 $('#jqxFromDate').jqxDateTimeInput({disabled: true}); 
         }else{
        	 $('#jqxFromDate').jqxDateTimeInput({disabled: false});
         }
	  }
	
	function clearAccountInfo(){
		$('#txtdocno').val('');$('#txtaccid').val('');$('#txtaccname').val('');
		
		if (document.getElementById("txtaccid").value == "") {
	        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
	    }

	}
	
	function  funClearInfo(){
		
		$('#fromdate').val(new Date());
		var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');;
	    var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	    var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	    $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	    $('#todate').val(new Date());
	    
		document.getElementById("rdpayment").checked=true;
		document.getElementById("rdall").checked=true;
		
		$('#cmbbranch').val('a');$('#cmbcriteria').val('1');$('#cmbcriteria').attr('disabled', false);
		$('#cmbdistribution').val('');$('#cmbgroup').val('');$('#cmbtype').val('0');
		$('#txtdocno').val('');$('#txtaccid').val('');$('#txtaccname').val('');
		$('#hidchckunclrposted').val('0');$('#chckunclrposted').attr('disabled', false);
		document.getElementById("chckunclrposted").checked = false;
		
		$("#jqxPdcList").jqxGrid('clear');
		$("#jqxPdcList").jqxGrid('addrow', null, {});
		$("#jqxPdcListGroup").jqxGrid('clear');
		$("#jqxDistributionGrid").jqxGrid('clear');
		
		if (document.getElementById("txtaccid").value == "") {
	        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
	    }
		
		$("#pdcListDiv").prop("hidden", false);
   	 	$("#pdcListGroupDiv").prop("hidden", true);
   	    $("#pdcListDistributionDiv").prop("hidden", true);
   	    
		}

	function funreload(event){
		     funGroupDistributionGrid();
		     
			 var branchval = document.getElementById("cmbbranch").value;
			 var fromdate = $('#fromdate').val();
			 var todate = $('#todate').val();
			 var criteria = $('#cmbcriteria').val();
			 var distribution = $('#cmbdistribution').val();
			 var group = $('#cmbgroup').val();
			 var acctype = $('#cmbtype').val();
			 var accno = $('#txtdocno').val();
			 var unclrposted = $('#hidchckunclrposted').val();
			 var reporttype = "";
			 
			 if(document.getElementById("rdall").checked==true){
				 reporttype = $('#rdall').val();
			 }else if(document.getElementById("rdpdc").checked==true){
				 reporttype = $('#rdpdc').val();
			 }else if(document.getElementById("rduncleared").checked==true){
				 reporttype = $('#rduncleared').val();
			 }
			 
			 $("#overlay, #PleaseWait").show();
			 
			 if(document.getElementById("rdreceipt").checked==true){
				 if(group=='' && distribution==''){
					  $("#pdcListDiv").load("pdcListGrid.jsp?code=FRO&reporttype="+reporttype+'&branchval='+branchval+'&fromdate='+fromdate+'&todate='+todate+'&criteria='+criteria+'&distribution='+distribution+'&group='+group+'&acctype='+acctype+'&accno='+accno+'&unclrposted='+unclrposted+'&check=1');								 
			     }else if(group!='' && distribution==''){
			    	 $("#pdcListGroupDiv").load("pdcListGroupingGrid.jsp?code=FRO&reporttype="+reporttype+'&branchval='+branchval+'&fromdate='+fromdate+'&todate='+todate+'&criteria='+criteria+'&distribution='+distribution+'&group='+group+'&acctype='+acctype+'&accno='+accno+'&unclrposted='+unclrposted+'&check=3');
				 }else{
					 $("#pdcListDistributionDiv").load("pdcListDistributionGrid.jsp?code=FRO&reporttype="+reporttype+'&branchval='+branchval+'&fromdate='+fromdate+'&todate='+todate+'&criteria='+criteria+'&distribution='+distribution+'&group='+group+'&acctype='+acctype+'&accno='+accno+'&unclrposted='+unclrposted+'&check=2');
				 }
			 }else{
				 if(group=='' && distribution==''){
					  $("#pdcListDiv").load("pdcListGrid.jsp?code=FPP&reporttype="+reporttype+'&branchval='+branchval+'&fromdate='+fromdate+'&todate='+todate+'&criteria='+criteria+'&distribution='+distribution+'&group='+group+'&acctype='+acctype+'&accno='+accno+'&unclrposted='+unclrposted+'&check=1');								 
			     }else if(group!='' && distribution==''){
			    	 $("#pdcListGroupDiv").load("pdcListGroupingGrid.jsp?code=FPP&reporttype="+reporttype+'&branchval='+branchval+'&fromdate='+fromdate+'&todate='+todate+'&criteria='+criteria+'&distribution='+distribution+'&group='+group+'&acctype='+acctype+'&accno='+accno+'&unclrposted='+unclrposted+'&check=3');
				 }else{
					 $("#pdcListDistributionDiv").load("pdcListDistributionGrid.jsp?code=FPP&reporttype="+reporttype+'&branchval='+branchval+'&fromdate='+fromdate+'&todate='+todate+'&criteria='+criteria+'&distribution='+distribution+'&group='+group+'&acctype='+acctype+'&accno='+accno+'&unclrposted='+unclrposted+'&check=2');
				 }
			    }
			}
	
	function funGroupDistributionGrid(){
		var group=$('#cmbgroup').val();
		var distribution=$('#cmbdistribution').val();
		if(group=='' && distribution==''){
			$("#pdcListDiv").prop("hidden", false);
       	 	$("#pdcListGroupDiv").prop("hidden", true);
       	    $("#pdcListDistributionDiv").prop("hidden", true);
        }else if(group!='' && distribution==''){
       	 	$("#pdcListDiv").prop("hidden", true); 
       	 	$("#pdcListGroupDiv").prop("hidden", false);
       	    $("#pdcListDistributionDiv").prop("hidden", true);
        }else{
        	$("#pdcListDiv").prop("hidden", true); 
       	 	$("#pdcListGroupDiv").prop("hidden", true);
       	    $("#pdcListDistributionDiv").prop("hidden", false);
        }
	}
	
	function checkunclrposted() {
		if(document.getElementById("chckunclrposted").checked) {
			 document.getElementById("hidchckunclrposted").value = 1;
		 } else {
			 document.getElementById("hidchckunclrposted").value = 0;
		 }
	 }
	
	function funExportBtn(){
		 var distribute = $('#cmbdistribution').val();
		 var grouping = $('#cmbgroup').val();
		 
		if(grouping=='' && distribute==''){
    		if(parseInt(window.parent.chkexportdata.value)=="1") {
    		  	JSONToCSVCon(data, 'PdcList', true);
    		 } else {
    			 $("#jqxPdcList").jqxGrid('exportdata', 'xls', 'PdcList');
    		 }
    	}

		if(grouping!='' && distribute==''){
    		if(parseInt(window.parent.chkexportdata.value)=="1") {
    		  	JSONToCSVCon(data1, 'PdcList', true);
    		 } else {
    			 $("#jqxPdcListGroup").jqxGrid('exportdata', 'xls', 'PdcList');
    		 }
	  	}
		
		if(!((grouping=='' && distribute=='') && (grouping!='' && distribute==''))){
			if(parseInt(window.parent.chkexportdata.value)=="1") {
			  	JSONToCSVCon(data3, 'PdcList', true);
			 } else {
				 $("#jqxDistributionGrid").jqxGrid('exportdata', 'xls', 'PdcList');
			 }
	 	}
	}
	function funprint(){
		var url=document.URL;
		var reurl=url.split("com");
		var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var criteria = $('#cmbcriteria').val();
		 var distribution = $('#cmbdistribution').val();
		 var group = $('#cmbgroup').val();
		 var acctype = $('#cmbtype').val();
		 var accno = $('#txtdocno').val();
		 var unclrposted = $('#hidchckunclrposted').val();
		 var reporttype = "";
		 
		 if(document.getElementById("rdall").checked==true){
			 reporttype = $('#rdall').val();
		 }else if(document.getElementById("rdpdc").checked==true){
			 reporttype = $('#rdpdc').val();
		 }else if(document.getElementById("rduncleared").checked==true){
			 reporttype = $('#rduncleared').val();
		 }
		
		if(document.getElementById("rdreceipt").checked==true){
			var win=window.open(reurl[0]+"com/dashboard/accounts/pdclist/"+"printpdcjasper?code=FRO&reporttype="+reporttype+'&branchval='+branchval+'&fromdate='+fromdate+'&todate='+todate+'&criteria='+criteria+'&distribution='+distribution+'&group='+group+'&acctype='+acctype+'&accno='+accno+'&unclrposted='+unclrposted+'&check=1',"_blank","top=250,left=310,width=800,height=800,location=no,scrollbars=no,toolbar=yes");
		 }else{
			 var win=window.open(reurl[0]+"com/dashboard/accounts/pdclist/"+"printpdcjasper?code=FPP&reporttype="+reporttype+'&branchval='+branchval+'&fromdate='+fromdate+'&todate='+todate+'&criteria='+criteria+'&distribution='+distribution+'&group='+group+'&acctype='+acctype+'&accno='+accno+'&unclrposted='+unclrposted+'&check=1',"_blank","top=250,left=310,width=800,height=800,location=no,scrollbars=no,toolbar=yes");
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
            <div class="filter-card" style="padding: 10px;">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>
        </div>

        <div class="sidebar-scroll-content">
            
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
                </table>
            </div>

            <div class="filter-card">
                <div style="font-size: 13px; font-weight: bold; color: #333; margin-bottom: 10px;">Report Type</div>
                <div class="radio-group">
                    <label class="radio-item" for="rdpayment">
                        <input type="radio" id="rdpayment" name="rdo" value="FPP"> Payment
                    </label>
                    <label class="radio-item" for="rdreceipt">
                        <input type="radio" id="rdreceipt" name="rdo" value="FRO"> Receipt
                    </label>
                </div>
            </div>

            <div class="filter-card">
                <div style="font-size: 13px; font-weight: bold; color: #333; margin-bottom: 10px;">Type</div>
                <div class="radio-group">
                    <label class="radio-item" for="rdall">
                        <input type="radio" id="rdall" name="rdos" value="rdall"> All
                    </label>
                    <label class="radio-item" for="rdpdc">
                        <input type="radio" id="rdpdc" name="rdos" value="rdpdc"> PDC
                    </label>
                </div>
                <div class="radio-group" style="margin-bottom: 0;">
                    <label class="radio-item" for="rduncleared">
                        <input type="radio" id="rduncleared" name="rdos" value="rduncleared"> Uncleared
                    </label>
                    <label class="radio-item" for="chckunclrposted" style="margin-left: 10px;">
                        <input type="checkbox" id="chckunclrposted" name="chckunclrposted" value="" onchange="checkunclrposted();" onclick="$(this).attr('value', this.checked ? 1 : 0)"> Uncleared Posted
                    </label>
                </div>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Criteria</td>
                        <td>
                            <select id="cmbcriteria" name="cmbcriteria" onchange="dateDisable();" value='<s:property value="cmbcriteria"/>'>
                                <option value="1">All</option>
                                <option value="2">To be Posted</option>
                                <option value="3">Posted PDC</option>
                                <option value="4">Returned PDC</option>
                                <option value="5">Dishonoured PDC</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Distribution</td>
                        <td>
                            <select id="cmbdistribution" name="cmbdistribution" value='<s:property value="cmbdistribution"/>'>
                                <option value="">--Select--</option>
                                <option value="monthwise">Month-Wise</option>
                                <option value="bankwise">Bank-Wise</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Grouping</td>
                        <td>
                            <select id="cmbgroup" name="cmbgroup" value='<s:property value="cmbgroup"/>'>
                                <option value="">--Select--</option>
                                <option value="date">Date</option>
                                <option value="month">Month</option>
                                <option value="bank">Bank</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Acc. Type</td>
                        <td>
                            <select id="cmbtype" name="cmbtype" onchange="clearAccountInfo();" value='<s:property value="cmbtype"/>'>
                                <option value="0">--Select--</option>
                                <option value="BANK">Bank</option>
                                <option value="AP">AP</option>
                                <option value="AR">AR</option>
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
                    <button type="button" class="btn-submit btn-secondary" name="clear" id="clear" onclick="funClearInfo();">Clear</button>
                    <button type="button" class="btn-submit" name="Print" id="print" onclick="funprint();">Print</button>
                </div>
            </div>
            
            <div style="display: none;">
                <input type="hidden" id="hidchckunclrposted" name="hidchckunclrposted" value='<s:property value="hidchckunclrposted"/>'/>
                <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
            </div>

        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-container">
            <div id="pdcListDiv"><jsp:include page="pdcListGrid.jsp"></jsp:include></div>
            <div id="pdcListGroupDiv" hidden="true"><jsp:include page="pdcListGroupingGrid.jsp"></jsp:include></div>
            <div id="pdcListDistributionDiv" hidden="true"><jsp:include page="pdcListDistributionGrid.jsp"></jsp:include></div>
        </div>
    </div>

</div>

<div id="accountDetailsWindow">
	<div></div><div></div>
</div>

</div> 
</body>
</html>