
<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<link href="../../../../css/dashboard.css" media="screen" rel="stylesheet" type="text/css" />  
<script type="text/javascript" src="<%=contextPath%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/resample.js"></script>
<%-- <script type="text/javascript" src="../../js/dashboard.js"></script> --%> 
<script type="text/javascript">

$(document).ready(function () {
	 
	 
	
	     $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	     $("body").prepend('<div id="overlaysub" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWaitsub' style='display: none;position:absolute; z-index: 1;top:230px;left:120px;'><img src='../../../../icons/31load.gif'/></div>");

	     $('#fieldexpdocmnt').hide();
	     $('#chkvalue').val("1");
	/*  $("#fromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"}); */
	/*  $("#todate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"}); */
	 $("#expfromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#exptodate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#expupdatefromdate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy",enableBrowserBoundsDetection:true});
	 $("#expupdatetodate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy",enableBrowserBoundsDetection:true});
	 $("#date").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
	 $("#uptodate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
/* 	 var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate'));
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
	 }); */
	 $("#branchlabel").css("opacity","0");$("#branchdiv").css("opacity","0");
	 fundisable();
	 $('#uptodate').hide();
	 $('#uptodatelbl').hide();
	
});

function funreload(event)
{
	/* var fromdates=new Date($('#fromdate').jqxDateTimeInput('getDate')); */
// out date
	 /* var todates=new Date($('#todate').jqxDateTimeInput('getDate'));  */
 /* if(fromdates>todates){
	   $.messager.alert('Message','To Date Less Than From Date  ','warning');   
	 
 return false;
}  */
	 var barchval = document.getElementById("cmbbranch").value;
     /* var fromdate= $("#fromdate").val(); */
	/*  var todate= $("#todate").val(); */
	 var uptodate= $("#uptodate").val();
	 var chk_val= $('#chkvalue').val();
  $("#overlaysub, #PleaseWaitsub").show();
 $("#docmntControlReg").load("docmntControlRegGrid.jsp?branchval="+barchval+"&id=1"+"&chk_val="+chk_val+"&uptodate="+uptodate);
  fundisable();
	}
	

function funchangeinfo()
{
	
	 $('#date').jqxDateTimeInput( 'focus');
	
	}
function fundisable(){
	$('#datadelete').attr('disabled',true);  
	$('#dataupdate').attr('disabled',true);
	$('#update').attr('disabled',true);
	$('#txtdocnameupd').val("");
	$('#txtdescupd').val("");
	$('#txtnoteupd').val("");
	$('#txtdocnameupd').attr('disabled',true);
	$('#txtdescupd').attr('disabled',true);
	$('#expupdatefromdate').jqxDateTimeInput({disabled:true});
	$('#expupdatetodate').jqxDateTimeInput('disabled',true);
	$('#txtnoteupd').attr('disabled',true);
	 
	
}
function funchkval(){
	 if (document.getElementById('chknew').checked) {
		 $('#uptodate').hide();
		 $('#uptodatelbl').hide();
		 $('#fieldnewdocmnt').show();
		 $('#fieldupdatedocmnt').show();
		 $('#fieldexpdocmnt').hide();
		 $('#chkvalue').val("1");
		 $('#docCntrlRegId').jqxGrid('clear');
		 $('#txtdocnameupd').val("");
			$('#txtdescupd').val("");
			$('#txtnoteupd').val("");
			$('#txtdocnameupd').attr('disabled',true);
			$('#txtdescupd').attr('disabled',true);
			$('#expupdatefromdate').jqxDateTimeInput({disabled:true});
			$('#expupdatetodate').jqxDateTimeInput('disabled',true);
			$('#uptodate').jqxDateTimeInput('disabled',false);
			 $('#uptodate').jqxDateTimeInput({disabled:true});
			$('#txtnoteupd').attr('disabled',true);
			$('#update').attr('disabled',true);
			$('#dataupdate').attr('disabled',true); 
			$('#datadelete').attr('disabled',true);
	 	}
	 else if (document.getElementById('chkexpd').checked) {
		 $('#uptodate').show();
		 $('#uptodatelbl').show();
		 $('#uptodate').jqxDateTimeInput({disabled:false});
		 $('#fieldnewdocmnt').hide();
		 $('#fieldupdatedocmnt').hide();
		 $('#fieldexpdocmnt').show();
		 $('#chkvalue').val("2");
		 $('#docCntrlRegId').jqxGrid('clear');
	 }
	 }
	 
