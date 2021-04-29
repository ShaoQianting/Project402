package com.rain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.rain.bean.BookBean;
import com.rain.bean.EmailBean;
import com.rain.bean.OverdueBean;
import com.rain.util.DBUtil;

public class EmailDao {
	
	public void initEmail(int aid,int type) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnectDb();
		String sql = "insert into email(aid,type, issend) values(?,?,?)";
		int rs = 0;
		PreparedStatement stm = null;
		try {
			stm = conn.prepareStatement(sql);
			stm.setInt(1, aid);
			stm.setInt(2, type);
			stm.setInt(3, 0);
			rs = stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<EmailBean> getSendInfoList(){
		ArrayList<EmailBean> tag_Array = new ArrayList<EmailBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from email where issend = 0";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while(rs.next()){
				EmailBean tag = new EmailBean();
				tag.setEid(rs.getInt("eid"));
				tag.setAid(rs.getInt("aid"));
				tag.setType(rs.getInt("type"));
				
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
	
	public ArrayList<EmailBean> getAllInfoList(){
		ArrayList<EmailBean> tag_Array = new ArrayList<EmailBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from email";
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while(rs.next()){
				EmailBean tag = new EmailBean();
				tag.setEid(rs.getInt("eid"));
				tag.setAid(rs.getInt("aid"));
				tag.setEmailaddress(rs.getString("emailaddress"));
				tag.setSubject(rs.getString("subject"));
				tag.setSentdate(rs.getString("sentdate"));
				tag.setContent(rs.getString("content"));
				tag.setIssend(rs.getInt("issend"));
				tag.setType(rs.getInt("type"));
				
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
	
	public void updateEmailRecord(int eid, String emailaddress, String subject, String content) {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnectDb();
		String sql = "update email set emailaddress=?,subject=?,content=?,sentdate=?,issend=? where eid=?";
		PreparedStatement stm = null;
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			//System.out.println(sql+eid);
			stm = conn.prepareStatement(sql);
			stm.setString(1, emailaddress);
			stm.setString(2, subject);
			stm.setString(3, content);
			stm.setString(4, ft.format(System.currentTimeMillis()));
			stm.setInt(5, 1);
			stm.setInt(6, eid);
			stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
