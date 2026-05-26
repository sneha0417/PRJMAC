<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GatewayERP(i)</title>
<%@page import="com.controlcentre.settings.productsettings.productmaster.ClsProductMasterDAO"%>
<%ClsProductMasterDAO DAO= new ClsProductMasterDAO(); %>
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

#frmsubCategory input[type="text"],
#frmsubCategory select { 
    height: 24px !important; 
    border: 1px solid #b8c6d8; 
    border-radius: 3px; 
    padding: 2px 6px;
    font-size: 12px;
    font-family: Arial, sans-serif;
    box-sizing: border-box; 
    background-color: #fff; 
    color: #333;
    width: 100%;
}

#frmsubCategory input[type="text"]:focus,
#frmsubCategory select:focus { 
    border-color: #007bff; 
    outline: none;
}

#frmsubCategory input[readonly],
#frmsubCategory input:disabled,
#frmsubCategory select:disabled { 
    background-color: #f8f9fa; 
    color: #6b7280;
}

fieldset {
    border: 1px solid #c5d3e0; 
    padding: 10px 10px 5px 10px; 
    background: #ffffff; 
    position: relative; 
    border-radius: 4px; 
    margin-bottom: 15px;
    margin-top: 12px;
}

legend {
    background: #ffffff; 
    padding: 0 8px; 
    color: #0056b3;
    font-weight: bold; 
    font-size: 14px; 
    font-family: Arial, sans-serif;
    border-left: 3px solid #0056b3;
    line-height: normal; 
    margin-left: -2px; 
}

#frmsubCategory table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 8px; 
}

#frmsubCategory td {
    padding: 0 5px;
    vertical-align: middle;
    font-family: Arial, sans-serif; 
    font-size: 12px; 
    color: #333;
}

#frmsubCategory div[align="right"] {
    text-align: right; 
    color: #444;
    font-size: 12px; 
    font-weight: bold;
    white-space: nowrap; 
    padding-right: 10px;
}

form label.error {
    color: red;
    font-weight: bold;
    font-size: 11px;
    font-family: Arial, sans-serif;
}

#jqxCategory {
    border: 1px solid #c5d3e0;
    border-radius: 4px;
    overflow: hidden;
}

