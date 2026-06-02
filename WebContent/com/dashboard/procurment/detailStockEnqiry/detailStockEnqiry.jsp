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
<%
	String contextPath=request.getContextPath();
 %>
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

/* Textarea styling */
textarea {
    width: 100%;
    padding: 6px 8px;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff;
    box-sizing: border-box;
    color: #333;
    font-family: 'Segoe UI', 'Tahoma', sans-serif;
    resize: none;
}

/* Readonly / disabled look - NO BAN ICON */
input[readonly],
input:disabled,
select:disabled,
textarea[readonly] {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default; /* Forces normal cursor instead of not-allowed */
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
.btn-submit:disabled { background: #9ca3af; }
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

.transactionHead {
	color: black;
	background-color: #E0ECF8;
	width: 100%;
	height: 28px;
	font-family: Myriad Pro;
	font-weight: bold;
    display: inline-block;
    padding: 4px 8px;
}
.transactionHeadDetails {
	color: black;
	background-color: #E0ECF8;
	width: 100%;
	font-family: comic sans ms;
    display: inline-block;
    padding: 4px 8px;
}
</style>

<script type="text/javascript">

	$(document).ready(function () {
		 // Enforced 100% width and 24px height
		 $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
		 
		 $('#productDetailsWindow').jqxWindow({width: '70%', height: '65%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Products Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#productDetailsWindow').jqxWindow('close');
		 
		 $('#unitDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Units Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
		 $('#unitDetailsWindow').jqxWindow('close');
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		 
	     $('#fromdate').val(new Date());
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	     document.getElementById("rdbackorder").checked=false;document.getElementById("rdpendingdelivery").checked=false;
	     $('#rdbackorder').attr('hidden', true );$('#rdpendingdelivery').attr('hidden', true );
		 $('#lblrdbackorder').attr('hidden', true );$('#lblpenddel').attr('hidden', true );

		 $('#txtpartno').dblclick(function(){
			 var aa="DSE";
			 productSearchContent("<%=contextPath%>/com/productsearch/productSearch.jsp?frm="+aa, $('#productDetailsWindow'));
		 }); 
		  
		 $('#txtunit').dblclick(function(){
			 unitsSearchContent('unitsDetailsSearch.jsp');
		 }); 
		
	});
	
	function getProduct(){
		
		 $('#productDetailsWindow').jqxWindow('open');
			$('#productDetailsWindow').jqxWindow('focus');
			 var aa="DSE";
			 productSearchContent("<%=contextPath%>/com/productsearch/productSearch.jsp?frm="+aa, $('#productDetailsWindow'));

	}
	
	function productSearchContent(url) {
	    $('#productDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#productDetailsWindow').jqxWindow('setContent', data);
		$('#productDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function unitsSearchContent(url) {
	    $('#unitDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#unitDetailsWindow').jqxWindow('setContent', data);
		$('#unitDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function getProductType(event){
        var x= event.keyCode;
        if(x==114){
        	productsSearchContent('productsDetailsSearch.jsp');
        }
        else{
         }
        }
	
	function getUnit(event){
        var x= event.keyCode;
        if(x==114){
        	unitsSearchContent('unitsDetailsSearch.jsp');
        }
        else{
         }
        }
	    
	function clearTypeInfo(){
		 document.getElementById("rdbackorder").checked=false;document.getElementById("rdpendingdelivery").checked=false;
	     
		 $('#rdbackorder').attr('hidden', true );$('#rdpendingdelivery').attr('hidden', true );
		 $('#lblrdbackorder').attr('hidden', true );$('#lblpenddel').attr('hidden', true );
	     
	} 
	
	function  funClearData(){
		 $('#cmbtype').val('curstk');$('#fromdate').val(new Date());$('#todate').val(new Date());
		 $('#txtpartno').val('');$('#txtproductname').val('');$('#txtunit').val('');$('#detailinfo').val('');
		 $('#hidproductid').val('');
		 $('#fromdate').val(new Date());
		 var curfromdate= $('#fromdate').jqxDateTimeInput('getDate');
	     var oneyeardate=new Date(new Date(curfromdate).setMonth(curfromdate.getMonth()-1));
	     var oneyearbackdate=new Date(new Date(oneyeardate).setDate(oneyeardate.getDate()));
	     $('#fromdate').jqxDateTimeInput('setDate', new Date(oneyearbackdate));
	     
	     document.getElementById("rdbackorder").checked=false;document.getElementById("rdpendingdelivery").checked=false;
	     
	     $('#rdbackorder').attr('hidden', true );$('#rdpendingdelivery').attr('hidden', true );
		 $('#lblrdbackorder').attr('hidden', true );$('#lblpenddel').attr('hidden', true );
		 document.getElementById("searchdetails").value= "";
	     $("#currentStockGridID").jqxGrid('clear');$("#transactionDetailsGridID").jqxGrid('clear');$("#jqxStockDetailGrid").jqxGrid('clear');$("#lastPurchasePriceDetailsGridID").jqxGrid('clear');$("#salesDetailsGridID").jqxGrid('clear');
	     $("#currentStockGridID").jqxGrid('addrow', null, {});$("#transactionDetailsGridID").jqxGrid('addrow', null, {});$("#jqxStockDetailGrid").jqxGrid('addrow', null, {});$("#lastPurchasePriceDetailsGridID").jqxGrid('addrow', null, {});$("#salesDetailsGridID").jqxGrid('addrow', null, {});
	     $("#currentStockDiv").prop("hidden", false);$("#transactionDetailsDiv").prop("hidden", true);$("#detailMovementDiv").prop("hidden", true);$("#lastPurchasePriceDetailsDiv").prop("hidden", true);$("#salesDetailsDiv").prop("hidden", true);
	     
	}
	
	function detailStockType(){
		
		 var type=$('#cmbtype').val();
		//$('#searchdetails').val('');
		 $("#currentStockGridID").jqxGrid('clear');$("#transactionDetailsGridID").jqxGrid('clear');$("#jqxStockDetailGrid").jqxGrid('clear');$("#lastPurchasePriceDetailsGridID").jqxGrid('clear');$("#salesDetailsGridID").jqxGrid('clear');
	     $("#currentStockGridID").jqxGrid('addrow', null, {});$("#transactionDetailsGridID").jqxGrid('addrow', null, {});$("#jqxStockDetailGrid").jqxGrid('addrow', null, {});$("#lastPurchasePriceDetailsGridID").jqxGrid('addrow', null, {});$("#salesDetailsGridID").jqxGrid('addrow', null, {});
	     
		 if(type=='saldet') {
			 
			 document.getElementById("rdbackorder").checked=false;document.getElementById("rdpendingdelivery").checked=false;
			 $('#rdbackorder').attr('hidden', true );$('#rdpendingdelivery').attr('hidden', true );
			 $('#lblrdbackorder').attr('hidden', true );$('#lblpenddel').attr('hidden', true );
			 $("#salesDetailsDiv").prop("hidden", false);$("#currentStockDiv").prop("hidden", true);$("#transactionDetailsDiv").prop("hidden", true);$("#detailMovementDiv").prop("hidden", true);$("#lastPurchasePriceDetailsDiv").prop("hidden", true);
		 } else if(type=='trdet') {
			 
			 document.getElementById("rdbackorder").checked=true;document.getElementById("rdpendingdelivery").checked=false;
			 $('#rdbackorder').attr('hidden', false );$('#rdpendingdelivery').attr('hidden', false );
			 $('#lblrdbackorder').attr('hidden', false );$('#lblpenddel').attr('hidden', false );
			 $("#transactionDetailsDiv").prop("hidden", false);$("#currentStockDiv").prop("hidden", true);$("#detailMovementDiv").prop("hidden", true);$("#lastPurchasePriceDetailsDiv").prop("hidden", true);$("#salesDetailsDiv").prop("hidden", true);
		 } else if(type=='detmov') {
			 $('#chk').attr('hidden', true );
			 document.getElementById("rdbackorder").checked=false;document.getElementById("rdpendingdelivery").checked=false;
			 $('#rdbackorder').attr('hidden', true );$('#rdpendingdelivery').attr('hidden', true );
			 $('#lblrdbackorder').attr('hidden', true );$('#lblpenddel').attr('hidden', true );
			 $("#detailMovementDiv").prop("hidden", false);$("#currentStockDiv").prop("hidden", true);$("#transactionDetailsDiv").prop("hidden", true);$("#lastPurchasePriceDetailsDiv").prop("hidden", true);$("#salesDetailsDiv").prop("hidden", true);
		 } else if(type=='lpurdet') {
			 document.getElementById("rdbackorder").checked=false;document.getElementById("rdpendingdelivery").checked=false;
			 $('#rdbackorder').attr('hidden', true );$('#rdpendingdelivery').attr('hidden', true );
			 $('#lblrdbackorder').attr('hidden', true );$('#lblpenddel').attr('hidden', true );
			 $("#lastPurchasePriceDetailsDiv").prop("hidden", false);$("#currentStockDiv").prop("hidden", true);$("#transactionDetailsDiv").prop("hidden", true);$("#detailMovementDiv").prop("hidden", true);$("#salesDetailsDiv").prop("hidden", true);
		 } else {
			 
			 document.getElementById("rdbackorder").checked=false;document.getElementById("rdpendingdelivery").checked=false;
			 $('#rdbackorder').attr('hidden', true );$('#rdpendingdelivery').attr('hidden', true );
			 $('#lblrdbackorder').attr('hidden', true );$('#lblpenddel').attr('hidden', true );
			 $("#currentStockDiv").prop("hidden", false);$("#transactionDetailsDiv").prop("hidden", true);$("#detailMovementDiv").prop("hidden", true);$("#lastPurchasePriceDetailsDiv").prop("hidden", true);$("#salesDetailsDiv").prop("hidden", true);
		 }
	}
	
	function funreload(event){

		 var branchval = document.getElementById("cmbbranch").value;
		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var rpttype = $('#cmbtype').val();
		 var product=$('#txtpartno').val();
		 var productid=$('#hidproductid').val();
		 var unit=$('#txtunit').val();
		 var chk=1;
		 
		 var aa="yes";
		 
			if(productid==""){
				
				$.messager.alert('Message','Select a product to Continue','warning');
				   return false;
			}
		 
		 $("#currentStockGridID").jqxGrid('clear');$("#transactionDetailsGridID").jqxGrid('clear');$("#jqxStockDetailGrid").jqxGrid('clear');$("#lastPurchasePriceDetailsGridID").jqxGrid('clear');$("#salesDetailsGridID").jqxGrid('clear');
		 
		 $("#overlay, #PleaseWait").show();
		 
		 if(rpttype=='saldet') {
				 $("#salesDetailsDiv").load("salesDetailsGrid.jsp?todate="+todate+"&frmdate="+fromdate+"&productid="+productid+"&branchval="+branchval+"&dtype="+rpttype+"&aa="+aa);
		 } else if(rpttype=='trdet') {
			     var documenttype='';
			     var dtype='';
			     if(document.getElementById("rdbackorder").checked==true)
			     {documenttype='Pending Order Details';
			     document.getElementById("gridhead").value="Reserved"; 
			     dtype='SOR';
			     }
			     if(document.getElementById("rdpendingdelivery").checked==true)
			     {documenttype='Pending Delivery List';
			     document.getElementById("gridhead").value="Deliverd"; 
			     dtype='DEL';
			     }
			     document.getElementById("lbldoctype").innerText=documenttype; 
			     $("#transactionDetailsDiv").load("transactionDetailsGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&rpttype='+rpttype+'&unit='+unit+'&chk='+chk+'&productid='+productid+'&dtype='+dtype+"&aa="+aa);
		 } else if(rpttype=='detmov') {
			 $("#detailMovementDiv").load("stockLedgerGridDetail.jsp?todate="+todate+"&frmdate="+fromdate+"&hidproduct="+productid+"&branchid="+branchval+"&aa="+aa);
	         /* $("#detailMovementDiv").load("detailMovementGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&rpttype='+rpttype+'&product='+product+'&unit='+unit+'&chk='+chk); */
		 } else if(rpttype=='lpurdet') {
	         $("#lastPurchasePriceDetailsDiv").load("lastPurchasePriceDetailsGrid.jsp?todate="+todate+"&frmdate="+fromdate+"&productid="+productid+"&branchval="+branchval+"&dtype="+rpttype+"&aa="+aa);
	     } else {
	         $("#currentStockDiv").load("currentStockGrid.jsp?branchval="+branchval+'&fromdate='+fromdate+'&todate='+todate+'&rpttype='+rpttype+'&unit='+unit+'&chk='+chk+'&productid='+productid+"&aa="+aa);
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
                        <td class="label-cell">Period</td>
                        <td><div id="fromdate" name="fromdate" value='<s:property value="fromdate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">To</td>
                        <td><div id="todate" name="todate" value='<s:property value="todate"/>'></div></td>
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
                    
                    <tr>
                        <td class="label-cell">Type</td>
                        <td>
                            <select id="cmbtype" name="cmbtype" onchange="clearTypeInfo();detailStockType();" value='<s:property value="cmbtype"/>'>
                                <option value="curstk" selected>Current Stock</option>
                                </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">
                            <div style="display: flex; justify-content: center; gap: 15px; margin-top: 5px;">
                                <div style="display: flex; align-items: center; gap: 5px;">
                                    <input type="radio" id="rdbackorder" name="rdo" value="rdbackorder" style="width: auto; height: auto;">
                                    <label for="rdbackorder" id="lblrdbackorder" class="branch" style="font-size: 11px;">Pending Order</label>
                                </div>
                                <div style="display: flex; align-items: center; gap: 5px;">
                                    <input type="radio" id="rdpendingdelivery" name="rdo" value="rdpendingdelivery" style="width: auto; height: auto;">
                                    <label for="rdpendingdelivery" id="lblpenddel" class="branch" style="font-size: 11px;">Pend. Delivery</label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">
                            <textarea id="searchdetails" name="searchdetails" rows="8" readonly="readonly"><s:property value="searchdetails" ></s:property></textarea>
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" class="btn-submit" name="clear" id="clear" onclick="funClearData();">Clear</button>
                </div>
                
                <div style="display: none;">
                    <input type="hidden" id="psrno" name="psrno" value='<s:property value="psrno"/>' /> 
                    <input type="hidden" id="txtunit" name="txtunit" readonly="readonly"  value='<s:property value="txtunit"/>'/>
                    
                    <input type="hidden" name="hidbrandid" id="hidbrandid">
                    <input type="hidden" name="hidtypeid" id="hidtypeid">
                    <input type="hidden" name="hideptid" id="hideptid">
                    <input type="hidden" name="hidcatid" id="hidcatid">
                    <input type="hidden" name="hidsubcatid" id="hidsubcatid">
                    <input type="hidden" name="hidproductid" id="hidproductid">
                    
                    <input type="hidden" name="hidbrand" id="hidbrand">
                    <input type="hidden" name="hidept" id="hidept">
                    <input type="hidden" name="hidtype" id="hidtype">
                    <input type="hidden" name="hidcat" id="hidcat">
                    <input type="hidden" name="hidsubcat" id="hidsubcat">
                    <input type="hidden" name="hidproduct" id="hidproduct">
                </div>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <table width="100%">
            <tr>
                <td>
                    <label class="transactionHead">&nbsp;</label>
                    <label class="transactionHeadDetails" name="lbldoctype" id="lbldoctype"></label>
                </td>
            </tr> 
            <tr>
                <td>
                    <div id="currentStockDiv"><jsp:include page="currentStockGrid.jsp"></jsp:include></div>
                    <div id="transactionDetailsDiv" hidden="true"><jsp:include page="transactionDetailsGrid.jsp"></jsp:include></div>
                    <%-- <div id="detailMovementDiv" hidden="true"><jsp:include page="detailMovementGrid.jsp"></jsp:include></div> --%>
                    <div id="detailMovementDiv" hidden="true"><jsp:include page="stockLedgerGridDetail.jsp"></jsp:include></div>
                    <div id="lastPurchasePriceDetailsDiv" hidden="true"><jsp:include page="lastPurchasePriceDetailsGrid.jsp"></jsp:include></div>
                    <div id="salesDetailsDiv" hidden="true"><jsp:include page="salesDetailsGrid.jsp"></jsp:include></div>
                </td>
            </tr>
        </table>
    </div>

</div>

<div id="productDetailsWindow">
	<div></div><div></div>
</div>
<div id="unitDetailsWindow">
	<div></div><div></div>
</div>

</div> 
</body>
</html>