<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<%
	String mod = request.getParameter("mod") == null ? "view" : request
			.getParameter("mod").toString();
 String purchasearray = request.getParameter("purchasearray") == null? "0": request.getParameter("purchasearray").toString() ;
 System.out.println("purchasearray==="+purchasearray);

%>
<html>
<%--   <% 
  
String dtype=  session.getAttribute("Code").toString();
  System.out.println("sss    "+dtype);
  %>  --%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>GatewayERP(i)</title>
 <jsp:include page="../../../../includes.jsp"></jsp:include> 
 
 <%
	String contextPath=request.getContextPath();
 %>
 
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

/* Validation Label */
.modern-ui .val-error { color: red; font-size: 11px; font-weight:bold; }

/* Scrollbar Logic */
.hidden-scrollbar {
    overflow-y: auto;
    height: calc(100vh - 150px);
    padding-right: 5px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #c5d3e0; border-radius: 3px; }

/* Disabled Button State */
.modern-ui .myButton:disabled,
button:disabled,
input[type="button"]:disabled,
input[type="submit"]:disabled {
    background: #e2e8f0 !important; /* Flat light grey background */
    color: #94a3b8 !important;      /* Darker grey text */
    border: 1px solid #cbd5e1 !important;
    cursor: not-allowed !important; /* Shows the "stop" mouse icon */
    box-shadow: none !important;
    text-shadow: none !important;
}
</style>
<script type="text/javascript">
<%-- var text1='<%=dtype%>'; --%>
var mod1='<%=mod%>';
var prcharray='<%=purchasearray%>';

$(document).ready(function () {
    $("#reqmasterdate").jqxDateTimeInput({ width: '120px', height: '24px', formatString:"dd.MM.yyyy"});   

    /* $('#brandsearchwndow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Brand Search',position: { x: 250, y: 60 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
    $('#brandsearchwndow').jqxWindow('close'); 
    
    $('#brandsearchwndow').jqxWindow({ width: '40%', height: '55%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Brand Search' ,position: { x: 350, y: 60 }, keyboardCloseKey: 27});
    $('#brandsearchwndow').jqxWindow('close'); 

    $('#modelsearchwndow').jqxWindow({ width: '40%', height: '55%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Model Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
    $('#modelsearchwndow').jqxWindow('close');
    
    $('#colorsearchwndow').jqxWindow({ width: '20%', height: '55%',  maxHeight: '62%' ,maxWidth: '60%' , title: 'Color Search' ,position: {x: 600, y: 60  }, keyboardCloseKey: 27});
    $('#colorsearchwndow').jqxWindow('close');
    */
     
    $('#sidesearchwndow').jqxWindow({ width: '55%', height: '95%', maxHeight: '90%', maxWidth: '80%', title: 'Product Search ', position: { x: 600, y: 0 }, keyboardCloseKey: 27});
    $('#sidesearchwndow').jqxWindow('close');   
    
    $('#searchwindow').jqxWindow({ width: '50%', height: '60%', maxHeight: '75%', maxWidth: '50%', title: 'Search', position: { x: 500, y: 60 }, keyboardCloseKey: 27});
    $('#searchwindow').jqxWindow('close');

    $('#itemdocno').dblclick(function(){
        if($("#mode").val() == "A" || $("#mode").val() == "E") {
            $('#searchwindow').jqxWindow('open');
            
            if(document.getElementById("itemtype").value=="1") {
                refsearchContent('<%=contextPath%>/com/Procurement/Purchase/costcodesearch/costCodeSearchGrid.jsp?docno='+document.getElementById("itemtype").value);     
            }
            else if(document.getElementById("itemtype").value=="6") {
                refsearchContent('<%=contextPath%>/com/Procurement/Purchase/costcodesearch/fleetGrid.jsp?');   
            }
            else {
                refsearchContent('<%=contextPath%>/com/Procurement/Purchase/costcodesearch/costunitsearch.jsp?docno='+document.getElementById("itemtype").value);   
            }
        }
    }); 
});
 
function getitem(event){
    var x = event.keyCode;
    if(x == 114){
        $('#searchwindow').jqxWindow('open');
            
        if(document.getElementById("itemtype").value == "1") {
            refsearchContent('<%=contextPath%>/com/Procurement/Purchase/costcodesearch/costCodeSearchGrid.jsp?docno='+document.getElementById("itemtype").value);     
        }
        else if(document.getElementById("itemtype").value == "6") {
            refsearchContent('<%=contextPath%>/com/Procurement/Purchase/costcodesearch/fleetGrid.jsp?');   
        }
        else {
            refsearchContent('<%=contextPath%>/com/Procurement/Purchase/costcodesearch/costunitsearch.jsp?docno='+document.getElementById("itemtype").value);   
        }
    }
}  

function refsearchContent(url) {
    $.get(url).done(function (data) {
        $('#searchwindow').jqxWindow('setContent', data);
    }); 
}
       
function productSearchContent(url) {
    $.get(url).done(function (data) {
        $('#sidesearchwndow').jqxWindow('open');
        $('#sidesearchwndow').jqxWindow('setContent', data);
    }); 
} 
    
function funReset(){
    //$('#frmpurReq')[0].reset(); 
}

function funReadOnly(){
    $('#frmpurReq input').attr('readonly', true);
    $('#frmpurReq textarea').attr('readonly', true);
    $('#frmpurReq select').attr('disabled', true);
    $('#psearch').attr('disabled', true);
    $('#setbtn').attr('disabled', true); // ADD Button disabled
    $('#reqmasterdate').jqxDateTimeInput({ disabled: true});
    
    $("#purchasedetails").jqxGrid({ disabled: true});
    
    if(document.getElementById("status").value.trim() == "0") {
        mod1 = "view";
    }
    
    if(mod1 == "A") {
        document.getElementById("formdet").innerText = window.parent.formName.value + " (" + window.parent.formCode.value.trim() + ")";
        document.getElementById("formdetail").value = window.parent.formName.value;
        document.getElementById("formdetailcode").value = window.parent.formCode.value.trim(); 
        funCreateBtn();
    }
}

function funRemoveReadOnly(){
    chkmultiqty();
    $('#frmpurReq input').attr('readonly', false);
    $('#frmpurReq textarea').attr('readonly', false);
    $('#frmpurReq select').attr('disabled', false);
    
    $('#reqmasterdate').jqxDateTimeInput({ disabled: false});
    $("#purchasedetails").jqxGrid({ disabled: false});
    $('#docno').attr('readonly', true);
    
    if ($("#mode").val() == "A") {
        $('#reqmasterdate').val(new Date());
        $("#purchasedetails").jqxGrid('clear');
        $("#purchasedetails").jqxGrid('addrow', null, {});
    }
    
    if(mod1 == "A") {
        $("#vehpurcgasereq").load("purreqDetails.jsp?prcharray="+'<%=purchasearray.replaceAll("\\s","a@b@c")%>'+"&modebprf=a1");
    }
    
    chkcostcode();
    
    $('#itemdocno').attr('readonly', true);
    $('#itemname').attr('readonly', true);
    
    chkproductconfig();
    $('#psearch').attr('disabled', false);
    $('#setbtn').attr('disabled', false); // ADD Button enabled
}
    
function funNotify(){   
    var rows = $("#purchasedetails").jqxGrid('getrows');
    $('#reqgridlenght').val(rows.length);
    
    for(var i=0 ; i < rows.length ; i++){
        newTextBox = $(document.createElement("input"))
            .attr("type", "dil")
            .attr("id", "reqtest"+i)
            .attr("name", "reqtest"+i)  
            .attr("hidden", "true"); 
        
        newTextBox.val(rows[i].psrno+"::"+rows[i].prodoc+" :: "+rows[i].unitdocno+" :: "+rows[i].qty+" :: "+rows[i].specid+" :: ");
        newTextBox.appendTo('form');
    }   
    
    return 1;
} 

function funChkButton() {
    frmpurReq.submit();
}

function funSearchLoad(){
    changeContent('mainsearch.jsp?'); 
}

$(function(){
    $('#frmpurReq').validate({
        rules: { 
            purdesc: { maxlength: 100 }
        },
        messages: {
            purdesc: { maxlength: " Max 100 chars" }
        }
    });
});
    
function funFocus(){
    $('#reqmasterdate').jqxDateTimeInput('focus');          
} 
    
function setValues() {
    if($('#hidreqmasterdate').val()){
        $("#reqmasterdate").jqxDateTimeInput('val', $('#hidreqmasterdate').val());
    }
    
    var docVal1 = document.getElementById("masterdoc_no").value;
      
    if(docVal1 > 0) {
        var indexVal2 = document.getElementById("masterdoc_no").value;
        $("#vehpurcgasereq").load("purreqDetails.jsp?reqdoc="+indexVal2);
        funchkforedit(); 
    }
    
    if($('#msg').val() != ""){
        $.messager.alert('Message',$('#msg').val());
    }
    
    document.getElementById("formdet").innerText = $('#formdetail').val() + " (" + $('#formdetailcode').val().trim() + ")";   
    funSetlabel();
}
    
function funPrintBtn(){
    if (($("#mode").val() == "view") && $("#masterdoc_no").val() != "") {
        var url = document.URL;
        var reurl = url.split("savepurreqdata");
        
        var brhid = <%=session.getAttribute("BRANCHID").toString()%>;
        var dtype = $('#formdetailcode').val();
  
        var win = window.open(reurl[0]+"printPurchaseReq?docno="+document.getElementById("masterdoc_no").value+"&dtype="+dtype+"&brhid="+brhid,"_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");    
        win.focus();
    } else {
        $.messager.alert('Message','Select a Document....!','warning');
        return false;
    }
}

function funchkforedit() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function() {
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText.trim();  
            if(parseInt(items) > 0) {
                // Action Buttons disabled based on state
                $("#btnEdit").attr('disabled', true);
                $("#btnDelete").attr('disabled', true); 
            }
        }
    }
    x.open("GET", "reqlinkchk.jsp?masterdoc_no="+document.getElementById("masterdoc_no").value, true);
    x.send();
}

