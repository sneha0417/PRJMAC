<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/resample.js"></script>

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

input[readonly],
input:disabled,
select:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: default !important;
}

/* jqx date/time containers */
.release-filter-table div[id^="frmdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* Input group for Client Search + Clear button */
.input-group {
    display: flex;
    gap: 5px;
    width: 100%;
}
.input-group .btn-clear {
    width: 28px;
    height: 24px;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #e1e8ed;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    cursor: pointer;
}
.input-group .btn-clear:hover { background-color: #ccd6e0; }
.input-group .btn-clear img { width: 14px; height: 14px; opacity: 0.7; }

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
    gap: 10px;
    margin-top: 15px;
    width: 100%;
}

/* Main Content Area (RIGHT SIDE) */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow-y: auto; 
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
}

.grid-container {
    margin-bottom: 20px;
}

.split-grid-row {
    display: flex;
    gap: 20px;
    flex: 1;
}
.split-grid-row > div {
    flex: 1;
    min-width: 0; /* Prevents flex items from overflowing */
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	
	 $("#test").hide();
	 
	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");

	 $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	 $('#clientsearch1').jqxWindow('close');
		  
     // Standardized to 100% width and 24px height
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#frmdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	
	 var todates=new Date($('#todate').jqxDateTimeInput('getDate'));
	 var onemounth=new Date(new Date(todates).setMonth(todates.getMonth()-1)); 
	  
     $('#todate').jqxDateTimeInput('setDate', new Date());
     $('#frmdate').jqxDateTimeInput('setDate',onemounth);
     
     $('#txtclient').dblclick(function(){
    	 $('#clientsearch1').jqxWindow('open');
    	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
	 });
     
     $('#contractwindow').jqxWindow({ width: '60%', height: '50%',  maxHeight: '85%' ,maxWidth: '80%' ,title: ' contract Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
	 $('#contractwindow').jqxWindow('close');
	  
	 $('#txtcontract').dblclick(function(){
	 	 $('#contractwindow').jqxWindow('open');
	 	 contractSearchContent('contractMastersearch.jsp?', $('#contractwindow'));
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

     function funExportBtn(){
 		
	  	   JSONToCSVCon(invoicelistexcel,'Invoice List',true);
	  }

	   function funClear(){
		   
		   $("#jqxpinvGrid").jqxGrid('clear'); 
			$("#jqxInvCount").jqxGrid('clear');
			
		   document.getElementById("txtclient").value="";
		   document.getElementById("clientid").value="0";
		   $("#txtclient").attr("placeholder", "press F3 for Search");
		   
		   document.getElementById("txtcontract").value="";
		   $("#txtcontract").attr("placeholder", "press F3 for Search");
		   
	   }
	   
	   
	   function funreload()
	   {

	   	 var clientid=$('#clientid').val();
	   	 var date=$('#todate').val();
	   	 var barchval = document.getElementById("cmbbranch").value;
	     	
	        var dtype="0";
	        var id=1;
			
	       if(id>0){
	       	countload(id);
	       }
	       
	   	}
	   
		 function countload(id){
			 
			 var clientid=$('#clientid').val();
			 var date=$('#todate').val();
			 var frmdate=$('#frmdate').val();
			 var barchval = document.getElementById("cmbbranch").value;
			 var contract=document.getElementById("txtcontract").value;
			 
			    $("#jqxpinvGrid").jqxGrid('clear'); 
				$("#jqxInvCount").jqxGrid('clear');
				
				 $("#invCountgrid").load("invCountgrid.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id+"&contract="+contract+"&frmdate="+frmdate);
			
		 }
		 
		 function getcontract(event){

				var x= event.keyCode;
			 	 if(x==114){
			 		 $('#contractwindow').jqxWindow('open');
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
		
 function gettaxconfig(){
					
				 document.getElementById("hidtaxconfig").value=0; 
						var x=new XMLHttpRequest();
						x.onreadystatechange=function(){
						if (x.readyState==4 && x.status==200)
							{
							 	var res= x.responseText;
							 	if(res>0){
							 		
							 		document.getElementById("hidtaxconfig").value=1; 
									  }
								}
						       else
							  {}
					     }
					      x.open("GET",'taxconfig.jsp',true);
					     x.send();
					    
					   } 
	
</script>
</head>
<body onload="getBranch();gettaxconfig();">
<form id="frmdinvoice" action=savedInvoice method="post">
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
                        <td class="label-cell">From Date</td>
                        <td><div id='frmdate' name='frmdate' value='<s:property value="frmdate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">To Date</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div class="input-group">
                                <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' onKeyDown="getclinfo(event);" readonly placeholder="Press F3 to Search" style="flex: 1;">
                                <button type="button" class="btn-clear" id="clear" title="Clear" onclick="funClear()"> 
                                    <img alt="clear" src="<%=contextPath%>/icons/clear.png">
                                </button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Contract No</td>
                        <td>
                            <input type="text" name="txtcontract" id="txtcontract" placeholder="Press F3 To Search" onKeyDown="getcontract(event);" readonly value='<s:property value="txtcontract"/>'>
                        </td>
                    </tr>
                </table>
            </div>
            
            <div class="filter-card" style="padding: 0; background: transparent; border: none; box-shadow: none;">
                <div id="invCountgrid"><jsp:include page="invCountgrid.jsp"></jsp:include></div>
            </div>

            <div style="display: none;">
                <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
                <input type="hidden" name="invgridlength" id="invgridlength" value='<s:property value="invgridlength"/>'>
                <input type="hidden" name="trno" id="trno" value='<s:property value="trno"/>'>
                <input type="hidden" name="hidtaxconfig" id="hidtaxconfig" value='<s:property value="hidtaxconfig"/>'>
            </div>
            
        </div>
    </div>

    <div class="main-content-area">
        
        <div class="grid-container">
            <div id="profinvdiv"><jsp:include page="serviceCompletionGrid.jsp"></jsp:include></div>
        </div>
        
        <%-- 
        <div class="split-grid-row">
            <div id="profserdetdiv"><jsp:include page="serviceDetGrid.jsp"></jsp:include></div>
            <div id="profinvdetdiv"><jsp:include page="invDetGrid.jsp"></jsp:include></div>
        </div>
        --%>
        
    </div>

</div>

<div id="clientsearch1">
   <div ></div>
</div>
<div id="contractwindow">
   <div ></div>
</div>

</div>
</form>
</body>
</html>