function funupdate(){
	 var date=$('#date').val();
	 var docno=$('#hidocno').val();
	 
	  $.messager.confirm('Message', 'Do you want to save changes?', function(r){
	     	  
		        
	     	if(r==false)
	     	  {
	     		return false; 
	     	  }
	     	else{
	     		 updatedata(docno,date);	
	     	}
		     });
	
	
	
}
function updatedata(docno,date)
{
	
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
	if (x.readyState==4 && x.status==200)
		{
		
     			
			var items=x.responseText;
			 if(items==1){		
			 
			  $('#date').val(new Date());
			  $.messager.alert('Message', '  Record Successfully Updated ', function(r){
				  var barchval = document.getElementById("cmbbranch").value;
				     /* var fromdate= $("#fromdate").val(); */
					/*  var todate= $("#todate").val(); */
					 var chk_val= $('#chkvalue').val();
				  $("#overlaysub, #PleaseWaitsub").show();
				 $("#docmntControlReg").load("docmntControlRegGrid.jsp?branchval="+barchval+"&id=1"+"&chk_val="+chk_val);
				  
		 		 
			     
		     });
			 funreload(event); 
			 fundisable();
			 }
			}
	}
		
x.open("GET","savedata.jsp?docno="+docno+"&date="+date+"&op=2",true);

x.send();
		
}

 function funupdatedata(){     
	 if(document.getElementById("txtdocnameupd").value=="")
	 {
		 $.messager.alert('Message','Enter Doc.Name ','warning');   
		 return 0;
	 } 
	 if($('#txtdescupd').val()=="") 
	 {
		 $.messager.alert('Message','Enter Description ','warning');   
		 return 0;
	 }
	 var desc = document.getElementById("txtdescupd").value;
	 var nmax = desc.length;
      if(nmax>99)
   	   {
   	  $.messager.alert('Message',' Description cannot contain more than 100 characters ','warning');   
   	
			return false; 
   	   } 
      if($('#txtnoteupd').val()=="") 
 	 {
 		 $.messager.alert('Message','Enter Note ','warning');   
 		 return 0;
 	 }
 	 var note =document.getElementById("txtnoteupd").value;
 	 var nmax1 =note.length;
       if(nmax1>99)
    	   {
    	  $.messager.alert('Message',' Note cannot contain more than 100 characters ','warning');   
    	
 			return false; 
    	   } 
      
       /* var expfromdates=$('#expfromdate').val();
	   var exptodates=$('#exptodate').val(); */
	   var expupfromdates1=new Date($('#expupdatefromdate').jqxDateTimeInput('getDate'));
	   var expuptodates1=new Date($('#expupdatetodate').jqxDateTimeInput('getDate'));
	   if(expupfromdates1>expuptodates1){
			   
			   $.messager.alert('Message','Issue Date Less Than Exp.From Date  ','warning');   
			 
		   return false;
		  } 
	   $('#expupdatetodate').on('change', function (event) {
		    
		      var fdate=new Date($('#expupdatetodate').jqxDateTimeInput('getDate'));
		      var curdate=new Date(); 
		      fdate.setHours(0,0,0,0);
		      curdate.setHours(0,0,0,0);
		      if(fdate<curdate){
		       
		       $.messager.alert('Message','Select Future Date','warning');   
		       $('#expupdatetodate').jqxDateTimeInput('setDate', new Date());
		     
		      return false;
		     } 
	   });     
     var doc_name=document.getElementById("txtdocnameupd").value;
	 var desc=document.getElementById("txtdescupd").value;
	 var note=document.getElementById("txtnoteupd").value;
	 var brchid=<%=session.getAttribute("BRANCHID")%>;
	 var userid=<%=session.getAttribute("USERID")%>;
	 var expupfromdates=$('#expupdatefromdate').val();
	 var expuptodates=$('#expupdatetodate').val();
	 var op="3";
	 var docno=$('#hidocno').val();
	 $.messager.confirm('Message', 'Do you want to save changes?', function(r){
	     	  
		        
	     	if(r==false)
	     	  {
	     		return false; 
	     	  }
	     	else{
	     		updatedata1(doc_name,desc,note,expupfromdates,expuptodates,brchid,userid,docno,op);	
	     	}
		     });
	
	
	
}
 function updatedata1(doc_name,desc,note,expfromdates,exptodates,brchid,userid,docno,op)
 {
 	
 	var x=new XMLHttpRequest();
 	x.onreadystatechange=function(){
 	if (x.readyState==4 && x.status==200)
 		{
 		
      			
 			var items=x.responseText;
 			 if(items==1){
 			 document.getElementById("txtdocname").value="";
 			 document.getElementById("txtdesc").value="";
 			 document.getElementById("txtnote").value="";
 			
 			 
 			  $('#date').val(new Date());
 			  $.messager.alert('Message', '  Record Successfully Updated', function(r){
 				  var barchval = document.getElementById("cmbbranch").value;
 				     /* var fromdate= $("#fromdate").val(); */
 					/*  var todate= $("#todate").val(); */
 					 var chk_val= $('#chkvalue').val();
 				  $("#overlaysub, #PleaseWaitsub").show();
 				 $("#docmntControlReg").load("docmntControlRegGrid.jsp?branchval="+barchval+"&id=1"+"&chk_val="+chk_val);
 		     });
 			 fundisable();
 			 funreload(event); 
 			 }
 			}
 	}
 		
 x.open("GET","savedata.jsp?doc_name="+doc_name+"&desc="+desc+"&note="+note+"&expfromdates="+expfromdates+"&exptodates="+exptodates+"&brchid="+brchid+"&userid="+userid+"&op="+op+"&docno="+docno,true);

 x.send();
 		
 }	 
 
