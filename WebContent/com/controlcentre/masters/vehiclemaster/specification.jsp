<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>

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
    padding: 24px 0;
    box-sizing: border-box;
    overflow-y: auto !important;
}

#mainBG {
    background: #fff;
    border-radius: 16px;
    padding: 15px;
    max-width: 100%;
    margin: 0 auto;
    box-shadow: 0 4px 24px rgba(0,0,0,0.06);
}

#frmSpecification input[type="text"],
#frmSpecification select { 
    height: 24px !important; 
    border: 1px solid #b8c6d8; 
    border-radius: 3px; 
    padding: 2px 6px;
    font-size: 12px;
    font-family: Arial, sans-serif;
    box-sizing: border-box; 
    background-color: #fff; 
    color: #333;
    width: 100%;
}

#frmSpecification input[type="text"]:focus,
#frmSpecification select:focus { 
    border-color: #007bff; 
    outline: none;
}

#frmSpecification input[readonly],
#frmSpecification input:disabled,
#frmSpecification select:disabled { 
    background-color: #f8f9fa; 
    color: #6b7280;
}

fieldset {
    border: 1px solid #c5d3e0; 
    padding: 20px 10px 10px 10px; 
    background: #ffffff; 
    position: relative; 
    border-radius: 4px; 
    margin-bottom: 15px;
    margin-top: 12px;
}

legend {
    background: #ffffff; 
    padding: 0 8px; 
    color: #0056b3;
    font-weight: bold; 
    font-size: 14px; 
    font-family: Arial, sans-serif;
    border-left: 3px solid #0056b3;
    line-height: normal; 
    margin-left: -2px; 
}

#frmSpecification table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px; 
}

#frmSpecification td {
    padding: 0 5px;
    vertical-align: middle;
    font-family: Arial, sans-serif; 
    font-size: 12px; 
    color: #333;
}

#frmSpecification td[align="right"] {
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

#specGrid {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    overflow: hidden;
}
form label.error {
color:red;
  font-weight:bold;

}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	document.getElementById("formdet").innerText="Specification(SPC)";
	document.getElementById("formdetail").value="Specification";
	document.getElementById("formdetailcode").value="SPC";
	window.parent.formCode.value="SPC";
	window.parent.formName.value="Specification";
	
});

function funNotify(){
	return 1;
}
function funReadOnly(){
	$('#frmSpecification input').attr('readonly', true );
}
function funRemoveReadOnly(){
	$('#frmSpecification input').attr('readonly', false );

}
function funSearchLoad(){
	changeContent('specificationSearch.jsp', $('#window')); 
 }
function chkButton(){
	
}
function funFocus(){
	document.getElementById("specname").focus();
}
function setValues(){
	 if($('#msg').val()!=""){
		   $.messager.alert('Message',$('#msg').val());
		  }

}
function funExcelBtn(){
				  $("#specGrid").jqxGrid('exportdata', 'xls', 'Specifications');
			  }
	</script>
</head>
<body onload="setValues();">

<div>
<div id="mainBG" class="homeContent" data-type="background"> 
<form id="frmSpecification" action="saveSpecification" method="post" autocomplete="off">
<jsp:include page="../../../../header.jsp" /><br/> 
<fieldset><legend>Specification Info</legend>
<table width="100%">
  <tr>
    <td width="6%" align="right">Name</td>
    <td width="15%" align="left"><input type="text" name="specname" id="specname" value='<s:property value="specname"/>' placeholder="Spec Name" /></td>
    <td align="right" width="6%">Details</td>
    <td width="25%" align="left"><input type="text" name="specdetails" id="specdetails" style="width:100%;" value='<s:property value="specdetails"/>' placeholder="Spec Details"/></td>
    
    <td width="10%" align="right">Doc No</td>
    <td width="20%" align="left"><input type="text" name="docno" tabindex="-1" readonly id="docno" value='<s:property value="docno"/>'/></td>
  </tr>
  <tr>
    
    </tr>
</table>
</fieldset>
<table  width="100%">
<tr>
    <td ><jsp:include page="specGrid.jsp"></jsp:include></td>
    </tr>
</table>
										        <input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>

<input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'/>
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>
</div>
</div>
</body>
</html>