function getitemtype(){ 
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState == 4 && x.status == 200) {
            items = x.responseText;
            items = items.split('####');
            var docno = items[0].split(",");
            var type = items[1].split(",");
            
            var optionstype = '';

            for (var i = 0; i < type.length; i++) {
                optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
            }
            
            $("select#itemtype").html(optionstype);     
            
            if($('#hideitemtype').val() != "") {
                $('#itemtype').val($('#hideitemtype').val());   
            }
        }
    }
    x.open("GET","getitem.jsp?",true);
    x.send();
}
     
function chkcostcode() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState == 4 && x.status == 200) {
            var items = x.responseText.trim();
            if(parseInt(items) > 0) {
                document.getElementById("costcheck").value = 1;
                $('#hcostcodes').show();
            } else { 
                document.getElementById("costcheck").value = 0;
                $('#hcostcodes').hide();
            }
        }
    }
    x.open("GET","<%=contextPath%>/com/Procurement/Purchase/costcodesearch/checkcostcode.jsp?",true);
    x.send();
} 

function cleardata() {
    document.getElementById("itemdocno").value="";
    document.getElementById("itemname").value="";
    /* document.getElementById("clientname").value="";
    document.getElementById("cldocno").value="";
    document.getElementById("siteid").value="";
    document.getElementById("site").value=""; 
    */
}

