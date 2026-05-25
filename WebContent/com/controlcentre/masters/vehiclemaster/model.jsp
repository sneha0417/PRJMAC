<%@page import="com.controlcentre.masters.vehiclemaster.model.ClsModelAction" %>
<%ClsModelAction cma=new ClsModelAction(); %>
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
/* =========================================================
   SCOPED UI: Modern Layout
========================================================= */
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

/* Grid Wrappers */
.modern-ui .grid-container {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    background: #fff;
    overflow: hidden;
    width: 100%;
}

/* Validation Errors */
form label.error {
    color: red;
    font-weight: bold;
    font-size: 11px;
    margin-left: 5px;
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

<script type="text/javascript">
      $(document).ready(function () {          
          $("#modeldate").jqxDateTimeInput({ width : '125px', height : 24, formatString : "dd.MM.yyyy", theme: 'energyblue' });  
          
          /* Force internal alignment AFTER render */
          setTimeout(function () {
               $("#modeldate").find("input").css({
                   "margin-top": "0px",
                   "line-height": "24px",
                   "font-size": "12px", 
                   "font-family": "Arial, sans-serif", 
                   "padding": "0 6px", 
                   "box-sizing":"border-box"
               });
               $("#modeldate").find(".jqx-action-button").css({
                   "top": "0px",
                   "height": "24px"
               });
          }, 0);
     
          document.getElementById("formdet").innerText="Model(MOD)";
            document.getElementById("formdetail").value="Model";
            document.getElementById("formdetailcode").value="MOD";
            window.parent.formCode.value="MOD";
            window.parent.formName.value="Model";
          var data= '<%=cma.searchDetails() %>';
              
              var num = 0; 
              var source =
              {
                  datatype: "json",
                  datafields: [
                                {name : 'DOC_NO' , type: 'int' },
                            {name : 'vtype', type: 'String'  },
                                {name : 'date', type: 'date'  },
                                {name : 'brand_name',type:'String'},
                                {name : 'brandid',type:'String'}
                   ],
                   localdata: data,
                  
                  
                  pager: function (pagenum, pagesize, oldpagenum) {
                      // callback called when a page or page size is changed.
                  }
              };
              
              var dataAdapter = new $.jqx.dataAdapter(source,
                     {
                        loadError: function (xhr, status, error) {
                           alert(error);    
                        }
                    }        
              );
      


              $("#jqxModelSearch1").jqxGrid(
                      {
                          width: '100%',
                          height: 350,
                          source: dataAdapter,
                          showfilterrow: true,
                          filterable: true,
                          selectionmode: 'multiplecellsextended',
                          theme: 'energyblue',
                        //  pagermode: 'default',
                          sortable: true,
                          //pageable: true,
                          altrows:true,
                          //Add row method
                          columns: [
                              { text: 'Doc No',filtertype: 'number', datafield: 'DOC_NO', width: '15%' },
                              { text: 'Brand ID',columntype: 'textbox', filtertype: 'input', datafield: 'brandid', width: '20%' },
                              { text: 'Model',columntype: 'textbox', filtertype: 'input', datafield: 'vtype', width: '25%' },
                              { text: 'Date',columntype: 'textbox',filtertype: 'input',datafield:'date',width: '15%',cellsformat:'dd.MM.yyyy'},
                              { text: 'Brand',columntype: 'textbox', filtertype: 'input', datafield: 'brand_name', width: '25%' }
                          ]
                      });

              $('#jqxModelSearch1').on('rowdoubleclick', function (event) 
                      {
                          var rowindex1=event.args.rowindex;
                          document.getElementById("docno").value= $('#jqxModelSearch1').jqxGrid('getcellvalue', rowindex1, "DOC_NO"); 
                          document.getElementById("model").value = $("#jqxModelSearch1").jqxGrid('getcellvalue', rowindex1, "vtype");
                        $('#frmModel select').attr('disabled', false);
                  $('#modeldate').jqxDateTimeInput({disabled: false});
                          $("#modeldate").jqxDateTimeInput('val',$("#jqxModelSearch1").jqxGrid('getcellvalue', rowindex1, "date"));
                         // $('#brandid').val($("#jqxModelSearch").jqxGrid('getcellvalue', rowindex1, "brandid")) ;
                          $('#brand').val($("#jqxModelSearch1").jqxGrid('getcellvalue', rowindex1, "brandid")) ;
                        $('#frmModel select').attr('disabled', true);
                  $('#modeldate').jqxDateTimeInput({disabled: true});
                       }); 
              $("#jqxModelSearch1").jqxGrid('hidecolumn', 'brandid'); 
              //$("#jqxModelSearch").jqxGrid('hidecolumn', 'brandid'); 

          });
    
      function funSearchLoad(){
            changeContent('modelSearch.jsp', $('#window')); 
         }

    function funReadOnly() {
        $('#frmModel input').attr('readonly', true);
        $('#frmModel select').attr('disabled', true);
        $('#modeldate').jqxDateTimeInput({disabled: true});
    }
    
    function funRemoveReadOnly() {
        $('#frmModel input').attr('readonly', false);
        $('#frmModel select').attr('disabled', false);
        $('#modeldate').jqxDateTimeInput({disabled: false});
        $('#docno').attr('readonly', true);
    }

    function getBrand() {
        var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) {
                items = x.responseText;
                items = items.split('***');
                var brandItems = items[0].split(",");
                var brandidItems = items[1].split(",");
                var optionsbrand = '<option value="">--Select--</option>';
                for (var i = 0; i < brandItems.length; i++) {
                    optionsbrand += '<option value="' + brandidItems[i] + '">'
                            + brandItems[i] + '</option>';
                }
                $("select#brand").html(optionsbrand);
                $('#brand').val($('#brandid').val());
                } else {
            }
        }
        x.open("GET", "getBrand.jsp", true);
        x.send();
    }
    
    function funFocus(){
        document.getElementById("brand").focus();
    }
     $(function(){
            $('#frmModel').validate({
                     rules: {
                     brand:{
                         required:true
                     },
                     model:{
                         required:true,
                         maxlength:20
                     }
                     },
                     messages: {
                      brand:{
                          required:" *"
                      },
                      model:{
                          required:" *",
                          maxlength:"max 20 chars"
                      }
                     }
            });});
            
         function funNotify(){
            return 1;
        } 
         
    function setValues() {
        if ($('#brandid').val() != null && $('#brandid').val() != '') {
            $('#brand').val($('#brandid').val());
        }
        if($('#msg').val()!=""){
           $.messager.alert('Message',$('#msg').val());
          }
    }
    
     function funExcelBtn(){
          $("#jqxModelSearch1").jqxGrid('exportdata', 'xls', 'Model');
      }
