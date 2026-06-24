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
<script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script>

<style type="text/css">
/* ===== MASTER LAYOUT COMPLIANT WITH REFERENCE UI ===== */
body, html, #mainBG, .hidden-scrollbar {
    height: 100%;
    margin: 0;
    overflow: hidden;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
}

/* Sidebar Wrapper Layout */
.sidebar-filters {
    width: 330px;
    flex: 0 0 330px;
    background: #fff;
    border-right: 1px solid #e1e8ed;
    display: flex;
    flex-direction: column;
    height: 100%;
    box-shadow: 2px 0 8px rgba(0,0,0,.05);
    z-index: 2;
}

.sidebar-fixed-top {
    padding: 15px 20px;
    border-bottom: 1px solid #f0f4f8;
}

.sidebar-scroll-content {
    flex: 1;
    overflow-y: auto;
    padding: 15px 20px 25px;
}

/* Sidebar Custom Scrollbar */
.sidebar-scroll-content::-webkit-scrollbar {
    width: 6px;
}
.sidebar-scroll-content::-webkit-scrollbar-track {
    background: transparent;
}
.sidebar-scroll-content::-webkit-scrollbar-thumb {
    background-color: #cbd5e1;
    border-radius: 10px;
}

/* UI Cards Panels */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px;
    margin-bottom: 12px;
}

/* Layout Form Filter Grids */
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
    white-space: nowrap; 
    line-height: 1.2;
}

/* ===== ENFORCED UNIFORM 24px GRID INPUTS ELEMENTS ===== */
input[type="text"], select,
.release-filter-table input[type="text"],
.release-filter-table select {
    width: 100%;
    height: 24px;
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

/* Specific styling for Textarea */
textarea, .release-filter-table textarea {
    width: 100%;
    padding: 6px 8px;
    border: 1px solid #ccd6e0 !important;
    border-radius: 4px;
    font-size: 12px;
    background-color: #ffffff !important;
    box-sizing: border-box;
    color: #333;
    resize: none;
    outline: none;
}

/* Readonly fields styling setup */
input[readonly]:not([readonly="false"]), 
select[readonly]:not([readonly="false"]),
input:disabled, select:disabled,
.release-filter-table input[readonly] {
    background-color: #f3f6f9 !important; 
    color: #555;
    cursor: default;
}

/* Search Box Wrapper Controls */
.search-input-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    width: 100%;
}

.search-input-wrapper input[type="text"] {
    width: 100%;
    padding-right: 26px; 
    cursor: pointer;
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

/* Form Layout Container Blocks for JQX widgets */
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
    width: 100%;
}

/* ===== REQUIRED VISUAL BLUE BUTTON SCALING DEFINITIONS ===== */
.btn-primary {
    height: 28px;
    background-color: #1e6bf2;
    border: none;
    border-radius: 8px;
    color: #ffffff;
    font-size: 12px;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.2s ease, transform 0.1s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 10px;
    width: 100%;
}

.btn-primary:hover {
    background-color: #1656c7;
}

.btn-primary:active {
    transform: scale(0.98);
}

.btn-primary:disabled {
    background-color: #9abaf5;
    cursor: not-allowed;
    transform: none;
}

.btn-secondary {
    background-color: #64748b;
}

.btn-secondary:hover {
    background-color: #475569;
}

.btn-danger {
    background-color: #dc2626;
}

.btn-danger:hover {
    background-color: #b91c1c;
}

.action-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    justify-content: center;
    margin-top: 15px;
}

.action-grid button {
    flex: 1;
    min-width: 45%; 
}

/* Flexible Right Workspace Panel */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow: auto;
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
}