function funsave()
{
	
	  if(document.getElementById("txtdocname").value=="")
	 {
		 $.messager.alert('Message','Enter Doc.Name ','warning');   
		 return 0;
	 } 
	 if($('#txtdesc').val()=="") 
	 {
		 $.messager.alert('Message','Enter Description ','warning');   
		 return 0;
	 }
	 var desc = document.getElementById("txtdesc").value;
	 var nmax = desc.length;
      if(nmax>99)
   	   {
   	  $.messager.alert('Message',' Description cannot contain more than 100 characters ','warning');   
   	
			return false; 
   	   } 
      if($('#txtnote').val()=="") 
 	 {
 		 $.messager.alert('Message','Enter Note ','warning');   
 		 return 0;
 	 }
 	 var note =document.getElementById("txtnote").value;
 	 var nmax1 =note.length;
       if(nmax1>99)
    	   {
    	  $.messager.alert('Message',' Note cannot contain more than 100 characters ','warning');   
    	
 			return false; 
    	   } 
      
       /* var expfromdates=$('#expfromdate').val();
	   var exptodates=$('#exptodate').val(); */
	   var expfromdates1=new Date($('#expfromdate').jqxDateTimeInput('getDate'));
	   var exptodates1=new Date($('#exptodate').jqxDateTimeInput('getDate'));
	   if(expfromdates1>exptodates1){
			   
			   $.messager.alert('Message','Issue Date Less Than Exp.From Date  ','warning');   
			 
		   return false;
		  } 
	   $('#exptodate').on('change', function (event) {
		    
		      var fdate=new Date($('#exptodate').jqxDateTimeInput('getDate'));
		      var curdate=new Date(); 
		      fdate.setHours(0,0,0,0);
		      curdate.setHours(0,0,0,0);
		      if(fdate<curdate){
		       
		       $.messager.alert('Message','Select Future Date','warning');   
		       $('#exptodate').jqxDateTimeInput('setDate', new Date());
		     
		      return false;
		     } 
	   });     
     var doc_name=document.getElementById("txtdocname").value;
	 var desc=document.getElementById("txtdesc").value;
	 var note=document.getElementById("txtnote").value;
	 var brchid=<%=session.getAttribute("BRANCHID")%>;
	 var userid=<%=session.getAttribute("USERID")%>;
	 var expfromdates=$('#expfromdate').val();
	 var exptodates=$('#exptodate').val();
	 var op="1";
	  $.messager.confirm('Message', 'Do you want to save changes?', function(r){
	     	  
		        
	     	if(r==false)
	     	  {
	     		return false; 
	     	  }
	     	else{
	     		 savedata(doc_name,desc,note,expfromdates,exptodates,brchid,userid,op);	
	     	}
		     });
	
	
	
}
function savedata(doc_name,desc,note,expfromdates,exptodates,brchid,userid,op)
{
	
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
	if (x.readyState==4 && x.status==200)
		{
		
     			
			var items=x.responseText;
			 if(items==1){
			 document.getElementById("txtdocname").value="";
			 document.getElementById("txtdesc").value="";
			 document.getElementById("txtnote").value="";
			
			 
			  $('#date').val(new Date());
			  $.messager.alert('Message', '  Record Successfully Saved', function(r){
				  var barchval = document.getElementById("cmbbranch").value;
				     /* var fromdate= $("#fromdate").val(); */
					 /* var todate= $("#todate").val(); */
					 var chk_val= $('#chkvalue').val();
				  $("#overlaysub, #PleaseWaitsub").show();
				 $("#docmntControlReg").load("docmntControlRegGrid.jsp?branchval="+barchval+"&id=1"+"&chk_val="+chk_val);
				  
		 		 
			     
		     });
			 funreload(event); 
			 fundisable();
			 }
			}
	}
		
