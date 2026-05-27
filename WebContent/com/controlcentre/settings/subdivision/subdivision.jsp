<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../../../../includes.jsp"></jsp:include>
<title>GatewayERP(i)</title>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.controlcentre.settings.subdivision.ClsSubDivisionDAO"%>
<%ClsSubDivisionDAO DAO= new ClsSubDivisionDAO();%>     
<script type="text/javascript">
				
		$(document).ready(function() {
			$("#date").jqxDateTimeInput({ width: '105px', height: '20px', formatString:"dd.MM.yyyy"});
		
			var datas='<%=DAO.descLoad(session) %>';
              
            var source =
            {
                datatype: "json",
                datafields: [
                          	{name : 'doc_no' , type: 'number' },
                          	{name : 'date', type: 'date'  },
                          	{name : 'name', type: 'String'  },
                 ],
                localdata: datas,
                
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
    
            $("#subDivisionGridID").jqxGrid(
                    {
                    	width: "100%",
                    	height:375,
                        source: dataAdapter,
                        showfilterrow: true,
                        filterable: true,
                        enabletooltips:true,     
                        selectionmode: 'singlerow',
                        
                        columns: [
        					{ text: 'Doc No', datafield: 'doc_no', width: '10%' },
        					{ text: 'Date',datafield: 'date', width: '10%',cellsformat:'dd.MM.yyyy' },
        					{ text: 'Name', datafield: 'name'},             
        	              ]
                    });
            
         $('#subDivisionGridID').on('rowdoubleclick', function (event) {
                var rowindex1=event.args.rowindex;
                
                document.getElementById("docno").value= $('#subDivisionGridID').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
                $("#date").jqxDateTimeInput('val', $("#subDivisionGridID").jqxGrid('getcellvalue', rowindex1, "date"));
                document.getElementById("txtname").value = $("#subDivisionGridID").jqxGrid('getcellvalue', rowindex1, "name");
            });
		
		});
		
		function funReadOnly(){
			$('#frmSubDivision input').attr('readonly', true );
			$('#date').jqxDateTimeInput({disabled: true});
		}
		
		function funRemoveReadOnly(){
			$('#frmSubDivision input').attr('readonly', false );
			$('#date').jqxDateTimeInput({disabled: false});
			$('#docno').attr('readonly', true);
			
			if ($("#mode").val() == "A") {
				$('#date').val(new Date());
			}
		}
		
		function funSearchLoad(){
			  /*changeContent('cpsMainSearch.jsp');*/   
		 }
			
		function funChkButton() {
				/* funReset(); */
		}
		 
		function funFocus(){
			$('#date').jqxDateTimeInput('focus'); 	    		
		}
		
		function funNotify(){	
  			 return 1;
			} 
		  
		  function setValues(){
			  
			  if($('#msg').val()!=""){
				   $.messager.alert('Message',$('#msg').val());
				  }
			  
			  document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
			  funSetlabel();
			  
			}
		
</script>

<style>
/* FORCE UNIVERSAL FONT (Fixes the Header vs Form mismatch) */
body, input, select, textarea, button, .modern-ui {
    font-family: Arial, sans-serif !important;
}

body {
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
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

/* Disabled Text Inputs */
.modern-ui input[readonly],
.modern-ui input[type="text"]:disabled,
.modern-ui select:disabled { 
    background-color: #f8f9fa !important; 
    color: #6b7280 !important;
    border-color: #e5e7eb !important;
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
.myButton {
    height: 24px !important;
    line-height: 22px !important;
    padding: 0 12px;
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

.myButton:hover:not(:disabled) { 
    background: linear-gradient(135deg, #083a8a 0%, #1d4ed8 100%); 
}

/* GLOBAL CATCH-ALL DISABLED BUTTON STATE */
.myButton:disabled,
button:disabled,
button[disabled],
input[type="button"]:disabled,
input[type="submit"]:disabled,
a.disabled,
a[disabled],
.disabled,
.l-btn-disabled,       /* Catches EasyUI framework buttons */
.ui-state-disabled,    /* Catches jQuery UI framework buttons */
.btn-disabled,
[disabled="disabled"],
[disabled="true"] {
    background: #e2e8f0 !important;
    background-color: #e2e8f0 !important;
    background-image: none !important; /* Kills legacy gradients */
    color: #94a3b8 !important;      
    border: 1px solid #cbd5e1 !important;
    cursor: not-allowed !important; 
    box-shadow: none !important;
    text-shadow: none !important;
    pointer-events: none !important; /* Physically stops clicks */
}

/* Kills hover effects on disabled elements */
a.disabled:hover,
.disabled:hover,
.l-btn-disabled:hover,
button:disabled:hover {
    background: #e2e8f0 !important;
    background-color: #e2e8f0 !important;
    background-image: none !important; 
}

/* Search Icon Wrapper */
.modern-ui .input-search-container {
    position: relative;
    display: flex;
}
.modern-ui .input-search-container input {
    padding-right: 25px !important;
}
.modern-ui .magnifier-icon {
    position: absolute;
    right: 6px; 
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #64748b; 
    z-index: 10;
}
.modern-ui .magnifier-icon:hover { color: #2563eb; }

/* FIXED: Grid Wrappers (Crash Prevention) */
.modern-ui .grid-container {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    background: #fff;
    overflow: hidden;
    display: block; 
    min-height: 200px;
}

/* FIXED: Scrollbar Logic (Crash Prevention) */
.hidden-scrollbar {
    padding-right: 5px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #c5d3e0; border-radius: 3px; }

/* Validation Error override */
.modern-ui label.error,
form label.error { 
    color: red !important; 
    font-weight: bold; 
    font-size: 11px; 
}

/* Specific internal layout resets */
#part input, #pnames input { width: 100% !important; box-sizing: border-box; }
.classpass { -webkit-text-security: disc; }
</style>
</head>
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
    <form id="frmSubDivision" action="saveSubDivision" method="post" autocomplete="off">
        
        <jsp:include page="../../../../header.jsp"></jsp:include>
        <br/>
        
        <div class="modern-ui hidden-scrollbar">
            
            <div class="middle-panel">
                <span class="middle-panel-title">Sub Division Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Date</label>
                    <div style="width: 120px;">
                        <div id='date' name='date' value='<s:property value="date"/>'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No.</label>
                    <input type="text" id="docno" name="docno" value='<s:property value="docno"/>' tabindex="-1" readonly style="width:120px;"/>
                </div>

                <div class="field-row" style="margin-bottom:0;">
                    <label class="lbl-right" style="width:80px;">Name</label>
                    <input type="text" id="txtname" name="txtname" value='<s:property value="txtname"/>' style="width: 300px;"/>
                </div>
            </div>

            <div class="middle-panel" style="margin-bottom:0;">
                <span class="middle-panel-title">Sub Division Records</span>
                <div id="subDivisionGridID" class="grid-container"></div>
            </div>

            <div style="display:none;">
                <input type="hidden" id="hidendate" name="hidendate" value='<s:property value="hidendate"/>'/>
                <input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>'/>
                <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
            </div>

        </div>
    </form>
</div>
</body>
</html>