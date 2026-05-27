<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../../../../includes.jsp"></jsp:include>
<title>GatewayERP(i)</title>

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

form label.error {
    color: red;
    font-weight: bold;
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

/* Coordinate Setup Grouping */
.modern-ui .input-group {
    display: flex;
    align-items: center;
    gap: 15px; /* Spacing between inputs without labels */
}

/* Spacer elements to match legacy alignment */
.modern-ui .header-row {
    display: flex;
    font-weight: bold;
    color: #444;
    font-size: 12px;
    margin-bottom: 4px;
    padding-left: 108px; /* Aligns with the input group start */
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
</style>

<script type="text/javascript">
        
        $(document).ready(function() {
            // Modernized Date Input Size
            $("#jqxChqPrintSetUpDate").jqxDateTimeInput({ width: '125px', height: 24, formatString:"dd.MM.yyyy", theme: 'energyblue'});
            
            /* Force internal alignment AFTER render */
            setTimeout(function () {
                $("#jqxChqPrintSetUpDate").find("input").css({
                    "margin-top": "0px",
                    "line-height": "24px",
                    "font-size": "12px", 
                    "font-family": "Arial, sans-serif", 
                    "padding": "0 6px", 
                    "box-sizing":"border-box"
                });
                $("#jqxChqPrintSetUpDate").find(".jqx-action-button").css({
                    "top": "0px",
                    "height": "24px"
                });
            }, 0);
            
            $('#bankDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
            $('#bankDetailsWindow').jqxWindow('close');
            
            $('#txtbankid').dblclick(function(){
                  bankSearchContent('bankDetails.jsp');
            });
        });
        
        function bankSearchContent(url) {
            $('#bankDetailsWindow').jqxWindow('open');
            $.get(url).done(function (data) {
            $('#bankDetailsWindow').jqxWindow('setContent', data);
            $('#bankDetailsWindow').jqxWindow('bringToFront');
        }); 
        } 
        
        function isNumber(evt) {
            var iKeyCode = (evt.which) ? evt.which : evt.keyCode
            if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
             {
              $.messager.alert('Message',' Enter Numbers Only ','warning');    
                return false;
             }
            return true;
        }
        
        function getBankDetails(event){
              var x= event.keyCode;
              if(x==114){
                  bankSearchContent('bankDetails.jsp');
              }
              else{
               }
              }
        
        function funReadOnly(){
            $('#frmChequePrintingSetUp input').attr('readonly', true );
            $('#jqxChqPrintSetUpDate').jqxDateTimeInput({disabled: true});
        }
        
        function funRemoveReadOnly(){
            $('#frmChequePrintingSetUp input').attr('readonly', false );
            $('#jqxChqPrintSetUpDate').jqxDateTimeInput({disabled: false});
            $('#txtbankid').attr('readonly', true);
            $('#txtbankname').attr('readonly', true);
            $('#docno').attr('readonly', true);
            
            if ($("#mode").val() == "A") {
                $('#jqxChqPrintSetUpDate').val(new Date());
            }
        }
        
        function funSearchLoad(){
              changeContent('cpsMainSearch.jsp');   
         }
            
        function funChkButton() {
                /* funReset(); */
        }
         
        function funFocus(){
            $('#jqxChqPrintSetUpDate').jqxDateTimeInput('focus');           
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
          
          function funPrintBtn(){
                if (($("#mode").val() == "view") && $("#docno").val()!="") {
                    var url=document.URL;
                    var reurl=url.split("saveChequePrintingSetUp");
                    $("#docno").prop("disabled", false);                
                 
                    var win= window.open(reurl[0]+"printChequeVoucher?docno="+document.getElementById("docno").value,"_blank","top=150,left=250,Width=1020,Height=500,location=no,scrollbars=no,toolbar=yes");
                    win.focus();
                 }
                else {
                    $.messager.alert('Message','Select a Document....!','warning');
                    return;
                }
            }
        
  </script>
</head>
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">

    <form id="frmChequePrintingSetUp" action="saveChequePrintingSetUp" method="post" autocomplete="off">
        <jsp:include page="../../../../header.jsp"></jsp:include>
        
        <div class="modern-ui">

            <div class="middle-panel" style="margin-top: 20px;">
                <span class="middle-panel-title">General Info</span>
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Date</label>
                    <div style="width: 125px;">
                        <div id='jqxChqPrintSetUpDate' name='jqxChqPrintSetUpDate' value='<s:property value="jqxChqPrintSetUpDate"/>'></div>
                        <input type="hidden" id="hidjqxChqPrintSetUpDate" name="hidjqxChqPrintSetUpDate" value='<s:property value="hidjqxChqPrintSetUpDate"/>'/>
                    </div>
                    
                    <label class="lbl-right" style="width:120px; margin-left:auto;">Doc No.</label>
                    <input type="text" id="docno" name="txtchqsetupdocno" style="width:150px;" value='<s:property value="txtchqsetupdocno"/>' tabindex="-1" readonly/>
                </div>
            </div>

            <div class="middle-panel">
                <span class="middle-panel-title">Bank Details</span>
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Bank Account</label>
                    <input type="text" id="txtbankid" name="txtbankid" style="width:150px;" placeholder="Press F3" onkeydown="getBankDetails(event);" value='<s:property value="txtbankid"/>'/>
                    <input type="hidden" id="txtbankdocno" name="txtbankdocno" value='<s:property value="txtbankdocno"/>'/>
                    
                    <label class="lbl-right" style="width:120px;">Bank Name</label>
                    <input type="text" id="txtbankname" name="txtbankname" style="flex:1;" value='<s:property value="txtbankname"/>' tabindex="-1" readonly/>
                </div>
            </div>

            <div class="middle-panel">
                <span class="middle-panel-title">Cheque Print Coordinates</span>
                
                <div class="header-row">
                    <div style="width:100px; text-align:center;">Height</div>
                    <div style="width:100px; text-align:center; margin-left:15px;">Width</div>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Page Size</label>
                    <div class="input-group" style="width:250px;">
                        <input type="text" id="txtpageheight" name="txtpageheight" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtpageheight"/>'/>
                        <input type="text" id="txtpagewidth" name="txtpagewidth" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtpagewidth"/>'/>
                    </div>
                    
                    <label class="lbl-right" style="width:120px;">Date</label>
                    <div class="input-group" style="width:250px;">
                        <input type="text" id="txtdate" name="txtdate" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtdate"/>'/>
                        <input type="text" id="txtdate1" name="txtdate1" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtdate1"/>'/>
                    </div>
                </div>
                
                <div style="height: 15px;"></div> <div class="header-row">
                    <div style="width:100px; text-align:center;">Ver</div>
                    <div style="width:100px; text-align:center; margin-left:15px;">Hor</div>
                    <div style="width:100px; text-align:center; margin-left:15px;">Len</div>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Pay To</label>
                    <div class="input-group" style="width:350px;">
                        <input type="text" id="txtvertical" name="txtvertical" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtvertical"/>'/>
                        <input type="text" id="txthorizontal" name="txthorizontal" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txthorizontal"/>'/>
                        <input type="text" id="txtlength" name="txtlength" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtlength"/>'/>
                    </div>
                    
                    <label class="lbl-right" style="width:20px;">A/C Payee</label>
                    <div class="input-group" style="width:250px;">
                        <input type="text" id="txtaccountpaying" name="txtaccountpaying" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtaccountpaying"/>'/>
                        <input type="text" id="txtaccountpaying1" name="txtaccountpaying1" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtaccountpaying1"/>'/>
                    </div>
                </div>

                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Amt Words (L1)</label>
                    <div class="input-group" style="width:350px;">
                        <input type="text" id="txtamtvertical" name="txtamtvertical" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtamtvertical"/>'/>
                        <input type="text" id="txtamthorizontal" name="txtamthorizontal" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtamthorizontal"/>'/>
                        <input type="text" id="txtamtlength" name="txtamtlength" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtamtlength"/>'/>
                    </div>
                    
                    <label class="lbl-right" style="width:20px;">Amount</label>
                    <div class="input-group" style="width:250px;">
                        <input type="text" id="txtamount" name="txtamount" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtamount"/>'/>
                        <input type="text" id="txtamount1" name="txtamount1" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtamount1"/>'/>
                    </div>
                </div>

                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Amt Words (L2)</label>
                    <div class="input-group" style="width:350px;">
                        <input type="text" id="txtamt1vertical" name="txtamt1vertical" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtamt1vertical"/>'/>
                        <input type="text" id="txtamt1horizontal" name="txtamt1horizontal" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtamt1horizontal"/>'/>
                        <input type="text" id="txtamt1length" name="txtamt1length" style="width:100px; text-align: right;" onkeypress="return isNumber(event)" value='<s:property value="txtamt1length"/>'/>
                    </div>
                </div>

            </div>

            <div style="display:none;">
                <input type="hidden" id="mode" name="mode"/>
                <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
            </div>

        </div>
    </form>

    <div id="bankDetailsWindow"><div></div><div></div></div>  
</div>
</body>
</html>