function getunit(val){ 
    var x = new XMLHttpRequest();
    x.onreadystatechange = function(){
        if (x.readyState == 4 && x.status == 200) {
            items = x.responseText;
            items = items.split('####');
            var docno = items[0].split(",");
            var type = items[1].split(",");
            
            var optionstype = "";

            for (var i = 0; i < type.length; i++) {
                optionstype += '<option value="' + docno[i] + '">' + type[i] + '</option>';
            }
            
            $("select#unit").html(optionstype);     
        }
    }
    x.open("GET","getunit.jsp?psrno="+val,true);
    x.send();
}   

function setgrid() {
    var temppsrno = document.getElementById("temppsrno").value; 
    var unit = document.getElementById("unit").value; 
    
    var rows1 = $("#purchasedetails").jqxGrid('getrows');
    var aa = 0;
    
    for(var i=0; i<rows1.length; i++){
        if(parseInt(rows1[i].prodoc) == parseInt(temppsrno)) {
            if((parseInt(document.getElementById("multimethod").value) == 1)) {   
                if(parseInt(rows1[i].unitdocno) == parseInt(unit)) {
                    aa = 1;
                    break;
                }
            } else {
                aa = 1;
                break;
            }
        } else {
            aa = 0;
        } 
    }
            
    if(parseInt(aa) == 1) {
        document.getElementById("errormsg").innerText = "You have already select this product";
        document.getElementById("jqxInput1").focus();
        return 0;
    } else {
        document.getElementById("errormsg").innerText = "";
    }
    
    var rows = $('#purchasedetails').jqxGrid('getrows');
    var rowlength = rows.length;

    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "proid", document.getElementById("jqxInput").value);
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "proname", document.getElementById("jqxInput1").value);
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "brandname", document.getElementById("brand").value);
    
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "unitdocno", document.getElementById("unit").value);
    if(document.getElementById("unit").value > 0) {
        $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "unit", $("#unit option:selected").text());
    }
    
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "psrno", document.getElementById("temppsrno").value);
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "prodoc", document.getElementById("temppsrno").value);
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "specid", document.getElementById("tempspecid").value);
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "productid", document.getElementById("jqxInput").value);
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "productname", document.getElementById("jqxInput1").value);
    $('#purchasedetails').jqxGrid('setcellvalue', rowlength-1, "qty", document.getElementById("quantity").value);
                
    document.getElementById("jqxInput").value = "";
    document.getElementById("jqxInput1").value = "";
    document.getElementById("brand").value = ""; 
    document.getElementById("collqty").value = "";
    document.getElementById("quantity").value = "";
    document.getElementById("unit").value = "";
    document.getElementById("temppsrno").value = "";
    document.getElementById("tempspecid").value = "";
                                            
    $("#purchasedetails").jqxGrid('addrow', null, {});
    document.getElementById("jqxInput1").focus();
}