</script>
</head>
<body onLoad="getBrand();setValues();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmModel" action="saveActionModel" autocomplete="off">
    <jsp:include page="../../../../header.jsp" />

    <div class='modern-ui hidden-scrollbar'>
        
        <div class="middle-panel">
            <span class="middle-panel-title">Model Details</span>
            
            <div class="field-row">
                <label class="lbl-right" style="width:80px;">Date</label>
                <div style="width: 125px;">
                    <div id="modeldate" name="modeldate" value='<s:property value="modeldate"/>'></div>
                </div>
                
                <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No.</label>
                <input type="text" name="docno" id="docno" value='<s:property value="docno"/>' readonly="readonly" tabindex="-1" style="width:120px;" />
            </div>
            
            <div class="field-row">
                <label class="lbl-right" style="width:80px;">Brand</label>
                <select name="brand" id="brand" style="width:200px;"></select>
                
                <label class="lbl-right" style="width:80px;">Model</label>
                <input type="text" name="model" id="model" value='<s:property value="model"/>' style="width:200px;" />
            </div>
        </div>

        <div class="middle-panel">
            <span class="middle-panel-title">Model Search</span>
            <div class="field-row">
                <div id="jqxModelSearch1" class="grid-container"></div>  
            </div>
        </div>
        
        <div style="display:none;">
            <input type="hidden" id="brandid" name="brandid" value='<s:property value="brandid"/>' />
            <input type="hidden" id="mode" name="mode"/>
            <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
            <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>    
        </div>
        
    </div>
</form>
</div>
</body>
</html>