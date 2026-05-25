<%@page import="com.controlcentre.masters.vehiclemaster.color.ClsColorAction" %>
<%ClsColorAction coa=new ClsColorAction(); %>

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

#frmColor input[type="text"],
#frmColor select { 
    height: 24px !important; 
    border: 1px solid #b8c6d8; 
    border-radius: 3px; 
    padding: 2px 6px;
    font-size: 12px;
    font-family: Arial, sans-serif;
    box-sizing: border-box; 
    background-color: #fff; 
    color: #333;
    
}

#frmColor input[type="text"]:focus,
#frmColor select:focus { 
    border-color: #007bff; 
    outline: none;
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

#frmColor table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px; 
}

#frmColor td {
    padding: 0 5px;
    vertical-align: middle;
    font-family: Arial, sans-serif; 
    font-size: 12px; 
    color: #333;
}

#frmColor td[align="right"] {
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


#jqxColorSearch1 {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    overflow: hidden;
}
</style>
<script type="text/javascript">
var data= '<%=coa.searchDetails() %>';
$(document).ready(function () { 	
    
    	document.getElementById("formdet").innerText="Color(CLR)";
		document.getElementById("formdetail").value="Color";
		document.getElementById("formdetailcode").value="CLR";
		window.parent.formCode.value="CLR";
		window.parent.formName.value="Color";
		
     var num = 0; 
    var source =
    {
        datatype: "json",
        datafields: [
                  	{name : 'DOC_NO' , type: 'number' },
						{name : 'color', type: 'String'  }
                  	
         ],
         localdata: data,
        
        
        pager: function (pagenum, pagesize, oldpagenum) {
            // callback called when a page or page size is changed.
        }
    };
    
    var dataAdapter = new $.jqx.dataAdapter(source,
    		 {
        		loadError: function (xhr, status, error) {
               // alert(error);    
                }
            }		
    );

    $("#jqxColorSearch1").jqxGrid(
            {
            	width: '70%',
                height: 315,
                source: dataAdapter,
                showfilterrow: true,
                filterable: true,
                selectionmode: 'multiplecellsextended',
                //pagermode: 'default',
                sortable: true,
                //pageable: true,
                altrows:true,
                //Add row method
                columns: [
					{ text: 'Doc No',filtertype: 'number', datafield: 'DOC_NO', width: '40%' },
					{ text: 'Color',columntype: 'textbox', filtertype: 'input', datafield: 'color', width: '60%' }
	              ]
            });
    $('#jqxColorSearch1').on('rowdoubleclick', function (event) 
    		{ 
    			var rowindex1=event.args.rowindex;
      		 	 document.getElementById("docno").value= $('#jqxColorSearch1').jqxGrid('getcellvalue', rowindex1, "DOC_NO"); 
       			 document.getElementById("color").value = $("#jqxColorSearch1").jqxGrid('getcellvalue', rowindex1, "color");                
    	 		 $('#window').jqxWindow('hide');
    		 }); 
});
function funReadOnly(){
	$('#frmColor input').attr('readonly', true );
	/* $('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
}
function funRemoveReadOnly(){
	$('#frmColor input').attr('readonly', false );
	//$('#jqxDateTimeInput').jqxDateTimeInput({ disabled: false});
	$('#docno').attr('readonly', true);
}
function setValues(){	
   
	 if($('#msg').val()!=""){
		   $.messager.alert('Message',$('#msg').val());
		  }

	}
    function funFocus()
    {
    	document.getElementById("color").focus();
    		
    }
   
    $(function(){
    	
        $('#frmColor').validate({
                 rules: {
                 color: {
                	 required:true,
                	 maxlength:45
                 }
                 
                 
                 },
                 messages: {
                  color:{
                	  required:" *",
                	  maxlength:"max 45 chars"
                  }
                  
                  
                 }
        });});
     function funNotify(){
    	
    		return 1;
	} 
     function funSearchLoad(){
			changeContent('colorSearch.jsp', $('#window')); 
		 }
     function funExcelBtn(){
		  $("#jqxColorSearch1").jqxGrid('exportdata', 'xls', 'Color');
	  }
</script>
</head>
<body onload="setValues();" >
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmColor" action="saveActionColor" autocomplete="off">
	<jsp:include page="../../../../header.jsp" />
	<br/>  
<fieldset><legend>Color Details</legend>
<table>
<tr><td width="8%" align="right">Color</td><td width="62%"><input type="text" name="color" id="color" value='<s:property value="color"/>'></td>
  <td width="14%" align="right">Doc No</td>
  <td width="16%"><input type="text" name="docno"  id="docno" readonly="readonly" value='<s:property value="docno"/>' tabindex="-1"></td>
</tr>
</table>
<br/>
</fieldset>	
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>
<input type="hidden" id="mode" name="mode"/>
				        <input type="hidden" id="msg" name="msg"  value='<s:property value="msg"/>'/>
</form>
<br/>
<div id="jqxColorSearch1"></div>
	<%-- <div id="window">
			<div id="windowHeader" class="windowHead">
				<span> <img src="../../../../icons/search_new.png" alt=""
					style="margin-right: 15px" />Search
				</span>
			</div>
			<div id="windowContent" class="windowCont" style="overflow: hidden;">
				<jsp:include page="colorSearch.jsp"></jsp:include>
			</div>
		</div> --%>
	</div>
</body>
</html>