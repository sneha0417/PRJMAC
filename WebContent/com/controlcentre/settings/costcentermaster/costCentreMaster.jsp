<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>GatewayERP(i)</title>
<meta charset="UTF-8">
<s:head/>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="../../../../includes.jsp"></jsp:include>

<style>
/* =========================================================
SCOPED UI: Modern Layout Standards (24px Standard)
========================================================= */
form label.error { color: red; font-weight: bold; }

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
    max-width: 95%;
    margin: 0 auto;
    box-shadow: 0 4px 24px rgba(0,0,0,0.06);
}

.modern-ui {
    font-family: 'Segoe UI', Arial, sans-serif; 
    color: #333;
    font-size: 12px; 
    width: 100%;
}

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
    padding-right: 8px;
}

.modern-ui .middle-panel {
    border: 1px solid #c5d3e0; 
    padding: 20px 15px 15px 15px; 
    background: #ffffff; 
    position: relative; 
    border-radius: 4px; 
    margin-bottom: 15px;
    margin-top: 15px;
    border-collapse: separate;
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

.modern-ui td { padding: 4px 0; }

/* SIDE-BY-SIDE FLEXBOX WRAPPER */
.panels-wrapper {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
    gap: 15px;
    width: 100%;
    flex-wrap: wrap;
}

.panels-wrapper > table {
    flex: 1; 
    min-width: 320px; 
    margin-top: 15px; 
}
</style>

<script type="text/javascript">
$(document).ready(function () {    
    $("#date_costmaster").jqxDateTimeInput({ width: '125px', height: 24, formatString : "dd.MM.yyyy" });

    setTimeout(function () {
        $("#date_costmaster").find("input").css({ "height": "24px", "line-height": "24px", "font-size": "12px", "padding": "0 6px" });
        $("#date_costmaster").find(".jqx-action-button").css({ "top": "0px", "height": "24px" });
    }, 0);
});

function funFocus(){ }

function funReset() { } 

function funReadOnly() {
    $('#frmCostmaster input').attr('readonly', true);
    $('#category1').attr('disabled', true);
    $('#category2').attr('disabled', true);
    $('#category3').attr('disabled', true);
    $('#frmCostmaster select').attr('disabled', true);
    delvalueChange();
}

function funRemoveReadOnly() {
    $('#frmCostmaster input').attr('readonly', false);
    $('#category1').attr('disabled', false);
    $('#category2').attr('disabled', false);
    $('#category3').attr('disabled', false);
    
    if ($("#mode").val() == "A") {
        $('#date_costmaster').val(new Date());
        $('#frmCostmaster select').attr('disabled', false);
        fundisable();
    }
    
    if ($("#mode").val() == "E" || $("#mode").val() == "D") {
        $('#frmCostmaster input').attr('readonly', false);
        $('#frmCostmaster select').attr('disabled', false);
        fundisable();
    }
    $('#docno').attr('readonly', true);
}

function funSearchLoad(){
    changeContent('masterSearch.jsp'); 
}

function fundisable(){
    var isCat1 = document.getElementById('category1').checked;
    var isCat2 = document.getElementById('category2').checked;
    var isCat3 = document.getElementById('category3').checked;

    if (isCat1) {
        $("table#sub input, table#sub select").prop("disabled", true);
        $("table#trans input, table#trans select").prop("disabled", true);
        $("table#main input, table#main select").prop("disabled", false);
        
        document.getElementById('radiotick').value = 1;
        document.getElementById('radiosaveval').value = 1;
        document.getElementById("errormsg").innerText = ""; 
        document.getElementById('maindel').value = 1;
        document.getElementById('otherdis').value = 1;
        document.getElementById('main_account').value = "mainacc";
    }
    else if (isCat2) {
        $("table#main input, table#main select").prop("disabled", true);
        $("table#trans input, table#trans select").prop("disabled", true);
        $("table#sub input, table#sub select").prop("disabled", false);
        $('#subaccgpname').attr('readonly', true);
        
        document.getElementById('radiotick').value = 2;
        document.getElementById('radiosaveval').value = 1;
        document.getElementById("errormsg").innerText = ""; 
        document.getElementById('maindel').value = 2;
        document.getElementById('otherdis').value = 2;
        document.getElementById('sub_account').value = "subacc";
    }
    else if (isCat3) {
        $("table#main input, table#main select").prop("disabled", true);
        $("table#sub input, table#sub select").prop("disabled", true);
        $("table#trans input, table#trans select").prop("disabled", false);
        $('#transcaccgpname').attr('readonly', true);
        
        document.getElementById('radiotick').value = 3;
        document.getElementById('radiosaveval').value = 1;
        document.getElementById("errormsg").innerText = ""; 
        document.getElementById('maindel').value = 3;
        document.getElementById('otherdis').value = 3;
        document.getElementById('tran_account').value = "tranacc";
    }
}

function getHead() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function() {
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText;
            items = items.split('####');
            var headItems = items[0].split(",");
            var headIdItems = items[1].split(",");
            var optionsauth = '<option value="">-- select -- </option>';
            for (var i = 0; i < headItems.length; i++) {
                optionsauth += '<option value="' + headIdItems[i].trim() + '">' + headItems[i] + '</option>';
            }
            $("select#mainaccgroup").html(optionsauth);
            delvalueChange();
        }
    }
    x.open("GET", "getMain.jsp", true);
    x.send();
}

