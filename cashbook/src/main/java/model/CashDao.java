package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class CashDao {

	public ArrayList<HashMap<String,Object>> selectCashList(String cashDateStr ) throws ClassNotFoundException, SQLException{
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
		ResultSet rs = null; 
		String sql = " SELECT ct.kind kind , ct.title title , c.color color FROM cash c INNER JOIN category ct "  
					  + " ON c.category_no = ct.category_no  WHERE cash_date = ? " ;
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, cashDateStr);
		
		rs = stmt.executeQuery();
		while(rs.next()) { 
			HashMap<String, Object> map = new HashMap <String, Object>();
			map.put("kind", rs.getString("kind"));
			map.put("title", rs.getString("title")); 
			map.put("color",rs.getString("color"));
			
			list.add(map);
		}
		
		return list;
	}
	
}
