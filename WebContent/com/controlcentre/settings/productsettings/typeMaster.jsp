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

#frmptm input[type="text"],
#frmptm select { 
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

#frmptm input[type="text"]:focus,
#frmptm select:focus { 
    border-color: #007bff; 
    outline: none;
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

#frmptm table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 8px; 
}

#frmptm td {
    padding: 0 5px;
    vertical-align: middle;
    font-family: Arial, sans-serif; 
    font-size: 12px; 
    color: #333;
}

#frmptm td[align="right"] {
    text-align: right; 
    color: #444;
    font-size: 12px; 
    font-weight: bold;
    white-space: nowrap; 
    padding-right: 10px;
}

#grpgrid {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    overflow: hidden;
}
 </style>			
<script type="text/javascript">

$(document).ready(function () { 
	$('#btnSearch').attr('disabled', true);
	 $("#ptmdate").jqxDateTimeInput({width : '125px',height : '15px',formatString : "dd.MM.yyyy"});
	 
      		document.getElementById("formdet").innerText="Type Master(PTM)";
    		document.getElementById("formdetail").value="Type Master";
    		document.getElementById("formdetailcode").value="PTM";
    		window.parent.formCode.value="PTM";
    		window.parent.formName.value="Type Master";
    		
  });
	
	function funFocus(){
		document.getElementById("ptmtype").focus();
	}
	
	function funReadOnly() {
		$('#frmptm input').attr('readonly', true);
		$('#ptmdate').jqxDateTimeInput({ disabled: true}); 
	}
	
	function funRemoveReadOnly() {
		$('#frmptm input').attr('readonly', false);
		$('#ptmdate').jqxDateTimeInput({ disabled: false}); 
		$('#docno').attr('readonly', true);
		
	}
	
	function setValues() {
		if($('#ptmdate').val()){
			$("#ptmdate").jqxDateTimeInput('val', $('#ptmdate').val());
		}
		
			if($('#msg').val()!=""){
				   $.messager.alert('Message',$('#msg').val());
				  }
			
	}
	    
	function funNotify(){
		if(document.getElementById("ptmtype").value==''){
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
<form id="frmptm" action="saveptmAction" method="post" autocomplete="off" >
	<jsp:include page="../../../../header.jsp" />
	<br/> 
<fieldset><legend>Product Type Details</legend>
<table width="100%">
  <tr>
    <td width="6%" align="right">Date</td>
    <td width="15%"><div id="ptmdate" name="ptmdate" value='<s:property value="ptmdate"/>'></div></td>
   <td align="right" width="6%">Type</td>
    <td><input type="text"  width="25%" name="ptmtype" id="ptmtype" placeholder="Product Type" value='<s:property value="ptmtype"/>' ></td>
   <td><input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>' /> 
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />
<input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>' /></td>
   
    <td  width="10%" align="right">Doc No.</td>
    <td width="20%"><input type="text" id="docno" name="docno" value='<s:property value="docno"/>' readonly tabindex="-1"></td>
  </tr>
  <tr>
    
  </tr>
</table>
</fieldset>

<table width="100%">
  <tr>
   <td>
   
   <div id="grpgrid"><jsp:include page="typeGrid.jsp"></jsp:include></div> 
   </td>
  </tr>
</table>

<input type="hidden" name="hidfgmdate" id="hidfgmdate" value='<s:property value="hidfgmdate"/>'/>
</form>
</div>
<br/> 
	
</body>
</html>