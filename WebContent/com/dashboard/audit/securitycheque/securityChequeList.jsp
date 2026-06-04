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
		 $("#uptodate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#date").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 $("#chequeDate").jqxDateTimeInput({ width: '125px', height: '15px',formatString:"dd.MM.yyyy"});
		 
		 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	     $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
		 
		 $('#txtremarks').attr('readonly', true);$('#btnupdate').attr("disabled",true);
		 
	});
	
	function funreload(event){
		 $('#txtremarks').val('');$('#txtdocno').val('');$('#txtbrhid').val('');
		 $('#btnupdate').attr("disabled",true);
			var cmbtype= document.getElementById("cmbtype").value;	

		 var branchval = document.getElementById("cmbbranch").value;
		 var uptodate = "";
		 if(document.getElementById("chktest").checked){  
		  uptodate = $('#uptodate').val();
	     }
		 $("#overlay, #PleaseWait").show();
		 
		 $("#securityChequeListDiv").load("securityChequeListGrid.jsp?branchval="+branchval+'&uptodate='+uptodate+'&cmbtype='+cmbtype+'&check=1');
		}
	
	function funUpdate(event){
		var docno = $('#txtdocno').val();
		var date = $('#date').val();
		var chequeno = $('#txtchequeno').val();
		var chequedate = $('#chequeDate').val();
		var branchid = $('#txtbrhid').val();
		var remarks = $('#txtremarks').val();
		var cmbtype= $('#cmbtype').val();	
		if(docno==''){
			 $.messager.alert('Message','Please Choose a Cheque.','warning');
			 return 0;
		 }
		
		 if(remarks==''){
			 $.messager.alert('Message','Please Enter Remarks.','warning');
			 return 0;
		 }
		
		    $.messager.confirm('Message', 'Do you want to save changes?', function(r){
			        
		     	if(r==false)
		     	  {
		     		return false; 
		     	  }
		     	else{
		     		 saveGridData(docno,date,chequeno,chequedate,branchid,remarks);	
		     	}
		 });
	}
	
	function saveGridData(docno,date,chequeno,chequedate,branchid,remarks) {
		var x=new XMLHttpRequest();
		x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200)
			{
				var items=x.responseText;

				var docno = $('#txtdocno').val('');
				var date = $('#date').val(new Date());
				var chequeno = $('#txtchequeno').val('');
				var chequedate = $('#chequeDate').val(new Date()); 
				var branchid = $('#txtbrhid').val('');
				var remarks = $('#txtremarks').val('');
				var info = $('#txtinfo').val(' ');
				
				
				$.messager.alert('Message', '  Record Successfully Updated ', function(r){
			  });
		      funreload(event); 
		  }
		}
			
	x.open("GET","saveData.jsp?docno="+docno+"&date="+date+"&chequeno="+chequeno+"&chequedate="+chequedate+"&branchid="+branchid+"&remarks="+remarks,true);
	x.send();
	}

	function funExportBtn(){
		// JSONToCSVCon(data, 'Security Cheque List', true);
		$("#securityChequeListDiv").excelexportjs({  
       		containerid: "securityChequeListDiv", 
       		datatype: 'json', 
       		dataset: null, 
       		gridId: "securityChequeList", 
       		columns: getColumns("securityChequeList") , 
       		worksheetName:"Security Cheque List"
       		});
	 }
	function disable(){
		 $('#uptodate').jqxDateTimeInput("disabled",true);
	}
	
	 function intro1check(){
		 if(document.getElementById("chktest").checked){  
			 $('#uptodate').jqxDateTimeInput({ disabled: false});  
		 }
		 else{
			 $('#uptodate').jqxDateTimeInput({ disabled: true});
		 }
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
    width: 90px; 
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

.release-filter-table input[type="checkbox"] {
    width: auto;
    height: auto;
    margin: 0;
    vertical-align: middle;
    cursor: pointer;
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

/* ===== STRICT DISABLED & READONLY STYLING (FIXED) ===== */
input[readonly="readonly"], input[readonly="true"], 
select[readonly="readonly"], select[readonly="true"], 
textarea[readonly="readonly"], textarea[readonly="true"],
input[disabled="disabled"], input[disabled="true"], input:disabled,
select[disabled="disabled"], select[disabled="true"], select:disabled,
textarea[disabled="disabled"], textarea[disabled="true"], textarea:disabled {
    background-color: #e2e8f0 !important; /* Deeper, obvious grey */
    color: #64748b !important; /* Faded text */
    cursor: not-allowed !important; /* Locked hover icon */
    border-color: #cbd5e1 !important;
    opacity: 1 !important; 
}

/* jqx date containers */
.release-filter-table div[id^="uptodate"],
.release-filter-table div[id^="date"],
.release-filter-table div[id^="chequeDate"] {
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
.release-actions {
    display: flex;
    justify-content: center;
    margin-top: 15px;
}
</style>
</head>
<body onload="getBranch();disable();">
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
                            <select id="cmbtype" name="cmbtype" value='<s:property value="cmbtype"/>'>
                                <option value="all">All</option>
                                <option value="open">Open</option>
                                <option value="closed">Closed</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell"></td>
                        <td>
                            <input type="checkbox" id="chktest" name="chktest" onchange="intro1check();" onclick="$(this).attr('value', this.checked ? 1 : 0)"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Up To</td>
                        <td><div id="uptodate" name="uptodate" value='<s:property value="uptodate"/>'></div></td>
                    </tr>
                </table>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td colspan="2">
                            <textarea id="txtinfo" name="txtinfo" readonly="readonly" style="height: 80px;"><s:property value="txtinfo"></s:property></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Remarks</td>
                        <td><input type="text" id="txtremarks" name="txtremarks" value='<s:property value="txtremarks"/>'/></td>
                    </tr>
                </table>

                <div class="release-actions">
                    <button type="button" class="btn-submit" id="btnupdate" name="btnupdate" onclick="funUpdate(event);">Close</button>
                </div>
            </div>

            <input type="hidden" name="hidcmbtype" id="hidcmbtype" value='<s:property value="hidcmbtype"/>'>
            <input type="hidden" id="txtchequeno" name="txtchequeno" readonly="readonly" value='<s:property value="txtchequeno"/>'/>
            <input type="hidden" name="txtbrhid" id="txtbrhid" value='<s:property value="txtbrhid"/>'>
            <input type="hidden" id="txtdocno" name="txtdocno" readonly="readonly" value='<s:property value="txtdocno"/>'/>
            
            <div style="display:none;" id='chequeDate' name='chequeDate' value='<s:property value="chequeDate"/>'></div>
            <div style="display:none;" id='date' name='date' value='<s:property value="date"/>'></div>

        </div>
    </div>

</td>

<td style="height: 100%; vertical-align: top; position: relative; padding: 0; background: #fff;">
    <div class="scrollable-column">
        <div style="padding: 15px;">
            <table width="100%">
                <tr>
                    <td>
                        <div id="securityChequeListDiv">
                            <jsp:include page="securityChequeListGrid.jsp"></jsp:include>
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