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

<script type="text/javascript">

	$(document).ready(function () {
		 $("#date").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $('#accountDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#accountDetailsWindow').jqxWindow('close');
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     
	     $('#date').jqxDateTimeInput({disabled: true});$('#txtreason').attr("readonly",true);$('#btndelete').attr("disabled",true);
	     $("#appliedDetailsGrid").jqxGrid({ disabled: true}); 
	});
	
	function accountsSearchContent(url) {
	    $('#accountDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#accountDetailsWindow').jqxWindow('setContent', data);
		$('#accountDetailsWindow').jqxWindow('bringToFront');
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
	
	function funreload(event){
		 var branchval = document.getElementById("cmbbranch").value;
		 var atype = $('#cmbtype').val();
		 var accountno = $('#txtdocno').val();
		 
		 $('#date').val(new Date());$('#txtreason').val('');$('#txttrno').val();
		 $('#txtoutamount').val('');$('#txtdtype').val('');$('#txtbranchid').val('');$('#applyinfo').val(' ');
  	     $("#appliedDetailsGrid").jqxGrid({ disabled: true});$("#appliedDetailsGrid").jqxGrid('clear'); 
  	     $('#date').jqxDateTimeInput({disabled: true});
  	     $('#txtreason').attr("readonly",true);$('#btndelete').attr("disabled",true);
         
  	     if(accountno==''){
			 $.messager.alert('Message','Account is Mandatory.','warning');
			 return 0;
		 }
  	   
		 $("#overlay, #PleaseWait").show();
		 
		 $("#appliedDiv").load("appliedGrid.jsp?branchval="+branchval+'&atype='+atype+'&accountno='+accountno);
		}
	
	function funDelete(event){
		
		var trno =  $('#txttrno').val();
		var accountno =  $('#txtdocno').val();
		var outamount =  $('#txtoutamount').val();
		var dtype =  $('#txtdtype').val();
		var branchid =  $('#txtbranchid').val();
		var date =  $('#date').val();
		var reason =  $('#txtreason').val();
		
		if(reason==''){
			 $.messager.alert('Message','Please Enter the Reason.','warning');
			 return 0;
		 }
		
		 $.messager.confirm('Message', 'Do you want to delete?', function(r){
		        
		     	if(r==false)
		     	  {
		     		return false; 
		     	  }
		     	else{
		     		saveGridData(trno,accountno,outamount,dtype,branchid,date,reason);	
		     	}
		});
	}
	    
	function saveGridData(trno,accountno,outamount,dtype,branchid,date,reason){

		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
	     			
				var items=x.responseText;
				var trno =  $('#txttrno').val(' ');
				var outamount =  $('#txtoutamount').val(' ');
				var dtype =  $('#txtdtype').val(' ');
				var branchid =  $('#txtbranchid').val(' ');
				var date =  $('#date').val(new Date());
				var reason =  $('#txtreason').val(' ');
				var applyinfo = $('#applyinfo').val(' ');
				
				$.messager.alert('Message', '  Record Successfully Deleted ', function(r){
			    });
				funreload(event); 
				}
		}
			
	x.open("GET","saveData.jsp?trno="+trno+"&accountno="+accountno+"&outamount="+outamount+"&dtype="+dtype+"&branchid="+branchid+"&date="+date+"&reason="+reason,true);
	x.send();
			
	}
	
	function clearAccountInfo(){
		$('#txtdocno').val('');$('#txtaccid').val('');$('#txtaccname').val('');
		$('#txttrno').val(' ');$('#txtoutamount').val(' ');$('#txtdtype').val(' ');
		$('#txtbranchid').val(' ');$('#date').val(new Date());$('#txtreason').val(' ');
		$('#applyinfo').val(' ');
		$("#appliedDetailsGrid").jqxGrid({ disabled: true});$("#appliedDetailsGrid").jqxGrid('clear'); 
		$("#appliedDelete").jqxGrid('clear');$('#date').jqxDateTimeInput({disabled: true});
  	    $('#txtreason').attr("readonly",true);$('#btndelete').attr("disabled",true);
  	    
  	  if (document.getElementById("txtaccid").value == "") {
	        $('#txtaccid').attr('placeholder', 'Press F3 to Search'); 
	    }
	}
	
	function getAccTypeFrom(event){
        var x= event.keyCode;
        if(x==114){
      		accountsSearchContent('accountsDetailsSearch.jsp');
        }
       
      }
	
	function funSearchdblclick(){
		  $('#txtaccid').dblclick(function(){
			  accountsSearchContent('accountsDetailsSearch.jsp');
			});
	}
	
	
</script>
<style>
/* ===== GLOBAL RESET ===== */
html, body {
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
    width: 70px; 
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

textarea, .release-filter-table textarea {
    width: 100%;
    padding: 6px 8px;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    resize: none;
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
.release-filter-table div[id^="date"] {
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
.btn-danger {
    background: #dc2626;
}
.btn-danger:hover {
    background: #b91c1c;
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
</head>
<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
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
                        <td class="label-cell">Type</td>
                        <td>
                            <select id="cmbtype" name="cmbtype" onchange="clearAccountInfo();" value='<s:property value="cmbtype"/>'>
                                <option value="AR">AR</option>
                                <option value="AP">AP</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Account</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" id="txtaccid" name="txtaccid" readonly="readonly" placeholder="Double click to search" value='<s:property value="txtaccid"/>' ondblclick="funSearchdblclick();" onkeydown="getAccTypeFrom(event);" />
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtaccname" name="txtaccname" readonly="readonly" tabindex="-1" value='<s:property value="txtaccname"/>' />
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td colspan="2">
                            <textarea id="applyinfo" name="applyinfo" readonly="readonly" style="height: 80px;"><s:property value="applyinfo"></s:property></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date</td>
                        <td><div id="date" name="date" value='<s:property value="date"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Reason</td>
                        <td><input type="text" id="txtreason" name="txtreason" value='<s:property value="txtreason"/>'/></td>
                    </tr>
                </table>

                <div class="release-actions">
                    <button type="button" class="btn-submit btn-danger" id="btndelete" name="btndelete" onclick="funDelete(event);">Delete</button>
                </div>
            </div>

            <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
            <input type="hidden" id="txttrno" name="txttrno" value='<s:property value="txttrno"/>'/>
            <input type="hidden" id="txtoutamount" name="txtoutamount" value='<s:property value="txtoutamount"/>'/>
            <input type="hidden" id="txtdtype" name="txtdtype" value='<s:property value="txtdtype"/>'/>
            <input type="hidden" id="txtbranchid" name="txtbranchid" value='<s:property value="txtbranchid"/>'/>

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
                            <div id="appliedDiv">
                                <jsp:include page="appliedGrid.jsp"></jsp:include>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="detailDiv">
                                <jsp:include page="appliedDetailGrid.jsp"></jsp:include>
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

<div id="accountDetailsWindow">
    <div></div><div></div>
</div>

</div> 
</div>
</body>
</html>