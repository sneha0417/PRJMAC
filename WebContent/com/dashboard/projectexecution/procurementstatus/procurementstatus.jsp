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

</style>
<script type="text/javascript">

	$(document).ready(function () {
		
		   // Enforced 100% width and 24px height
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
				  }})
		   
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	         
	     
	     $('#clientsearch1').jqxWindow({ width: '40%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Client Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		  $('#clientsearch1').jqxWindow('close');
		  $('#contractwindow').jqxWindow({ width: '50%', height: '52%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Contract Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		  $('#contractwindow').jqxWindow('close');
		  $('#brandsearch').jqxWindow({ width: '50%', height: '52%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' Brand Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
		  $('#brandsearch').jqxWindow('close');
	     
	     $('#productsearchwndow').jqxWindow({ width: '40%', height: '70%',  maxHeight: '90%' ,maxWidth: '80%' ,title: ' Product Search ' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
			$('#productsearchwndow').jqxWindow('close'); 
			

			 
		     $('#txtclient').dblclick(function(){
				   
		    	 $('#clientsearch1').jqxWindow('open');
		    	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
				   		
				 });
		     
		    
			  $('#txtcontract').dblclick(function(){
			  	    $('#contractwindow').jqxWindow('open');
			   
			  	  contractSearchContent('contractMastersearch.jsp?', $('#contractwindow'));
		    });
			  $('#txtproduct').dblclick(function(){
			  	    $('#productsearchwndow').jqxWindow('open');
			   
			  	  productSearchContent('productMasterSearch.jsp?', $('#productsearchwndow'));
		    });
			  
			  $('#txtbrand').dblclick(function(){
			  	    $('#brandsearch').jqxWindow('open');
			   
			  	  brandSearchContent('brandMasterSearch.jsp?', $('#brandsearch'));
		    });
			 
		    
			  
	});
	
	
	function getclinfo(event){
		 var x= event.keyCode;
		 if(x==114){
		  $('#clientsearch1').jqxWindow('open');
		 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    }
		 else{
			 }
		 } 
	     function clientSearchContent(url) {
	            
	               $.get(url).done(function (data) {
	  
		            $('#clientsearch1').jqxWindow('setContent', data);

	    	}); 
	         	}

	     function getcontract(event){

				var x= event.keyCode;
			 	 if(x==114){
			 		 $('#contractwindow').jqxWindow('open');
			 		// changeContent('contractMastersearch.jsp');  
			 		 contractSearchContent('contractMastersearch.jsp?', $('#contractwindow'));
			    	 }
			 	 else{
			 		 
			 		 }
			 	 }
			    	 
			function contractSearchContent(url) {
				 $.get(url).done(function (data) {
				$('#contractwindow').jqxWindow('setContent', data);
			            	}); 
			 	}
	
			 function getproduct(event){

					var x= event.keyCode;
				 	 if(x==114){
				 		 $('#productsearchwndow').jqxWindow('open');
				 		// changeContent('contractMastersearch.jsp');  
				 		 productSearchContent('productMasterSearch.jsp?', $('#productsearchwndow'));
				    	 }
				 	 else{
				 		 
				 		 }
				 	 }
	
	 function productSearchContent(url) {
      	 //alert(url);
      		 $.get(url).done(function (data) {
      			
      		$('#productsearchwndow').jqxWindow('setContent', data);
      
      	}); 
      } 
	
	 function getbrand(event){

			var x= event.keyCode;
		 	 if(x==114){
		 		 $('#brandsearch').jqxWindow('open');
		 		// changeContent('contractMastersearch.jsp');  
		 		 brandSearchContent('brandMasterSearch.jsp?', $('#brandsearch'));
		    	 }
		 	 else{
		 		 
		 		 }
		 	 }

function brandSearchContent(url) {
//alert(url);
	 $.get(url).done(function (data) {
		
	$('#brandsearch').jqxWindow('setContent', data);

}); 
} 
	
	function funreload(event){

		 var fromdate = $('#fromdate').val();
		 var todate = $('#todate').val();
		 var branchval = document.getElementById("cmbbranch").value;
		 var clientid=$('#txtclientid').val();
		 
		 var contrid=document.getElementById("txtcontractid").value;
		 var prodid=document.getElementById("txtproductid").value;
		 var brandid=document.getElementById("txtbrandid").value;
		 
		 $("#overlay, #PleaseWait").show();  
		 $("#detailDiv").load("procurementStatusGrid.jsp?branchval="+branchval+"&fromdate="+fromdate+"&todate="+todate+"&clientid="+clientid+"&contrid="+contrid+"&prodid="+prodid+"&brandid="+brandid+"&check=1");
	}
	

	function funExportBtn(){
	    

		JSONToCSVCon(matdata, 'Procurement Status', true);
		   }
function funcleardata()
{
	document.getElementById("txtclient").value="";
	document.getElementById("txtclientid").value="";
	document.getElementById("txtcontract").value="";
	document.getElementById("txtcontractid").value="";
	document.getElementById("txtproduct").value="";
	document.getElementById("txtproductid").value="";
	document.getElementById("txtbrand").value="";
	document.getElementById("txtbrandid").value="";
	document.getElementById("txtareadet").value="";
	        
	 $('#txtclient').attr('placeholder', 'Press F3 TO Search'); 
	 $('#txtcontract').attr('placeholder', 'Press F3 TO Search'); 
	 $('#txtproduct').attr('placeholder', 'Press F3 TO Search'); 
	 $('#txtbrand').attr('placeholder', 'Press F3 TO Search'); 
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
                        <td class="label-cell">Client</td>
                        <td>
                            <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' onKeyDown="getclient(event);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Contract No.</td>
                        <td>
                            <input type="text" name="txtcontract" id="txtcontract" placeholder="Press F3 To Search"  onKeyDown="getcontract(event);" readonly value='<s:property value="txtcontract"/>'>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Product</td>
                        <td>
                            <input type="text" name="txtproduct" id="txtproduct" value='<s:property value="txtproduct"/>' onKeyDown="getproduct(event);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Brand</td>
                        <td>
                            <input type="text" name="txtbrand" id="txtbrand" value='<s:property value="txtbrand"/>' onKeyDown="getbrand(event);" readonly placeholder="Press F3 to Search">
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Details</td>
                        <td>
                            <textarea rows="6" name="txtareadet" id="txtareadet" readonly></textarea>
                        </td>
                    </tr>
                </table>
                
                <div class="button-group">
                    <button type="button" class="btn-submit" name="clear" id="clear" onclick="funcleardata()">Clear</button>
                </div>
                
                <div style="display: none;">
                    <input type="hidden" id="txtclientid" name="txtclientid" value='<s:property value="txtclientid"/>'>
                    <input type="hidden" id="txtcontractid" name="txtcontractid" value='<s:property value="txtcontractid"/>'>
                    <input type="hidden" id="txtproductid" name="txtproductid" value='<s:property value="txtproductid"/>'>
                    <input type="hidden" id="txtbrandid" name="txtbrandid" value='<s:property value="txtbrandid"/>'>
                    
                    <input type="hidden" id="txtdocno" name="txtdocno" value='<s:property value="txtdocno"/>'/>
                    <input type="hidden" id="txtbranch" name="txtbranch" value='<s:property value="txtbranch"/>'/>
                    <input type="hidden" id="txtsalid" name="txtsalid" value='<s:property value="txtsalid"/>'/>
                    <input type="hidden" id="txtrdocno" name="txtrdocno" value='<s:property value="txtrdocno"/>'/>
                    <input type="hidden" id="txtbrchid" name="txtbrchid" value='<s:property value="txtbrchid"/>'/>
                    <input type="hidden" id="txtuserid" name="txtuserid" value='<s:property value="txtuserid"/>'/>
                    <input type="hidden" name="subgridlength" id="subgridlength" value='<s:property value="subgridlength"/>'>
                    <input type="hidden" name="contracttrno" id="contracttrno" value='<s:property value="contracttrno"/>'>
                    <input type="hidden" name="contractdocno" id="contractdocno" value='<s:property value="contractdocno"/>'>
                    <input type="hidden" id="puchasechk" name="puchasechk"/> 
                </div>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        <table width="100%" style=" vertical-align: top;">
            <tr><td><div id="detailDiv"><jsp:include page="procurementStatusGrid.jsp"></jsp:include></div></td></tr>
        </table>
    </div>

</div>

<div id="productsearchwndow"><div></div></div>
<div id="clientsearch1"><div></div></div>
<div id="contractwindow"><div></div></div>
<div id="brandsearch"><div></div></div>
	
</div> 
</body>
</html>