function getMainac() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function() {
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText;
            items = items.split('####');
            var mainacItems = items[0].trim().split(",");
            var mainacIdItems = items[1].trim().split(",");
            var optionsauth = '<option value=""> -- select --</option>';
            for (var i = 0; i < mainacItems.length; i++) {
                optionsauth += '<option value="' + mainacIdItems[i].trim() + '">' + mainacItems[i].trim()+ '</option>';
            }
            $("select#subaccgroup, select#tansaccgroup").html(optionsauth);
            delvalueChange();
        } 
    }
    x.open("GET", "getSubTranAccmain.jsp", true);
    x.send();
}

function getAcgroup(value,check) {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText;
            if (check == 1) {
                $('#subaccgpname').val(items);
            } else if (check == 2) {
                $('#transcaccgpname').val(items);
            }
        }
    }
    x.open("GET","disAcgroup.jsp?subaccountgroup="+value,true);
    x.send();
}

function funChkButton(){
    frmCostmaster.submit();        
}

function funNotify(){
    if ($("#mode").val() == "A") {
        var radval = document.getElementById("radiosaveval").value; 
        if(radval == "") {
            document.getElementById("errormsg").innerText = " *Select One Account";
            return 0;
        }
        var codeval = document.getElementById("codeval").value; 
        if(codeval == 1) {
            document.getElementById("errormsg").innerText = "Cost Code Already Exists";
            return 0;
        } else {
            document.getElementById("errormsg").innerText = "";
        }
        
        var radiotick = document.getElementById("radiotick").value; 
        if(radiotick == 1) {
            var mainval = document.getElementById("mainaccgroup").value;
            if(mainval == "") {
                document.getElementById("errormsg").innerText = "Select Cost Group";
                document.getElementById("mainaccgroup").focus();
                return 0;
            }
            var mainacc = document.getElementById("mainacconame").value;
            if(mainacc == "") {
                document.getElementById("errormsg").innerText = "Enter Cost Name";
                document.getElementById("mainacconame").focus();
                return 0;
            }
        } else if(radiotick == 2) {
            var subval = document.getElementById("subaccgroup").value;
            if(subval == "") {
                document.getElementById("errormsg").innerText = "Select Cost Group";
                document.getElementById("subaccgroup").focus();
                return 0;
            }
            var subacc = document.getElementById("subaccname").value;
            if(subacc == "") {
                document.getElementById("errormsg").innerText = "Enter Cost Name";
                document.getElementById("subaccname").focus();
                return 0;
            }
        } else if(radiotick == 3) {
            var tranval = document.getElementById("tansaccgroup").value;
            if(tranval == "") {
                document.getElementById("errormsg").innerText = " Select Cost Group";
                document.getElementById("tansaccgroup").focus();
                return 0;
            }
            var tranacc = document.getElementById("transaccname").value;
            if(tranacc == "") {
                document.getElementById("errormsg").innerText = "Enter Cost Name";
                document.getElementById("transaccname").focus();
                return 0;
            }
        } else {
            document.getElementById("errormsg").innerText = "";
        } 
    }
    
    if($("#mode").val() == "E") {
        var codeval = document.getElementById("codeval").value; 
        if(codeval == 1) {
            document.getElementById("errormsg").innerText = "Cost Code Already Exists";
            return 0;
        } else {
            document.getElementById("errormsg").innerText = "";
        }
    }
    
    if ($("#mode").val() == "view") {
        $('#category1').attr('disabled', false);
        $('#category2').attr('disabled', false);
        $('#category3').attr('disabled', false);
        $('#mainaccgroup').attr('disabled', false);
    }
    return 1;
}

function maincheck() {
    document.getElementById("errormsg").innerText = "";
    document.getElementById("codeval").value = "";  
    if(document.getElementById("mainacccode").value != "") {
        var code = document.getElementById("mainacccode").value;
        funtest(code);
    }
}

function subcheck() {
    document.getElementById("errormsg").innerText = "";
    document.getElementById("codeval").value = "";  
    if(document.getElementById("subacccode").value != "") {
        var code = document.getElementById("subacccode").value;
        funtest(code);
    }
}

