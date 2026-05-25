<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<% String contextPath=request.getContextPath();%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>
<script type="text/javascript" src="../../../../js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=contextPath%>/js/resample.js"></script>

<style>
/* =========================================================
SCOPED UI: Modern Layout (Pure White Panels)
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
.modern-ui select,
.modern-ui textarea { 
    min-height: 24px; 
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
.modern-ui select:focus,
.modern-ui textarea:focus { 
    border-color: #007bff; 
    outline: none;
}

.modern-ui input[readonly],
.modern-ui input:disabled,
.modern-ui select:disabled,
.modern-ui textarea:disabled { 
    background-color: #f8f9fa; 
    color: #6b7280;
}

.modern-ui input[type="checkbox"] {
    margin: 0;
    cursor: pointer;
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

/* Pure White Middle Section Panels */
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

.modern-ui .icon-btn {
    height: 24px;
    width: 24px;
    border-radius: 3px;
    border: 1px solid #b8c6d8;
    background: #fff;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    transition: all 0.2s;
}
.modern-ui .icon-btn:hover { background: #f0f4f8; }
.modern-ui .icon-btn img { width: 14px; height: 14px; }

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
    width: 100%;
}

/* Scrollbar Logic */
.hidden-scrollbar {
    overflow-y: auto;
    height: calc(100vh - 150px);
    padding-right: 5px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #c5d3e0; border-radius: 3px; }

/* Camera Additions */
#webcam, #canvas {
    max-width: 100%;
    border: 2px solid #ccc;
    background: #f8f9fa;
    border-radius: 4px;
}
#flash { display:none; }
form label.error { color:red; font-weight:bold; }
</style> 