function calculatedata(val) {

}
</script>
</head>
<body onload="setValues();chkcostcode();getitemtype();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmpurReq" action="savepurreqdata" autocomplete="OFF">

<jsp:include page="../../../../header.jsp"></jsp:include>
<!-- Keeping multiqty script/logic block rendering out of the UI flow -->
<div style="display:none;"><jsp:include page="multiqty.jsp"></jsp:include></div>

<div class='modern-ui hidden-scrollbar'>

    <!-- General Info Panel -->
    <div class="middle-panel">
        <span class="middle-panel-title">General Info</span>
        
        <div class="field-row">
            <label class="lbl-right" style="width:80px;">Date</label>
            <div style="width: 125px;">
                <div id='reqmasterdate' name='reqmasterdate' value='<s:property value="reqmasterdate"/>'></div>
                <input type="hidden" id="hidreqmasterdate" name="hidreqmasterdate" value='<s:property value="hidreqmasterdate"/>'/>
            </div>
            
            <label class="lbl-right" style="width:80px;">Ref No</label>
            <input type="text" id="refno" name="refno" value='<s:property value="refno"/>' style="width:120px;" />
            
            <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No</label>
            <input type="text" id="docno" name="docno" tabindex="-1" value='<s:property value="docno"/>' style="width:120px;" readonly />
        </div>
        
        <!-- Job/Cost Codes row (Maintains original 'hidden' logic wrapper) -->
        <div class="field-row" id="hcostcodes" hidden="true">
            <label class="lbl-right" style="width:80px;">Group</label>
            <select id="itemtype" name="itemtype" style="width:120px;" onchange="cleardata()">
                <option></option>
            </select>
            
            <label class="lbl-right" style="width:80px;">Job No</label>
<div class="input-search-container" style="width: 120px;">
    <input type="text" id="itemdocno" name="itemdocno" placeholder="Double click" onkeydown="getitem(event);" ondblclick="getitem(event);" value='<s:property value="itemdocno"/>' style="cursor: pointer;" />
    <svg class="magnifier-icon" onclick="getitem(event);" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
