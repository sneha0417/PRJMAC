<%@page import="com.controlcentre.masters.vehiclemaster.project.ClsProjectDAO" %>
<%ClsProjectDAO cpd=new ClsProjectDAO(); %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>

<style>

body {
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    font-family: 'Segoe UI', 'Roboto', 'Arial', sans-serif;
    color: #222;
    margin: 0;
    padding: 6px 0;
    box-sizing: border-box;
    overflow-y: auto !important;
}

#mainBG {
    background: #fff;
    border-radius: 16px;
    padding: 5px;
    max-width: 100%;
    margin: 0 auto;
    box-shadow: 0 4px 24px rgba(0,0,0,0.06);
}

#frmProject input[type="text"],
#frmProject select { 
    height: 24px !important; 
    border: 1px solid #b8c6d8; 
    border-radius: 3px; 
    padding: 2px 3px;
    font-size: 12px;
    font-family: Arial, sans-serif;
    box-sizing: border-box; 
    background-color: #fff; 
    color: #333;
    width: 100%;
}

#frmProject input[type="text"]:focus,
#frmProject select:focus { 
    border-color: #007bff; 
    outline: none;
}



fieldset {
    border: 1px solid #c5d3e0; 
    padding: 1px; 
    background: #ffffff; 
    position: relative; 
    border-radius: 4px; 
    margin-bottom: 15px;
    margin-top: 12px;
}

legend {
    background: #ffffff; 
    padding: 0 2px; 
    color: #0056b3;
    font-weight: bold; 
    font-size: 14px; 
    font-family: Arial, sans-serif;
    border-left: 3px solid #0056b3;
    line-height: normal; 
    margin-left: -2px; 
}

#frmProject table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px; 
}

#frmProject td {
    padding: 0 5px;
    vertical-align: middle;
    font-family: Arial, sans-serif; 
    font-size: 12px; 
    color: #333;
}

#frmProject td[align="right"] {
    text-align: right; 
    color: #444;
    font-size: 12px; 
    font-weight: bold;
    white-space: nowrap; 
    padding-right: 10px;
}

form label.error {
    color: red;
    font-weight: bold;
    font-size: 11px;
    font-family: Arial, sans-serif;
}

#jqxProjectSearch1 {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    overflow: hidden;
}

.input-search-container {
    position: relative;
    display: block; 
    width: 100%;
    min-width: 150px; 
    margin-right: 15px;
}

.input-search-container input {
    padding-right: 30px !important; 
    width: 100% !important;
    display: block;
    box-sizing: border-box !important;
}

.magnifier-icon {
    position: absolute;
    right: 8px; 
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #64748b; 
    z-index: 10;
    pointer-events: all; 
    
}
.magnifier-icon:hover {
    color: #2563eb; 
    transform: translateY(-50%) scale(1.1);
}
</style>

<script type="text/javascript">

