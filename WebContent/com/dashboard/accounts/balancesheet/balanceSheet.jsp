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

.button-group {
    display: flex;
    flex-direction: column;
    gap: 10px;
    margin-top: 15px;
}

/* Checkbox alignment */
.checkbox-list {
    display: flex;
    flex-direction: column;
    gap: 8px;
    margin-top: 5px;
}
.checkbox-item {
    display: flex;
    align-items: center;
    gap: 8px;
}
.checkbox-item label {
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    margin: 0;
    cursor: pointer;
}
.checkbox-item input[type="checkbox"] {
    width: auto;
    height: auto;
    margin: 0;
    cursor: pointer;
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
    
	var selectedBox = null;
	
	$(document).ready(function () {
         // Standardized to 100% width and 24px height
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
		 var year = window.parent.txtaccountperiodfrom.value;
		 var newDate = year.split('-');
		 year = newDate[1] + "-" + newDate[0] + "-" + newDate[2];
		 $('#fromdate').jqxDateTimeInput('setDate', new Date(year));
	     
		 $("#branchlabel").attr('hidden',true);
		 $("#branchdiv").attr('hidden',true);
			
 		 $(".chcklevels").click(function() {
 	        selectedBox = this.id;

 	        $(".chcklevels").each(function() {
 	            if ( this.id == selectedBox )
 	            {
 	                this.checked = true;
 	               if ( this.id != "chcklevel4" ){  
 	               	 $('#btnprint').attr("disabled",true);
 	               }else{
 	               	 $('#btnprint').attr("disabled",false);
 	               } 
 	            }
 	            else
 	            {
 	                this.checked = false;
 	            };        
 	        });
 	    });    
 		 
		 document.getElementById("hidchcklevel4").value=1;
 		 document.getElementById("chcklevel4").checked = true;
 		 $('#btnprint').attr("disabled",true);
 		 getBalanceSheetPrintConfig();
	});
	
	function getBalanceSheetPrintConfig(){
  		var x = new XMLHttpRequest();
  		x.onreadystatechange = function() {
  			if (x.readyState == 4 && x.status == 200) {
  				var items = x.responseText;
  			    
  			  	if(parseInt(items)==1){
  				 	 $("#btnprint").show();
	  			 } else {
	  				 $("#btnprint").hide();
  				 }
  		    }
  		}
  		x.open("GET", "getBalanceSheetPrintConfig.jsp", true);
  		x.send();
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
	
	function analysischeck(){
		 if(document.getElementById("chckanalysis").checked){
			 document.getElementById("hidchckanalysis").value = 1;
			 $('#txtnoofdays').val("0");
 			 $('#txtfrequency').val("0");
		 }
		 else{
			 document.getElementById("hidchckanalysis").value = 0;
		 }
		 hidedata();
	 }
	
	function checklevel1(){
		if(document.getElementById("chcklevel1").checked){
			 document.getElementById("hidchcklevel1").value = 1;
			 document.getElementById("hidchcklevel2").value = 0;
			 document.getElementById("hidchcklevel3").value = 0;
			 document.getElementById("hidchcklevel4").value = 0;
		 }
		 else{
			 document.getElementById("hidchcklevel1").value = 0;
		 }
	 }
	
	function checklevel2(){
		 if(document.getElementById("chcklevel2").checked){
			 document.getElementById("hidchcklevel2").value = 1;
			 document.getElementById("hidchcklevel1").value = 0;
			 document.getElementById("hidchcklevel3").value = 0;
			 document.getElementById("hidchcklevel4").value = 0;
		 }
		 else{
			 document.getElementById("hidchcklevel2").value = 0;
		 }
	 }
	
	function checklevel3(){
		 if(document.getElementById("chcklevel3").checked){
			 document.getElementById("hidchcklevel3").value = 1;
			 document.getElementById("hidchcklevel1").value = 0;
			 document.getElementById("hidchcklevel2").value = 0;
			 document.getElementById("hidchcklevel4").value = 0;
		 }
		 else{
			 document.getElementById("hidchcklevel3").value = 0;
		 }
	 }
	
	function checklevel4(){
		 if(document.getElementById("chcklevel4").checked){
			 document.getElementById("hidchcklevel4").value = 1;
			 document.getElementById("hidchcklevel1").value = 0;
			 document.getElementById("hidchcklevel2").value = 0;
			 document.getElementById("hidchcklevel3").value = 0;
		 }
		 else{
			 document.getElementById("hidchcklevel4").value = 0;
		 }
	 }
	
	function hidedata(){
  		var analysis=$('#hidchckanalysis').val();
  		
  		if(parseInt(analysis)==1){
  			   $("#analysisDiv").prop("hidden", false);
  			   $("#viewDiv").attr("hidden", true);
  			}
  			else{
  				$("#analysisDiv").prop("hidden", true);
  				$("#viewDiv").attr("hidden", false);
  			}
  		}
	
	 function funreload(event){
		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var level1 = $('#hidchcklevel1').val();
		 var level2 = $('#hidchcklevel2').val();
		 var level3 = $('#hidchcklevel3').val();
		 var level4 = $('#hidchcklevel4').val();
		 var check=1;
		 
		 $("#overlay, #PleaseWait").show();
		 if(document.getElementById("chcklevel4").checked){
		   $('#btnprint').attr("disabled",true);
		 }
		 $("#balanceSheetDiv").load("balanceSheetGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&level1='+level1+'&level2='+level2+'&level3='+level3+'&level4='+level4+'&check='+check);
		}
		
		function funExportBtn(){
		  if(parseInt(window.parent.chkexportdata.value)=="1") {
		  	JSONToCSVCon(dataExcelExport, 'BalanceSheet', true);
		  } else {
			 $("#balanceSheetGrid").jqxTreeGrid('exportData', 'xls');
		  }
	    }
		
		function funPrintTForm(){
		        var url=document.URL;
		        var reurl=url.split("balanceSheet.jsp");

		        var fromdate = $('#fromdate').jqxDateTimeInput('val');
		        var todate = $('#todate').jqxDateTimeInput('val');
		        
		        var win= window.open(reurl[0]+"printTForm?branch="+document.getElementById("cmbbranch").value+'&fromdate='+fromdate+'&todate='+todate,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
		        win.focus();
	    }
		
		function funPrint(){
		
		  if(document.getElementById("chcklevel4").checked){
			 
			 var branchval = document.getElementById("cmbbranch").value;
			 var fromdate = $('#fromdate').val();
			 var todate = $('#todate').val();
			 
			 var url=document.URL;
			 var reurl=url.split("com/");
			 var path= "com/dashboard/accounts/balancesheet/balancesheetlist2.action?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate;
			 var win= window.open(reurl[0]+path,"_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");		
			 win.focus();		
			}
			else {
			
			 var branchval = document.getElementById("cmbbranch").value;
			 var fromdate = $('#fromdate').val();
			 var todate = $('#todate').val();
			 
			 var url=document.URL;
			 var reurl=url.split("com");
			 var path= "com/dashboard/accounts/balancesheet/balancesheetlist.action?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate;
			 var win= window.open(reurl[0]+path,"_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");		
			 win.focus();
			
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
            
            <%-- <div style="display: flex; align-items: center; gap: 5px; margin-bottom: 10px;">
                <input type="checkbox" id="chckanalysis" name="chckanalysis" value="" onchange="analysischeck();" onclick="$(this).attr('value', this.checked ? 1 : 0)" style="width: auto; height: auto;">
                <label class="branch" style="margin: 0; font-size: 12px; font-weight: 600;">Analysis</label>
            </div> --%>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Period</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div id="viewDiv">
                <div class="filter-card">
                    <table class="release-filter-table">
                        <tr>
                            <td class="label-cell">To</td>
                            <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
                        </tr>
                    </table>
                    
                    <div style="font-size: 13px; font-weight: bold; color: #333; margin: 15px 0 5px 0;">Levels</div>
                    <div class="checkbox-list">
                        <div class="checkbox-item">
                            <input type="checkbox" id="chcklevel1" name="chcklevel1" class="chcklevels" value="" onchange="checklevel1();" onclick="$(this).attr('value', this.checked ? 1 : 0)">
                            <label for="chcklevel1">Level 1</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="chcklevel2" name="chcklevel2" class="chcklevels" value="" onchange="checklevel2();" onclick="$(this).attr('value', this.checked ? 1 : 0)">
                            <label for="chcklevel2">Level 2</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="chcklevel3" name="chcklevel3" class="chcklevels" value="" onchange="checklevel3();" onclick="$(this).attr('value', this.checked ? 1 : 0)">
                            <label for="chcklevel3">Level 3</label>
                        </div>
                        <div class="checkbox-item">
                            <input type="checkbox" id="chcklevel4" name="chcklevel4" class="chcklevels" value="" onchange="checklevel4();" onclick="$(this).attr('value', this.checked ? 1 : 0)">
                            <label for="chcklevel4">Level 4</label>
                        </div>
                    </div>
                </div>
            </div>

            <div id="analysisDiv" hidden="true">
                <div class="filter-card">
                    <div style="display: flex; gap: 5px; margin-bottom: 10px;">
                        <select id="cmbchoose" name="cmbchoose" style="flex: 1;" value='<s:property value="cmbchoose"/>'>
                            <option value="1">Days</option>
                            <option value="2">Monthly</option>
                            <option value="3">Quarterly</option>
                            <option value="4">Yearly</option>
                        </select>
                        <input type="text" id="txtnoofdays" name="txtnoofdays" style="flex: 1;" value='<s:property value="txtnoofdays"/>'/>
                    </div>
                    <table class="release-filter-table">
                        <tr>
                            <td class="label-cell">Frequency</td>
                            <td><input type="text" id="txtfrequency" name="txtfrequency" value='<s:property value="txtfrequency"/>'/></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="button-group">
                <button type="button" class="btn-submit" id="btnPrintTForm" name="btnPrintTForm" onclick="funPrintTForm(event);">T-Form</button>
                <button type="button" class="btn-submit" id="btnprint" onclick="funPrint();">Print</button>
            </div>

            <div style="display: none;">
                <input type="hidden" id="hidchckanalysis" name="hidchckanalysis" value='<s:property value="hidchckanalysis"/>'/>
                <input type="hidden" id="hidchcklevel1" name="hidchcklevel1" value='<s:property value="hidchcklevel1"/>'/>
                <input type="hidden" id="hidchcklevel2" name="hidchcklevel2" value='<s:property value="hidchcklevel2"/>'/>
                <input type="hidden" id="hidchcklevel3" name="hidchcklevel3" value='<s:property value="hidchcklevel3"/>'/>
                <input type="hidden" id="hidchcklevel4" name="hidchcklevel4" value='<s:property value="hidchcklevel4"/>'/>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-container">
            <div id="balanceSheetDiv"><jsp:include page="balanceSheetGrid.jsp"></jsp:include></div>
        </div>
    </div>

</div>

</div> 
</body>
</html>