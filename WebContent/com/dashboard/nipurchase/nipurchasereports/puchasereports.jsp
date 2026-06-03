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

/* Range input layout */
.range-group {
    display: flex;
    align-items: center;
    gap: 5px;
}
.range-group input[type="text"] {
    width: 45%;
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

.grid-container {
    margin-bottom: 20px;
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	$('#orderlist').show();
	$('#orderlistdetails').hide();
	document.getElementById('rsumm').checked=true;

	$("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	$("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

    $('#accountDetailsWindow').jqxWindow({width: '51%', height: '60%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	$('#accountDetailsWindow').jqxWindow('close');
		 
	// Standardized to 100% width and 24px height
	$("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	$("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	
    var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
    $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	$('#todate').on('change', function (event) {
			
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
		  // out date
		 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
			 
		   return false;
		  }   
	});
	 
    $('#acno').dblclick(function(){
		  $('#accountDetailsWindow').jqxWindow('open');
		  commenSearchContent('accountsDetailsSearch.jsp?');
	}); 
	  
});

function  getacc(event){
	 var x= event.keyCode;
	 if(x==114){
	
	  $('#accountDetailsWindow').jqxWindow('open');
	
	 commenSearchContent('accountsDetailsSearch.jsp?');
	 }
}   
function commenSearchContent(url) {
	 
		 $.get(url).done(function (data) {
			 
			 $('#accountDetailsWindow').jqxWindow('open');
		$('#accountDetailsWindow').jqxWindow('setContent', data);

	}); 
} 	


 
function funExportBtn(){
	  
	if(document.getElementById('rsumm').checked) {
	  
	JSONToCSVCon(rdatasex, 'NI Puchase Reports', true);
	}
	else if (document.getElementById('rdet').checked) {
		JSONToCSVCon(putdatasex, 'NI Puchase detailed Reports', true);
	}
}
function funreload(event)
{

	  var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 
	  // out date
	 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
	 	 
	   if(fromdates>todates){
		   
		   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		 
	   return false;
	  } 
	   else
		   {
		   
		   var fromdocno=$("#fromdocno").val();
		   var todocno=$("#todocno").val();   
		   var fromamount=$("#fromamount").val();  
		   var toamount=$("#toamount").val(); 
		   
		   if(fromdocno!="")
			   {
			   if(todocno=="")
				   {
				   
				   $.messager.alert('Message','Enter To Doc No ','warning');   
					 
				   return false;
				   
				   }
			   else if(parseInt(todocno)<parseInt(fromdocno))
				   {
				   
				   $.messager.alert('Message','To Doc No Less Than From Doc No','warning');   
					 
				   return false;
				   
				   }
			   
			   }
		   
		   if(fromamount!="")
		   {
		   if(toamount=="")
			   {
			   
			   $.messager.alert('Message','Enter To Amount ','warning');   
				 
			   return false;
			   
			   }
		   
		   else if(parseFloat(toamount)<parseFloat(fromamount))
		   {
		   
		   $.messager.alert('Message','To Amount Less Than From Amount  ','warning');   
			 
		   return false;
		   
		   }
		   
		   }

	 var barchval = document.getElementById("cmbbranch").value;
     var fromdate= $("#fromdate").val();
	 var todate= $("#todate").val();
	 
	 var accdocno=$("#accdocno").val(); 
	   $("#overlay, #PleaseWait").show();
	   if(document.getElementById('rsumm').checked) {
	  $("#listdiv").load("puchasereportGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&fromdocno="
			  +fromdocno+"&todocno="+todocno+"&fromamount="+fromamount+"&toamount="+toamount+"&accdocno="+accdocno);
	         }
	   else if (document.getElementById('rdet').checked) {
		   $("#listdetdiv").load("purchasedetailsGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&fromdocno="
					  +fromdocno+"&todocno="+todocno+"&fromamount="+fromamount+"&toamount="+toamount+"&accdocno="+accdocno);
			         }
		   }
	}
	
	
	
function funClearInfo()
{
	 
	  $("#fromdocno").val('');
	  $("#todocno").val('');   
	 $("#fromamount").val('');  
	 $("#toamount").val(''); 
	  $("#accdocno").val(''); 
	  
	 $("#acno").val(''); 
	 $("#accname").val(''); 
	 
	 
	  $("#fromdocno").attr('placeholder', 'From');
	  $("#todocno").attr('placeholder', 'To');
	  $("#fromamount").attr('placeholder', 'From');
	  $("#toamount").attr('placeholder', 'To');
	  
}
	   
function isNumber(evt) {
    var iKeyCode = (evt.which) ? evt.which : evt.keyCode
    if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
    	{
 	   $.messager.alert('Message',' Enter Numbers Only  ','warning');   
        return false;
    	}
    return true;
}	
function fundisable(){
	
	if (document.getElementById('rsumm').checked) {
		
		 $('#orderlist').show(); 
		   $('#orderlistdetails').hide();
		  
		}
	 else if (document.getElementById('rdet').checked) {
		 
		  $('#orderlist').hide(); 
		  $('#orderlistdetails').show();
		 
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
                        <td><div id='fromdate' name='fromdate' value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div style="display: flex; gap: 15px; justify-content: center; margin: 10px 0;">
                                <div style="display: flex; align-items: center; gap: 5px;">
                                    <input type="radio" id="rsumm" name="stkled" onchange="fundisable();" value="rsumm" style="width: auto; height: auto;">
                                    <label for="rsumm" style="font-size: 12px; color: #4e5e71; font-weight: 600;">Summary</label>
                                </div>
                                <div style="display: flex; align-items: center; gap: 5px;">
                                    <input type="radio" id="rdet" name="stkled" onchange="fundisable();" value="rdet" style="width: auto; height: auto;">
                                    <label for="rdet" style="font-size: 12px; color: #4e5e71; font-weight: 600;">Detail</label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">DOC NO</td>
                        <td>
                            <div class="range-group">
                                <input type="text" id="fromdocno" name="fromdocno" placeholder="From" value='<s:property value="fromdocno"/>' onkeypress="javascript:return isNumber (event);" />
                                <span>-</span>
                                <input type="text" id="todocno" placeholder="To" name="todocno" value='<s:property value="todocno"/>' onkeypress="javascript:return isNumber (event);"/> 
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Amount</td>
                        <td>
                            <div class="range-group">
                                <input type="text" id="fromamount" name="fromamount" style="text-align:right;" placeholder="From" value='<s:property value="fromamount"/>' onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);" />
                                <span>-</span>
                                <input type="text" id="toamount" placeholder="To" name="toamount" style="text-align:right;" value='<s:property value="toamount"/>' onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber (event);" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Vendor</td>
                        <td>
                            <input type="text" id="acno" name="acno" placeholder="Press F3 To search" readonly="readonly" value='<s:property value="acno"/>' tabindex="-1" onkeydown="getacc(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="accname" name="accname" readonly="readonly" value='<s:property value="accname"/>' tabindex="-1"/>
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" class="btn-submit" name="clear" id="clear" onclick="funClearInfo();">Clear</button>
                </div>
                
                <div style="display: none;">
                    <input type="hidden" id="accdocno" name="accdocno" value='<s:property value="accdocno"/>' tabindex="-1"/>
                    <div id='paychaaaaa'></div>
                </div>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-container">
            <div id="listdiv"><jsp:include page="puchasereportGrid.jsp"></jsp:include></div>
        </div>
        <div class="grid-container">
            <div id="listdetdiv"><jsp:include page="purchasedetailsGrid.jsp"></jsp:include></div>
        </div>
    </div>

</div>
 
<div id="accountDetailsWindow">
	<div></div> 
</div>

</div>
</body>
</html>