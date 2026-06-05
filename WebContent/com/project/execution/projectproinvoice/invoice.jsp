<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>

<style>
/* =========================================================
SCOPED UI: Modern Layout Standards
========================================================= */
form label.error {
    color: red;
    font-weight: bold;
}

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

/* Grid Wrappers */
.modern-ui .grid-container {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    background: #fff;
    overflow: hidden;
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
$(document).ready(function() {
    /* Standardized to 24px height */
    $("#date").jqxDateTimeInput({ width: '125px', height: 24, formatString: "dd.MM.yyyy" });
    
    /* Force internal alignment AFTER render */
    setTimeout(function () {
        $("#date").find("input").css({
            "margin-top": "0px",
            "line-height": "24px",
            "font-size": "12px", 
            "font-family": "Arial, sans-serif", 
            "padding": "0 6px", 
            "box-sizing":"border-box"
        });
        $("#date").find(".jqx-action-button").css({
            "top": "0px",
            "height": "24px"
        });
    }, 0);
      
    $('#contractwindow').jqxWindow({ width: '60%', height: '50%',  maxHeight: '85%' ,maxWidth: '80%' ,title: 'Contract Search' , position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    $('#contractwindow').jqxWindow('close');
      
    $('#txtcontract').dblclick(function(){
        $('#contractwindow').jqxWindow('open');
        contractSearchContent('contractMastersearch.jsp?', $('#contractwindow'));
    });
});

function getcontract(event){
    var x = event.keyCode;
    if(x == 114){
        $('#contractwindow').jqxWindow('open');
        contractSearchContent('contractMastersearch.jsp?', $('#contractwindow'));
    }
}
         
function contractSearchContent(url) {
    $.get(url).done(function (data) {
        $('#contractwindow').jqxWindow('setContent', data);
    }); 
}

function funFocus() {
    //document.getElementById("txtcontract").focus();
}

function funReadOnly(){
    $('#frmprojectproinvoice input').attr('readonly', true);
    $('#frmprojectproinvoice input').attr('disabled', true);
    $('#frmprojectproinvoice select').attr('disabled', true);
    $('#date').jqxDateTimeInput({ disabled: true});
    $('#docno').attr('readonly', true);
    $("#serviceGrid").jqxGrid({ disabled: true});
}

function funRemoveReadOnly(){
    $('#frmprojectproinvoice input').attr('readonly', false);
    $('#frmprojectproinvoice input').attr('disabled', false);
    $('#frmprojectproinvoice select').attr('disabled', false);
    $('#txtcontract').attr('readonly', true);
    $('#txtclient').attr('readonly', true);
    $('#txtclientdet').attr('readonly', true);
    $('#docno').attr('readonly', true);
    $('#date').jqxDateTimeInput({ disabled: false});
    $("#serviceGrid").jqxGrid({ disabled: false});
    
    if ($("#mode").val() == "A") {
        $("#txtlegalamt").val(0.0);
        $("#txtseramt").val(0.0);
        $("#txtnettotal").val(0.0);
         
        $("#serviceGrid").jqxGrid('clear');
        $("#serviceGrid").jqxGrid('addrow', null, {});
    }
}

function funNotify(){
    var contrno = document.getElementById("txtcontract").value;
    var amount = $('#serviceGrid').jqxGrid('getcellvalue',0,'amount');
    var legalfee = $('#serviceGrid').jqxGrid('getcellvalue',0,'lfee');
    
    if(amount == "" || amount == "undefined" || typeof(amount) == "undefined" || amount == null){
        document.getElementById("errormsg").innerText = "Amount is Mandatory";
        return 0;
    }
    
    if(contrno == ""){
        document.getElementById("errormsg").innerText = "Select Contract No.";
        return 0;
    }
    
    var rows = $("#serviceGrid").jqxGrid('getrows');
    $('#invgridlength').val(rows.length);
    for(var i = 0 ; i < rows.length ; i++){
        var newTextBox = $(document.createElement("input"))
            .attr("type", "dil")
            .attr("id", "prjinvtest"+i)
            .attr("name", "prjinvtest"+i)
            .attr("hidden", "true"); 
         
        newTextBox.val(rows[i].amount+"::"+rows[i].lfee+" :: ");
        newTextBox.appendTo('form');
    }    
    return 1;
} 

function funclear(){
    document.getElementById("txtcontract").value = "";
    document.getElementById("txtclient").value = "";
    document.getElementById("txtclientdet").value = "";
}

function setValues() {
    var docVal1 = document.getElementById("maintrno").value.trim();
  
    if(docVal1 > 0){
        var indexVal2 = document.getElementById("maintrno").value.trim();
        $("#serdiv").load("serviceGrid.jsp?pjinvtrno="+indexVal2);
    }
    
    if($('#msg').val() != ""){
       $.messager.alert('Message',$('#msg').val());
    }

    document.getElementById("formdet").innerText = $('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";	
     
    if($('#contypeval').val() != ""){
        $('#cmbcontracttype').val($('#contypeval').val());
    }
}
    
function funSearchLoad(){
    changeContent('Mastersearch.jsp'); 
} 

$(function(){
    $('#frmprojectproinvoice').validate({
        rules: { 
            refno: {"required":true},
            cmbcontracttype: {"required":true},
            desc: {"required":true, maxlength:300}
        },
        messages: {
            refno: {required:" * Required"},
            cmbcontracttype: {required:" * Required"},
            desc: {required:" * Required", maxlength:" Max 300 chars"}
        }
    });
});
     
function funPrintBtn() {
    if (($("#mode").val() == "view") && $("#docno").val() != "") {
        $("#docno").prop("disabled", false);
        $("#maintrno").prop("disabled", false);
        $("#formdetailcode").prop("disabled", false);
         
        var docno = $('#docno').val();
        var trno = $('#maintrno').val();
        var dtype = $('#formdetailcode').val();
        var costid = $('#costid').val();
        var brhid = <%= session.getAttribute("BRANCHID").toString() %>;
        var url = document.URL;
        var reurl = url.split("com/"); 
     
        var win = window.open(reurl[0]+"printProforma?docno="+docno+"&brhid="+brhid+"&trno="+trno+"&costid="+costid+"&dtype="+dtype+"&header=1","_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
        win.focus();
    } else {
        $.messager.alert('Message','Select a Document....!','warning');
        return;
    }
}
</script>
</head>

<body onLoad="setValues();">
<div id="mainBG" class="homeContent" data-type="background"> 
    <form id="frmprojectproinvoice" action="saveProjectProinvoice" method="post" autocomplete="off">
        <jsp:include page="../../../../header.jsp" />
        
        <div class="modern-ui hidden-scrollbar">
            
            <div class="middle-panel">
                <span class="middle-panel-title">General Info</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Date</label>
                    <div style="width: 125px;">
                        <div id="date" name="date" value='<s:property value="date"/>'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Ref No.</label>
                    <input type="text" name="refno" id="refno" value='<s:property value="refno"/>' style="width:120px;" />
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No.</label>
                    <input type="text" name="docno" id="docno" value='<s:property value="docno"/>' style="width:120px;" readonly tabindex="-1" />
                </div>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Contract Type</label>
                    <select name="cmbcontracttype" id="cmbcontracttype" onchange="funclear();" style="width:125px;">
                        <option value="">--Select--</option>
                        <option value="AMC">AMC</option>
                        <option value="SJOB">SJOB</option>
                    </select>
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Contract No.</label>
                    <div class="input-search-container" style="width: 120px;">
                        <input type="text" name="txtcontract" id="txtcontract" placeholder="Press F3" onKeyDown="getcontract(event);" value='<s:property value="txtcontract"/>' />
                        <svg class="magnifier-icon" onclick="$('#contractwindow').jqxWindow('open'); contractSearchContent('contractMastersearch.jsp?', $('#contractwindow'));" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                    </div>
                    
                    <div style="width:80px; margin-left:auto;"></div>
                    <div style="width:120px;"></div>
                </div>

                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Client</label>
                    <input type="text" name="txtclient" id="txtclient" value='<s:property value="txtclient"/>' style="width:125px;" readonly tabindex="-1" />
                    <input type="text" name="txtclientdet" id="txtclientdet" value='<s:property value="txtclientdet"/>' style="flex:1;" readonly tabindex="-1" />
                </div>
                
                <div class="field-row" style="margin-bottom:0;">
                    <label class="lbl-right" style="width:80px;">Description</label>
                    <input type="text" name="desc" id="desc" value='<s:property value="desc"/>' style="flex:1;" />
                </div>
            </div>

            <div class="middle-panel">
                <span class="middle-panel-title">Proforma Invoice Details</span>
                <div id="serdiv" class="grid-container">
                    <jsp:include page="serviceGrid.jsp"></jsp:include>
                </div>
            </div>

            <div style="display:none;">
                <input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>'/>
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
                <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
                <input type="hidden" id="clientid" name="clientid" value='<s:property value="clientid"/>'/>
                <input type="hidden" id="costid" name="costid" value='<s:property value="costid"/>'/>
                <input type="hidden" id="clacno" name="clacno" value='<s:property value="clacno"/>'/>
                <input type="hidden" name="contypeval" id="contypeval" value='<s:property value="cmbcontracttype"/>'/>
                <input type="hidden" name="maintrno" id="maintrno" value='<s:property value="maintrno"/>'/>
                <input type="hidden" id="invgridlength" name="invgridlength" />
                <input type="hidden" id="txtlegalamt" name="txtlegalamt" value='<s:property value="txtlegalamt"/>'/>
                <input type="hidden" id="txtseramt" name="txtseramt" value='<s:property value="txtseramt"/>'/>
                <input type="hidden" id="txtnettotal" name="txtnettotal" value='<s:property value="txtnettotal"/>'/>
            </div>

        </div>
    </form>
</div>     

<div id="contractwindow">
   <div></div>
</div>

</body>
</html>