<jsp:include page="../../../../includes.jsp"></jsp:include>    
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String contextPath=request.getContextPath();
 %>
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
    overflow: hidden;
}

.master-container {
    display: flex;
    width: 100%;
    height: 100vh;
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    background-color: #f4f7f9;
}

/* Sidebar */
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
    width: 90px;
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

/* Readonly / disabled look */
input[readonly],
input:disabled {
    background-color: #f3f6f9 !important;
    color: #555;
    cursor: not-allowed;
}

/* jqx date/time containers */
.release-filter-table div[id^="todate"],
.release-filter-table div[id^="invdate"] {
    width: 100%;
}

/* Input with icon button alignment */
.input-with-button {
    display: flex;
    gap: 6px;
    align-items: center;
}

.icon-btn {
    width: 24px;
    height: 24px;
    padding: 2px;
    background: #ffffff;
    border: 1px solid #ccd6e0;
    border-radius: 4px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
}
.icon-btn img {
    width: 14px;
    height: 14px;
}
.icon-btn:hover {
    background: #f1f5f9;
}

/* Checkbox Alignment */
.checkbox-row {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    font-size: 12px;
    color: #4e5e71;
    font-weight: 600;
    margin: 10px 0;
}
.checkbox-row input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
}

/* Buttons */
.btn-submit {
    width: 100%;
    height: 32px;
    background: #2563eb;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: background 0.2s, transform 0.1s;
    margin-top: 5px;
}

.btn-submit:hover {
    background: #1d4ed8;
}

.btn-submit:active {
    transform: scale(0.98);
}

.btn-secondary {
    background: #64748b;
}

.btn-secondary:hover {
    background: #475569;
}

.button-group {
    display: flex;
    gap: 8px;
    margin-top: 15px;
}

/* Main Content Area */
.main-content-area {
    flex: 1;
    height: 100vh;
    overflow: auto;
    background: #ffffff;
    padding: 15px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.sidebar-scroll-content {
    flex: 1;
    overflow-y: auto;
    /* Apply the massive bottom padding from your working code */
    padding: 15px 20px 120px; 
    min-height: 0;
    box-sizing: border-box;
}
</style>

<script type="text/javascript">
$(document).ready(function () {
	 $("body").prepend('<div id="overlay" class="ui-widget-overlay" style="z-index: 1; display: none;"></div>');
	 $("body").prepend("<div id='PleaseWait' style='display: none;position:absolute; z-index: 1;top:180px;right:550px;'><img src='../../../../icons/31load.gif'/></div>");
	 $("body").prepend("<div id='PleaseWaitSub' style='display: none;position:absolute; z-index: 1;top:230px;left:120px;'><img src='../../../../icons/31load.gif'/></div>");
	 
     $('#clientsearch1').jqxWindow({ width: '50%', height: '55%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Client Search' , position: { x: 250, y: 120 }, keyboardCloseKey: 27});
	 $('#clientsearch1').jqxWindow('close');
		  
	 // Enforced 100% width and 24px height to match new UI standard
	 $("#todate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	 $("#invdate").jqxDateTimeInput({ width: '100%', height: '24px',formatString:"dd.MM.yyyy"});
	
	 var todates=new Date($('#todate').jqxDateTimeInput('getDate'));
	    
     $('#todate').jqxDateTimeInput('setDate', new Date());
     $('#invdate').jqxDateTimeInput('setDate', "");
    
	 $('#invdate').on('change', function (event) {
		   var invdate=new Date($('#invdate').jqxDateTimeInput('getDate'));
		   var curdate=new Date(); 
		   invdate.setHours(0,0,0,0);
		   curdate.setHours(0,0,0,0);
		   if(invdate>curdate){
			   $.messager.alert('Message','Future Date Not Allowed','warning');   
			   $('#invdate').jqxDateTimeInput('setDate', new Date());
		       return false;
		  }   
		  funDateInPeriod(invdate); 
	 });
	
     $('#txtclient').dblclick(function(){
    	 $('#clientsearch1').jqxWindow('open');
    	 clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1')); 
	 });
});

function getclinfo(event){
	 var x= event.keyCode;
	 if(x==114){
	     $('#clientsearch1').jqxWindow('open');
	     clientSearchContent('clientINgridsearch.jsp?', $('#clientsearch1'));    
	 }
} 

function clientSearchContent(url) {
    $.get(url).done(function (data) {
        $('#clientsearch1').jqxWindow('setContent', data);
    }); 
}

function funExportBtn(){    
    $("#profinvdiv").excelexportjs({    
		containerid: "profinvdiv", 
		datatype: 'json', 
		dataset: null, 
		gridId: "jqxpinvGrid", 
		columns: getColumns("jqxpinvGrid") ,        
		worksheetName:"InvoiceProcessing"
    });
}        
	
function funNotify(){
	 var branch=$('#hidcmbbranch').val();
	 if(branch=="a"){
		 $.messager.alert('Warning','Select a Branch');
		 return false;
	 }
	 var invdate=$('#invdate').val();
	 if(invdate==""){
		 $.messager.alert('Warning','Invoice Date is Madatory');
		 return false;
	 }
	 
	var z=0;
	var rows = $("#jqxpinvDetGrid").jqxGrid('getrows');                    
	if(rows.length>0 && (rows[0].tr_no=="undefined" || rows[0].tr_no==null || rows[0].tr_no=="")){
		return false;
	}
	
	var selectedRecords = new Array();
    var selectedrows=$("#jqxpinvDetGrid").jqxGrid('selectedrowindexes');
    
	if(selectedrows.length==0){
		$.messager.alert('Warning','Select a document');
		return false;
	}
	
	var invdate=new Date($('#invdate').jqxDateTimeInput('getDate'));
	invdate.setHours(0,0,0,0);
	
	if(funDateInPeriod(invdate)==1){
	   $.messager.confirm('Confirm', 'Do you want to Generate Invoice?', function(r){
            if (r){
                var i=0;
                $('#invgridlength').val(selectedrows.length);
                for(var j=0;j<selectedrows.length;j++){
                    newTextBox = $(document.createElement("input"))
				    .attr("type", "dil")
				    .attr("id", "pinv"+j)
				    .attr("name", "pinv"+j)
				    .attr("hidden","true");
					
				    newTextBox.val($('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'tr_no')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'doc_no')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'dtype')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'date')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'duedate')
						+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'cval')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'tobeinvamt')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'dueamt')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'dueafser')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'lfee')
						+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'client')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'clacno')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'sdate')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'edate')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'brch')
						+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'clientid')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'refno')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'pdid')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'ptype')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'inctax')+" :: "+$('#jqxpinvDetGrid').jqxGrid('getcellvalue',selectedrows[j],'nontax')+" :: ");
				
				    newTextBox.appendTo('form');
                }
                document.getElementById("mode").value="A";
				document.getElementById("formcode").value="PINV";
				
				$("#overlay, #PleaseWait").show();
				document.getElementById("frmdinvoice").submit();
		    }
        });
	}
}
	   
