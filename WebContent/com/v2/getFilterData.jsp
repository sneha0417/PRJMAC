<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="com.dashboard.ClsDashBoardNewDAO"%>
<%@page import="com.connection.*"%>
<%@page import="com.common.*"%>
<%@page import="java.sql.*"%>
<%
Connection conn=null;
String widgetname=request.getParameter("widgetname")==null?"":request.getParameter("widgetname");
JSONObject objdata=new JSONObject();
try{
	ClsConnection objconn=new ClsConnection();
	ClsCommon objcommon=new ClsCommon();
	//ClsDashBoardNewDAO dao=new ClsDashBoardNewDAO();
	conn=objconn.getMyConnection();
	Statement stmt=conn.createStatement();
	String strsql="",sqltest="",strjoin="",sqlselect="";
	System.out.println(widgetname);      
	if(widgetname.equalsIgnoreCase("enqsch")){
		sqltest=" and m.enqstatus=0 and m.sh_empid=0 ";  
		sqlselect="coalesce(round(datediff(curdate(),m.date),0),0) days";   
	}else if(widgetname.equalsIgnoreCase("schenq")){
		sqltest=" and m.enqstatus=0 and m.sh_empid!=0 ";
		sqlselect="coalesce(round(datediff(curdate(),m.date),0),0) days";   
	}else if(widgetname.equalsIgnoreCase("sur")){
		sqltest=" and m.enqstatus=1 ";
		strjoin=" left join cm_surveym sm on (sm.refDocNo=m.doc_no and sm.ref_type='enq') left join gl_beqs bs on (bs.rdocno=m.doc_no and bs.process='sur') ";    
		sqlselect="if(sm.entrydate is null and bs.entrydate is null,coalesce(round(datediff(curdate(),m.date),0),0),coalesce(if(sm.entrydate is null,round(datediff(curdate(),bs.entrydate),0),round(datediff(curdate(),sm.entrydate),0)),0)) days";                 
	}else if(widgetname.equalsIgnoreCase("est")){
		sqltest=" and m.enqstatus=2 ";
		strjoin=" left join cm_prjestm pm on (pm.reftrno=m.doc_no and pm.ref_type='enq') ";
		sqlselect="coalesce(round(datediff(curdate(),pm.entrydate),0),0) days";      
	}else if(widgetname.equalsIgnoreCase("quot")){
		sqltest=" and m.enqstatus=3 ";   
		strjoin=" left join cm_srvqotm qm on (qm.refDocNo=m.doc_no and qm.ref_type='enq') ";
		sqlselect="coalesce(round(datediff(curdate(),qm.entrydate),0),0) days";    
	}else if(widgetname.equalsIgnoreCase("totalenq")){      
		sqltest=" and m.enqstatus<=3 ";
		sqlselect="coalesce(round(datediff(curdate(),m.date),0),0) days";
	}else{}  
	
	if(!sqltest.equalsIgnoreCase("")){                 
		String strenqlist="select @i:=@i+1 as slno,a.* from(select m.voc_no enqno,date_format(m.date,'%d-%m-%Y') date,ac.refname client,"+sqlselect+" from gl_enqm m left join my_acbook ac on (ac.cldocno=m.cldocno and ac.dtype='crm') "+strjoin+" where m.status=3 "+sqltest+" group by m.doc_no)a,(select @i:=0) r;";
		System.out.println(strenqlist);   
		JSONArray enqlistarray=new JSONArray();     
		ResultSet rsenqlist=stmt.executeQuery(strenqlist);
		while(rsenqlist.next()){
			JSONObject objtemp=new JSONObject();  
			objtemp.put("srno",rsenqlist.getString("slno"));
			objtemp.put("enqno",rsenqlist.getString("enqno"));
			objtemp.put("date",rsenqlist.getString("date"));
			objtemp.put("client",rsenqlist.getString("client"));
			objtemp.put("days",rsenqlist.getString("days"));   
			enqlistarray.add(objtemp);    
		}
		objdata.put("enqlistdata",enqlistarray);        
	}
	
}
catch(Exception e){
	e.printStackTrace();
}
finally{
	conn.close();
}
//System.out.println(objdata);
response.getWriter().write(objdata+"");
%>