x.open("GET","savedata.jsp?doc_name="+doc_name+"&desc="+desc+"&note="+note+"&expfromdates="+expfromdates+"&exptodates="+exptodates+"&brchid="+brchid+"&userid="+userid+"&op="+op,true);
x.send();
}
function funExportBtn(){
	//JSONToCSVCon(documentntcontrolexcel, 'Document Control Register', true);
	$("#docmntControlReg").excelexportjs({
		containerid: "docmntControlReg",
		datatype: 'json',
		dataset: null,
		gridId: "docCntrlRegId",
		columns: getColumns("docCntrlRegId") ,
		worksheetName:"Document Control Register"
		});
}
function fundeletedata(){
	 var doc_name=document.getElementById("txtdocname").value;
	 var desc=document.getElementById("txtdesc").value;
	 var note=document.getElementById("txtnote").value;
	 var brchid=<%=session.getAttribute("BRANCHID")%>;
	 var userid=<%=session.getAttribute("USERID")%>;    
	 var expfromdates=$('#expfromdate').val();
	 var exptodates=$('#exptodate').val();
	 var op="4";
	 var docno=$('#hidocno').val();
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
	if (x.readyState==4 && x.status==200)
		{
			var items=x.responseText;
			 if(items==1){
			 document.getElementById("txtdocname").value="";
			 document.getElementById("txtdesc").value="";
			 document.getElementById("txtnote").value="";
			  $('#date').val(new Date());
			  $.messager.alert('Message', '  Record Successfully Deleted', function(r){
				  var barchval = document.getElementById("cmbbranch").value;
				     /* var fromdate= $("#fromdate").val(); */
					/*  var todate= $("#todate").val(); */
					 var chk_val= $('#chkvalue').val();
				  $("#overlaysub, #PleaseWaitsub").show();
				 $("#docmntControlReg").load("docmntControlRegGrid.jsp?branchval="+barchval+"&id=1"+"&chk_val="+chk_val);
		     });
			 fundisable();
			 funreload(event); 
			 }
			}
	}
x.open("GET","savedata.jsp?doc_name="+doc_name+"&desc="+desc+"&note="+note+"&expfromdates="+expfromdates+"&exptodates="+exptodates+"&brchid="+brchid+"&userid="+userid+"&op="+op+"&docno="+docno,true);
x.send();
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

/* ===== CARDS & HEADERS ===== */
.filter-card {
    background: #f8fafc;
    border: 1px solid #e3e8ee;
    border-radius: 12px;
    padding: 15px 12px;
    margin-bottom: 15px;
}

