package com.dashboard.marketing.projectmanagement;
        
import com.common.ClsCommon;
import com.connection.ClsConnection;

import java.sql.*;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
public class ClsProjectManagementDAO {  

	ClsConnection objconn=new ClsConnection();     
	ClsCommon objcommon=new ClsCommon();
	
		 
	public JSONArray presalesData(HttpSession session,String id,String widgetname,String brhid) throws SQLException{    
		JSONArray data=new JSONArray();                      
		Connection conn=null; 
		 java.sql.Date edates = null;     
		 if(!id.equalsIgnoreCase("1")){        
			 return data;
		 } 
		try{
			conn=objconn.getMyConnection();  
			Statement stmt=conn.createStatement();
			String sqltest="",strjoin="",sqlselect="";   
			           
	           
			/*	if(widgetname.equalsIgnoreCase("enqsch")){
					sqltest=" and m.enqstatus=0 and m.sh_empid=0 ";  
					sqlselect=",coalesce(round(datediff(curdate(),m.date),0),0) age";   
				}else if(widgetname.equalsIgnoreCase("schenq")){
					sqltest=" and m.enqstatus=0 and m.sh_empid!=0 ";
					sqlselect=",coalesce(round(datediff(curdate(),m.date),0),0) age";   
				}else if(widgetname.equalsIgnoreCase("sur")){
					sqltest=" and m.enqstatus=1 ";
					sqlselect=",if(sm.entrydate is null and bs.entrydate is null,coalesce(round(datediff(curdate(),m.date),0),0),coalesce(if(sm.entrydate is null,round(datediff(curdate(),bs.entrydate),0),round(datediff(curdate(),sm.entrydate),0)),0)) age";                 
				}else if(widgetname.equalsIgnoreCase("est")){  
					sqltest=" and m.enqstatus=2 ";
					//strjoin=" left join cm_prjestm pm on (pm.reftrno=m.doc_no and pm.ref_type='enq') ";
					sqlselect=",coalesce(round(datediff(curdate(),pm.entrydate),0),0) age";      
				}else if(widgetname.equalsIgnoreCase("quot")){
					sqltest=" and m.enqstatus=3 ";   
					//strjoin=" left join cm_srvqotm qm on (qm.refDocNo=m.doc_no and qm.ref_type='enq') ";  
					sqlselect=",coalesce(round(datediff(curdate(),qm.entrydate),0),0) age";    
				}else if(widgetname.equalsIgnoreCase("totalenq")){      
					sqltest=" and m.enqstatus<=3 ";
					sqlselect=",coalesce(round(datediff(curdate(),m.date),0),0) age";
				}else{}  */  
				
				if(!brhid.equalsIgnoreCase("") && !brhid.equalsIgnoreCase("a")){        
					sqltest+=" and m.brhid='"+brhid+"'";        
				}
				
				/*String sql1="select e.doc_no from my_salm  e where e.status=3 and  salesuserlink='"+session.getAttribute("USERID")+"'";
				//System.out.println("--------underwriter----------"+sql1);
				String salesuser="";
				ResultSet resultSet1 = stmt.executeQuery(sql1) ;
				if(resultSet1.next()){
					salesuser=" and m.sal_id='"+resultSet1.getString("doc_no")+"'";      
				} */
				
				String strsql="select m.brhid,round(p.workper,2) workper,dm.tr_no srtrno,dm.doc_no srdocno,p.tr_no sheduleno,ser.doc_no as serdocno,ss.areaid,p.siteid,p.reftrno,ac.acno,ss.site sitez,round(m.budget,2) budget,case when m.invprog=1 then 'PROGRESSIVE' when m.invprog=2 then 'PROGRESSIVE WITH RETENTION' else '' end as  terms,date_format(d.duedate,'%d.%m.%Y') duedate, round(d.amount,2) amount,d.description paydesc,d.terms payterms,if(d.terms='SERVICE',d.dueafser,0) payservice,b.branchname branch,s.site,m.tr_no docno,m.doc_no vocno,m.date,m.cldocno,round(contractval,2) as contractval,ac.refname,sm.sal_name,p.refdocno,p.tr_no,p.dtype,coalesce(gr.groupname,'') asgnmode,gr.doc_no as asignid,mm.doc_no grpid,coalesce(em.name,'') as emp,md.empid,md.doc_no as teampid,coalesce(grpcode,'') as asgngrp from  cm_srvcontrm m left join cm_srvcontrpd d on d.tr_no=m.tr_no left join my_acbook ac on(ac.doc_no=m.cldocno and ac.dtype='CRM') left join my_salm sm on(sm.doc_no=m.sal_id) left join (select group_concat(site) site,tr_no from cm_srvcsited group by tr_no) s on s.tr_no=m.tr_no left join my_brch b on b.doc_no=m.brhid  inner join cm_servplan p on(m.tr_no=p.doc_no and m.dtype=p.dtype) left join my_groupvals gr on(gr.doc_no=p.asgnmode and gr.grptype='assignmode') left join cm_serteamm mm on(p.empgroupid=mm.doc_no) left join cm_serteamd md on(md.rdocno=mm.doc_no and p.empid=md.empid) left join hr_empm em on(md.empid=em.doc_no) left join cm_srvcsited ss on(p.siteid=ss.rowno)  left join my_groupvals ser on(p.servid=ser.doc_no and ser.grptype='service') left join cm_srvdetm dm on dm.schrefdocno=p.tr_no  where m.dtype='SJOB' and m.status=3 and m.jbaction in (0,4)  and m.pstatus!=1 and dm.confirm=0 "+sqltest+" group by m.tr_no";
				System.out.println("strsql--->>>"+strsql);                                                                                 
				ResultSet rs=stmt.executeQuery(strsql);    
				data=objcommon.convertToJSON(rs);  
		}   
		catch(Exception e){  
			e.printStackTrace();
		}
		finally{
			conn.close();  
		}
		return data;
	}
	
