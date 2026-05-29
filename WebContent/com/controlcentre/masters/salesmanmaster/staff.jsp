<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>

<script type="text/javascript">
	$(document).ready(function () {     
		  $('#accountWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Accounts Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	      $('#accountWindow').jqxWindow('close');
		  
	      $('#nationalityWindow').jqxWindow({width: '25%', height: '61%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'Nation Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true});
		  $('#nationalityWindow').jqxWindow('close');
		  
		  $('#stateWindow').jqxWindow({width: '25%', height: '58%',  maxHeight: '70%' ,maxWidth: '25%' , title: 'State Search',position: { x: 420, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	 	  $('#stateWindow').jqxWindow('close');
	 		 
		  $("#staffdate").jqxDateTimeInput({width : '125px',height : '15px',formatString : "dd.MM.yyyy"});
		  
		  $('#txtaccno').dblclick(function(){
	  	    $('#accountWindow').jqxWindow('open');
	        var url=document.URL;
		    var reurl=url.split("com/");
	  	  		accountSearchContent(reurl[0]+'com/search/accountsearch/accountsEmployee.jsp?dtype='+document.getElementById("formdetailcode").value);
			 }); 
		  
		  document.getElementById("formdet").innerText="Staff(STF)";
   		  document.getElementById("formdetail").value="Staff";
   		  document.getElementById("formdetailcode").value="STF";
   		  window.parent.formCode.value="STF";
   		  window.parent.formName.value="Staff";
		});
	
	 function nationalitySearchContent(url) {
		    $('#nationalityWindow').jqxWindow('open');
	  	    $.get(url).done(function (data) {
		    $('#nationalityWindow').jqxWindow('setContent', data);
		    $('#nationalityWindow').jqxWindow('bringToFront');
		   }); 
		  }
	 
	 function stateSearchContent(url) {
		 	$('#stateWindow').jqxWindow('open');
			$.get(url).done(function (data) {
			$('#stateWindow').jqxWindow('setContent', data);
			$('#stateWindow').jqxWindow('bringToFront');
		}); 
		}
	 
	function getAcc(event){
		 var x= event.keyCode;
		 if(x==114){
		  $('#accountWindow').jqxWindow('open');
	      var url=document.URL;
		  var reurl=url.split("com/");
	   		accountSearchContent(reurl[0]+'com/search/accountsearch/accountsEmployee.jsp?dtype='+document.getElementById("formdetailcode").value);
		 }
		 else{}
		 }
	
	function accountSearchContent(url) {
			 $.get(url).done(function (data) {
			 $('#accountWindow').jqxWindow('setContent', data);
		}); 
		}
	
	function funReadOnly(){
		$('#frmStaff input').attr('readonly', true );
		$('#staffdate').jqxDateTimeInput({ disabled: true}); 
		$("#jqxDriver").jqxGrid({ disabled: true});
	}
	
	function funRemoveReadOnly(){
		$('#frmStaff input').attr('readonly', false );
		$('#staffdate').jqxDateTimeInput({ disabled: false}); 
		$('#docno').attr('readonly', true);
		$("#jqxDriver").jqxGrid({ disabled: false});
		
		if ($("#mode").val() == "A") {
	        $("#jqxDriver").jqxGrid('clear');
	        $("#jqxDriver").jqxGrid('addrow', null, {});
	     }
		
		if ($("#mode").val() == "E") {
			$("#jqxDriver").jqxGrid('addrow', null, {});
		}
		
		$('#txtaccno').attr('readonly', true);
		$('#txtaccname').attr('readonly', true);
	}
	
	
	function funNotify(){
		if(document.getElementById("txtaccno").value==''){
			document.getElementById("errormsg").innerText="Account is Mandatory.";
			return 0;
		}
	
		if(document.getElementById("chkvalid").value==1){
			document.getElementById("errormsg").innerText="Please Enter Necessary Details";
			return 0;
		}
	
		var rows = $("#jqxDriver").jqxGrid('getrows');
		var length=0;
		for(var i=0 ; i < rows.length ; i++){
			var chk=rows[i].dob;
			if(typeof(chk) != "undefined"){
				length=length+1;
				newTextBox = $(document.createElement("input"))
			    .attr("type", "dil")
			    .attr("id", "test"+i)
			    .attr("name", "test"+i)
			    .attr("hidden", "true");
		     
				newTextBox.val(rows[i].hiddob+"::"+rows[i].nation1+"::"+rows[i].mobno+"::"+rows[i].passport_no+"::"+rows[i].hidpassexp+"::"+rows[i].dlno+"::"+rows[i].hidissdate+"::"+rows[i].issfrm+"::"+rows[i].hidled+"::"+rows[i].ltype+"::"+rows[i].visano+"::"+rows[i].hidvisaexp+"::"+rows[i].dr_id);
		    	newTextBox.appendTo('form');
			   }
		    }
 		$('#gridlength').val(length);
		
		document.getElementById("errormsg").innerText="";
		return 1;		
	}
	
	function funChkButton() {
		   /* funReset(); */
		  }
		  
	function setValues() {
		
			if($('#hidstaffdate').val()){
				$("#staffdate").jqxDateTimeInput('val', $('#staffdate').val());
			  }
			
			if($('#msg').val()!=""){
				   $.messager.alert('Message',$('#msg').val());
				  }
			
		   if(document.getElementById("docno").value>0){
			   var code=$('#formdetailcode').val().trim();
	           var doc=document.getElementById("docno").value;
	           $('#staffdiv').load("driver2.jsp?docno="+doc+"&dtype="+code);
	}
		   
	}
	
	function funFocus(){
		document.getElementById("code").focus();
	}
	
	function funSearchLoad(){
		changeContent('staffSearch.jsp'); 
	 }
	 
	 $(function(){
		    $('#frmStaff').validate({
	            rules: {
	            code: {required:true,maxlength:10},
	            name:{required:true,maxlength:40},
	            txtaccname:{required:true},
	            mail:{email:true}
	            },
	            messages: {
	             code:{required:" *",maxlength:"Max 10 Chars"},
	             name:{required:" *",maxlength:"Max 40 Chars"},
	             txtaccname:{required:" *"},
	             mail:{email:"Not a valid Email."}
	             }
	   });});
	 
	 function funExcelBtn(){
		   	if(document.getElementById("docno").value!=""){
		   		
		   		$("#jqxDriver").jqxGrid('exportdata', 'xls', 'Staff '+document.getElementById("name").value);	
		   	} 
		   	else{
		   	 $.messager.alert('Warning','Select a valid Document');
		   	 return false;
		   	}
			
		   }
</script>

<style>

/* ================= MASTER UI ================= */

body,
input,
select,
textarea,
button,
table,
td,
th,
div,
span,
label,
.modern-ui {
    font-family: "Segoe UI", Tahoma, sans-serif !important;
    font-size: 12px;
    color: #333;
}

body {
    background: linear-gradient(135deg, #f5f7fa 0%, #dbe5f1 100%);
    margin: 0;
    padding: 24px 0;
    overflow-y: auto !important;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

#mainBG {
    background: #fff;
    border-radius: 14px;
    padding: 15px;
    box-shadow: 0 4px 24px rgba(0,0,0,0.06);
}

.modern-ui {
    padding: 5px 15px;
    box-sizing: border-box;
    width: 100%;
}

/* ================= INPUTS ================= */

.modern-ui input[type="text"],
.modern-ui input[type="email"],
.modern-ui select {
    height: 24px !important;
    border: 1px solid #b8c6d8;
    border-radius: 3px;
    padding: 2px 6px;
    background: #fff;
    width: 100%;
    box-sizing: border-box;
}

.modern-ui input[type="text"]:focus,
.modern-ui input[type="email"]:focus,
.modern-ui select:focus {
    border-color: #2563eb;
    outline: none;
}

.modern-ui input[readonly],
.modern-ui input:disabled,
.modern-ui select:disabled {
    background: #f8f9fa !important;
    color: #6b7280 !important;
    border-color: #dbe1ea !important;
}

/* ================= LABELS ================= */

.modern-ui .lbl-right {
    text-align: right;
    color: #2f2f2f;
    font-size: 12px;
    font-weight: 600;
    white-space: nowrap;
}

/* ================= LAYOUT ================= */

.modern-ui .field-row {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-bottom: 10px;
    flex-wrap: wrap;
}

/* ================= PANELS ================= */

.modern-ui .middle-panel {
    border: 1px solid #c7d2df;
    border-radius: 4px;
    background: #fff;
    padding: 20px 12px 12px 12px;
    position: relative;
    margin-bottom: 15px;
    margin-top: 12px;
}

.modern-ui .middle-panel-title {
    position: absolute;
    top: -12px;
    left: 10px;
    background: #fff;
    padding: 0 8px;
    color: #0056b3;
    font-size: 13px;
    font-weight: 700;
    border-left: 3px solid #0056b3;
}

/* ================= GRID ================= */

.grid-container {
    border: 1px solid #c7d2df;
    border-radius: 4px;
    overflow: hidden;
    background: #fff;
}

/* ================= DISABLED ================= */

button:disabled,
button[disabled],
input[type="button"]:disabled,
input[type="submit"]:disabled,
a.disabled,
a[disabled],
.disabled,
.l-btn-disabled,
.ui-state-disabled,
.btn-disabled,
[disabled="disabled"],
[disabled="true"] {
    background: #e2e8f0 !important;
    background-image: none !important;
    color: #94a3b8 !important;
    border: 1px solid #cbd5e1 !important;
    cursor: not-allowed !important;
    pointer-events: none !important;
    box-shadow: none !important;
}

/* ================= LEGACY RESET ================= */

fieldset {
    border: none;
    margin: 0;
    padding: 0;
    background: transparent !important;
}

legend {
    display: none;
}

</style>
</head>
<body onLoad="setValues();">

<div id="mainBG" class="homeContent" data-type="background">

<form id="frmStaff"
      action="saveActionStaff"
      autocomplete="off">

<jsp:include page="../../../../header.jsp" />

<div class="modern-ui">

    <!-- STAFF DETAILS -->
    <div class="middle-panel">

        <span class="middle-panel-title">Staff Details</span>

        <!-- ROW 1 -->
        <div class="field-row">

            <label class="lbl-right" style="width:80px;">Date</label>

            <div style="width:160px;">

                <div id="staffdate"
                     name="staffdate"
                     value='<s:property value="staffdate"/>'></div>

            </div>

            <label class="lbl-right"
                   style="width:90px; margin-left:auto;">Doc No.</label>

            <input type="text"
                   id="docno"
                   name="docno"
                   style="width:140px;"
                   value='<s:property value="docno"/>'
                   readonly
                   tabindex="-1">

        </div>

        <!-- ROW 2 -->
        <div class="field-row">

            <label class="lbl-right" style="width:80px;">Code</label>

            <input type="text"
                   id="code"
                   name="code"
                   placeholder="Code"
                   style="width:180px;"
                   value='<s:property value="code"/>'/>

            <label class="lbl-right" style="width:80px;">Name</label>

            <input type="text"
                   name="name"
                   id="name"
                   placeholder="Name"
                   style="flex:1;"
                   value='<s:property value="name"/>'>

            <label class="lbl-right" style="width:80px;">Email</label>

            <input type="email"
                   name="mail"
                   id="mail"
                   style="width:260px;"
                   placeholder="someone@example.com"
                   value='<s:property value="mail"/>'>

        </div>

        <!-- ROW 3 -->
        <div class="field-row">

            <label class="lbl-right" style="width:80px;">Account</label>

            <input type="text"
                   name="txtaccno"
                   id="txtaccno"
                   style="width:180px;"
                   value='<s:property value="txtaccno"/>'
                   onKeyDown="getAcc(event);"
                   readonly
                   placeholder="Press F3 to Search">

            <input type="text"
                   name="txtaccname"
                   id="txtaccname"
                   style="flex:1;"
                   value='<s:property value="txtaccname"/>'
                   readonly>

        </div>

    </div>

    <!-- GRID -->
    <div class="middle-panel">

        <span class="middle-panel-title">Staff Information</span>

        <div id="staffdiv" class="grid-container">

            <jsp:include page="driver2.jsp"></jsp:include>

        </div>

    </div>

    <!-- HIDDEN FIELDS -->
    <div style="display:none;">

        <input type="hidden"
               name="hidstaffdate"
               id="hidstaffdate"
               value='<s:property value="hidstaffdate"/>'>

        <input type="hidden"
               name="mode"
               id="mode"
               value='<s:property value="mode"/>'>

        <input type="hidden"
               name="deleted"
               id="deleted"
               value='<s:property value="deleted"/>'>

        <input type="hidden"
               name="gridlength"
               id="gridlength"
               value='<s:property value="gridlength"/>'>

        <input type="hidden"
               name="msg"
               id="msg"
               value='<s:property value="msg"/>'>

        <input type="hidden"
               name="hidacno"
               id="hidacno"
               value='<s:property value="hidacno"/>'>

    </div>

</div>

</form>

<!-- WINDOWS -->

<div id="accountWindow">
    <div></div>
</div>

<div id="nationalityWindow">
    <div></div>
</div>

<div id="stateWindow">
    <div></div>
</div>

</div>

</body>
</html>

