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
    document.getElementById("formdet").innerText="Location(LOC)";
    document.getElementById("formdetail").value="Location";
    document.getElementById("formdetailcode").value="LOC";
    window.parent.formCode.value="LOC";
    window.parent.formName.value="Location";
});

function funReadOnly(){
    $('#frmLocation input').attr('readonly', true );
    $('#frmLocation select').attr('disabled', true );
}

function funRemoveReadOnly(){
    $('#frmLocation input').attr('readonly', false );
    $('#frmLocation select').attr('disabled', false );
}
  
function funSearchLoad(){
    changeContent('locationSearch.jsp', $('#window')); 
}

function getBranch() {
    var x=new XMLHttpRequest();
    x.onreadystatechange=function(){
        if (x.readyState==4 && x.status==200) {
            items= x.responseText;
            items=items.split('***');
            var branchidItems=items[1].split(",");
            var branchItems=items[0].split(",");
            var optionsbranch = '<option value="">--Select--</option>';
            for ( var i = 0; i < branchItems.length; i++) {
                optionsbranch += '<option value="' + branchidItems[i] + '">' + branchItems[i] + '</option>';
            }
            $("select#cmbbranchname").html(optionsbranch);
            $('#cmbbranchname').val($('#hidcmbbranchname').val());
        }
    }
    x.open("GET","getBranch.jsp",true);
    x.send();   
}

function setValues(){
    if($('#msg').val()!=""){
        $.messager.alert('Message',$('#msg').val());
    }
}

function funFocus() {
    document.getElementById("cmbbranchname").focus();
}

$(function(){
    $('#frmLocation').validate({
        rules: {
            cmbbranchname: "required",
            txtloccode:"required",
            txtlocname:"required"
        },
        messages: {
            cmbbranchname: " *",
            txtloccode:" *",
            txtlocname:" *"
        }
    });
});

function funNotify(){
    return 1;
}

function checkLocCode(value){
    var x=new XMLHttpRequest();
    x.onreadystatechange=function(){
        if (x.readyState==4 && x.status==200) {
            var items=x.responseText;
            if(items.trim()!='undefine'){
                document.getElementById("txtloccode").focus();
                document.getElementById("errormsg").innerText="Location ID Already Exists";
            }
            else{
                document.getElementById("txtlocname").focus();
                document.getElementById("errormsg").innerText="";
            }
        }
    }
    x.open("GET","checkLocCode.jsp?code="+value+"&doc="+document.getElementById("docno").value,true);
    x.send();
}
</script>
</head>
<body onload="getBranch();funReadOnly();setValues();">
<div id="mainBG" class="homeContent" data-type="background">
    <form id="frmLocation" action="saveActionLocation" autocomplete="off" >
        <jsp:include page="../../../../header.jsp" />
        
        <div class="modern-ui">

            <div class="middle-panel" style="margin-top: 20px;">
                <span class="middle-panel-title">Location Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Branch</label>
                    <select id="cmbbranchname" name="cmbbranchname" style="flex:1;" value='<s:property value="cmbbranchname"/>'>
                        <option></option>
                    </select>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Location</label>
                    <input type="text" id="txtloccode" name="txtloccode" style="width:120px;" value='<s:property value="txtloccode"/>' onblur="checkLocCode(this.value);">
                    <input type="text" id="txtlocname" name="txtlocname" style="flex:1;" value='<s:property value="txtlocname"/>' placeholder="Location Name">
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Address</label>
                    <input type="text" id="txtaddress" name="txtaddress" style="flex:1;" value='<s:property value="txtaddress"/>' />
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">P.B.No</label>
                    <input type="text" id="txtpbno" name="txtpbno" style="width:250px;" value='<s:property value="txtpbno"/>'>
                </div>
            </div>

            <div class="middle-panel">
                <span class="middle-panel-title">Contact Information</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Tel 1</label>
                    <input type="text" id="txttel1" name="txttel1" style="width:250px;" value='<s:property value="txttel1"/>'>
                    
                    <label class="lbl-right" style="width:100px;">Tel 2</label>
                    <input type="text" id="txttel2" name="txttel2" style="width:250px;" value='<s:property value="txttel2"/>'>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Fax 1</label>
                    <input type="text" id="txtfax1" name="txtfax1" style="width:250px;" value='<s:property value="txtfax1"/>'>
                    
                    <label class="lbl-right" style="width:100px;">Fax 2</label>
                    <input type="text" id="txtfax2" name="txtfax2" style="width:250px;" value='<s:property value="txtfax2"/>'>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Email</label>
                    <input type="email" id="txtemail1" name="txtemail1" style="flex:1; max-width: 616px;" value='<s:property value="txtemail1"/>'>
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Website</label>
                    <input type="text" id="txtwebsite" name="txtwebsite" style="flex:1; max-width: 616px;" value='<s:property value="txtwebsite"/>'>
                </div>
            </div>

            <div style="display:none;">
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'>
                <input type="hidden" id="hidcmbbranchname" name="hidcmbbranchname" value='<s:property value="hidcmbbranchname"/>'>
                <input type="hidden" name="docno" id="docno" value='<s:property value="docno"/>'>
                <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'/>
                <input type="hidden" id="mode" name="mode"/>
            </div>

        </div>
    </form>
</div>
</body>
</html>