.card-header {
    font-size: 13px; 
    font-weight: 700; 
    color: #334155; 
    margin-bottom: 15px; 
    border-bottom: 1px solid #e3e8ee;
    padding-bottom: 6px;
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
    width: 95px; 
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

/* ===== STRICT DISABLED & READONLY STYLING ===== */
input[readonly], select[readonly], textarea[readonly],
input:disabled, select:disabled, textarea:disabled,
input[disabled="true"], select[disabled="true"], textarea[disabled="true"] {
    background-color: #e2e8f0 !important; /* Deeper, obvious grey */
    color: #64748b !important; /* Faded text */
    cursor: not-allowed !important; /* Locked hover icon */
    border-color: #cbd5e1 !important;
    opacity: 1 !important; 
}

/* Radio Button Layout */
.radio-group {
    display: flex;
    flex-direction: column;
    gap: 8px;
    margin-bottom: 12px;
    padding-bottom: 12px;
    border-bottom: 1px solid #e2e8f0;
}
.radio-row {
    display: flex;
    align-items: center;
    gap: 6px;
    cursor: pointer;
}
.radio-row label {
    font-size: 12px;
    font-weight: 600;
    color: #4e5e71;
    cursor: pointer;
}
.radio-row input[type="radio"] {
    margin: 0;
    cursor: pointer;
}

/* jqx date containers */
.release-filter-table div[id^="uptodate"],
.release-filter-table div[id^="exp"],
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
<body onload="setval()">
<div id="mainBG" class="homeContent" data-type="background"> 
<div class='hidden-scrollbar'>

<table width="100%" cellspacing="0" cellpadding="0" style="height: 100%;">
<tr>

<!-- Sidebar Cell -->
<td width="310" style="width: 310px; min-width: 310px; padding: 0;">
    
    <!-- THE FIXED SIDEBAR -->
    <div class="fixed-sidebar-container">
        <div class="sidebar-content-padding">
            
            <div class="filter-card">
                <jsp:include page="../../heading.jsp"></jsp:include>
            </div>

            <!-- Main Filter/Mode Card -->
            <div class="filter-card">
                <div class="radio-group">
                    <div class="radio-row">
                        <input type="radio" name="chk" checked="checked" id="chknew" value="out" onchange="funchkval()">
                        <label for="chknew">New Document</label>
                    </div>
                    <div class="radio-row">
                        <input type="radio" name="chk" id="chkexpd" value="in" onchange="funchkval()">
                        <label for="chkexpd">Expired Document</label>
                    </div>
                </div>

                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell" id="uptodatelbl">Upto Date</td>
                        <td><div id='uptodate' name='uptodate' value='<s:property value="uptodate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <!-- Dynamic UI Sections Wrapper (Maintained original wrapper ID for safety) -->
            <div id="divprocess">

                <!-- New Document Section -->
                <div class="filter-card" id="fieldnewdocmnt">
                    <div class="card-header">New Document</div>
                    <table class="release-filter-table">
                        <tr>
                            <td class="label-cell">Document Name</td>
                            <td><input type="text" id="txtdocname" name="txtdocname" value='<s:property value="txtdocname"/>'></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Description</td>
                            <td><input type="text" id="txtdesc" name="txtdesc" value='<s:property value="txtdesc"/>'></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Issue Date</td>
                            <td><div id='expfromdate' name='expfromdate' value='<s:property value="expfromdate"/>'></div></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Exp. Date</td>
                            <td><div id='exptodate' name='exptodate' value='<s:property value="exptodate"/>'></div></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Notes</td>
                            <td><input type="text" id="txtnote" name="txtnote" value='<s:property value="txtnote"/>'></td>
                        </tr>
                    </table>
                    <div class="release-actions">
                        <button type="button" name="save" id="save" class="btn-submit" onclick="funsave()">Save</button>
                    </div>
                </div>

                <!-- Update Document Section -->
                <div class="filter-card" id="fieldupdatedocmnt">
                    <div class="card-header">Update Document</div>
                    <table class="release-filter-table">
                        <tr>
                            <td class="label-cell">Document Name</td>
                            <td><input type="text" id="txtdocnameupd" name="txtdocnameupd" value='<s:property value="txtdocnameupd"/>'></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Description</td>
                            <td><input type="text" id="txtdescupd" name="txtdescupd" value='<s:property value="txtdescupd"/>'></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Notes</td>
                            <td><input type="text" id="txtnoteupd" name="txtnoteupd" value='<s:property value="txtnoteupd"/>'></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Issue Date</td>
                            <td><div id='expupdatefromdate' name='expupdatefromdate' value='<s:property value="expupdatefromdate"/>'></div></td>
                        </tr>
                        <tr>
                            <td class="label-cell">Exp. Date</td>
                            <td><div id='expupdatetodate' name='expupdatetodate' value='<s:property value="expupdatetodate"/>'></div></td>
                        </tr>
                    </table>
                    <div class="release-actions">
                        <button type="button" name="dataupdate" id="dataupdate" class="btn-submit" onclick="funupdatedata()">Update</button>
                        <button type="button" name="datadelete" id="datadelete" class="btn-submit btn-danger" onclick="fundeletedata()">Delete</button>
                    </div>
                </div>

                <!-- Extend Expiry Section -->
                <div class="filter-card" id="fieldexpdocmnt">
                    <div class="card-header">Extend Exp. Date</div>
                    <table class="release-filter-table">
                        <tr>
                            <td class="label-cell">Extend To</td>
                            <td><div id='date' name='date' value='<s:property value="date"/>'></div></td>
                        </tr>
                    </table>
                    <div class="release-actions">
                        <button type="button" name="update" id="update" class="btn-submit" onclick="funupdate()">Update Exp. Date</button>
                    </div>
                </div>

            </div>

            <!-- Hidden Properties -->
            <input type="hidden" name="hidocno" id="hidocno" value='<s:property value="hidocno"/>'>
            <input type="hidden" name="chkvalue" id="chkvalue" value='<s:property value="chkvalue"/>'>

        </div>
    </div>

</td>

<!-- Main Grid Cell (Content Area) -->
<td style="height: 100%; vertical-align: top; position: relative; padding: 0; background: #fff;">
    <!-- Independent Right Side Scroller -->
    <div class="scrollable-column">
        <div style="padding: 15px;">
            <table width="100%">
                <tr>
                    <td>
                        <div id="docmntControlReg">
                            <jsp:include page="docmntControlRegGrid.jsp"></jsp:include>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</td>

</tr>
</table>

</div>
</div>
</body>
</html>