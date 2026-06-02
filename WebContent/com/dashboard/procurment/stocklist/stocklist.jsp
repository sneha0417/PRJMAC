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
	$('#stockLedgerDiv').show();
	 $('#stockLedgerDetDiv').hide();
	 document.getElementById('rsumm').checked=true;
	  $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

		 $('#productDetailsWindow').jqxWindow({width: '51%', height: '59%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Products Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#productDetailsWindow').jqxWindow('close');
		 
		 $('#txtpartno').dblclick(function(){
			 productSearchContent('productSearch.jsp', $('#productDetailsWindow'));
		 }); 
});

function funExportBtn(){
	if (document.getElementById('rsumm').checked) {
		JSONToCSVCon(datass, 'Strock List', true);
	}
	 else if (document.getElementById('rdet').checked) {
		JSONToCSVCon(dat, 'Strock List', true);
	}
}

function productSearchContent(url) {
    $('#productDetailsWindow').jqxWindow('open');
	$.get(url).done(function (data) {
	$('#productDetailsWindow').jqxWindow('setContent', data);
	$('#productDetailsWindow').jqxWindow('bringToFront');
}); 
}

function getProduct(){
	 $('#productDetailsWindow').jqxWindow('open');
     $('#productDetailsWindow').jqxWindow('focus');
     productSearchContent('productSearch.jsp', $('#productDetailsWindow'));

}
function funreload(event)
{
	 var barchval = document.getElementById("cmbbranch").value;
	 var statusselect=$("#statusselect").val();
	 var psrno=$("#psrno").val();
   
    if (document.getElementById('rsumm').checked) {
        $("#overlay, #PleaseWait").show();
        var load="yes";
        $("#stockLedgerDiv").load("stockGridSummary.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&load="+load);
    }
    else if (document.getElementById('rdet').checked) {
        $("#overlay, #PleaseWait").show();
        var load="yes";
        $("#stockLedgerDetDiv").load("stockGridDetail.jsp?barchval="+barchval+"&statusselect="+statusselect+"&psrno="+psrno+"&load="+load);
    }  
	  
}

function  funcleardata()
{
	 document.getElementById('txtpartno').value="";
	 document.getElementById('txtproductname').value="";
	 document.getElementById('psrno').value="";
	 document.getElementById('rsumm').checked=true;
 
	 document.getElementById("cmbbranch").value="a";
	 
	 $('#txtpartno').attr('placeholder', 'Press F3 TO Search'); 
}
	
function fundisable(){
	if (document.getElementById('rsumm').checked) {
        $('#stockLedgerDiv').show();
        $('#stockLedgerDetDiv').hide();
    }
	else if (document.getElementById('rdet').checked) {
        $('#stockLedgerDiv').hide();
        $('#stockLedgerDetDiv').show();
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
                        <td class="label-cell">Product</td>
                        <td>
                            <input type="text" id="txtpartno" name="txtpartno" readonly="readonly" placeholder="Press F3 to Search" value='<s:property value="txtpartno"/>' onKeyDown="getProduct(event);"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="text" id="txtproductname" name="txtproductname" readonly="readonly" value='<s:property value="txtproductname"/>' tabindex="-1"/>
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" class="btn-submit" name="clear" id="clear" onclick="funcleardata()">Clear</button>
                </div>
                
                <div style="display: none;">
                    <input type="hidden" id="psrno" name="psrno" value='<s:property value="psrno"/>' />
                    <input type="hidden" id="statusselect" name="statusselect" value='<s:property value="statusselect"/>'>
                    <input type="hidden" id="acno" name="acno" value='<s:property value="acno"/>'>
                    <div id='paychaaaaa'></div>
                </div>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-container">
            <div id="stockLedgerDiv"><jsp:include page="stockGridSummary.jsp"></jsp:include></div>
        </div>
        <div class="grid-container">
            <div id="stockLedgerDetDiv"><jsp:include page="stockGridDetail.jsp"></jsp:include></div>
        </div>
    </div>

</div>
 
<div id="productDetailsWindow">
	<div></div><div></div>
</div>

</div>
</body>
</html>