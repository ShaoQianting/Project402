package com.rain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.rain.bean.OverdueBean;
import com.rain.util.DBUtil;

public class OverdueDao {
	
	public void addOverdueRecord(int hid, int aid, int bid, String card, String bookname, String adminname, String username,String begintime, String endtime, int days, double amount, int issettlement, String payway) {
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
			stm.setDouble(11, amount);
			stm.setInt(12, issettlement);
			stm.setString(13, payway);
			rs = stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateOverdueInfo(int oid,int days, double amount) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnectDb();
		String sql = "update overduebooks set days=?,amount=? where oid=?";
		//System.out.println(sql);
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setInt(1, days);
			stm.setDouble(2, amount);
			stm.setInt(3, oid);
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<OverdueBean> get_ListInfo(){
		ArrayList<OverdueBean> tag_Array = new ArrayList<OverdueBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from overduebooks order by issettlement";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while(rs.next()){
				OverdueBean tag = new OverdueBean();
				tag.setOid(rs.getInt("oid"));
				tag.setAid(rs.getInt("aid"));
				tag.setBid(rs.getInt("bid"));
				tag.setHid(rs.getInt("hid"));
				tag.setCard(rs.getString("card"));
				tag.setBookname(rs.getString("bookname"));
				tag.setAdminname(rs.getString("adminname"));
				tag.setUsername(rs.getString("username"));
				tag.setBegintime(rs.getString("begintime"));
				tag.setEndtime(rs.getString("endtime"));
				tag.setDays(rs.getInt("days"));
				tag.setAmount(rs.getDouble("amount"));
				tag.setIssettlement(rs.getInt("issettlement"));
				tag.setPayway(rs.getString("payway"));
						
				tag_Array.add(tag);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag_Array;
	}
	
	public ArrayList<OverdueBean> get_ListForOverdue(){
		ArrayList<OverdueBean> tag_Array = new ArrayList<OverdueBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from overduebooks where issettlement=0";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while(rs.next()){
				OverdueBean tag = new OverdueBean();
				tag.setOid(rs.getInt("oid"));
				tag.setAid(rs.getInt("aid"));
				tag.setBid(rs.getInt("bid"));
				tag.setHid(rs.getInt("hid"));
				tag.setCard(rs.getString("card"));
				tag.setBookname(rs.getString("bookname"));
				tag.setAdminname(rs.getString("adminname"));
				tag.setUsername(rs.getString("username"));
				tag.setBegintime(rs.getString("begintime"));
				tag.setEndtime(rs.getString("endtime"));
				tag.setDays(rs.getInt("days"));
				tag.setAmount(rs.getDouble("amount"));
				tag.setIssettlement(rs.getInt("issettlement"));
				tag.setPayway(rs.getString("payway"));
						
				tag_Array.add(tag);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag_Array;
	}
	
	public void deleteOverdueRecord(int oid) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnectDb();
		String sql = "delete from overduebooks where oid=?";
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setInt(1, oid);
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updatePayFromAdmin(int oid) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnectDb();
		String sql = "update overduebooks set payway=?,issettlement=? where oid=?";
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setString(1, "Cash");
			stm.setInt(2, 1);
			stm.setInt(3, oid);
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updatePayFromReader(int hid) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnectDb();
		String sql = "update overduebooks set payway=?,issettlement=? where hid=?";
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setString(1, "Cash");
			stm.setInt(2, 1);
			stm.setInt(3, hid);
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<OverdueBean> getLikeList(String keywords) {
		// TODO Auto-generated method stub
		ArrayList<OverdueBean> tag_Array = new ArrayList<OverdueBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from overduebooks where bookname like '%"+keywords+"%' or adminname like '%"+keywords+"%' or username like '%"+keywords+"%' order by issettlement";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			
			while(rs.next()){
				//System.out.println(rs.getInt("oid"));
				OverdueBean tag = new OverdueBean();
				tag.setOid(rs.getInt("oid"));
				tag.setAid(rs.getInt("aid"));
				tag.setBid(rs.getInt("bid"));
				tag.setHid(rs.getInt("hid"));
				tag.setCard(rs.getString("card"));
				tag.setBookname(rs.getString("bookname"));
				tag.setAdminname(rs.getString("adminname"));
				tag.setUsername(rs.getString("username"));
				tag.setBegintime(rs.getString("begintime"));
				tag.setEndtime(rs.getString("endtime"));
				tag.setDays(rs.getInt("days"));
				tag.setAmount(rs.getDouble("amount"));
				tag.setIssettlement(rs.getInt("issettlement"));
				tag.setPayway(rs.getString("payway"));
				
				tag_Array.add(tag);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.CloseDB(rs, stm, conn);
		}
		return tag_Array;
	}
}
