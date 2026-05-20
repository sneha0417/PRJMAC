<%@page import="com.dashboard.marketing.amcmanagement.ClsAmcManagementDAO"%>   
<%
ClsAmcManagementDAO sd=new ClsAmcManagementDAO();      
%> 
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%@page import="javax.servlet.http.HttpSession" %>   
   
 <%
     String id=request.getParameter("id")==null?"":request.getParameter("id").toString();
     String divname=request.getParameter("divname")==null?"":request.getParameter("divname").toString();
     String brhid=request.getParameter("brhid")==null?"":request.getParameter("brhid").toString();  
 %>        
<script type="text/javascript">    
var data;
data='<%=sd.projectData(session,id,divname,brhid) %>';                                 
$(document).ready(function(){           
    
    var source =
    {             
            datatype: "json",
            datafields: [ 
                        {name : 'docno',type:'string'},
                        {name : 'vocno' , type: 'string'},
 						{name : 'refname', type: 'string'},
 						{name : 'date', type:'date'},             
 						{name : 'sal_name', type: 'string'},
 						{name : 'brhid', type: 'String' },
 						{name : 'cldocno', type: 'String' },
 						{name : 'branch', type: 'String' },
 						{name : 'site', type: 'String'},
 						{name : 'contractval', type: 'number' }, 
 						
 						{name : 'dtype', type: 'String'  },
 						{name : 'refdocno', type: 'number'  },
 						{name : 'tr_no', type: 'String' },
 						{name : 'asgngrp', type: 'String' },
 						{name : 'teampid', type: 'String' },
 						{name : 'grpid', type: 'String' },
 						{name : 'emp', type: 'String' },
 						{name : 'empid', type: 'String' },
 						{name : 'asgnmode', type: 'String' },
 						{name : 'asignid', type: 'String' },  
 						
 						{name : 'sitez', type: 'String' },  
 						{name : 'budget', type: 'String' },  
 						
 						{name : 'srtrno', type: 'String' },
 						{name : 'srdocno', type: 'String' },
 						{name : 'sheduleno', type: 'String' },
 						{name : 'serdocno', type: 'String' },
 						{name : 'areaid', type: 'String' },	
 						{name : 'siteid', type: 'String' },	
 						{name : 'reftrno', type: 'String' },	
 						{name : 'acno', type: 'String' }, 
 						{name : 'workper', type: 'String' },   
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



        $("#jqxEnquiryGrid").jqxGrid(
                {
                	width: '100%',
                    height: 430,
                    source: dataAdapter,
                    showfilterrow: true,
                    filterable: true,
                    selectionmode: 'singlerow',
                  	editable:false,
                    altrows:true,
                    sortable: true,
                     columnsresize: true,
                    //Add row method
                    columns: [  
							{ text: 'Sr. No.',datafield: '',columntype:'number', width: '4%',cellsrenderer: function (row, column, value) {
							    return "<center><div style='margin:4px;'>" + (value + 1) + "</div></center>";
							}   }, 
							{ text: 'DOCNO',datafield: 'docno', width: '6%',hidden:true},
							{ text: 'Doc No',datafield: 'vocno', width: '6%'},
							{ text: 'Date',datafield: 'date', width: '5%',cellsformat:'dd.MM.yyyy'},     
	    					{ text: 'Branch',datafield: 'branch', width: '12%'},   
							{ text: 'Client', datafield: 'refname'}, 
							{ text: 'Salesman', datafield: 'sal_name', width: '14%'}, 
							{ text: 'brhid', datafield: 'brhid',width: '10%', hidden: true },  
							{ text: 'cldocno', datafield: 'cldocno',width: '10%', hidden: true },
							{ text: 'Site', datafield: 'site',width: '17%'},  
							{ text: 'Contract Value', datafield: 'contractval', width: '6%',cellsalign:'right',align:'right',cellsformat:'d2'},    
							
							{ text: 'ASSIGN.GROUP', datafield: 'asgngrp', width: '8%', hidden: true },
							{ text: 'EMPLOYEE', datafield: 'emp', width: '8%', hidden: true },
							{ text: 'ASSIGN.MODE', datafield: 'asgnmode', width: '8%', hidden: true },   
							{ text: 'teampid', datafield: 'teampid', hidden: true },
							{ text: 'grpid', datafield: 'grpid', hidden: true },
							{ text: 'empid', datafield: 'empid', hidden: true },
							{ text: 'asignid', datafield: 'asignid', hidden: true },
							{ text: 'tr_no', datafield: 'tr_no', hidden: true },
							{ text: 'dtype', datafield: 'dtype', hidden: true },
							{ text: 'refdocno', datafield: 'refdocno', hidden: true },
							
							{ text: 'sitez', datafield: 'sitez', hidden: true }, 
							{ text: 'budget', datafield: 'budget', hidden: true }, 
							
							{ text: 'srtrno', datafield: 'srtrno', hidden: true }, 					
							{ text: 'srdocno', datafield: 'srdocno', hidden: true }, 
							{ text: 'sheduleno', datafield: 'sheduleno', hidden: true }, 
							{ text: 'serdocno', datafield: 'serdocno', hidden: true }, 
							{ text: 'areaid', datafield: 'areaid', hidden: true }, 
							{ text: 'siteid', datafield: 'siteid', hidden: true }, 
							{ text: 'reftrno', datafield: 'reftrno', hidden: true }, 
							{ text: 'acno', datafield: 'acno', hidden: true },    
							{ text: 'workper', datafield: 'workper', hidden: true },  
					   ]                                                  
                });  
                $("#overlay, #PleaseWait").hide();
                $('#jqxEnquiryGrid').on('rowdoubleclick', function (event) {       
	                   var rowindex = event.args.rowindex;
	                         
	                   document.getElementById("brhid").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "brhid"); 
	                   document.getElementById("jobvocno").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "vocno");   
	                   document.getElementById("jobdocno").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "docno");
	                   
	                   document.getElementById("srno").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "tr_no");
	                   document.getElementById("dtype").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "dtype");
	                   document.getElementById("trno").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "refdocno");  
	                   document.getElementById("cldocno").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "cldocno");  
	                   
	                   document.getElementById("jqxgrpsearch").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "asgngrp");
             	       document.getElementById("hidgroupid").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "grpid");
             	       
	                   document.getElementById("jqxassignsearch").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "asgnmode");
		               document.getElementById("hidassignid").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "asignid");
		               inputload();     
             	       document.getElementById("tempassignname").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "emp");
		               document.getElementById("hidgrpmemberid").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "teampid");
		               document.getElementById("hidgrpempid").value=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "empid");
		               
		               document.getElementById("site").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "sitez"); 
		               document.getElementById("budget").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "budget");   
		               var costtype=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "dtype");
		               var costcode=$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "refdocno"); 	   
		               getManPowerConsumed(costtype,costcode);   
		               
		               document.getElementById("srtrno").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "srtrno");  												
		               document.getElementById("srdocno").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "srdocno");  											
		               document.getElementById("sheduleno").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "sheduleno");  												
		               document.getElementById("serdocno").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "serdocno");  						
		               document.getElementById("areaid").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "areaid");  												
		               document.getElementById("siteid").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "siteid");  												
		               document.getElementById("reftrno").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "reftrno");  												
		               document.getElementById("acno").value = $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "acno");    
		               
		               var srdocno= $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "srdocno");
		               var workper= $('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "workper");  
		           	   
		               if(srdocno>0){
		                	document.getElementById("txtper").value=workper;
	                   }else{
			                document.getElementById("txtper").value="";
            	       }
		               
            	       if(workper!=0) {
    				 		$('#btnserviceattach').attr("disabled",false);
        	    	   }else{
    				 		$('#btnserviceattach').attr("disabled",true);  
        	     	   }   
            	       
            	       if(workper==100){
	            	    	 $('#txtper').attr("readonly",true);
	            	    	 $('#btnserviceupdate').attr("disabled",true);  
	        				 $('#btnserviceconfirm').attr("disabled",false);    
            	    	 }else{
	            	    	 $('#txtper').attr("readonly",false);
	            	    	 $('#btnserviceupdate').attr("disabled",false);
	        				 $('#btnserviceconfirm').attr("disabled",true);  
            	       }  
            	          
	                   $('.textpanel p').text('Doc No '+$('#jqxEnquiryGrid').jqxGrid('getcellvalue',rowindex,'vocno')+' - '+$('#jqxEnquiryGrid').jqxGrid('getcellvalue', rowindex, "refname"));
	                   $('.comments-container').html('');     
                });       
	});     
</script>
<div id="jqxEnquiryGrid"></div>  