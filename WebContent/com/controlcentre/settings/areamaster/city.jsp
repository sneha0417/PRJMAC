<%@page import="com.controlcentre.settings.areamaster.city.ClsCityDAO"%>
<%ClsCityDAO DAO= new ClsCityDAO();%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<jsp:include page="../../../../includes.jsp"></jsp:include>
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

.modern-ui .myButton:hover:not(:disabled) { 
    background: linear-gradient(135deg, #083a8a 0%, #1d4ed8 100%); 
}

/* Verified Disabled Button State */
.modern-ui .myButton:disabled,
button:disabled,
input[type="button"]:disabled,
input[type="submit"]:disabled {
    background: #e2e8f0 !important; 
    color: #94a3b8 !important;      
    border: 1px solid #cbd5e1 !important;
    cursor: not-allowed !important; 
    box-shadow: none !important;
    text-shadow: none !important;
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
    display: block; /* Forces strict bounds so jqxGrid doesn't infinitely resize */
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
<script type="text/javascript">
      $(document).ready(function () {          
    	  $("#date_city").jqxDateTimeInput({ width : '125px', height : '15px', formatString : "dd.MM.yyyy" });  
     
           var data= '<%=DAO.searchDetails() %>'; 
       	
              
          //var data;
               var num = 0; 
              var source =
              {
                  datatype: "json",
                  datafields: [
                            	{name : 'doc_no' , type: 'int' },
       						    {name : 'city_name', type: 'String'},
       						    {name : 'city_code', type: 'String'},
                            	{name : 'date', type: 'String'  },
                            	{name : 'region',type:'String'},
                            	{name : 'reg_id',type:'String'},
                            	{name : 'country',type:'String'},
                            	{name : 'cou1_id',type:'String'}
                   ],
                   localdata: data,
                  
                  
                  pager: function (pagenum, pagesize, oldpagenum) {
                      // callback called when a page or page size is changed.
                  }
              };
              
              var dataAdapter = new $.jqx.dataAdapter(source,
              		 {
                  		loadError: function (xhr, status, error) {
  	                    alert(error);    
  	                    }
  		            }		
              );
      


              $("#jqxCitySearch1").jqxGrid(
                      {
                      	width: '70%',
                          height: 350,
                          source: dataAdapter,
                          showfilterrow: true,
                          filterable: true,
                          selectionmode: 'multiplecellsextended',
                        //  pagermode: 'default',
                          sortable: true,
                          //pageable: true,
                          altrows:true,
                          //Add row method
                          columns: [
          					{ text: 'Doc No',filtertype: 'number', datafield: 'doc_no', width: '5%'},
          					{ text: 'Date',columntype: 'textbox',filtertype: 'input',datafield:'date',width: '15%'},         					
          					{ text: 'City',columntype: 'textbox', filtertype: 'input', datafield: 'city_name', width: '25%' },
          					{ text: 'City Code',columntype: 'textbox', filtertype: 'input', datafield: 'city_code', width: '15%' },
          					{ text: 'Country id', datafield: 'cou1_id' } ,
          					{ text: 'Country',columntype: 'textbox', filtertype: 'input', datafield: 'country', width: '20%' },
          					{ text: 'Region id', datafield: 'reg_id' } ,
          					{ text: 'Region',columntype: 'textbox', filtertype: 'input', datafield: 'region', width: '20%' } 

          	              ]
                      });

              $('#jqxCitySearch1').on('rowdoubleclick', function (event) 
              		{
  		            	var rowindex1=event.args.rowindex;
  		                document.getElementById("docno").value= $('#jqxCitySearch1').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
  		                document.getElementById("city").value = $("#jqxCitySearch1").jqxGrid('getcellvalue', rowindex1, "city_name");
		                document.getElementById("city_code").value = $("#jqxCitySearch1").jqxGrid('getcellvalue', rowindex1, "city_code");
		                document.getElementById("country").value = $("#jqxCitySearch1").jqxGrid('getcellvalue', rowindex1, "cou1_id");
  		                document.getElementById("region").value = $("#jqxCitySearch1").jqxGrid('getcellvalue', rowindex1, "reg_id");
  		              $('#frmCity select').attr('disabled', false);
  		    		$('#date_city').jqxDateTimeInput({disabled: false});
  		                $("#date_city").jqxDateTimeInput('val',$("#jqxCitySearch1").jqxGrid('getcellvalue', rowindex1, "date"));
  		               // $('#brandid').val($("#jqxModelSearch").jqxGrid('getcellvalue', rowindex1, "brandid")) ;
  		               // $('#brand').val($("#jqxCitySearch1").jqxGrid('getcellvalue', rowindex1, "brandid")) ;
  		              $('#frmCity select').attr('disabled', true);
  		    		$('#date_city').jqxDateTimeInput({disabled: true});
              		 }); 
              $("#jqxCitySearch1").jqxGrid('hidecolumn', 'reg_id'); 
              $("#jqxCitySearch1").jqxGrid('hidecolumn', 'cou1_id'); 
              //$("#jqxModelSearch").jqxGrid('hidecolumn', 'brandid'); 

          });
    
      function funSearchLoad(){
			changeContent('citySearch.jsp', $('#window')); 
		 }

	function funReset() {
		document.getElementById("frmCity").reset();
	}
	function funReadOnly() {
		$('#frmCity input').attr('readonly', true);
		$('#frmCity select').attr('disabled', true);
		$('#date_city').jqxDateTimeInput({disabled: true});
		/* $('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
		
	}
	function funRemoveReadOnly() {
		$('#frmCity input').attr('readonly', false);
		$('#frmCity select').attr('disabled', false);
		$('#date_city').jqxDateTimeInput({disabled: false});
		$('#docno').attr('readonly', true);
		
		if(document.getElementById("mode").value=='A'){
			$('#jqxCitySearch1').jqxGrid({ disabled: true});
		}
		

	}

	 function getRegion() {
		 
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					items = x.responseText;
					
					items = items.split('***');
					var brandItems = items[0].split(",");
					var brandidItems = items[1].split(",");
					var optionsbrand = '<option value="">--Select--</option>';
					for (var i = 0; i < brandItems.length; i++) {
						optionsbrand += '<option value="' + brandidItems[i] + '">'
								+ brandItems[i] + '</option>';
					}
					/* alert("ssss"+optionsbrand); */
					$("select#region").html(optionsbrand);
					$('#region').val($('#reg_id').val());
					} else {
				}
			}
			x.open("GET", "getRegion.jsp", true);
			x.send();
		} 
	 function getCountry() {
		 	var region=document.getElementById("region").value;
		 	//alert("==region"+region);
			var x = new XMLHttpRequest();
			x.onreadystatechange = function() {
				if (x.readyState == 4 && x.status == 200) {
					items = x.responseText;
					
					items = items.split('***');
					var brandItems = items[0].split(",");
					var brandidItems = items[1].split(",");
					var optionsbrand = '<option value="">--Select--</option>';
					for (var i = 0; i < brandItems.length; i++) {
						optionsbrand += '<option value="' + brandidItems[i] + '">'
								+ brandItems[i] + '</option>';
					}
					/* alert("ssss"+optionsbrand); */
					$("select#country").html(optionsbrand);
					$('#country').val($('#cou_id').val());
					} else {
				}
			}
			x.open("GET", "getCountry.jsp?region="+region, true);
			x.send();
		} 
	
	function funFocus(){
		document.getElementById("region").focus();
	}
	 $(function(){
	        $('#frmCity').validate({
	                 rules: {
	                	 region:{
	                	 required:true
		                 },
		                 country:{
		                	 required:true,		                	
		                 },
		                 city:{
		                	 required:true,
		                	 maxlength:45 
		                 }
		                 
		                 },
		                 messages: {
		                	 region:{
		                	  required:" *"
		                  },
		                  country:{
		                	  required:" *",
		                	  
		                  },
		                  city:{
		                	  required:" *",
		                	  maxlength:"max 65 chars" 
		                  }
	                 }
	        });});
	     function funNotify(){
	    	
	    		return 1;
		} 
	     
	function setValues() {
		//$('#brand').val($('#brandid').val());
if ($('#reg_id').val() != null) {
	//alert("ghcj");
			$('#region').val($('#reg_id').val());
}
if($('#msg').val()!=""){
	   $.messager.alert('Message',$('#msg').val());
	  }
document.getElementById("formdet").innerText=$('#formdetail').val()+" ("+$('#formdetailcode').val().trim()+")";
	}