function trancheck() {
    document.getElementById("errormsg").innerText = "";
    document.getElementById("codeval").value = "";  
    if(document.getElementById("transacccode").value != "") {
        var code = document.getElementById("transacccode").value;
        funtest(code);
    }
}

function funtest(code) {
    var masterdoc = document.getElementById("docno").value;
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText.trim();
            if(items != "") {
                document.getElementById("codeval").value = 1;
                document.getElementById("errormsg").innerText = "Cost Code Already Exists";
            } else {
                document.getElementById("codeval").value = "";
                document.getElementById("errormsg").innerText = "";
            }
        }
    }
    x.open("GET", 'checkAcccode.jsp?code='+code+'&masterdoc='+masterdoc, true);
    x.send();
}  

function delvalueChange() {
    if(document.getElementById("radiotick").value == 1) document.getElementById("category1").checked = true;
    else if(document.getElementById("radiotick").value == 2) document.getElementById("category2").checked = true;
    else if(document.getElementById("radiotick").value == 3) document.getElementById("category3").checked = true;
    
    if($('#checksetval').val() != "") $('#mainaccgroup').val($('#checksetval').val());
    if($('#subchecksetval').val() != "") $('#subaccgroup').val($('#subchecksetval').val());
    if($('#tranchecksetval').val() != "") $('#tansaccgroup').val($('#tranchecksetval').val());
}

function funclear1() {
    document.getElementById("subchecksetval").value = "";
    document.getElementById("tranchecksetval").value = "";
}

function funclear2() {
    document.getElementById("checksetval").value = "";
    document.getElementById("tranchecksetval").value = "";
}

function funclear3() {
    document.getElementById("checksetval").value = "";
    document.getElementById("subchecksetval").value = "";
}