	public JSONArray assignmode(HttpSession session) throws SQLException{
		JSONArray RESULTDATA1=new JSONArray();
		Connection conn=null;
		try {
			conn = objconn.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql = "";

			sql="select groupname assign,codeno,doc_no docno from my_groupvals where grptype='assignmode' and status=3";
//			System.out.println("===getassign===="+sql);
			ResultSet resultSet1 = stmt.executeQuery(sql);
			RESULTDATA1=objcommon.convertToJSON(resultSet1);

		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return RESULTDATA1;
	}
	
	public JSONArray assignfrm(HttpSession session) throws SQLException{
		JSONArray RESULTDATA1=new JSONArray();
		Connection conn=null;
		try {
			conn = objconn.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql = "";

			sql="select grpcode,doc_no  from cm_serteamm where status=3";
//			System.out.println("===sql===="+sql);
			ResultSet resultSet1 = stmt.executeQuery(sql);
			RESULTDATA1=objcommon.convertToJSON(resultSet1);

		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return RESULTDATA1;
	}
	
	public JSONArray assignteam(HttpSession session,String assignid) throws SQLException{  
		JSONArray RESULTDATA1=new JSONArray();
		Connection conn=null;
		try {
			conn = objconn.getMyConnection();  
			Statement stmt = conn.createStatement();

			String sql = "";

			sql="select s.doc_no,s.rdocno,name,grpcode,s.empid from cm_serteamd s left join hr_empm e on(s.empid=e.doc_no) "
					+ "left join cm_serteamm m on(m.doc_no=s.rdocno) where m.status=3 and m.doc_no='"+assignid+"'";
			System.out.println("===sql===="+sql);
			ResultSet resultSet1 = stmt.executeQuery(sql);
			RESULTDATA1=objcommon.convertToJSON(resultSet1);

		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return RESULTDATA1;
	}
	
	public JSONArray userSearch(HttpSession session) throws SQLException{
		JSONArray RESULTDATA1=new JSONArray();
		Connection conn=null;
		try {
			conn = objconn.getMyConnection();
			Statement stmt = conn.createStatement();

			String sql = "";

			sql="select doc_no docno,user_name username from my_user where status=3 and block=0";

//			System.out.println("===getassign===="+sql);

			ResultSet resultSet1 = stmt.executeQuery(sql);
			RESULTDATA1=objcommon.convertToJSON(resultSet1);   

		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			conn.close();
		}
		return RESULTDATA1;
	}
	
	public  JSONArray subGridData(String id,String jobdocno) throws SQLException {
		JSONArray RESULTDATA=new JSONArray();
		if(!id.equalsIgnoreCase("1")){
			return RESULTDATA;
		}
		Connection conn = null;
		Statement stmt =null;
		ResultSet resultSet=null;
		String sqltest="";
		try {
			conn = objconn.getMyConnection();
			stmt = conn.createStatement ();
				
			String sqldata="select a.doc_no,cast(budget as decimal(15,2)) budget,name  from(select rdocno doc_no,round(budget,2) budget,cm.name from cm_subdivm m left join cm_subdivision cm on cm.doc_no=m.rdocno and cm.status=3 where m.jobdocno="+jobdocno+" union all select doc_no,'' budget,name from cm_subdivision  where status=3)a group by a.doc_no";   
			//System.out.println("******++******"+sqldata);
				resultSet= stmt.executeQuery (sqldata);
			    RESULTDATA=objcommon.convertToJSON(resultSet);  

		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{     
			stmt.close();
			conn.close();
		}
		return RESULTDATA;
	}
	public JSONArray employeeDetailsSearch(String empid,String empname,String check) throws SQLException {
	    
    	JSONArray RESULTDATA=new JSONArray();
          
    	if(!(check.equalsIgnoreCase("1"))){
			return RESULTDATA;
		}
    	
         Connection conn = null; 
         
        try {
        	
            conn = objconn.getMyConnection();   
            Statement stmtBDT = conn.createStatement();
            String sql1="";
           
            if(!(empid.equalsIgnoreCase("") || empid.equalsIgnoreCase("0"))){
            	sql1+=" and m.codeno="+empid+"";
            }
            
            if(!(empname.equalsIgnoreCase("") || empname.equalsIgnoreCase("0"))){
            	sql1+=" and m.name like '%"+empname+"%'";
            }
            
            String sql="select m.doc_no,m.codeno,m.name,m.costperhour from hr_empm m left join (select max(doc_no),catid,status,timesheet from hr_paycode where status=3 and timesheet=1 group by catid) c on (m.pay_catid=c.catid and c.timesheet=1) "
            		+ "left join hr_setdept d on m.dept_id=d.doc_no where m.status=3 and m.active=1 and c.status=3 and c.timesheet=1 and d.deploytech=1 "+sql1+"";
            
            ResultSet resultSet = stmtBDT.executeQuery(sql);
            RESULTDATA=objcommon.convertToJSON(resultSet);
           
            stmtBDT.close();
            conn.close();
        } catch(Exception e){
          e.printStackTrace();
          conn.close();
        } finally{
      conn.close();
     }
          return RESULTDATA;
     }
}
