
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
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%>
<script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script>

 
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
	   
	 $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
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
});
function funExportBtn(){
	   $("#detailsgrid").jqxGrid('exportdata', 'xls', 'Rental List');
	 }
function getdtype(event){
	 var x= event.keyCode;
	 if(x==114){
	  $('#dtypewindow').jqxWindow('open');
	dtypeSearchContent('dtypesearch.jsp?', $('#dtypewindow'));    }
	 else{
		 }
	 } 
function dtypeSearchContent(url) {
	 //alert(url);
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
	docnoSearchContent('docsearch.jsp?dtype='+dtype, $('#docwindow'));    }
	 else{
		 }
	 } 
function docnoSearchContent(url) {
	 //alert(url);
		 $.get(url).done(function (data) {
			 
			 $('#docwindow').jqxWindow('open');
		$('#docwindow').jqxWindow('setContent', data);

	}); 
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
	 var barchval = document.getElementById("brhid").value;
     var fromdate= $("#fromdate").val();
	 var todate= $("#todate").val(); 
	   $("#overlay, #PleaseWait").show();
	  $("#detlist").load("detailsGrid.jsp?barchval="+barchval+"&fromdate="+fromdate+"&todate="+todate+"&doc_no="+document.getElementById("doc_no").value+"&dtype="+$("#doctype").val());
	
		   }
	}




function  funcleardata()
{
	
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
	
	
function saveApprremove()  
{  

	if($("#doc_no").val()=="" || $("#doctype").val()=="" || $("#brhid").val()==""){
		
		 $.messager.alert('Message','Select an Approval to Remove  ','warning');
		
		//alert('Select an Approval to Remove');
		
		return 0;
		
	}
/*  var reftypid=document.getElementById("reftypid").value; */     
	/* alert("===docno==="+$("#hidocno").val()+"===&dtype="+$("#hidtype").val()+"&userid===="+$("#hiuserid").val()+"==&brchid="+$("#hibrchid").val()+"===&desc="+$("#txtdesc").val()); */
    $.ajaxFileUpload  
    (  
        {  
            url:'removeApprove.action?docno='+$("#doc_no").val()+'&dtype='+$("#doctype").val()+'&brchid='+$("#brhid").val()+'&reason='+$("#reason").val(),
            secureuri:false,//false  
            fileElementId:'file',//id  <input type="file" id="file" name="file" />  
            dataType: 'String',// json  
            success: function (data, status)  //  
            {  
                //alert(data.message);//jsonmessage,messagestruts2
           	
         //       $('#refreshdiv').load();
                <%-- var data='<%= com.common.ClsAttach.reload(docNo) %>';
                alert("============="+data); --%>
               if(status=='success'){
              	 
            		  $("#detlist").load("detailsGrid.jsp?barchval="+$("#brhid").val()+"&fromdate="+$("#fromdate").val()+"&todate="+$("#todate").val()+"&doc_no="+$("#doc_no").val()+"&dtype="+$("#doctype").val());
            	   
            	   
                   $.messager.show({title:'Message',msg:'Approval Removed Successfully',showType:'show',
                      style:{left:15,right:'',top:document.body.scrollTop+document.documentElement.scrollTop,bottom:''}
                  }); 
                }
               
                if(typeof(data.error) != 'undefined')  
                {  
                    if(data.error != '')  
                    {  
                        //$.messager.alert('Message',data.error);
                        $.messager.show({title:'Message',msg: data.error,showType:'show',
                            style:{left:'',right:27,top:document.body.scrollTop+document.documentElement.scrollTop,bottom:''}
                        }); 
                    }else  
                    {  
                        //$.messager.alert('Message',data.message);
                        $.messager.show({title:'Message',msg: data.message,showType:'show',
	                            style:{left:'',right:27,top:document.body.scrollTop+document.documentElement.scrollTop,bottom:''}
	                        }); 
                    }  
                }  
            },  
            error: function (data, status, e)//  
            {  
                //alert(e);  
                $.messager.alert('Message',e);
            }  
        }  
    )  
    return false;  
}

	


</script>
<style>
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

</style>

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
.release-filter-table div[id^="fromdate"],
.release-filter-table div[id^="todate"] {
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
.btn-secondary {
    background: #64748b;
}
.btn-secondary:hover {
    background: #475569;
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

/* ===== SEARCH FIELD OVERRIDE: Keep search fields white and clickable even if readonly ===== */
.search-input-wrapper input[type="text"][readonly],
.search-input-wrapper input[type="text"][readonly="readonly"] {
    background-color: #ffffff !important; 
    color: #333 !important;
    cursor: pointer !important; /* Shows the pointer finger to indicate it's clickable */
    border-color: #ccd6e0 !important;
}
</style>
<script>

</script>
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
                            <textarea name="reason" id="reason" style="height: 90px;"><s:property value="reason"/></textarea>
                        </td>
                    </tr>
                </table>

                <div class="release-actions">
                    <button type="button" class="btn-submit btn-secondary" name="clear" id="clear" onclick="funcleardata()">Clear</button>
                    <button type="button" class="btn-submit btn-danger" name="Remove" id="remove" onclick="saveApprremove()">Remove Approval</button>
                </div>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id='paychaaaaa' style="width: 100%; height: 100px;"></div>
            </div>

            <input type="hidden" name="brhid" id="brhid" value='<s:property value="brhid"/>'>

        </div>
    </div>

</td>

<td style="vertical-align: top; padding: 0; background: #fff; height: 100%;">
    
    <div style="position: relative; height: 100%; width: 100%;">
        
        <div class="scrollable-column">
            <div class="main-content-padding">
                <table width="100%">
                    <tr>
                        <td>
                            <div id="detlist">
                                <jsp:include page="detailsGrid.jsp"></jsp:include>
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

<div id="clientwindow"><div></div></div>
<div id="fleetwindow"><div></div></div>
<div id="groupwindow"><div></div></div>
<div id="docwindow"><div></div></div>
<div id="dtypewindow"><div></div></div>

</div> 
</div>
</body>
</html>
	 