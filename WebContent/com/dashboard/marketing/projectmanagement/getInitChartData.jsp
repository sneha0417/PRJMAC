<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.common.ClsCommon"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.connection.*"%>
<%@page import="java.sql.*"%>

<%
	JSONObject data=new JSONObject();
	JSONObject enqdetails=new JSONObject();
	ClsConnection objconn=new ClsConnection();
	ClsCommon objcommon=new ClsCommon();
	JSONObject objdata=new JSONObject();  
	Connection conn=null;
	try{
		conn=objconn.getMyConnection();
		Statement stmt=conn.createStatement();  
		String strenq="select (select count(*) val from (select m.tr_no from cm_srvcontrm m inner join cm_servplan p on(m.tr_no=p.doc_no and m.dtype=p.dtype) left join cm_srvdetm dm on dm.schrefdocno=p.tr_no where m.dtype='SJOB' and m.status=3 and m.jbaction in (0,4) and m.pstatus!=1 and dm.confirm=0 and p.empid is null group by m.tr_no)a) notassigned,(select count(*) val from (select m.tr_no from cm_srvcontrm m inner join cm_servplan p on(m.tr_no=p.doc_no and m.dtype=p.dtype) left join cm_srvdetm dm on dm.schrefdocno=p.tr_no where m.dtype='SJOB' and m.status=3 and m.jbaction in (0,4) and m.pstatus!=1 and dm.confirm=0 and p.empid is not null group by m.tr_no)a) assigned,(select count(*) val from (select m.tr_no from cm_srvcontrm m inner join cm_servplan p on(m.tr_no=p.doc_no and m.dtype=p.dtype) left join cm_srvdetm dm on dm.schrefdocno=p.tr_no where m.dtype='SJOB' and m.status=3 and m.jbaction in (0,4) and m.pstatus!=1 and dm.confirm=0 and p.workper>0 group by m.tr_no)a) workstarted,(select count(*) val from (select m.tr_no from cm_srvcontrm m inner join cm_servplan p on(m.tr_no=p.doc_no and m.dtype=p.dtype) left join cm_srvdetm dm on dm.schrefdocno=p.tr_no where m.dtype='SJOB' and m.status=3 and m.jbaction in (0,4) and m.pstatus!=1 and dm.confirm=0 group by m.tr_no)a) pndcnfrd";
		System.out.println(strenq);        
			String notassignedcount="0",assignedcount="0",workstartedcount="0",pndcnfrdcount="0";      
			ResultSet rsenq=stmt.executeQuery(strenq);
			while(rsenq.next()){
				notassignedcount=rsenq.getString("notassigned");  
				assignedcount=rsenq.getString("assigned");
				workstartedcount=rsenq.getString("workstarted");
				pndcnfrdcount=rsenq.getString("pndcnfrd");  
			}
			objdata.put("notassignedcount",notassignedcount);
			objdata.put("assignedcount",assignedcount);
			objdata.put("workstartedcount",workstartedcount);
			objdata.put("pndcnfrdcount",pndcnfrdcount);       
	}
	catch(Exception e){
		e.printStackTrace();
		conn.close();
	}
	finally{
		conn.close();
	}
	
	//System.out.println(enqdetails);  
	response.getWriter().print(objdata);           
%>