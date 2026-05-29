<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
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
<style>
form label.error {
color:red;
  font-weight:bold;

}

.textbox {
    border: 0;
    height: 25px;
    width: 20%;
    border-radius: 5px;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -moz-box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -webkit-box-shadow: 1px 1px 0 0 #E0ECF8, 5px 5px 40px 2px #E0ECF8 inset;
    -webkit-background-clip: padding-box;
    outline: 0;
}
</style>
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

<script type="text/javascript">
<%-- var text1='<%=dtype%>'; --%>

 


 $(document).ready(function () {
	 
   	 $("#date").jqxDateTimeInput({ width: '125px', height: '15px', formatString:"dd.MM.yyyy"});   
   	 
   
 
 $('#sidesearchwndow').jqxWindow({ width: '60%', height: '65%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Search ' , position: { x: 250, y: 80 }, keyboardCloseKey: 27});
 $('#sidesearchwndow').jqxWindow('close');   
 
 
 
 $('#branchwindow').jqxWindow({ width: '30%', height: '50%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Search ' , position: { x: 700, y:  80 }, keyboardCloseKey: 27});
 $('#branchwindow').jqxWindow('close');   
 
 
 $('#locationwindow').jqxWindow({ width: '30%', height: '50%',  maxHeight: '90%' ,maxWidth: '80%' ,title: 'Search ' , position: { x: 750, y: 80 }, keyboardCloseKey: 27});
 $('#locationwindow').jqxWindow('close');   
  
	

		
	});
         
       
          function SearchContent(url) {
          	 //alert(url);
          		$.get(url).done(function (data) {
          		$('#sidesearchwndow').jqxWindow('open');
          		$('#sidesearchwndow').jqxWindow('setContent', data);
          
          	}); 
          	} 
    
      
          
          function branchSearchContent(url) {
           	 //alert(url);
           		$.get(url).done(function (data) {
           		$('#branchwindow').jqxWindow('open');
           		$('#branchwindow').jqxWindow('setContent', data);
           
           	}); 
           	} 
     
          
          function locationSearchContent(url) {
           	 //alert(url);
           		$.get(url).done(function (data) {
           		$('#locationwindow').jqxWindow('open');
           		$('#locationwindow').jqxWindow('setContent', data);
           
           	}); 
           	} 
     
         
          
    function funReset(){
	 
	}
	function funReadOnly(){
		$('#frmprdopn input').attr('readonly', true );
		$('#frmprdopn textarea').attr('readonly', true );
		$('#frmprdopn select').attr('disabled', true);

		$('#date').jqxDateTimeInput({ disabled: true});
		 
		$("#purchasedetails").jqxGrid({ disabled: true});
		
		 
	
	}
	function funRemoveReadOnly(){
		

		
		
		$('#frmprdopn input').attr('readonly', false );
		$('#frmprdopn textarea').attr('readonly', false );
		$('#frmprdopn select').attr('disabled', false);
	
		$('#date').jqxDateTimeInput({ disabled: false});
	 
		$("#purchasedetails").jqxGrid({ disabled: false});
		$('#docno').attr('readonly', true);
		if ($("#mode").val() == "A") {
			$('#date').val(new Date());
 
			 $("#purchasedetails").jqxGrid('clear');
			  $("#purchasedetails").jqxGrid('addrow', null, {});
			    
			     
				 
		
		}
		
		
	}
	 
	
 
	
	
	
	function funNotify(){	
 
		
		
		
 		 var rows = $("#purchasedetails").jqxGrid('getrows');
		    $('#gridlenght').val(rows.length);
		   
		   for(var i=0 ; i < rows.length ; i++){
		 
		    newTextBox = $(document.createElement("input"))
		       .attr("type", "dil")
		       .attr("id", "reqtest"+i)
		       .attr("name", "reqtest"+i)   
		    .attr("hidden", "true"); 
		    
		 
		    newTextBox.val(rows[i].psrno+"::"+rows[i].qty+" :: "+rows[i].specid+" :: "+rows[i].costprice+" :: "+rows[i].brhid+" :: "+rows[i].locid+" :: "+rows[i].psrno);
		
		   newTextBox.appendTo('form');
		  
		    
		   }   
		
		return 1;
	} 

 
	function funSearchLoad(){

		 changeContent('mainsearch.jsp?'); 
	}
 
		 
	function funFocus(){
		 
	   	$('#date').jqxDateTimeInput('focus'); 	    		
	} 
	 
	function setValues() {
		
		
		 $("#btnEdit").attr('disabled', true );
		 $("#btnDelete").attr('disabled', true ); 
		if($('#hiddate').val()){
			$("#date").jqxDateTimeInput('val', $('#hiddate').val());
		}
		 
   	 	 var docVal1 = document.getElementById("masterdoc_no").value;
  	  
      	if(docVal1>0)
      		{
       
      	
		 var indexVal2 = document.getElementById("masterdoc_no").value;
		 

     	  
         $("#prdgriddiv").load("prdgrid.jsp?reqdoc="+indexVal2);
			 
      		}
      	if($('#msg').val()!=""){
 		   $.messager.alert('Message',$('#msg').val());
 		  }
 
	 
      	document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";   
		
		
	}
	
    function funPrintBtn(){
  	    
  	}
    
    


	
</script>
</head>
<body onload="setValues();">

<div id="mainBG" class="homeContent" data-type="background">

<form id="frmprdopn"
      action="savePrdopnData"
      autocomplete="OFF">

<jsp:include page="../../../../header.jsp"></jsp:include>

<div class="modern-ui">

    <!-- GENERAL INFO -->
    <div class="middle-panel">

        <span class="middle-panel-title">General Information</span>

        <div class="field-row">

            <label class="lbl-right" style="width:80px;">Date</label>

            <div style="width:160px;">

                <div id="date"
                     name="date"
                     value='<s:property value="date"/>'></div>

                <input type="hidden"
                       id="hiddate"
                       name="hiddate"
                       value='<s:property value="hiddate"/>'/>

            </div>

            <label class="lbl-right"
                   style="width:90px; margin-left:auto;">Doc No</label>

            <input type="text"
                   id="docno"
                   name="docno"
                   tabindex="-1"
                   readonly
                   style="width:160px;"
                   value='<s:property value="docno"/>'/>

        </div>

    </div>

    <!-- GRID -->
    <div class="middle-panel">

        <span class="middle-panel-title">Product Opening Details</span>

        <div id="prdgriddiv" class="grid-container">

            <jsp:include page="prdgrid.jsp"></jsp:include>

        </div>

    </div>

    <!-- HIDDEN FIELDS -->
    <div style="display:none;">

        <input type="hidden"
               id="refno"
               name="refno"
               value='<s:property value="refno"/>'/>

        <input type="hidden"
               id="masterdoc_no"
               name="masterdoc_no"
               value='<s:property value="masterdoc_no"/>'/>

        <input type="hidden"
               id="mode"
               name="mode"
               value='<s:property value="mode"/>'/>

        <input type="hidden"
               name="deleted"
               id="deleted"
               value='<s:property value="deleted"/>'/>

        <input type="hidden"
               id="msg"
               name="msg"
               value='<s:property value="msg"/>'/>

        <input type="hidden"
               name="gridlenght"
               id="gridlenght"
               value='<s:property value="gridlenght"/>'/>

    </div>

</div>

</form>

<!-- WINDOWS -->

<div id="sidesearchwndow">
    <div></div>
</div>

<div id="branchwindow">
    <div></div>
</div>

<div id="locationwindow">
    <div></div>
</div>

</div>

</body>
</html>