<script type="text/javascript">
     $(document).ready(function () { 
        document.getElementById('download').addEventListener('click', function() {
            downloadCanvas(this);
        }, false);
      
        $("#imagediv").prop("hidden", false); 
        $("#canvasdiv").prop("hidden", true);
        document.getElementById("btnEdit").disabled=true;
        
        /* Apply 24px heights to JQX DateTime Widgets */
        $("#date").jqxDateTimeInput({ width: '120px', height: 24, formatString:"dd.MM.yyyy", theme: 'energyblue'});
        $("#time").jqxDateTimeInput({ width: '80px', height: 24, formatString: 'HH:mm', showCalendarButton: false, value: new Date(), theme: 'energyblue'});
        $("#accdate").jqxDateTimeInput({ width: '120px', height: 24, formatString:"dd.MM.yyyy", value:null, enableBrowserBoundsDetection: true, theme: 'energyblue'});
        $("#collectdate").jqxDateTimeInput({ width: '120px', height: 24, formatString:"dd.MM.yyyy", value:null, enableBrowserBoundsDetection: true, theme: 'energyblue'});

        /* force internal alignment AFTER render */
        setTimeout(function () {
            $("#date, #time, #accdate, #collectdate").find("input").css({
                "margin-top": "0px",
                "line-height": "24px",
                "font-size": "12px", 
                "font-family": "Arial, sans-serif", 
                "padding": "0 6px", 
                "box-sizing":"border-box"
            });
            $("#date, #time, #accdate, #collectdate").find(".jqx-action-button").css({
                "top": "0px",
                "height": "24px"
            });
        }, 0);

        /* Window Setup */
        $('#docwindow').jqxWindow({ width: '70%', height: '60%',  maxHeight: '70%' ,maxWidth: '60%' , title: 'Document Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
        $('#docwindow').jqxWindow('close');
        $('#damagewindow').jqxWindow({ width: '60%', height: '54%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Damage Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
        $('#damagewindow').jqxWindow('close');
        $('#maintenancewindow').jqxWindow({ width: '60%', height: '54%',  maxHeight: '75%' ,maxWidth: '50%' , title: 'Complaint Search' ,position: { x: 250, y: 60 }, keyboardCloseKey: 27});
        $('#maintenancewindow').jqxWindow('close');
        $('#printWindow').jqxWindow({width: '51%', height: '28%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Print',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
        $('#printWindow').jqxWindow('close');
        
        $('#date').on('change', function (event) {  
            var jsDate = event.args.date; 
            var type = event.args.type;
            var docdateval=funDateInPeriod($('#date').jqxDateTimeInput('getDate'));
            if(docdateval=="0"){
                $('#date').jqxDateTimeInput('focus');
                return false;
            }
            var docdatevalnew=funCheckOneMonthBackDate($('#date').jqxDateTimeInput('val'),"1");
            if($('#docdatestatus').val()=="0"){
                return false;
            }
        }); 
        
        document.getElementById("savemsg").innerText="";
        
        $('#cmbagmtbranch').change(function(){
            document.getElementById("rdocno").value="";
            document.getElementById("refvoucherno").value="";
            document.getElementById("rfleet").value="";
            document.getElementById("regno").value="";
            document.getElementById("client").value="";
            document.getElementById("hidinsurexcess").value=""; 
        });
        
        $('#refvoucherno').dblclick(function(){ openDocSearch(); });
        
        $('#accremarks').keydown(function (evt) {
             if (evt.keyCode==9) {
                 event.preventDefault();
                 $('#newmaintenanceGrid').jqxGrid('selectcell',0, 'description');
                 $('#newmaintenanceGrid').jqxGrid('focus',0, 'description');
             }
        });
        enableAccData();
      });
      
      /* ===============================================
         Safe Search Functions (Fixes JSP Compile Error)
         =============================================== */
      function openDocSearch() {
          $('#cmbclaim').val('');
          document.getElementById("amount").value="";
          var reftype=document.getElementById("cmbreftype").value;
          
          if(reftype==''){
             document.getElementById("errormsg").innerText="Reference Type is Mandatory";
             return false;
          }
          if(reftype=="RAG" || reftype=="LAG"){
             if(document.getElementById("cmbagmtbranch").value==""){
                 document.getElementById("errormsg").innerText="Agreement Branch is Mandatory";
                 return false;
             }
          }
          document.getElementById("errormsg").innerText="";
          $('#docwindow').jqxWindow('open');
          docSearchContent("<%=contextPath%>/com/operations/vehicletransactions/vehicleinspection/detailDocSearch.jsp?reftype="+reftype+"&branch="+$('#cmbagmtbranch').val()+"&type="+$('#cmbtype').val(), $('#docwindow'));
      }
      /* =============================================== */
      
      function funCheckOneMonthBackDate(docdate,id){
        var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) {
                var items = x.responseText.trim();
                if(items=="0"){
                    document.getElementById("errormsg").innerText="Transaction Prior one month is not valid";
                    $('#date').jqxDateTimeInput("focus");
                    $('#docdatestatus').val("0");
                }
                else{
                    document.getElementById("errormsg").innerText="";
                    $('#docdatestatus').val("1");
                }
            } else {
            }
        }
        x.open("GET", "checkDocDate.jsp?docdate="+docdate, true);
        x.send();
      }

   function getAgmtBranch(){
       var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) {
                var items = x.responseText;
                items = items.split('***');
                var locItems = items[0].split(",");
                var locIdItems = items[1].split(",");
                var optionsloc = '<option value="">--Select--</option>';
                for (var i = 0; i < locItems.length; i++) {
                    optionsloc += '<option value="' + locIdItems[i] + '">'
                            + locItems[i] + '</option>';
                }
                $("select#cmbagmtbranch").html(optionsloc);
                
                if ($('#hidcmbagmtbranch').val() != null && $('#hidcmbagmtbranch').val()!="") {
                    $('#cmbagmtbranch').val($('#hidcmbagmtbranch').val());
                }
            } else {
            }
        }
        x.open("GET", "getBranch.jsp", true);
        x.send();
   }
      
      function getDoc(event){
          var x= event.keyCode;
           if(x==114){
               openDocSearch();
           }
      }

      function docSearchContent(url) {
          $.get(url).done(function (data) {
        $('#docwindow').jqxWindow('setContent', data);
    }); 
    }
      function damageSearchContent(url) {
          $.get(url).done(function (data) {
        $('#damagewindow').jqxWindow('setContent', data);
    }); 
    }
      function maintenanceSearchContent(url) {
          $.get(url).done(function (data) {
        $('#maintenancewindow').jqxWindow('setContent', data);
    }); 
    }

   function readURL(input) {
       document.getElementById("filedet").value=1;
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('prevImage').src=e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
            loading();
        }
    }
    
     function funReadOnly(){
      $('#frmVehicleInspection input').attr('readonly',true);
    $('#frmVehicleInspection select').attr('disabled',true);
    $('#date').jqxDateTimeInput({disabled: false});
    }

  function setValues(){
      funSetlabel();
         document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
          getAgmtBranch();
         if ($('#hidcmbtype').val() != null) {
                $('#cmbtype').val($('#hidcmbtype').val());
            }
         if ($('#hidcmbreftype').val() != null) {
                $('#cmbreftype').val($('#hidcmbreftype').val());
            }
         if ($('#hidcmbclaim').val() != null) {
                $('#cmbclaim').val($('#hidcmbclaim').val());
            }
         if($('#hiddate').val()){
                $("#date").jqxDateTimeInput('val', $('#hiddate').val());
            }
         if($('#hidtime').val()){
                $("#time").jqxDateTimeInput('val', $('#hidtime').val());
            }
         if($('#hidaccdate').val()){
                $("#accdate").jqxDateTimeInput('val', $('#hidaccdate').val());
            }
         if($('#hidcollectdate').val()){
                $("#collectdate").jqxDateTimeInput('val', $('#hidcollectdate').val());
            }
         if($('#msg').val()!=""){
              $.messager.alert('Message',$('#msg').val());
              }
         if(document.getElementById("docno").value>0){
             $('#existingdiv').load('existingGrid.jsp?fleet='+document.getElementById("rfleet").value+'&doc='+document.getElementById("docno").value);
             $('#newdiv').load('newgrid.jsp?fleet='+document.getElementById("rfleet").value+'&doc='+document.getElementById("docno").value+'&code='+document.getElementById("formdetailcode").value);
             $('#existmaintenancediv').load('existmaintenanceGrid.jsp?fleet='+document.getElementById("rfleet").value+'&doc='+document.getElementById("docno").value);
             $('#newmaintenancediv').load('newmaintenanceGrid.jsp?fleet='+document.getElementById("rfleet").value+'&doc='+document.getElementById("docno").value);
         }
  }

  function funSearchLoad(){
        changeContent('mainSearch.jsp'); 
     }

   function funRemoveReadOnly(){
       $('#newGrid').jqxGrid({ disabled: false});
       $('#newmaintenanceGrid').jqxGrid({ disabled: false});
        $('#frmVehicleInspection input').attr('readonly',false);
            $('#frmVehicleInspection select').attr('disabled',false);
       $('#docno').prop('readonly',true);
       $('#rdocno').prop('readonly',true);
       $('#rfleet').prop('readonly',true);
       if(document.getElementById("mode").value=='A'){
           $('#existingGrid').jqxGrid('clear');
           $("#existingGrid").jqxGrid("addrow", null, {});
           $('#newGrid').jqxGrid('clear');
           $("#newGrid").jqxGrid("addrow", null, {});
           $('#existmaintenanceGrid').jqxGrid('clear');
           $("#existmaintenanceGrid").jqxGrid("addrow", null, {});
           $('#newmaintenanceGrid').jqxGrid('clear');
           $("#newmaintenanceGrid").jqxGrid("addrow", null, {});
           $('#date').val(new Date());
           document.getElementById("savemsg").innerText="";
           document.getElementById("errormsg").innerText="";
       }
   }

   function funFocus(){
       document.getElementById("cmbtype").focus();
   }

   function funNotify(){
       var docdateval=funDateInPeriod($('#date').jqxDateTimeInput('getDate'));
        if(docdateval==0){
            $('#date').jqxDateTimeInput('focus');
            return 0;
        }
        if($('#docdatestatus').val()=="0"){
            document.getElementById("errormsg").innerText="Transaction Prior one month is not valid";
            $('#date').jqxDateTimeInput("focus");
            return 0;
        }
       if(document.getElementById("cmbtype").value==""){
           document.getElementById("errormsg").innerText="";
           document.getElementById("errormsg").innerText="Type is Mandatory";
           document.getElementById("cmbtype").focus();
           return 0;
       }
       if(document.getElementById("cmbreftype").value==""){
           document.getElementById("errormsg").innerText="";
           document.getElementById("errormsg").innerText="Reference Type is Mandatory";
           document.getElementById("cmbreftype").focus();
           return 0;
       }
       if(document.getElementById("rdocno").value==""){
           document.getElementById("errormsg").innerText="";
           document.getElementById("errormsg").innerText="Reference Doc is Mandatory";
           document.getElementById("rdocno").focus();
           return 0;
       }
       if(document.getElementById("chkaccidents").checked==true){
           if($('#accdate').jqxDateTimeInput('getDate')==null){
               document.getElementById("errormsg").innerText="";
               document.getElementById("errormsg").innerText="Accident Date cannot be Empty";
               $("#accdate .jqx-input-content").focus();
               return 0;
           }
           if($('#collectdate').jqxDateTimeInput('getDate')==null){
               document.getElementById("errormsg").innerText="";
               document.getElementById("errormsg").innerText="Collection Date cannot be Empty";
               $("#collectdate .jqx-input-content").focus();
               return 0;
           }
       }
       var existrowsdamage = $("#existingGrid").jqxGrid('getrows');
        if(!((existrowsdamage[0].srno=="undefined") || (existrowsdamage[0].srno==null) || (existrowsdamage[0].srno==""))){
    $('#existdamagegridlength').val(existrowsdamage.length);
        for(var i=0 ; i < existrowsdamage.length ; i++){
                newTextBox = $(document.createElement("input"))
                .attr("type", "dil")
                .attr("id", "testexistdamage"+i)
                .attr("name", "testexistdamage"+i);
                
            newTextBox.val(existrowsdamage[i].srno+"::");
            newTextBox.appendTo('form');
            }
    } 
        var rowsdamage = $("#newGrid").jqxGrid('getrows');
        if(!((rowsdamage[0].code=="undefined") || (rowsdamage[0].code==null) || (rowsdamage[0].code==""))){
    $('#damagegridlength').val(rowsdamage.length);
        for(var i=0 ; i < rowsdamage.length ; i++){
                newTextBox = $(document.createElement("input"))
                .attr("type", "dil")
                .attr("id", "test"+i)
                .attr("name", "test"+i);
                
            newTextBox.val(rowsdamage[i].code+"::"+rowsdamage[i].description+"::"+rowsdamage[i].type+"::"+rowsdamage[i].remarks+"::"+rowsdamage[i].upload+"::"+rowsdamage[i].dmgid);
            newTextBox.appendTo('form');
            }
    } 
           var rowsmaintenance = $("#newmaintenanceGrid").jqxGrid('getrows');
            if(!((rowsmaintenance[0].description=="undefined") || (rowsmaintenance[0].description==null) || (rowsmaintenance[0].description==""))){
        $('#maintenancegridlength').val(rowsmaintenance.length);
            for(var i=0 ; i < rowsmaintenance.length ; i++){
                    newTextBox = $(document.createElement("input"))
                    .attr("type", "dil")
                    .attr("id", "testmaint"+i)
                    .attr("name", "testmaint"+i);
                    
                newTextBox.val(rowsmaintenance[i].description+"::"+rowsmaintenance[i].remarks+"::"+rowsmaintenance[i].doc);
                newTextBox.appendTo('form');
                }
        }
        
            document.getElementById("errormsg").innerText="";
       return 1;
   }

 function funResetValues(){
     funRemoveReadOnly();
     document.getElementById("rdocno").value="";
     document.getElementById("rfleet").value="";
 }
 function enableAccData(){
     if(document.getElementById("chkaccidents").checked==true){
         document.getElementById("hidaccidents").value="1";
         $('#accdate').jqxDateTimeInput({ disabled: false});
         $('#prcs').prop('disabled',false);
         $('#collectdate').jqxDateTimeInput({ disabled: false});
         $('#accplace').prop('disabled',false);
         $('#accfines').prop('disabled',false);
         $('#cmbclaim').prop('disabled',false);
         $('#accremarks').prop('disabled',false);
     }
     if(document.getElementById("chkaccidents").checked==false){
         document.getElementById("hidaccidents").value="0";
         $('#accdate').jqxDateTimeInput({ disabled: true});
         $('#prcs').prop('disabled',true);
         $('#collectdate').jqxDateTimeInput({ disabled: true});
         $('#accplace').prop('disabled',true);
         $('#accfines').prop('disabled',true);
         $('#cmbclaim').prop('disabled',true);
         $('#accremarks').prop('disabled',true);    
     }
 }

 function checkClaim(value){
     if(value=="1"){
        if(document.getElementById("hidinsurexcess").value!="" && parseFloat(document.getElementById("hidinsurexcess").value)>0){
            document.getElementById("accfines").value=document.getElementById("hidinsurexcess").value;
        }
     }
 }

 function isNumber(evt,id) {
        var iKeyCode = (evt.which) ? evt.which : evt.keyCode
        if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57)) {
             $.messager.alert('Warning','Enter Numbers Only');
           $("#"+id+"").focus();
            return false;
         }
        return true;
    }
 
 function funPrintBtn() {
     var value=$('#hidconfig').val();
     if(value=="1"){
         mobilePrintContent('mobileprintWindow.jsp?docno='+document.getElementById("docno").value+'&rfleet='+document.getElementById("rfleet").value);
     }
     else{  
        if(document.getElementById("docno").value=='' || document.getElementById("docno").value=='0'){
         $.messager.alert('Warning','Select a Document');
         return false;
            }
        var url=document.URL;
     var reurl=url.split("com/");
        
        var win= window.open(reurl[0]+"com/operations/vehicletransactions/vehicleinspection/inspectionPrint.action?docno="+document.getElementById("docno").value+"&fleetno="+document.getElementById("rfleet").value+"&lblurl="+window.location.origin,"_blank","top=250,left=310,Width=800,Height=800,location=no,scrollbars=no,toolbar=yes");
        win.focus();
     }
 }

 function mobilePrintContent(url) {
        $('#printWindow').jqxWindow('open');
        $.get(url).done(function (data) {
        $('#printWindow').jqxWindow('setContent', data);
        $('#printWindow').jqxWindow('bringToFront');
    }); 
    } 

 function opensnapshotWindow() {
    document.getElementById("canvasdet").value=1;
    $("#imagediv").prop("hidden", true); 
     $("#canvasdiv").prop("hidden", false);
    
    var url=document.URL;
     var reurl=url.split("vehicleInspection");
     window.open("snapshot.jsp", "Camera",'menubar=0,resizable=1,width=400,height=440, top=50, left=380');
 }

 function downloadCanvas(link) {
    var formname=document.getElementById("formdetailcode").value;
    var docno=document.getElementById("docno").value;
    var filename=formname+"_"+docno;
     link.href = document.getElementById("canvas").toDataURL();
     link.download =filename;
 }

 function saveViaAJAX(row) {
     var formname=document.getElementById("formdetailcode").value;
     var docno=document.getElementById("docno").value;

     if(docno==""){
         document.getElementById("errormsg").innerText="Please Select a Document Number";
         return false;
     }
    var testCanvas = document.getElementById("canvas");  
    var canvasData = testCanvas.toDataURL("image/png");
    var postData = "canvasData="+canvasData;
    
    var ajax = new XMLHttpRequest();
    ajax.open("POST",'saveImage.jsp?formname='+formname+'&docno='+docno+'&srno='+row,true);    
    ajax.setRequestHeader('Content-Type', 'canvas/upload');
    
    ajax.onreadystatechange=function()
    {
        if (ajax.readyState == 4)
        { 
            document.getElementById("savemsg").innerText="Successfully Attached";
            document.getElementById("filedet").value=0;
            document.getElementById("canvasdet").value=0;
              $.messager.alert('Message',"Successfully Attached");
            $('#newdiv').load('newgrid.jsp?fleet='+document.getElementById("rfleet").value+'&doc='+document.getElementById("docno").value+'&code='+document.getElementById("formdetailcode").value);
        }
    }
    ajax.send(postData);  
 }
  
 </script>
        
