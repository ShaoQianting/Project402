package com.rain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rain.util.DBUtil;

public class OverdueDao {
	
	public void addOverdueRecord(int hid, int aid, int bid, String card, String bookname, String adminname, String username,String begintime, String endtime, int days, double d, int issettlement, String payway) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnectDb();
		String sql = "insert into overduebooks(hid,aid,bid,card,bookname,adminname, username, begintime, endtime, days, amount, issettlement, payway) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int rs = 0;
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setInt(1, hid);
			stm.setInt(2, aid);
			stm.setInt(3, bid);
			stm.setString(4, card);
			stm.setString(5, bookname);
			stm.setString(6, adminname);
			stm.setString(7, username);
			stm.setString(8, begintime);
			stm.setString(9, endtime);
			stm.setInt(10, days);
			stm.setDouble(11, d);
			stm.setInt(12, issettlement);
			stm.setString(13, payway);
			rs = stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