/* Grid Cards */
.grid-card {
    background: #fff;
    border: 1px solid #e1e8ed;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 15px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.02);
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	
	   $('#docwindow').jqxWindow({ width: '20%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'DocNo Search' ,position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	   $('#docwindow').jqxWindow('close');
	   $('#dtypewindow').jqxWindow({ width: '20%', height: '60%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'DocType Search' ,position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	   $('#dtypewindow').jqxWindow('close');
	   
       $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	   $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	   
	   $('#doctype').dblclick(function(){
	  	  $('#dtypewindow').jqxWindow('open');
	  	  dtypeSearchContent('dtypesearch.jsp?', $('#dtypewindow')); 
       }); 
	   
       // Enforced 24px JQX Criteria
	   $("#fromdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	   $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	   
       var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	   var onemounth=new Date(new Date(fromdates).setMonth(fromdates.getMonth()-1)); 
	    
       $('#fromdate').jqxDateTimeInput('setDate', new Date(onemounth));
	   $('#todate').on('change', function (event) {
		   var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
		 	 var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
		   if(fromdates>todates){
			   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
		       return false;
		  }   
	   });
});

function funExportBtn(){
	$("#detailsgrid").jqxGrid('exportdata', 'xls', 'Rental List');
}

function getdtype(event){
	 var x= event.keyCode;
	 if(x==114){
	     $('#dtypewindow').jqxWindow('open');
	     dtypeSearchContent('dtypesearch.jsp?', $('#dtypewindow'));    
     }
} 

function dtypeSearchContent(url) {
    $.get(url).done(function (data) {
        $('#dtypewindow').jqxWindow('open');
        $('#dtypewindow').jqxWindow('setContent', data);
	}); 
} 

function getdocno(event){
	var dtype=$("#doctype").val();
	if(dtype==""){
		$.messager.alert('Message','Select a Document Type To Continue  ','warning');
		return 0;
	}
	
	var x= event.keyCode;
	if(x==114){
	    $('#docwindow').jqxWindow('open');
	    docnoSearchContent('docsearch.jsp?dtype='+dtype, $('#docwindow'));    
    }
} 

function docnoSearchContent(url) {
    $.get(url).done(function (data) {
        $('#docwindow').jqxWindow('open');
        $('#docwindow').jqxWindow('setContent', data);
	}); 
}  

function funreload(event) {
	var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
	var todates=new Date($('#todate').jqxDateTimeInput('getDate')); //del date
		 	 
	if(fromdates>todates){
		$.messager.alert('Message','To Date Less Than From Date  ','warning');   
	    return false;
	} else {
	    var barchval = document.getElementById("brhid").value;
        var fromdate= $("#fromdate").val();
	    var todate= $("#todate").val(); 
	    $("#overlay, #PleaseWait").show();
	    $("#detlist").load("detailsGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&doc_no="+document.getElementById("doc_no").value+"&dtype="+$("#doctype").val());
	}
}

function funcleardata() {
	document.getElementById("doc_no").value="";
	document.getElementById("doctype").value="";
	document.getElementById("brhid").value="";
	document.getElementById("reason").value="";
	
	if (document.getElementById("doc_no").value == "") {
	    $('#doc_no').attr('placeholder', 'Press F3 TO Search'); 
	}
	if (document.getElementById("doctype").value == "") {
	    $('#doctype').attr('placeholder', 'Press F3 TO Search'); 
	}
	if (document.getElementById("brhid").value == "") {
	    $('#brhid').attr('placeholder', 'Press F3 TO Search'); 
	}
}
	
function saveApprremove() {  
	if($("#doc_no").val()=="" || $("#doctype").val()=="" || $("#brhid").val()==""){
		 $.messager.alert('Message','Select an Approval to Remove  ','warning');
		 return 0;
	}

    $.ajaxFileUpload({  
        url:'removeApprove.action?docno='+$("#doc_no").val()+'&dtype='+$("#doctype").val()+'&brchid='+$("#brhid").val()+'&reason='+$("#reason").val(),
        secureuri:false,//false  
        fileElementId:'file',//id  <input type="file" id="file" name="file" />  
        dataType: 'String',// json  
        success: function (data, status) {  
           if(status=='success'){
          	   $("#detlist").load("detailsGrid.jsp?barchval="+$("#brhid").val()+"&fromdate="+$("#fromdate").val()+"&todate="+$("#todate").val()+"&doc_no="+$("#doc_no").val()+"&dtype="+$("#doctype").val());
               $.messager.show({title:'Message',msg:'Approval Removed Successfully',showType:'show',
                  style:{left:15,right:'',top:document.body.scrollTop+document.documentElement.scrollTop,bottom:''}
              }); 
            }
           
            if(typeof(data.error) != 'undefined') {  
                if(data.error != '') {  
                    $.messager.show({title:'Message',msg: data.error,showType:'show',
                        style:{left:'',right:27,top:document.body.scrollTop+document.documentElement.scrollTop,bottom:''}
                    }); 
                } else {  
                    $.messager.show({title:'Message',msg: data.message,showType:'show',
                        style:{left:'',right:27,top:document.body.scrollTop+document.documentElement.scrollTop,bottom:''}
                    }); 
                }  
            }  
        },  
        error: function (data, status, e) {  
            $.messager.alert('Message',e);
        }  
    });  
    return false;  
}

</script>
</head>

<body onload="getBranch();">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<div class="master-container">

    <div class="sidebar-filters">
        <div class="sidebar-fixed-top">
            <div class="filter-card" style="padding: 10px; margin-bottom: 0;">
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
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">DocType</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="doctype" id="doctype" placeholder="Double click to search" readonly="readonly" onKeyDown="getdtype(event);" ondblclick="getdtype(event);" value='<s:property value="doctype"/>'>
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">DocNo</td>
                        <td>
                            <div class="search-input-wrapper">
                                <input type="text" name="doc_no" id="doc_no" placeholder="Double click to search" readonly="readonly" onkeydown="getdocno(event)" ondblclick="getdocno(event)" onclick="this.placeholder=''" value='<s:property value="doc_no"/>'>
                                <div class="search-icon"></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Reason</td>
                        <td>
                            <textarea name="reason" id="reason" style="height: 60px;"><s:property value="reason"/></textarea>
                        </td>
                    </tr>
                </table>

                <div class="action-grid">
                    <button type="button" class="btn-primary btn-secondary" name="clear" id="clear" onclick="funcleardata()">Clear</button>
                    <button type="button" class="btn-primary btn-danger" name="Remove" id="remove" onclick="saveApprremove()">Remove Approval</button>
                </div>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id='paychaaaaa' style="width: 100%; height: 100px;"></div>
            </div>

            <input type="hidden" name="brhid" id="brhid" value='<s:property value="brhid"/>'>

        </div>
    </div>

    <div class="main-content-area">
        <div class="grid-card">
            <div id="detlist">
                <jsp:include page="detailsGrid.jsp"></jsp:include>
            </div>
        </div>
    </div>

</div>

<div id="clientwindow"><div></div></div>
<div id="fleetwindow"><div></div></div>
<div id="groupwindow"><div></div></div>
<div id="docwindow"><div></div></div>
<div id="dtypewindow"><div></div></div>

</div> 
</div>
</body>
</html>