function funClear(){
	$("#jqxpinvDetGrid").jqxGrid('clear'); 
	$("#jqxpinvDetGrid").jqxGrid('addrow', null, {});
			
    document.getElementById("txtclient").value="";
    document.getElementById("clientid").value="0";
    $("#txtclient").attr("placeholder", "press F3 for Search");
}
	   
function setValues(){
	var id=1;
	var type=1;
	var dtype=$('#countdtype').val();
	var clientid=$('#clientid').val();
	var date=$('#todate').val();
	var barchval = document.getElementById("cmbbranch").value;
	
    if($('#msg').val()!=""){
		 document.getElementById("txtclient").value="";
		 document.getElementById("clientid").value="0";
		 document.getElementById("hiddeninterstate").value=0;
		 $.messager.alert('Message','<center>'+$('#msg').val()+'</center>');
		 countload(id);
		 $("#overlay, #PleaseWait").show();
		 $("#profinvdiv").load("invoiceprocessingGrid.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id+"&type="+type+"&dtype="+dtype);
	}
}
	   
function funreload() {
    var clientid=$('#clientid').val();
	var date=$('#todate').val();
	var barchval = document.getElementById("cmbbranch").value;
	var dtype="0";
	var id=1;
	
    if(barchval=="a"){
		 $.messager.alert('Warning','Select a Branch');
		 return false;
	}
	if(id>0){
	   	countload(id);
	}
}
	   
function countload(id){
	var clientid=$('#clientid').val();
	var date=$('#todate').val();
	var barchval = document.getElementById("cmbbranch").value;
	
    $("#jqxpinvGrid").jqxGrid('clear'); 
	$("#jqxInvCount").jqxGrid('clear');
	$("#jqxpinvDetGrid").jqxGrid('clear'); 
				
	$("#jqxpinvGrid").jqxGrid('addrow', null, {});
	$("#overlay, #PleaseWaitSub").show();
	$("#invCountgrid").load("invCountgrid.jsp?barchval="+barchval+"&date="+date+"&clientid="+clientid+"&id="+id);
}
	
function getprintconfig(){
	$("#btninvoiceprint").hide();
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200) {
			var res= x.responseText;
			if(res>0){
				$("#btninvoiceprint").show();
			}
		}
	}
	x.open("GET",'printconfig.jsp',true);
	x.send();
}

