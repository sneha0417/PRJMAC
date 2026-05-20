<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>  
<%@page import="com.connection.*" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>  
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.project.execution.ServiceSale.ClsServiceSaleDAO"%>     
<%@page import="com.common.*"%>                   
<%  
    int rowno=request.getParameter("rowno")==null || request.getParameter("rowno")==""?0:Integer.parseInt(request.getParameter("rowno").toString());
	String date=request.getParameter("date")==null || request.getParameter("date")==""?"0":request.getParameter("date");     
    String remarks=request.getParameter("remarks")==null || request.getParameter("remarks")==""?"":request.getParameter("remarks");
    String podate=request.getParameter("podate")==null || request.getParameter("podate")==""?"0":request.getParameter("podate");
    String pono=request.getParameter("pono")==null || request.getParameter("pono")==""?"":request.getParameter("pono");
	String amount=request.getParameter("amount")==null || request.getParameter("amount")==""?"0":request.getParameter("amount");   
	String vocno=request.getParameter("vocno")==null || request.getParameter("vocno")==""?"0":request.getParameter("vocno");
	String brhid=request.getParameter("brhid")==null || request.getParameter("brhid")==""?"0":request.getParameter("brhid");
	String rntldocno=request.getParameter("docno")==null || request.getParameter("docno")==""?"0":request.getParameter("docno").trim().toString();
	String cldocno=request.getParameter("cldocno")==null || request.getParameter("cldocno")==""?"0":request.getParameter("cldocno").trim().toString();
	String userid=session.getAttribute("USERID").toString();                   
	ClsConnection objconn=new ClsConnection();    
	ClsCommon ClsCommon=new ClsCommon();
	Connection conn=null;
	int val=0,val1=0,tax=0; 
	String logdesc="",invacno="0",acno="0",servocno="0";          
	java.sql.Date sqldate=null;
	java.sql.Date sqlpodate=null;
	Double taxper=0.00,taxamount=0.00,total=0.00,nettotal=0.00;  
	try{
		conn=objconn.getMyConnection();
		conn.setAutoCommit(false);
		Statement stmt=conn.createStatement(); 
		ClsServiceSaleDAO DAO= new ClsServiceSaleDAO();     
		ArrayList<String> gridarray=new ArrayList<String>();
		if(!date.equalsIgnoreCase("0")){
			sqldate=ClsCommon.changeStringtoSqlDate(date);     
		}
		if(!podate.equalsIgnoreCase("0")){   
			sqlpodate=ClsCommon.changeStringtoSqlDate(podate);        
		}   
		String strcountdata="select coalesce(ac.tax,0) tax,ac.acno,(select acno from my_account where codeno='INVOICE ACCOUNT') invacno from my_acbook ac where ac.cldocno="+cldocno+"";        
		//System.out.println("strcountdata--->>>"+strcountdata);                                  
		ResultSet rs=stmt.executeQuery(strcountdata);                        
		while(rs.next()){           
				invacno=rs.getString("invacno"); 
				acno=rs.getString("acno");  
				tax=rs.getInt("tax");                 
		}
		total=Double.parseDouble(amount);         
		nettotal=ClsCommon.round(total,session);            
		gridarray.add(1+"::"+1+" :: "+remarks+" :: "+nettotal+" :: "+nettotal+" :: "+""+" :: "+nettotal+" :: "+0.0+" :: "+0.0+" :: "+nettotal+" :: "+""+" :: "+""+" :: "+""+" :: "+""+" :: "+invacno+" :: "+""+" :: ");
		//System.out.println("====gridarray===="+gridarray); 
		val=DAO.insert(sqldate,sqldate,"",vocno,"AR",acno,"","1","1","","",remarks,session,"A",nettotal,gridarray,"SRS",request,sqlpodate,pono,"",0,taxper);
		if(val>0){ 
			 servocno=request.getAttribute("vocno").toString(); 
			 if(rowno>0){         
				 String sql="update rl_rentald set invtrno='"+val+"' where rowno="+rowno+"";           
				 //System.out.println("====sql===="+sql);   
				 val=stmt.executeUpdate(sql);  
			 }else{
				 String sql="update rl_rental set invtrno='"+val+"' where doc_no="+rntldocno+"";           
				 //System.out.println("====sql===="+sql);   
				 val=stmt.executeUpdate(sql); 
			 }    
			 logdesc="Invoice generated - Rental Docno#"+rntldocno+" Rental Rowno#"+rowno;                                             
			 String sqllog="insert into gl_biblog(doc_no, brhId, dtype, edate, userId, userNo, activity, srno, ENTRY,description) values("+vocno+",'"+brhid+"','PIV',now(),'"+session.getAttribute("USERID")+"',0,0,0,'E','"+logdesc+"')";                       
			 //System.out.println(val+"====sqllog===="+sqllog);
			 stmt.executeUpdate(sqllog);               
			 val1=1;                      
			 conn.commit(); 
		 }
	}
	catch(Exception e){
		e.printStackTrace();
	}
	finally{
		conn.close();
	}   
	response.getWriter().print(val1+"###"+servocno);                              
%>