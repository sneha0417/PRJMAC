<%@page import="com.controlcentre.masters.vehiclemaster.securitypass.ClsSecurityPassDAO" %>
<%ClsSecurityPassDAO DAO1=new ClsSecurityPassDAO(); %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<%
String contextPath=request.getContextPath();
%>
<head>
<title>GatewayERP(i)</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../../../../includes.jsp"></jsp:include>

<script type="text/javascript">
	$(document).ready(function () {    
	    $("#date").jqxDateTimeInput({ width: '125px', height: '15px' ,formatString : "dd.MM.yyyy" });
	     $("#startdate").jqxDateTimeInput({ width: '125px', height: '15px' ,formatString : "dd.MM.yyyy" });
	      $("#enddate").jqxDateTimeInput({ width: '125px', height: '15px' ,formatString : "dd.MM.yyyy" });
	    document.getElementById("formdet").innerText="Security Pass(SPA)";
		document.getElementById("formdetail").value="Security Pass";
		document.getElementById("formdetailcode").value="SPA";
		window.parent.formCode.value="SPA";
		window.parent.formName.value="Security Pass";
 		
		
		/* Grid starts */
			var spdata='<%=DAO1.searchDetails()%>'; 
            var num = 0; 
            var source =
            {
                datatype: "json",
                datafields: [
                          	{name : 'doc_no' , type: 'number' },
     						{name : 'name', type: 'String'  },
                          	{name : 'date', type: 'date'  },
                          	{name : 'startdate', type: 'date'  },
                          	{name : 'enddate', type: 'date'  },
							{name : 'description',type:'string'},
							{name : 'qty',type:'string'},
                 ],
               localdata: spdata,
                //url: "/searchDetails",
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
    
            $("#jqxSecpassSearch1").jqxGrid(
                    {
                    	width: '100%',
                    	height:350,
                        source: dataAdapter,
                        showfilterrow: true,
                        filterable: true,
                        selectionmode: 'singlerow',
                        //Add row method
                        columns: [
        					{ text: 'Doc No', datafield: 'doc_no', width: '10%' },
        					{ text: 'Date',columntype: 'textbox', filtertype: 'input', datafield: 'date', width: '10%',cellsformat:'dd.MM.yyyy' },
							{ text: 'Name',columntype: 'textbox', filtertype: 'input', datafield: 'name', width: '30%' },
							{ text: 'Description',datafield:'description',width:'50%',columntype: 'textbox', filtertype: 'input'},
							{ text: 'StartDate',columntype: 'textbox', filtertype: 'input', datafield: 'startdate', width: '10%',cellsformat:'dd.MM.yyyy' },
							{ text: 'EndDate',columntype: 'textbox', filtertype: 'input', datafield: 'enddate', width: '10%',cellsformat:'dd.MM.yyyy' },
							{ text: 'Qty',columntype: 'textbox', filtertype: 'input', datafield: 'qty', width: '10%' },
        	              ]
                    });
            $('#jqxSecpassSearch1').on('rowdoubleclick', function (event) {
                var rowindex1=event.args.rowindex;
                document.getElementById("docno").value= $('#jqxSecpassSearch1').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
                document.getElementById("name").value = $("#jqxSecpassSearch1").jqxGrid('getcellvalue', rowindex1, "name");
				document.getElementById("description").value = $("#jqxSecpassSearch1").jqxGrid('getcellvalue', rowindex1, "description");
                $("#date").jqxDateTimeInput('val', $("#jqxSecpassSearch1").jqxGrid('getcellvalue', rowindex1, "date"));
				 var sdate=$("#jqxSecpassSearch1").jqxGrid('getcellvalue', rowindex1, "startdate");
				 var edate=$("#jqxSecpassSearch1").jqxGrid('getcellvalue', rowindex1, "enddate");
                if(sdate==null ||sdate==""){
                 $("#startdate").val(new Date());
                }else{
                $("#startdate").jqxDateTimeInput('val', $("#jqxSecpassSearch1").jqxGrid('getcellvalue', rowindex1, "startdate"));
                
                }
                  if(edate==null ||edate==""){
                 $("#enddate").val(new Date());
                }else{
                 $("#enddate").jqxDateTimeInput('val', $("#jqxSecpassSearch1").jqxGrid('getcellvalue', rowindex1, "enddate"));
                
                }
                 
                  document.getElementById("qty").value= $('#jqxSecpassSearch1').jqxGrid('getcellvalue', rowindex1, "qty");
                $('#window').jqxWindow('close');
                // 
            });  
            
            /* Grid Ends */
        });
	
	
	
	function funSearchLoad(){
		changeContent('securityPassSearch.jsp', $('#window')); 
	 }
	function funReadOnly() {
		$('#frmSecpass input').attr('readonly', true);
		$('#date').jqxDateTimeInput({
			readonly : true
		});
		
		/* 	$('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
	}
	function funRemoveReadOnly() {
		$('#frmSecpass input').attr('readonly', false);
		$('#date').jqxDateTimeInput({
			readonly : false
		});
		$('#docno').attr('readonly', true);
		 if(document.getElementById("mode").value=='A'){
		  $("#startdate").jqxDateTimeInput('setDate', new Date());
	    	 $("#enddate").jqxDateTimeInput('setDate', new Date());
	    	  $("#date").jqxDateTimeInput('setDate', new Date());
		 
		 
		 }
	}
	function setValues() {
		 if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
	}
	
	 $(function(){
	        $('#frmSecpass').validate({
	                 rules: {
	                 name: {
	                	 required:true,
	                	 maxlength:40
	                 }
	                 },
	                 messages: {
	                  name: {
	                	  required:" *",
	                	  maxlength:"max 40 only"
	                  } 
	                 }
	        });});
	     function funNotify(){
	    
	    		return 1;
		} 
	     function funFocus(){
	    	 document.getElementById("name").focus();
	     }
	  function funExcelBtn(){
		  $("#jqxSecpassSearch1").jqxGrid('exportdata', 'xls', 'Brand');
	  }
</script>  
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

/* Custom UI Buttons matching 24px height */
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

/* Disabled Button Styling */
.modern-ui .myButton:disabled,
.modern-ui .myButton[disabled] {
    background: #e2e8f0 !important;
    color: #94a3b8 !important;
    cursor: not-allowed !important;
    box-shadow: none !important;
    border: 1px solid #cbd5e1 !important;
}
.modern-ui .myButton:disabled:hover {
    background: #e2e8f0 !important;
}

/* Grid Wrappers */
.modern-ui .grid-container {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    background: #fff;
    overflow: hidden;
    min-height: 200px;
}

/* Scrollbar Logic */
.hidden-scrollbar {
    overflow-y: auto;
    height: calc(100vh - 150px);
    padding-right: 5px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #c5d3e0; border-radius: 3px; }
</style>
</head>
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
    <jsp:include page="../../../../header.jsp" />

    <div class='modern-ui hidden-scrollbar'>
        
        <form id="frmSecpass" action="saveSecurityPass" method="get" autocomplete="off">
            <div class="middle-panel">
                <span class="middle-panel-title">Security Pass Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:70px;">Date</label>
                    <div style="width: 120px;">
                        <div id="date" name="date" value='<s:property value="date"/>'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:80px;">StartDate</label>
                    <div style="width: 120px;">
                        <div id="startdate" name="startdate" value='<s:property value="startdate"/>'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:80px;">EndDate</label>
                    <div style="width: 120px;">
                        <div id="enddate" name="enddate" value='<s:property value="enddate"/>'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No.</label>
                    <input type="text" name="docno" id="docno" value='<s:property value="docno"/>' style="width:120px;" tabindex="-1" readonly />
                </div>

                <div class="field-row" style="margin-bottom:0;">
                    <label class="lbl-right" style="width:70px;">Name</label>
                    <input type="text" name="name" id="name" value='<s:property value="name"/>' style="width:200px;" />
                    
                    <label class="lbl-right" style="width:80px;">Description</label>
                    <input type="text" name="description" id="description" value='<s:property value="description"/>' style="flex:1;" />
                    
                    <label class="lbl-right" style="width:60px;">Qty</label>
                    <input type="text" name="qty" id="qty" value='<s:property value="qty"/>' style="width:100px;" />
                </div>
            </div>

            <div style="display:none;">
                <input type="hidden" id="mode" name="mode" />
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>' />
                <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />
            </div>
        </form>

        <div class="middle-panel" style="margin-bottom:0;">
            <span class="middle-panel-title">Security Pass Records</span>
            <div id="jqxSecpassSearch1" class="grid-container"></div>
        </div>

    </div>
</div>
</body>
</html>