function funPrint(){
	var invdate=$('#invdate').val();
	
    if(invdate==""){
		 $.messager.alert('Warning','Invoice Date is Madatory');
		 return false;
	}
					
	var z=0;
	var rows = $("#jqxpinvDetGrid").jqxGrid('getrows');                    
	if(rows.length>0 && (rows[0].tr_no=="undefined" || rows[0].tr_no==null || rows[0].tr_no=="")){
		return false;
	}
    
    var selectedRecords = new Array();
    var selectedrows=$("#jqxpinvDetGrid").jqxGrid('selectedrowindexes');
    
	if(selectedrows.length==0){
		$.messager.alert('Warning','Select a document');
		return false;
	}
				  
	var i=0;
	var amount=0;
	var docno=0;
	var dtype=0;
	var cldocno=0;
	var site="::";
    
    $('#invgridlength').val(selectedrows.length);
	for (i = 0; i < rows.length; i++) {
		for(var j=0;j<selectedrows.length;j++){
			if(selectedrows[j]==i){
				newTextBox = $(document.createElement("input"))
				.attr("type", "dil")
				.attr("id", "printinv"+z)
				.attr("name", "printinv"+z)
				.attr("hidden","true");
								
				docno=rows[i].doc_no;
				dtype=rows[i].dtype;
				trno=rows[i].tr_no;
				site=site+rows[i].site+"::";
							
				cldocno=rows[i].clientid;
				amount=amount+rows[i].dueamt;
				z++;
			}
		}
		if(i==rows.length-1){
			var url=document.URL;
			var reurl=url.split("invoiceprocessing.jsp");
			var win= window.open(reurl[0]+"invoiceProcessingPrint?dtype="+dtype+"&docno="+docno+"&cldocno="+cldocno+"&amount="+amount+"&invdate="+invdate+"&trno="+trno+"&site="+site,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
			win.focus(); 
		} 
	}    
}

function funinterstate(){
	if(document.getElementById("interstate").checked){
		document.getElementById("hiddeninterstate").value=1;
	}
	else{
		document.getElementById("hiddeninterstate").value=0;
	}
}

function getinterservconfig(){
	$("#interid").hide();
	var x=new XMLHttpRequest();
	x.onreadystatechange=function(){
		if (x.readyState==4 && x.status==200){
			var res= x.responseText;
			if(res>0){
				// $("#interid").show();
			}
		}
	}
	x.open("GET",'interservconfig.jsp',true);
	x.send();
} 
</script>
</head>
<body onload="getBranch();setValues(); getprintconfig();getinterservconfig();">
<form id="frmdinvoice" action="savedInvoice" method="post">
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
                        <td class="label-cell">Upto Date</td>
                        <td><div id='todate' name='todate' value='<s:property value="todate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Client</td>
                        <td>
                            <div class="input-with-button">
                                <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' onKeyDown="getclinfo(event);" readonly placeholder="Press F3 to Search" style="flex: 1;">
                                <button type="button" class="icon-btn" id="clear" title="clear" onclick="funClear()"> 
                                    <img alt="clear" src="<%=contextPath%>/icons/clear.png">
                                </button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="filter-card" style="padding: 10px;">
                <div id="invCountgrid"><jsp:include page="invCountgrid.jsp"></jsp:include></div>
            </div>

            <div class="filter-card">
                <table class="release-filter-table">
                    <tr>
                        <td class="label-cell">Inv Date</td>
                        <td><div id='invdate' name='invdate' value='<s:property value="invdate"/>'></div></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Description</td>
                        <td><input type="text" name="txtdesc" id="txtdesc" value='<s:property value="txtdesc"/>'></td>
                    </tr>
                    
                    <tr>
                        <td class="label-cell">Notes</td>
                        <td><input type="text" name="txtnotes" id="txtnotes" value='<s:property value="txtnotes"/>'></td>
                    </tr>
                </table>
                
                <span id="interid" hidden="true">
                    <div class="checkbox-row">
                        <input type="checkbox" name="interstate" id="interstate" onchange="funinterstate();">
                        <label for="interstate">Inter State service</label>
                    </div>
                </span>
                
                <div class="button-group">
                    <button type="button" name="btninvoiceprint" id="btninvoiceprint" class="btn-submit btn-secondary" onclick="funPrint();">Print</button>
                    <button type="button" name="btninvoicesave" id="btninvoicesave" class="btn-submit" onclick="funNotify();">Generate</button>
                </div>
            </div>

            <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'>
            <input type="hidden" name="invgridlength" id="invgridlength" value='<s:property value="invgridlength"/>'>
            <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'>
            <input type="hidden" name="msg" id="msg" value='<s:property value="msg"/>'> 
            <input type="hidden" name="formcode" id="formcode" value='<s:property value="formcode"/>'>
            <input type="hidden" name="ptype" id="ptype" value='<s:property value="ptype"/>'>
            <input type="hidden" id="hiddeninterstate" name="hiddeninterstate" value='<s:property value="hiddeninterstate"/>'>	
            <input type="hidden" name="countdtype" id="countdtype" value='<s:property value="countdtype"/>'>
        </div>
    </div>

    <div class="main-content-area">
        <div class="filter-card" style="padding: 0; overflow: hidden; flex: 1; display: flex; flex-direction: column;">
            <div id="profinvdiv" style="flex: 1; min-height: 250px;">
                <jsp:include page="invoiceprocessingGrid.jsp"></jsp:include> 
            </div>
        </div>
        
        <div class="filter-card" style="padding: 0; overflow: hidden; flex: 1; display: flex; flex-direction: column;">
            <div id="profinvdetdiv" style="flex: 1; min-height: 250px;">
                <jsp:include page="InvoiceDetGrid.jsp"></jsp:include> 
            </div>
        </div>
    </div>

</div>

<div id="clientsearch1">
   <div></div>
</div>

</div>
</div>
</form>
</body>
</html>