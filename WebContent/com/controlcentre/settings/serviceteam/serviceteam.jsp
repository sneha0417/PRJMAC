<%@ taglib prefix="s" uri="/struts-tags" %>
<% String contextPath=request.getContextPath();%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>

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

/* Disabled Text Inputs */
.modern-ui input[readonly],
.modern-ui input[type="text"]:disabled,
.modern-ui select:disabled { 
    background-color: #f8f9fa !important; 
    color: #6b7280 !important;
    border-color: #e5e7eb !important;
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

/* Custom UI Buttons */
.myButton {
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

.myButton:hover:not(:disabled) { 
    background: linear-gradient(135deg, #083a8a 0%, #1d4ed8 100%); 
}

/* GLOBAL Disabled Button State (Removed .modern-ui prefix to catch header buttons) */
.myButton:disabled,
button:disabled,
input[type="button"]:disabled,
input[type="submit"]:disabled {
    background: #e2e8f0 !important; 
    color: #94a3b8 !important;      
    border: 1px solid #cbd5e1 !important;
    cursor: not-allowed !important; 
    box-shadow: none !important;
    text-shadow: none !important;
    pointer-events: none !important;
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

/* FIXED: Grid Wrappers (Crash Prevention) */
.modern-ui .grid-container {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    background: #fff;
    overflow: hidden;
    display: block; 
    min-height: 200px;
}

/* FIXED: Scrollbar Logic (Crash Prevention) */
.hidden-scrollbar {
    padding-right: 5px;
}
.hidden-scrollbar::-webkit-scrollbar { width: 6px; }
.hidden-scrollbar::-webkit-scrollbar-thumb { background: #c5d3e0; border-radius: 3px; }

/* Validation Error override */
.modern-ui label.error,
form label.error { 
    color: red !important; 
    font-weight: bold; 
    font-size: 11px; 
}

/* Specific internal layout resets */
#part input, #pnames input { width: 100% !important; box-sizing: border-box; }
.classpass { -webkit-text-security: disc; }
</style>
<jsp:include page="../../../../includes.jsp"></jsp:include>
<script type="text/javascript">
	
	$(document).ready(function() {
  	  $("#date").jqxDateTimeInput({ width : '125px', height : '15px', formatString : "dd.MM.yyyy" }); 
  	
  	  $('#employeeDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Employee Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
  	  $('#employeeDetailsWindow').jqxWindow('close');
  	  
  	  $('#userDetailsWindow').jqxWindow({width: '51%', height: '58%',  maxHeight: '70%' ,maxWidth: '51%' , title: 'Team-User Link Search',position: { x: 300, y: 87 } , theme: 'energyblue', showCloseButton: true, keyboardCloseKey: 27});
	  $('#userDetailsWindow').jqxWindow('close');
	  
	  $('#txtteamuserlinkname').dblclick(function(){
		  $('#userDetailsWindow').jqxWindow('open');
     	  userSearchContent('userDetailsSearch.jsp?id=0');
	});
  	  
	});
	
	function employeeSearchContent(url) {
	 	$('#employeeDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#employeeDetailsWindow').jqxWindow('setContent', data);
		$('#employeeDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function userSearchContent(url) {
	 	$('#userDetailsWindow').jqxWindow('open');
		$.get(url).done(function (data) {
		$('#userDetailsWindow').jqxWindow('setContent', data);
		$('#userDetailsWindow').jqxWindow('bringToFront');
	}); 
	}
	
	function getTeamUserLink(event){
        var x= event.keyCode;
        if(x==114){
        	 $('#userDetailsWindow').jqxWindow('open');
        	 userSearchContent('userDetailsSearch.jsp?id=0');
        }
        else{}
        }
	
	function getTeamUserLink(rownindex){
		$('#userDetailsWindow').jqxWindow('open');
   	    userSearchContent('userDetailsSearch.jsp?id=1&rownindex='+rownindex); 
	}
	
	function getemployee(rownindex){
   	  $('#employeeDetailsWindow').jqxWindow('open');
   	  employeeSearchContent('employeeDetailsSearch.jsp?rownindex='+rownindex); 
    }
	
	function funReadOnly() {
		 $('#frmServiceteam input').attr('readonly', true);
		 $('#frmServiceteam input').attr('disabled', true);
		 $('#date').jqxDateTimeInput({ disabled: true});
		 $('#docno').attr('disabled', false);
		 $("#serviceteamGrid").jqxGrid('disabled',true);
	}
	function funRemoveReadOnly() {
		$('#frmServiceteam input').attr('readonly', false);
		$('#frmServiceteam input').attr('disabled', false);
		$('#docno').attr('readonly', true);
		$('#txtteamuserlinkname').attr('readonly', true);
		
		 $('#date').jqxDateTimeInput({ disabled: false}); 
		 $("#serviceteamGrid").jqxGrid('disabled',false);
		 if ($("#mode").val() == "A") {
			 $('#date').val(new Date());
		     $("#serviceteamGrid").jqxGrid('clear');
		     $("#serviceteamGrid").jqxGrid('addrow', null, {});
		   }
		 if($('#mode').val()=='E'){
         	
         	$("#serviceteamGrid").jqxGrid('addrow', null, {});
         }   
		 
	}
	
	function setValues() {
		document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
		funSetlabel();
		
		if(document.getElementById("ismultiemp").value==1)
    	{
			document.getElementById("ismemp").checked=true;
    		
    	}
		if(document.getElementById("ismultiemp").value==0)
    	{
			document.getElementById("ismemp").checked=false;
    		
    	}
		
		var docVal1 = document.getElementById("docno").value;
	  	
      	if(docVal1>0)
      		{
     	  
         $("#searviceteamdiv").load("serviceteamGrid.jsp?docno="+docVal1);
      		}
      	
		 if($('#msg').val()!=""){
			   $.messager.alert('Message',$('#msg').val());
			  }
	}

	 function funFocus()
	    {
	    	document.getElementById("txtgpcode").focus();
	    		
	    }
	    /* $(function(){
	        $('#frmVehicle').validate({
	                 rules: {
	                cmbauthority:"required"
	                 
	                 }, 
	        messages:{
	        	cmbauthority:" *"
	        }
	                 //alert("here");
	        });
	        }); */
	        
	     function funNotify(){
	        	
	        	if(document.getElementById("ismemp").checked==true)
            	{
            		document.getElementById("ismultiemp").value=1;
            	}
	        	if(document.getElementById("ismemp").checked==false)
            	{
            		document.getElementById("ismultiemp").value=0;
            	}
	        	
	        	var rows = $("#serviceteamGrid").jqxGrid('getrows');
	 		    $('#serteamgridlen').val(rows.length);
	 		  
	 		   for(var i=0 ; i < rows.length ; i++){
	 		
	 		    newTextBox = $(document.createElement("input"))
	 		       .attr("type", "dil")
	 		       .attr("id", "test"+i)
	 		       .attr("name", "test"+i)
	 		       .attr("hidden", "true"); 
	 		 
	 		    newTextBox.val(rows[i].empid+"::"+rows[i].teamuserlinkid+" :: ");
	 		    newTextBox.appendTo('form');
	 		    
	 		   }
	        	
	    		return 1;
	     }
	        
	  function fungridchange(){
		  $("#serviceteamGrid").jqxGrid('addrow', null, {});
	  }
	  
	  function funSearchLoad(){
			changeContent('masterSearch.jsp', $('#window'));
	  }

</script>
 </head>
<body onLoad="setValues();"> 
<div id="mainBG" class="homeContent" data-type="background"> 
    
    <form id="frmServiceteam" action="saveServiceteam" method="post" autocomplete="off">
        
        <jsp:include page="../../../../header.jsp" />
        <br/>
        
        <div class="modern-ui hidden-scrollbar">
            
            <div class="middle-panel">
                <span class="middle-panel-title">Service Team Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:100px;">Date</label>
                    <div style="width: 120px;">
                        <div id="date" name="date" value='<s:property value="date"/>'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:100px; margin-left:auto;">Doc No</label>
                    <input type="text" name="docno" id="docno" value='<s:property value="docno"/>' tabindex="-1" style="width:150px;">
                </div>

                <div class="field-row">
                    <label class="lbl-right" style="width:100px;"></label> 
                    <div style="display: flex; align-items: center; gap: 5px; width: 130px;">
                        <input type="checkbox" name="ismemp" id="ismemp" onchange="fungridchange()" style="margin:0;">
                        <label for="ismemp" style="font-weight: bold; color: #444; font-size: 12px; cursor: pointer; white-space: nowrap;">Multiple Employees</label>
                    </div>
                    
                    <label class="lbl-right" style="width:100px; margin-left:auto;">Team-User Link</label>
                    <div class="input-search-container" style="width: 150px;">
                        <input type="text" name="txtteamuserlinkname" id="txtteamuserlinkname" placeholder="Press F3 To Search" onKeyDown="getTeamUserLink(event);" value='<s:property value="txtteamuserlinkname"/>'>
                    </div>
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Group Code</label>
                    <input type="text" name="txtgpcode" id="txtgpcode" value='<s:property value="txtgpcode"/>' style="width: 120px;">
                </div>
                
                <div class="field-row" style="margin-bottom:0;">
                    <label class="lbl-right" style="width:100px;">Description</label>
                    <input type="text" id="txtdesc" name="txtdesc" value='<s:property value="txtdesc"/>' style="flex:1;">
                </div>
            </div>

            <div class="middle-panel" style="margin-bottom:0;">
                <span class="middle-panel-title">Service Team Records</span>
                <div id="searviceteamdiv" class="grid-container">
                    <jsp:include page="serviceteamGrid.jsp"></jsp:include>
                </div>  
            </div>

            <div style="display:none;">
                <input type="hidden" name="txtteamuserlinkid" id="txtteamuserlinkid" value='<s:property value="txtteamuserlinkid"/>'>
                <input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>'/>
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
                <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
                <input type="hidden" id="ismultiemp" name="ismultiemp" value='<s:property value="ismultiemp"/>'/>
                <input type="hidden" id="serteamgridlen" name="serteamgridlen" value='<s:property value="serteamgridlen"/>'/>
            </div>

            <div id="employeeDetailsWindow"><div></div></div>
            <div id="userDetailsWindow"><div></div></div>
            
        </div>
    </form>
</div>
</body>
</html>