function setValues() {
    if($('#datehidden').val()){
        $("#date_costmaster").jqxDateTimeInput('val', $('#datehidden').val());
    }
    if($('#msg').val() != ""){
        $.messager.alert('Message',$('#msg').val());
    }
    document.getElementById("formdet").innerText = $('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
    delvalueChange();
}

function checkreq() {
    if(document.getElementById('radiotick').value == 1) {
        if(document.getElementById("mainacconame").value == "") { 
            document.getElementById("errormsg").innerText = " Enter Account Name";
            return 0;
        }
    } else if(document.getElementById('radiotick').value == 2) {
        if(document.getElementById("subaccname").value == "") {
            document.getElementById("errormsg").innerText = " Enter SubAccount Name";
            return 0;
        }
    } else if(document.getElementById('radiotick').value == 3) {
        if(document.getElementById("transaccname").value == "") { 
            document.getElementById("errormsg").innerText = " Enter TraAccount Name";
            return 0;
        }
    } else {
        document.getElementById("errormsg").innerText = "";
    }
}

function dismassge() {
    document.getElementById("errormsg").innerText = "";
}

function funExcelBtn(){
    var url = document.URL;
    var reurl = url.split("costcentermaster");
    top.addTab("ChartOfCost",reurl[0]+"costcentermaster/chartOfCost.jsp");
}
</script>
</head>

<body onload="getHead();getMainac();setValues();">

<div id="mainBG" class="homeContent" data-type="background">
    <jsp:include page="../../../../header.jsp"></jsp:include>
    <br>
    <form id="frmCostmaster" action="saveCostmaster" method="post" autocomplete="off">
        
        <div class="modern-ui" style="padding: 0 10px;">
            
            <div class="middle-panel" style="padding-bottom: 5px; margin-top: 0;">
                <span class="middle-panel-title">Master Details</span>
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Date</label>
                    <div id="date_costmaster" name="date_costmaster" value='<s:property value="date_costmaster"/>'></div>
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No.</label>
                    <input type="text" name="docno" id="docno" value='<s:property value="docno"/>' style="width:150px;" readonly>
                </div>
            </div>

            <div class="field-row" style="justify-content: center; gap: 40px; margin: 20px 0;">
                <label style="font-weight: bold; font-size: 13px; cursor: pointer; display: flex; align-items: center; gap: 5px;">
                    <input type="radio" id="category1" name="category" value="mainaccount" onchange="fundisable();"> Main
                </label>
                <label style="font-weight: bold; font-size: 13px; cursor: pointer; display: flex; align-items: center; gap: 5px;">
                    <input type="radio" id="category2" name="category" value="subaccount" onchange="fundisable();"> Sub
                </label>
                <label style="font-weight: bold; font-size: 13px; cursor: pointer; display: flex; align-items: center; gap: 5px;">
                    <input type="radio" id="category3" name="category" value="transaction" onchange="fundisable();"> Transaction
                </label>
            </div>

            <div class="panels-wrapper">
                
                <table id="main" class="middle-panel modern-ui">
                    <tr><td colspan="2"><span class="middle-panel-title">Main</span></td></tr>
                    <tr>
                        <td class="lbl-right" style="width:100px;">Cost Group</td>
                        <td>
                            <select name="mainaccgroup" id="mainaccgroup" style="width:100%;" value='<s:property value="mainaccgroup"/>' onchange="funclear1();">
                                <option value="-1">--Select--</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl-right">Cost Code</td>
                        <td><input type="text" name="mainacccode" id="mainacccode" style="width:100%;" value='<s:property value="mainacccode"/>' onblur="maincheck(this.value)"></td>
                    </tr>
                    <tr>
                        <td class="lbl-right">Cost Name</td>
                        <td><input type="text" name="mainacconame" id="mainacconame" style="width:100%;" value='<s:property value="mainacconame"/>' onblur="dismassge()"></td>
                    </tr>
                </table>

                <table id="sub" class="middle-panel modern-ui">
                    <tr><td colspan="2"><span class="middle-panel-title">Sub</span></td></tr>
                    <tr>
                        <td class="lbl-right" style="width:100px;">Main Cost Group</td>
                        <td>
                            <select name="subaccgroup" id="subaccgroup" style="width:100%; margin-bottom: 4px;" onChange="getAcgroup(this.value,1);" onfocus="funclear2();" value='<s:property value="subaccgroup"/>'>
                                <option value="-1">--Select--</option>
                            </select>
                            <input type="text" id="subaccgpname" name="subaccgpname" style="width:100%;" value='<s:property value="subaccgpname"/>' placeholder="Group Name" readonly />
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl-right">Cost Code</td>
                        <td><input type="text" name="subacccode" id="subacccode" style="width:100%;" value='<s:property value="subacccode"/>' onblur="subcheck(this.value)"></td>
                    </tr>
                    <tr>
                        <td class="lbl-right">Cost Name</td>
                        <td><input type="text" name="subaccname" id="subaccname" style="width:100%;" value='<s:property value="subaccname"/>' onblur="dismassge()" /></td>
                    </tr>
                </table>

                <table id="trans" class="middle-panel modern-ui">
                    <tr><td colspan="2"><span class="middle-panel-title">Transaction</span></td></tr>
                    <tr>
                        <td class="lbl-right" style="width:100px;">Main Cost Group</td>
                        <td>
                            <select id="tansaccgroup" name="tansaccgroup" style="width:100%; margin-bottom: 4px;" onChange="getAcgroup(this.value,2);" onfocus="funclear3();" value='<s:property value="tansaccgroup"/>'>
                                <option value="-1">--Select--</option>
                            </select>
                            <input type="text" name="transcaccgpname" id="transcaccgpname" style="width:100%;" value='<s:property value="transcaccgpname"/>' placeholder="Trans Name" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl-right">Cost Code</td>
                        <td><input type="text" name="transacccode" id="transacccode" style="width:100%;" value='<s:property value="transacccode"/>' onblur="trancheck(this.value)"></td>
                    </tr>
                    <tr>
                        <td class="lbl-right">Cost Name</td>
                        <td><input type="text" name="transaccname" id="transaccname" style="width:100%;" value='<s:property value="transaccname"/>' onblur="dismassge()" /></td>
                    </tr>
                </table>
                
            </div> <div style="display:none;">
                <input type="radio" name="data" value="debit" checked>Debit
                <input type="radio" name="data" value="Credit">Credit
                
                <input type="hidden" name="main_account" id="main_account" value='<s:property value="main_account"/>' />
                <input type="hidden" name="sub_account" id="sub_account" value='<s:property value="sub_account"/>' />
                <input type="hidden" name="tran_account" id="tran_account" value='<s:property value="tran_account"/>' />
                
                <input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>'>
                <input type="hidden" id="datehidden" name="datehidden" value='<s:property value="datehidden"/>'/>
                <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'>
                <input type="hidden" id="radiotick" name="radiotick" value='<s:property value="radiotick"/>'>
                <input type="hidden" id="checksetval" name="checksetval" value='<s:property value="checksetval"/>'>
                <input type="hidden" id="subchecksetval" name="subchecksetval" value='<s:property value="subchecksetval"/>'>
                <input type="hidden" id="tranchecksetval" name="tranchecksetval" value='<s:property value="tranchecksetval"/>'>
                <input type="hidden" id="otherdis" name="otherdis" value='<s:property value="otherdis"/>'>
                <input type="hidden" id="maindel" name="maindel" value='<s:property value="maindel"/>'>
                <input type="hidden" id="radiosaveval" name="radiosaveval" value='<s:property value="radiosaveval"/>'>
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
                <input type="hidden" id="codeval" name="codeval" value='<s:property value="codeval"/>'>
            </div>
            
        </div>
    </form>
</div>

</body>
</html>