</div>
            
            <input type="text" id="itemname" name="itemname" style="flex:1; margin-left: 10px;" value='<s:property value="itemname"/>' />
        </div>

        <div class="field-row" style="margin-bottom:0;">
            <label class="lbl-right" style="width:80px;">Description</label>
            <input type="text" id="purdesc" name="purdesc" style="flex:1;" value='<s:property value="purdesc"/>'/>
        </div>
    </div>

    <!-- Item Details Entry Panel -->
    <div id="psearch" class="middle-panel">
        <span class="middle-panel-title">Item Details</span>
        
        <!-- Columnized Flex-Row for Entry Grid -->
        <div class="field-row" style="align-items: flex-end; margin-bottom:0;">
            <div style="flex:1; min-width: 120px;">
                <label class="lbl-right" style="text-align:left; display:block; margin-bottom:4px; padding:0;">Product ID</label>
                <div id="part"><jsp:include page="part.jsp"></jsp:include></div>
            </div>
            
            <div style="flex:2; min-width: 200px;">
                <label class="lbl-right" style="text-align:left; display:block; margin-bottom:4px; padding:0;">Product Name</label>
                <div id="pnames"><jsp:include page="name.jsp"></jsp:include></div>
            </div>
            
            <div style="flex:1; min-width: 100px;">
                <label class="lbl-right" style="text-align:left; display:block; margin-bottom:4px; padding:0;">Brand</label>
                <input type="text" id="brand" style="width: 100%;" />
            </div>
            
            <div style="flex:1; min-width: 80px;">
                <label class="lbl-right" style="text-align:left; display:block; margin-bottom:4px; padding:0;">Unit</label>
                <select id="unit" style="width: 100%;"></select>
            </div>
            
            <div style="flex:1; min-width: 80px;">
                <label class="lbl-right" style="text-align:left; display:block; margin-bottom:4px; padding:0;">Qty</label>
                <input type="text" id="quantity" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber1(event);" onchange="calculatedata(this.id);" style="text-align: right; width: 100%;" />
            </div>
            
            <div style="margin-left: 10px;">
                <input type="button" id="setbtn" class="myButton" onclick="setgrid()" value="ADD" />
            </div>
        </div>
        
        <!-- Extracted embedded hidden field elements from the previous table format -->
        <div style="display:none;">
            <input type="hidden" id="collqty" />
            <input type="hidden" id="loads" class="myButtons" value="Load Data" onclick="loaddatass()" />
            <input type="hidden" id="focs" onblur="funRoundAmt(this.value,this.id);" onkeypress="javascript:return isNumber1(event);" />
            <input type="hidden" id="multi" onchange="chkmultis()" />
            <input type="hidden" id="batch" onkeydown="getbatch(event)" />
            <div id="expdate" hidden="true" name="expdate" value='<s:property value="expdate"/>'></div>
            <input type="hidden" id="cleardata" />
        </div>
    </div>

    <!-- Details Grid Container -->
    <div class="middle-panel" style="padding-bottom: 20px;">
        <span class="middle-panel-title">Purchase Requisition Details</span>
        <div id="vehpurcgasereq" class="grid-container">
            <jsp:include page="purreqDetails.jsp"></jsp:include>
        </div>
    </div>

    <!-- Form Hidden Elements Bucket -->
    <div style="display:none;">
        <input type="hidden" id="masterdoc_no" name="masterdoc_no" value='<s:property value="masterdoc_no"/>' /> 
        <input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>' />
        <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />
        <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
        <input type="hidden" name="reqgridlenght" id="reqgridlenght" value='<s:property value="reqgridlenght"/>' />   
        <input type="text" name="gridtext" id="gridtext" value='<s:property value="gridtext"/>' />   
        <input type="text" name="gridtext1" id="gridtext1" value='<s:property value="gridtext1"/>' />    
        <input type="hidden" id="costtr_no" name="costtr_no" value='<s:property value="costtr_no"/>'/> 
        <input type="hidden" id="costcheck" name="costcheck" value='<s:property value="costcheck"/>'/> 
        <input type="hidden" id="hideitemtype" name="hideitemtype" value='<s:property value="hideitemtype"/>'/> 
        <input type="hidden" id="hidetype" name="hidetype" value='<s:property value="hidetype"/>'/>
        <input type="hidden" id="productchk" name="productchk" value='<s:property value="productchk"/>' />
        <input type="hidden" id="temppsrno" >  
        <input type="hidden" id="tempspecid" > 
        <input type="hidden" id="tempunitdocno" > 
    </div>

</div>
</form>

<!-- Modal Windows Anchors -->
<div id="sidesearchwndow"><div></div></div>
<div id="searchwindow"><div></div></div>

<!-- Legacy commented Modals left exactly as commented -->
<!-- 
<div id="colorsearchwndow"><div></div></div>
<div id="modelsearchwndow"><div></div></div>
<div id="brandsearchwndow"><div></div></div> 
-->

</div>
</body>
</html>