<script>
    (function ( $width, $height, $file) {
        function resampled(data) {
            document.getElementById("data").value=data;
            var imgid = new Image();
            imgid.src =data;
            var temp_paint = $('#canvasid');
            var temp_ctx = temp_paint[0].getContext('2d');
             document.getElementById("errormsg").innerText=" ";
              temp_ctx.drawImage(imgid, 0, 0,640, 480);
        }
        
        function load(e) {
            Resample(
                    this.result,
                    this._width || null,
                    this._height || null,
                    resampled
            );
        }
        
        function abort(e) {}
        function error(e) {}
        
        $file.addEventListener("change", function change() {
            var width = parseInt($width.value, 10), height = parseInt($height.value, 10), file;
            if (!width && !height) {
                $file.parentNode.replaceChild( file = $file.cloneNode(false), $file );
                $file.removeEventListener("change", change, false);
                ($file = file).addEventListener("change", change, false);
            } else if( ($file.files || []).length && /^image\//.test((file = $file.files[0]).type) ) {
                file = new FileReader;
                file.onload = load;
                file.onabort = abort;
                file.onerror = error;
                file._width = width;
                file._height = height;
                file.readAsDataURL($file.files[0]);
            }
        }, false);
    }(
        document.getElementById("width"),
        document.getElementById("height"),
        document.getElementById("file")
    ));
    
    function loading(){
        var path=document.getElementById("file").value;
         var fsize = $('#file')[0].files[0].size;
         var extn = path.substring(path.lastIndexOf(".") + 1, path.length);
         if((extn=='jpg')||(extn=='png')||(extn=='jpeg')||(extn=='gif')||(extn=='bmp')||(extn=='JPG')||(extn=='PNG')||(extn=='JPEG')||(extn=='GIF')||(extn=='BMP'))
        {
             if(fsize>1048576) { }
        }
    }
    
    function getConfig() {
        var x = new XMLHttpRequest();
        x.onreadystatechange = function() {
            if (x.readyState == 4 && x.status == 200) {
                var items = x.responseText.trim();
                $('#hidconfig').val(items);
            } else { }
        }
        x.open("GET", "getConfig.jsp", true);
        x.send();
    }
 </script>