</script>
</head>
<body onLoad="getRegion();getCountry();funReadOnly();setValues();">
<div id="mainBG" class="homeContent" data-type="background">
    <div class="modern-ui hidden-scrollbar">
        
        <form id="frmCity" action="saveCity" autocomplete="off">
            <script>
                window.parent.formName.value="State / Province";
                window.parent.formCode.value="PRO";
            </script>
            
            <jsp:include page="../../../../header.jsp" />
            
            <div class="middle-panel">
                <span class="middle-panel-title">State / Province Details</span>
                
                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Date</label>
                    <div style="width: 120px;">
                        <div id="date_city" name="date_city" value='<s:property value="date_city"/>'></div>
                    </div>
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Doc No</label>
                    <input type="text" name="docno" id="docno" value='<s:property value="docno"/>' readonly="readonly" tabindex="-1" style="width:120px;">
                </div>

                <div class="field-row">
                    <label class="lbl-right" style="width:80px;">Region</label>
                    <select name="region" id="region" onchange="getCountry();" style="width:200px;"></select>
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">Country</label>
                    <select name="country" id="country" style="width:200px;"></select>
                </div>
                
                <div class="field-row" style="margin-bottom:0;">
                    <label class="lbl-right" style="width:80px;">State</label>
                    <input type="text" name="city" id="city" value='<s:property value="city"/>' style="width:200px;">
                    
                    <label class="lbl-right" style="width:80px; margin-left:auto;">State Code</label>
                    <input type="text" name="city_code" id="city_code" value='<s:property value="city_code"/>' style="width:120px;">
                </div>
            </div>

            <div style="display:none;">
                <input type="text" id="cou_id" name="cou_id" value='<s:property value="cou_id"/>'>
                <input type="text" id="reg_id" name="reg_id" value='<s:property value="reg_id"/>'>
                <input type="hidden" id="mode" name="mode" value='<s:property value="mode"/>'/>
                <input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>'/>
                <input type="hidden" id="deleted" name="deleted" value='<s:property value="deleted"/>'/>
            </div>
        </form>

        <div class="middle-panel" style="margin-bottom:0;">
            <span class="middle-panel-title">State / Province Records</span>
            <div id="jqxCitySearch1" class="grid-container"></div>  
        </div>

        <%-- Commented Original Modal Logic --%>
        <%-- <div id="window">
            <div id="windowHeader" class="windowHead">
                <span> <img src="../../../../icons/search_new.png" alt="" style="margin-right: 15px" />Search</span>
            </div>
            <div id="windowContent" class="windowCont" style="overflow: hidden;">
                <jsp:include page="modelSearch.jsp"></jsp:include>
            </div>
        </div> --%>
        
    </div>
</div>
</body>
</html>