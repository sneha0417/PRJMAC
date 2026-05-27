<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>

<!DOCTYPE html>
<html>
<head>
<s:head/>
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

form label.error {
    color: red;
    font-weight: bold;
}

/* Master Input Heights - Forced to 24px */
.modern-ui input[type="text"],
.modern-ui input[type="email"],
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
.modern-ui input[type="email"]:focus,
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
</style>

<script type="text/javascript">
$(document).ready(function () {  
    // Modernized Date Input Size
    $("#date_province").jqxDateTimeInput({ width: '125px', height: 24, formatString: "dd.MM.yyyy", theme: 'energyblue'}); 
    
    /* Force internal alignment AFTER render */
    setTimeout(function () {
        $("#date_province").find("input").css({
            "margin-top": "0px",
            "line-height": "24px",
            "font-size": "12px", 
            "font-family": "Arial, sans-serif", 
            "padding": "0 6px", 
            "box-sizing":"border-box"
        });
        $("#date_province").find(".jqx-action-button").css({
            "top": "0px",
            "height": "24px"
        });
    }, 0);

    document.getElementById("formdet").innerText="Province(PRV)";
    document.getElementById("formdetail").value="Province";
    document.getElementById("formdetailcode").value="PRV";
    window.parent.formCode.value="PRV";
    window.parent.formName.value="Province";
});

function funReadOnly(){
   $('#frmProvince input').attr('readonly', true );
   $('#frmProvince select').attr('disabled', true );
   $('#date_province').jqxDateTimeInput({ disabled: true}); 
}

function funRemoveReadOnly(){
   $('#frmProvince input').attr('readonly', false );
   $('#frmProvince select').attr('disabled', false );
   $('#docno').attr('readonly', true );
   $('#date_province').jqxDateTimeInput({ disabled: false}); 
}

function funSearchLoad(){
    changeContent('ProvinceSearch.jsp', $('#window')); 
}

function getBranch() {
    // Left empty as per original implementation
}

function setValues(){
    if($('#msg').val()!=""){
        $.messager.alert('Message',$('#msg').val());
    }
}

function funFocus() {
    // document.getElementById("cmbbranchname").focus();
}

function funNotify(){
    return 1;
}

function checkLocCode(value){
    // Left empty as per original implementation
}
</script>
</head>
<body onload="setValues();">
<div id="mainBG" class="homeContent" data-type="background">
    <form id="frmProvince" action="saveActionProvince" autocomplete="off" >

        <jsp:include page="../../../../header.jsp" />
        
        <div class="modern-ui">

            <div class="middle-panel" style="margin-top: 20px;">
                <span class="middle-panel-title">Province Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:120px;">Date</label>
                    <div style="width: 125px;">
                        <div id="date_province" name="date_province" value='<s:property value="date_province"/>'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:100px;">Doc No</label>
                    <input type="text" id="docno" name="docno" style="width:150px;" value='<s:property value="docno"/>' readonly="readonly" tabindex="-1">
                </div>

                <div class="field-row">
                    <label class="lbl-right" style="width:120px;">Code</label>
                    <input type="text" id="txtprovincecode" name="txtprovincecode" style="width:125px;" value='<s:property value="txtprovincecode"/>' onblur="checkcompid(this.value);">
                    
                    <label class="lbl-right" style="width:100px;">Name</label>
                    <input type="text" id="txtprovincename" name="txtprovincename" style="flex:1; max-width: 300px;" value='<s:property value="txtprovincename"/>'>
                </div>
            </div>

            <div style="display:none;">
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'>
                <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>
                <input type="hidden" id="hidcmbbranchname" name="hidcmbbranchname" value='<s:property value="hidcmbbranchname"/>'>
                <input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>'/>
            </div>

        </div>
    </form>
</div>
</body>
</html>