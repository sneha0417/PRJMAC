<% String contextPath=request.getContextPath();%>
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

#frmdept input[type="text"],
#frmdept select { 
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

#frmdept input[type="text"]:focus,
#frmdept select:focus { 
    border-color: #007bff; 
    outline: none;
}

#frmdept input[readonly],
#frmdept input:disabled,
#frmdept select:disabled { 
    background-color: #f8f9fa; 
    color: #6b7280;
}

fieldset {
    border: 1px solid #c5d3e0; 
    padding: 10px 10px 5px 10px; 
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

#frmdept table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 8px; 
}

#frmdept td {
    padding: 0 5px;
    vertical-align: middle;
    font-family: Arial, sans-serif; 
    font-size: 12px; 
    color: #333;
}

#frmdept td[align="right"] {
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

#jqxcategorySearch1 {
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

$(document).ready(function () { 
	$('#btnSearch').attr('disabled', true);
	 $("#date").jqxDateTimeInput({width : '125px',height : '15px',formatString : "dd.MM.yyyy"});
	 
      		document.getElementById("formdet").innerText="Department Master(DPM)";
    		document.getElementById("formdetail").value="Department Master";
    		document.getElementById("formdetailcode").value="DPM";
    		window.parent.formCode.value="DPM";
    		window.parent.formName.value="Department Master";
  });
	
	function funFocus(){
		document.getElementById("dept").focus();
	}
	
	function funReadOnly() {
		$('#frmdept input').attr('readonly', true);
		$('#date').jqxDateTimeInput({ disabled: true}); 
	}
	
	function funRemoveReadOnly() {
		$('#frmdept input').attr('readonly', false);
		$('#date').jqxDateTimeInput({ disabled: false}); 
		$('#docno').attr('readonly', true);
		
	}
	
	function setValues() {
		if($('#date').val()){
			$("#date").jqxDateTimeInput('val', $('#date').val());
		}
		
			if($('#msg').val()!=""){
				   $.messager.alert('Message',$('#msg').val());
				  }
			
	}
	    
	function funNotify(){
		if(document.getElementById("dept").value==''){
			document.getElementById("errormsg").innerText="Product Type is Mandatory.";
			return false;
		}
		document.getElementById("errormsg").innerText="";
		return 1;
	}
	
	function funChkButton() {
		   /* funReset(); */
		  }
		  

</script>
</head>
<!-- onload="setValues();" -->
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmdept" action="savedeptAction" method="post" autocomplete="off" >
	<jsp:include page="../../../../header.jsp" />
	<br/> 
<fieldset><legend>Department Details</legend>
<table width="100%">
  <tr>
    <td width="6%" align="right">Date</td>
    <td width="15%"><div id="date" name="date" value='<s:property value="date"/>'></div></td>
    <td width="6%" align="right">Department</td>
    <td><input width="15%" type="text" name="dept" id="dept" placeholder="Department" value='<s:property value="dept"/>' ></td>
    <td width="10%"align="right">Doc No.</td>
    <td width="20%"><input type="text" id="docno" name="docno" value='<s:property value="docno"/>' readonly tabindex="-1"></td>
  </tr>
  <tr>
    
  
  
<td><input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>' /> 
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />
<input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>' /></td>
  </tr>
</table>
</fieldset>

<table width="100%">
  <tr>
   <td>
   
   <div id="dptgrid"><jsp:include page="deptGrid.jsp"></jsp:include></div> 
   </td>
  </tr>
</table>


</form>
</div>
<br/> 
	
</body>
</html>