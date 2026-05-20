<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="com.connection.*" %>

<%	
ClsConnection ClsConnection=new ClsConnection();
     
	Connection conn = null;

	try{
 	        conn = ClsConnection.getMyConnection();
			Statement stmt = conn.createStatement();
	
			String sessionbrch=request.getParameter("sessionbrch");
            
            if(sessionbrch.equalsIgnoreCase("a")){

            	String sql = "select doc_no from my_brch where mainbranch=1";
        		ResultSet rs = stmt.executeQuery(sql);
        		
        		while(rs.next()){
        			sessionbrch = rs.getString("doc_no");
        		}
        		
            }
    		
			session.setAttribute("BRANCHID",sessionbrch);
			System.out.println("====== "+session.getAttribute("BRANCHID"));
 			response.getWriter().write(1);

 			stmt.close();
 			conn.close();
 		}catch(Exception e){
 		 	e.printStackTrace();
 		 	conn.close();
 		}finally{
 			conn.close();
 		}
%>
  
 