</head>

<body onload="setValues();getConfig();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmVehicleInspection" action="saveVehicleInspection" autocomplete="off">
<jsp:include page="../../../../header.jsp"></jsp:include>
<script>
    window.parent.formName.value="Vehicle Inspection";
    window.parent.formCode.value="VIP";
</script>

<div class='modern-ui hidden-scrollbar'>

    <div class="middle-panel">
        <span class="middle-panel-title">Vehicle Inspection Info</span>
        
        <div class="field-row">
            <label class="lbl-right" style="width:60px;">Date</label>
            <div style="width: 125px;">
                <div id="date" name="date" value='<s:property value="date"/>'></div>
                <input type="hidden" name="hiddate" id="hiddate" value='<s:property value="hiddate"/>'>
            </div>
            
            <label class="lbl-right" style="width:50px; margin-left:15px;">Time</label>
            <div style="width: 80px;">
                <div id="time" name="time" value='<s:property value="date"/>'></div>
                <input type="hidden" name="hidtime" id="hidtime" value='<s:property value="hidtime"/>'>
            </div>
            
            <label class="lbl-right" style="width:50px; margin-left:15px;">Type</label>
            <select name="cmbtype" id="cmbtype" style="width:100px;">
                <option value="">--Select--</option>
                <option value="IN">IN</option>
                <option value="OUT">OUT</option>
            </select>
            <input type="hidden" name="hidcmbtype" id="hidcmbtype" value='<s:property value="hidcmbtype"/>'>
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Ref type</label>
            <select name="cmbreftype" id="cmbreftype" style="width:140px;" onchange="funResetValues();">
                <option value="">--Select--</option>
                <option value="RAG">Rental</option>
                <option value="LAG">Lease</option>
                <option value="RPL">Replacement</option>
                <option value="NRM">Non Revenue  Movement</option>
            </select>
            <input type="hidden" name="hidcmbreftype" id="hidcmbreftype" value='<s:property value="hidcmbreftype"/>'>
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Branch</label>
            <select name="cmbagmtbranch" id="cmbagmtbranch" style="width:120px;" onChange="funResetValues();" value='<s:property value="cmbagmtbranch"/>'>
                <option value="">--Select--</option>
            </select>
            <input type="hidden" name="hidcmbagmtbranch" id="hidcmbagmtbranch" value='<s:property value="hidcmbagmtbranch"/>'>
            
            <label class="lbl-right" style="width:60px; margin-left:auto;">Doc No</label>
            <input type="text" name="docno" id="docno" value='<s:property value="docno"/>' style="width:120px;" readonly tabindex="-1">
        </div>

        <div class="field-row" style="margin-bottom:0;">
            <label class="lbl-right" style="width:80px;">Ref Doc No</label>
            <div class="input-search-container" style="width: 140px;">
                <input type="text" name="refvoucherno" id="refvoucherno" value='<s:property value="refvoucherno"/>' readonly placeholder="Press F3" onKeyDown="getDoc(event);">
                <svg class="magnifier-icon" onclick="openDocSearch();" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            </div>
            
            <label class="lbl-right" style="width:80px; margin-left:15px;">Ref Fleet No</label>
            <input type="text" name="rfleet" id="rfleet" style="width:120px;" value='<s:property value="rfleet"/>' readonly>
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Reg No</label>
            <input type="text" name="regno" id="regno" style="width:120px;" value='<s:property value="regno"/>' readonly>
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Client</label>
            <input type="text" name="client" id="client" style="flex:1;" value='<s:property value="client"/>' readonly>
        </div>
    </div>

    <div style="display: flex; gap: 15px; margin-bottom: 15px;">
        
        <div style="flex: 2; display: flex; flex-direction: column; gap: 15px;">
            <div class="middle-panel" style="margin-bottom: 0;">
                <span class="middle-panel-title">Existing Damages</span>
                <div id="existingdiv" class="grid-container">
                    <jsp:include page="existingGrid.jsp"></jsp:include> 
                </div>
            </div>
            
            <div class="middle-panel" style="margin-bottom: 0;">
                <span class="middle-panel-title">New Damages</span>
                <div id="newdiv" class="grid-container">
                    <jsp:include page="newgrid.jsp"></jsp:include>
                </div>
            </div>
        </div>

        <div class="middle-panel" style="flex: 1; margin-bottom: 0;">
            <span class="middle-panel-title">Snapshot / Images</span>
            
            <div class="field-row" style="justify-content: center; gap: 20px;">
                <a id="download" href="#" style="text-decoration: none;">
                    <button class="icon-btn" title="Save Image" type="button" style="width: 32px; height: 32px;">
                        <img alt="Download File" src="<%=contextPath%>/icons/isave.png" style="width:20px; height:20px;">
                    </button>
                </a>
                <button class="icon-btn" title="SnapShot" type="button" onclick="opensnapshotWindow()" style="width: 32px; height: 32px;">
                    <img alt="SnapShot" src="<%=contextPath%>/icons/snapshot.png" style="width:20px; height:20px;"> 
                </button>
            </div>
            
            <div style="display:flex; justify-content:center; align-items:center; margin-top: 15px;">
                <div id="canvasdiv">
                    <canvas id="canvas" height="240" width="320"></canvas>
                    <ul id="cams"></ul>
                </div>
                <div id="imagediv" style="width:100%; height:240px; display:flex; align-items:center; justify-content:center; border:1px solid #c5d3e0; border-radius:4px; background:#f4f7f9;">
                    <img id="prevImage" src="<%=contextPath%>/icons/gatewaybg.png" alt="Image" style="max-height:100%; max-width:100%;"/>
                </div>
            </div>
            <input type="hidden" name="canvasdet" id="canvasdet" value='<s:property value="canvasdet"/>'>
            <input type="hidden" name="filedet" id="filedet" value='<s:property value="filedet"/>'>
        </div>
    </div>

    <div class="middle-panel">
        <span class="middle-panel-title">Charges & Accidents</span>
        
        <div class="field-row">
            <label class="lbl-right" style="width:300px; margin-left:auto;">Damage Charges to be collected (No Police Report)</label>
            <input type="text" name="amount" id="amount" value='<s:property value="amount"/>' style="width:120px; text-align:right;" onkeypress="javascript:return isNumber (event,id)" onblur="funRoundAmt(value,id);">
        </div>

        <div class="field-row">
            <label class="lbl-right" style="width:120px; display:flex; justify-content:flex-end; align-items:center; gap:5px; cursor:pointer;" for="chkaccidents">
                <input type="checkbox" name="chkaccidents" id="chkaccidents" value='<s:property value="chkaccidents"/>' onchange="enableAccData();">
                <span>Accidents</span>
            </label>
            <span style="font-size: 11px; color:#666;">(Considered only with Police Report)</span>
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Date</label>
            <div style="width: 125px;">
                <div id="accdate" name="accdate" value='<s:property value="accdate"/>'></div>
                <input type="hidden" name="hidaccdate" id="hidaccdate" value='<s:property value="hidaccdate"/>'>
            </div>
            
            <label class="lbl-right" style="width:80px; margin-left:15px;">Police Report</label>
            <input type="text" name="prcs" id="prcs" style="width:100px;" value='<s:property value="prcs"/>'>
            
            <label class="lbl-right" style="width:80px; margin-left:15px;">Collection Date</label>
            <div style="width: 125px;">
                <div id="collectdate" name="collectdate" value='<s:property value="collectdate"/>'></div>
                <input type="hidden" name="hidcollectdate" id="hidcollectdate" value='<s:property value="hidcollectdate"/>'>
            </div>
            
            <label class="lbl-right" style="width:60px; margin-left:15px;">Place</label>
            <input type="text" name="accplace" id="accplace" style="flex:1;" value='<s:property value="accplace"/>'>
        </div>

        <div class="field-row" style="margin-bottom:0;">
            <label class="lbl-right" style="width:120px;">Claim</label>
            <select name="cmbclaim" id="cmbclaim" style="width:120px;" onchange="checkClaim(this.value);">
                <option value="">--Select--</option>
                <option value=1>Own</option>
                <option value=0>Third Party</option>
            </select>
            <input type="hidden" name="hidcmbclaim" id="hidcmbclaim" value='<s:property value="hidcmbclaim"/>'>
            
            <label class="lbl-right" style="width:80px; margin-left:15px;">Ins Excess</label>
            <input type="text" name="accfines" id="accfines" value='<s:property value="accfines"/>' style="width:120px; text-align:right;" onKeyPress="javascript:return isNumber (event,id)" onBlur="funRoundAmt(value,id);">
            
            <label class="lbl-right" style="width:80px; margin-left:15px;">Remarks</label>
            <input type="text" name="accremarks" id="accremarks" style="flex:1;" value='<s:property value="accremarks"/>'>
        </div>
    </div>

    <div style="display: flex; gap: 15px; margin-bottom: 15px;">
        <div class="middle-panel" style="flex: 1; margin-bottom: 0;">
            <span class="middle-panel-title">Existing Complaints</span>
            <div id="existmaintenancediv" class="grid-container">
                <jsp:include page="existmaintenanceGrid.jsp"></jsp:include>
            </div>
        </div>
        <div class="middle-panel" style="flex: 1; margin-bottom: 0;">
            <span class="middle-panel-title">New Complaints</span>
            <div id="newmaintenancediv" class="grid-container">
                <jsp:include page="newmaintenanceGrid.jsp"></jsp:include>
            </div>
        </div>
    </div>

    <div style="display:none;">
        <input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>'>
        <input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>'>
        <input type="hidden" name="msg" id="msg" value='<s:property value="msg"/>'>
        <input type="hidden" name="damagegridlength" id="damagegridlength" value='<s:property value="damagegridlength"/>'>
        <input type="hidden" name="existdamagegridlength" id="existdamagegridlength" value='<s:property value="existdamagegridlength"/>'>
        <input type="hidden" name="maintenancegridlength" id="maintenancegridlength" value='<s:property value="maintenancelength"/>'>
        <input type="hidden" name="hidaccidents" id="hidaccidents" value='<s:property value="hidaccidents"/>'>
        <input type="hidden" name="hidinsurexcess" id="hidinsurexcess" value='<s:property value="hidinsurexcess"/>'>
        <input type="hidden" name="rdocno" id="rdocno" value='<s:property value="rdocno"/>' readonly onkeydown="getDoc(event);">
        <input type="hidden" name="docdatestatus" id="docdatestatus" value='<s:property value="docdatestatus"/>' >
        <input type="hidden" name="hidconfig" id="hidconfig" value='<s:property value="hidconfig"/>' >
    </div>

</div>

<div id="docwindow"><div></div><div></div></div>
<div id="damagewindow"><div></div><div></div></div>
<div id="maintenancewindow"><div></div><div></div></div>
<div id="printWindow"><div></div><div></div></div>

<div id="errormsg" style="color:red; font-weight:bold; margin-left:15px; margin-top:10px;"></div>
<div id="savemsg" style="color:green; font-weight:bold; margin-left:15px; margin-top:5px;"></div>

</form>
</div>
</body>
</html>