$(document).ready(function () {
	 $("#projectDate").jqxDateTimeInput({ width: '125px', height: '15px' ,formatString : "dd.MM.yyyy" });
	
	 $('#clientDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Client Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	 $('#clientDetailsWindow').jqxWindow('close');
	 
	 $("#btnExcel").click(function() {
			$("#jqxProjectSearch1").jqxGrid('exportdata', 'xls', 'Project');
		});
	 
	    document.getElementById("formdet").innerText="Project(PRJ)";
		document.getElementById("formdetail").value="Project";
		document.getElementById("formdetailcode").value="PRJ";
	 	window.parent.formCode.value="PRJ";
			window.parent.formName.value="Project";
	 var data= '<%=cpd.projectDetailsLoading() %>';
	           
	 var source =
	            {
	                datatype: "json",
	                datafields: [
	                          	{name : 'doc_no' , type: 'number' },
	                          	{name : 'date', type: 'date'  },
	                          	{name : 'refname', type: 'String'  },
	                          	{name : 'project_name', type: 'String'  }
	                 ],
	               localdata: data,
	                
	                pager: function (pagenum, pagesize, oldpagenum) {
	                    // callback called when a page or page size is changed.
	                }
	            };
	            var dataAdapter = new $.jqx.dataAdapter(source,
	            		 {
	                		loadError: function (xhr, status, error) {
		                    }
			            }		
	            );
	    
	            $("#jqxProjectSearch1").jqxGrid(
	                    {
	                    	width: 850,
	                        source: dataAdapter,
	                        showfilterrow: true,
	                        filterable: true,
	                        selectionmode: 'multiplecellsextended',
	                        //Add row method
	                        columns: [
	        					{ text: 'Doc No',filtertype: 'number', datafield: 'doc_no', width: '10%' },
	        					{ text: 'Date',columntype: 'textbox', filtertype: 'input', datafield: 'date', width: '20%',cellsformat:'dd.MM.yyyy' },
	        					{ text: 'Client Name',columntype: 'textbox', filtertype: 'input', datafield: 'refname', width: '30%' },
	        					{ text: 'Project Name',columntype: 'textbox', filtertype: 'input', datafield: 'project_name', width: '40%' }
	        	              ]
	                    });
	            $('#jqxProjectSearch1').on('rowdoubleclick', function (event) {
	                var rowindex1=event.args.rowindex;
	                document.getElementById("docno").value= $('#jqxProjectSearch1').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
	                document.getElementById("txtprojectname").value = $("#jqxProjectSearch1").jqxGrid('getcellvalue', rowindex1, "project_name");
	                $("#projectDate").jqxDateTimeInput('val', $("#jqxProjectSearch1").jqxGrid('getcellvalue', rowindex1, "date"));
	                document.getElementById("txtclientname").value = $("#jqxProjectSearch1").jqxGrid('getcellvalue', rowindex1, "refname");
	            }); 
	            
	            
	            
	            $('#txtclientname').dblclick(function(){
	            	clientSearchContent('clientDetailsGrid.jsp');
	       		});
          });

function clientSearchContent(url) {
    $('#clientDetailsWindow').jqxWindow('open');
	$.get(url).done(function (data) {
	$('#clientDetailsWindow').jqxWindow('setContent', data);
	$('#clientDetailsWindow').jqxWindow('bringToFront');
}); 
}

function funReadOnly(){
	$('#frmProject input').attr('readonly', true );
	$('#projectDate').jqxDateTimeInput({disabled: true});
}

function funRemoveReadOnly(){
	$('#frmProject input').attr('readonly', false );
	$('#projectDate').jqxDateTimeInput({disabled: false});
	$('#txtclientname').prop('readonly', true);
	$('#docno').prop('readonly', true);
}

function setValues(){	
   
	 if($('#msg').val()!=""){
		   $.messager.alert('Message',$('#msg').val());
		  }

}

function funFocus(){
	$('#projectDate').jqxDateTimeInput('focus'); 
}
   
    /* Validations */
	   $(function(){
	        $('#frmProject').validate({
	                rules: {
	                txtclientname:"required",
	                txtprojectname:"required"
	                 },
	                 messages: {
	                 txtclientname:" *",
	                 txtprojectname:" *"
	                 }
	        });});
     
function funNotify(){
   return 1;
} 

function funSearchLoad(){
    changeContent('projectSearch.jsp');
}
     
function getClient(event){
  var x= event.keyCode;
  if(x==114){
	  clientSearchContent('clientDetailsGrid.jsp');
  }
  else{
   }
}
function funExcelBtn(){
	  $("#jqxProjectSearch1").jqxGrid('exportdata', 'xls', 'Project');
}
</script>
</head>
<body onload="setValues();" >
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmProject" action="saveActionProject" autocomplete="off">
<jsp:include page="../../../../header.jsp" /><br/>  
<fieldset><legend>Project Details</legend>
<table width="100%">
<tr>
  <td align="right">Date</td>
  <td><div id="projectDate" name="projectDate" value='<s:property value="projectDate"/>'></div>
    <input type="hidden" id="hidprojectDate" name="hidprojectDate" value='<s:property value="hidprojectDate"/>'/></td>
  <td align="right">Doc No</td>
  <td><input type="text" id="docno" name="txtprojectdocno" style="width:25%;" value='<s:property value="txtprojectdocno"/>' tabindex="-1"/></td>
</tr>
<tr>
  <td width="9%" align="right">Client</td>
  <td width="31%"><div class="input-search-container"><input type="text" name="txtclientname" id="txtclientname" style="width:80%;" placeholder="Double tap to Search" value='<s:property value="txtclientname"/>' onkeydown="getClient(event);">
  <svg class="magnifier-icon" onclick="triggerToSearch();" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
        </svg>
        </div>
  <input type="hidden" id="txtcldocno" name="txtcldocno" value='<s:property value="txtcldocno"/>'/></td>
  <td width="12%" align="right">Project Name</td>
  <td width="48%"><input type="text" name="txtprojectname"  id="txtprojectname"  style="width:70%;" value='<s:property value="txtprojectname"/>'></td>
</tr>
</table>
<br/>
</fieldset><br/>
<div id="jqxProjectSearch1"></div> 
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>
<input type="hidden" id="mode" name="mode"/>
<input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
</form>
<div id="clientDetailsWindow">
	<div></div><div></div>
</div>
</div>
</body>
</html>