form label.error {
color:red;
  font-weight:bold;

}
</style>
<script type="text/javascript">
      $(document).ready(function () { 
    	  $('#btnSearch').attr('disabled', true);
    	  $("#date").jqxDateTimeInput({ width : '125px', height : '15px', formatString : "dd.MM.yyyy" });  
     
    	    document.getElementById("formdet").innerText="SubCategory(SCAT)";
			document.getElementById("formdetail").value="SubCateGory";
			document.getElementById("formdetailcode").value="SCAT";
			window.parent.formCode.value="SCAT";
			window.parent.formName.value="SubCateGory";
          var data= '<%=DAO.prdsubcategoryLoad(session) %>';
              
              var num = 0; 
              var source =
              {
                  datatype: "json",
                  datafields: [
                            	{name : 'doc_no' , type: 'int' },
       						{name : 'subcategory', type: 'String'  },
                            	{name : 'date', type: 'date'  },
                            	{name : 'category',type:'String'},
                            	{name : 'catid',type:'String'}
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
      


              $("#jqxCategory").jqxGrid(
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
          					{ text: 'Doc No',filtertype: 'number', datafield: 'doc_no', width: '15%' },
          					/* { text: 'Brand ID',columntype: 'textbox', filtertype: 'input', datafield: 'brandid', width: '30%' }, */
          					{ text: 'Sub Cateogry',columntype: 'textbox', filtertype: 'input', datafield: 'subcategory', width: '30%' },
          					{ text: 'Date',columntype: 'textbox',filtertype: 'input',datafield:'date',width: '15%',cellsformat:'dd.MM.yyyy'},
          					{ text: 'Category',columntype: 'textbox', filtertype: 'input', datafield: 'category', width: '40%' },

          	              ]
                      });

              $('#jqxCategory').on('rowdoubleclick', function (event) 
              		{
  		            	var rowindex1=event.args.rowindex;
  		                document.getElementById("docno").value= $('#jqxCategory').jqxGrid('getcellvalue', rowindex1, "doc_no"); 
  		                document.getElementById("subcat").value = $("#jqxCategory").jqxGrid('getcellvalue', rowindex1, "subcategory");
  		              $('#frmsubCategory select').attr('disabled', false);
  		    		$('#date').jqxDateTimeInput({disabled: false});
  		                $("#date").jqxDateTimeInput('val',$("#jqxCategory").jqxGrid('getcellvalue', rowindex1, "date"));
  		               // $('#brandid').val($("#jqxModelSearch").jqxGrid('getcellvalue', rowindex1, "brandid")) ;
  		                $('#category').val($("#jqxCategory").jqxGrid('getcellvalue', rowindex1, "catid")) ;
  		              $('#frmsubCategory select').attr('disabled', true);
  		    		$('#date').jqxDateTimeInput({disabled: true});
              		 }); 
              $("#jqxCategory").jqxGrid('hidecolumn', 'brandid'); 
              //$("#jqxModelSearch").jqxGrid('hidecolumn', 'brandid'); 

          });
    
      function funSearchLoad(){
			changeContent('modelSearch.jsp', $('#window')); 
		 }

	function funReadOnly() {
		$('#frmsubCategory input').attr('readonly', true);
		$('#frmsubCategory select').attr('disabled', true);
		$('#date').jqxDateTimeInput({disabled: true});
		/* $('#jqxDateTimeInput').jqxDateTimeInput({ disabled: true}); */
		
	}
	function funRemoveReadOnly() {
		$('#frmsubCategory input').attr('readonly', false);
		$('#frmsubCategory select').attr('disabled', false);
		$('#date').jqxDateTimeInput({disabled: false});
		$('#docno').attr('readonly', true);
		

	}

	function getCategory() {
		var x = new XMLHttpRequest();
		x.onreadystatechange = function() {
			if (x.readyState == 4 && x.status == 200) {
				items = x.responseText;
				items = items.split('####');
				var brandItems = items[0].split(",");
				var brandidItems = items[1].split(",");
				var optionsbrand = '<option value="">--Select--</option>';
				for (var i = 0; i < brandItems.length; i++) {
					optionsbrand += '<option value="' + brandidItems[i] + '">'
							+ brandItems[i] + '</option>';
				}
				$("select#category").html(optionsbrand);
				if ($('#hidtest').val() != null) {
	  					$('#category').val($('#hidtest').val());
	  				}
				
				} else {
			}
		}
		x.open("GET", "getCategory.jsp", true);
		x.send();
	}
	
	function funFocus(){
		document.getElementById("subcat").focus();
	}
	 $(function(){
	        $('#frmsubCategory').validate({
	                 rules: {
	                 brand:{
	                	 required:true
	                 },
	                 model:{
	                	 required:true,
	                	 maxlength:20
	                 }
	                 },
	                 messages: {
	                  brand:{
	                	  required:" *"
	                  },
	                  model:{
	                	  required:" *",
	                	  maxlength:"max 20 chars"
	                  }
	                 }
	        });});
	     function funNotify(){
	    	
	    		return 1;
		} 
	     
	function setValues() {
	
	
		//$('#brand').val($('#brandid').val());
if ($('#brandid').val() != null) {
	//alert("ghcj");
			$('#category').val($('#catid').val());
}
if($('#msg').val()!=""){
	   $.messager.alert('Message',$('#msg').val());
	  }
	}
</script>
</head>
<body onload="getCategory();setValues();">
<div id="mainBG" class="homeContent" data-type="background">
<form id="frmsubCategory" action="savepscmAction"  autocomplete="off">
<jsp:include page="../../../../header.jsp" /><br/> 
<fieldset><legend>Sub Category Details</legend>
<input type="text" id="catid" name="catid" value='<s:property value="catid"/>' hidden="true">
<table width="100%">
<tr>
  <td width="6%"><div align="right">Date</div></td>
  <td width="21%"><div id="date" name="date" value='<s:property value="date"/>'></div></td>
  <td width="6%"><div align="right">Doc No</div></td>
  <td width="51%"><input type="text" name="docno" style="width:40%;" value='<s:property value="docno"/>' id="docno" readonly="readonly"  tabindex="-1"></td>
</tr>
<tr><td><div align="right">Category</div></td>
<td> 
<!-- <option value="">--Select--</option> -->
 <select name="category" id="category" style="width:60%;">
</select></td>
<td><div align="right">Sub Category</div></td><td><input type="text" name="subcat" id="subcat" value='<s:property value="subcat"/>'></td></tr>
<td><input type="hidden" name="mode" id="mode" value='<s:property value="mode"/>' /> 
<input type="hidden" name="deleted" id="deleted" value='<s:property value="deleted"/>' />
<input type="hidden" id="msg" name="msg" value='<s:property value="msg"/>' />
<input type="hidden" id="hidtest" name="hidtest" value='<s:property value="hidtest"/>' /></td></table> 
</fieldset>										        
</form>
<br/>
<div id="jqxCategory"></div>
<%-- <div id="window">
	<div id="windowHeader" class="windowHead">
		<span> <img src="../../../../icons/search_new.png" alt="" style="margin-right: 15px" />Search</span>
	</div>
	<div id="windowContent" class="windowCont" style="overflow: hidden;">
		<jsp:include page="modelSearch.jsp"></jsp:include>
	</div></div> --%>
	
</div>
</body>
</html>