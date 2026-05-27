<%@page import="com.controlcentre.masters.vehiclemaster.yom.ClsYomAction" %>
<%ClsYomAction coa=new ClsYomAction(); %>

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

.modern-ui {
    font-family: Arial, sans-serif; 
    color: #333;
    font-size: 12px; 
    padding: 5px 15px;
    box-sizing: border-box;
    width: 100%;
}

/* Master Input Heights - Forced to 24px */
.modern-ui input[type="text"],
.modern-ui select { 
    height: 24px !important; 
    border: 1px solid #b8c6d8; 
    border-radius: 3px; 
    padding: 2px 6px;
    font-size: 12px;
    box-sizing: border-box; 
    background-color: #fff; 
    color: #333;
    width: 100%;
}

.modern-ui input[type="text"]:focus,
.modern-ui select:focus { 
    border-color: #007bff; 
    outline: none;
}

.modern-ui input[readonly],
.modern-ui input:disabled,
.modern-ui select:disabled { 
    background-color: #f8f9fa; 
    color: #6b7280;
}

/* Layout Utilities */
.modern-ui .field-row { 
    display: flex;
    align-items: center; 
    gap: 8px;
    margin-bottom: 10px; 
    flex-wrap: wrap;
}

.modern-ui .lbl-right { 
    text-align: right; 
    color: #444;
    font-size: 12px; 
    font-weight: bold;
    white-space: nowrap; 
    padding-right: 5px;
}

/* Middle Section Panels */
.modern-ui .middle-panel {
    border: 1px solid #c5d3e0; 
    padding: 20px 10px 10px 10px; 
    background: #ffffff; 
    position: relative; 
    border-radius: 4px; 
    margin-bottom: 15px;
    margin-top: 12px;
}

.modern-ui .middle-panel-title { 
    position: absolute; 
    top: -12px;
    left: 10px; 
    background: #ffffff; 
    padding: 0 8px; 
    color: #0056b3;
    font-weight: bold; 
    font-size: 14px; 
    border-left: 3px solid #0056b3;
    z-index: 2; 
    line-height: normal; 
}

/* Custom UI Buttons */
.modern-ui .myButton {
    height: 24px !important;
    line-height: 22px !important;
    padding: 0 12px;
    font-family: Arial, sans-serif;
    font-size: 11px;
    font-weight: bold;
    border-radius: 3px;
    cursor: pointer;
    text-shadow: none;
    transition: all 0.2s;
    box-shadow: 0 1px 2px rgba(0,0,0,0.1);
    border: none;
    background: linear-gradient(135deg, #0b45a2 0%, #2563eb 100%);
    color: #ffffff;
    white-space: nowrap;
}
.modern-ui .myButton:hover { background: linear-gradient(135deg, #083a8a 0%, #1d4ed8 100%); }

/* Grid Wrappers */
.modern-ui .grid-container {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    background: #fff;
    overflow: hidden;
}

/* Validation & Error Labels */
.modern-ui .val-error,
.modern-ui form label.error { 
    color: red !important; 
    font-size: 11px; 
    font-weight: bold; 
}

/* Scrollbar Logic */
.hidden-scrollbar {
    overflow-y: auto;
    height: calc(100vh - 150px);
    padding-right: 5px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #c5d3e0; border-radius: 3px; }

/* Custom UI Buttons */
.modern-ui .myButton {
    height: 24px !important;
    line-height: 22px !important;
    padding: 0 12px;
    font-family: Arial, sans-serif;
    font-size: 11px;
    font-weight: bold;
    border-radius: 3px;
    cursor: pointer;
    text-shadow: none;
    transition: all 0.2s;
    box-shadow: 0 1px 2px rgba(0,0,0,0.1);
    border: none;
    background: linear-gradient(135deg, #0b45a2 0%, #2563eb 100%);
    color: #ffffff;
    white-space: nowrap;
}

.modern-ui .myButton:hover:not(:disabled) { 
    background: linear-gradient(135deg, #083a8a 0%, #1d4ed8 100%); 
}

/* Disabled Button State */
.modern-ui .myButton:disabled,
button:disabled,
input[type="button"]:disabled,
input[type="submit"]:disabled {
    background: #e2e8f0 !important; 
    color: #94a3b8 !important;      
    border: 1px solid #cbd5e1 !important;
    cursor: not-allowed !important; 
    box-shadow: none !important;
    text-shadow: none !important;
}
</style>
<script type="text/javascript">
var data= '<%=coa.searchDetails() %>';
$(document).ready(function () { 	
   $("#btnSearch").hide(); 
    $("#btnEdit").hide(); 
     $("#btnDelete").hide(); 
    	document.getElementById("formdet").innerText="YOM(YOM)";
		document.getElementById("formdetail").value="YOM";
		document.getElementById("formdetailcode").value="YOM";
		window.parent.formCode.value="YOM";
		window.parent.formName.value="YOM";
		
     var num = 0; 
    var source =
    {
        datatype: "json",
        datafields: [
                  	{name : 'DOC_NO' , type: 'number' },
						{name : 'yom', type: 'String'  }
                  	
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

    $("#jqxYomSearch").jqxGrid(
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
					{ text: 'YOM',columntype: 'textbox', filtertype: 'input', datafield: 'yom', width: '60%' }
              ]
            });
    $('#jqxYomSearch').on('rowdoubleclick', function (event) 
    		{ 
    			var rowindex1=event.args.rowindex;
      		 	 document.getElementById("docno").value= $('#jqxYomSearch').jqxGrid('getcellvalue', rowindex1, "DOC_NO"); 
       			 document.getElementById("yom").value = $("#jqxYomSearch").jqxGrid('getcellvalue', rowindex1, "yom");                
     		 	 $('#window').jqxWindow('hide');
    		 }); 
});
function funReadOnly(){
	$('#frmYom input').attr('readonly', true );
	/* $('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
}
function funRemoveReadOnly(){
	$('#frmYom input').attr('readonly', false );
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
    	document.getElementById("yom").focus();
    		
    }
   
    $(function(){
    	
        $('#frmYom').validate({
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
		  $("#jqxYomSearch").jqxGrid('exportdata', 'xls', 'YOM');
	  }
</script>

<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
    <jsp:include page="../../../../header.jsp" />

    <div class="modern-ui hidden-scrollbar">
        <form id="frmYom" action="saveActionYom" autocomplete="off">
            
            <div class="middle-panel">
                <span class="middle-panel-title">YOM Details</span>
                <div class="field-row" style="margin-bottom: 0;">
                    <label class="lbl-right" style="width:80px;">YOM</label>
                    <input type="text" name="yom" id="yom" value='<s:property value="yom"/>' style="width: 250px;">
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No</label>
                    <input type="text" name="docno" id="docno" readonly="readonly" value='<s:property value="docno"/>' tabindex="-1" style="width: 120px;">
                </div>
            </div>

            <div style="display:none;">
                <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>
                <input type="hidden" id="mode" name="mode"/>
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
            </div>
            
        </form>

        <div class="middle-panel" style="margin-bottom:0;">
            <span class="middle-panel-title">YOM Search Records</span>
            <div id="jqxYomSearch"></div>
        </div>

        <%-- Commented Original Modal Logic --%>
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
</div>
</body>
</html>