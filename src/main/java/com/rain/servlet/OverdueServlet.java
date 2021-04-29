package com.rain.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rain.bean.OverdueBean;
import com.rain.dao.BookDao;
import com.rain.dao.OverdueDao;

/**
 * 删除图书类别
 */
@WebServlet("/OverdueServlet")
public class OverdueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OverdueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		//删除图书分类信息
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String mod = request.getParameter("mod");
		String from = request.getParameter("from");
		System.out.println("mod:"+ mod);
		if(from.equals("reader")) {
			switch(mod){
		    case "pay" :
		    	payFromReader(request,response);
		       break; 
		    default :
		}
		}else {
			
			switch(mod){
			    case "del" :
			    	deleteRecord(request,response);
			       break;
			    case "pay" :
			    	payForAdmin(request,response);
			       break; 
			    default :
			}
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String mod = request.getParameter("mod");
		switch(mod){
	    case "search" :
	    	search(request,response);
	       break; 
	    
	    default : 
	      
		}
	}
	
	public void deleteRecord(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int oid = Integer.parseInt(request.getParameter("oid"));
		OverdueDao overduedao = new OverdueDao();
		overduedao.deleteOverdueRecord(oid);
		response.sendRedirect("/books/admin_charge.jsp");
	}
	
	public void payForAdmin(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int oid = Integer.parseInt(request.getParameter("oid"));
		int hid = Integer.parseInt(request.getParameter("hid"));
		OverdueDao overduedao = new OverdueDao();
		BookDao bookdao = new BookDao();
		bookdao.updateIsSettlement(hid);
		overduedao.updatePayFromAdmin(oid);
		response.sendRedirect("/books/admin_charge.jsp");
	}
	
	public void search(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String keywords = request.getParameter("keywords");
		System.out.print(keywords);
		
		OverdueDao overduedao = new OverdueDao();
		ArrayList<OverdueBean> data = overduedao.getLikeList(keywords);

		request.setAttribute("data", data);
		String url = "";
		url = response.encodeURL("admin_charge.jsp");
	
	    request.getRequestDispatcher(url).forward(request, response);
	}
	
	public void payFromReader(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int hid = Integer.parseInt(request.getParameter("hid"));
		OverdueDao overduedao = new OverdueDao();
		BookDao bookdao = new BookDao();
		
		overduedao.updatePayFromReader(hid);
		bookdao.updateIsSettlement(hid);
		response.sendRedirect("/books/borrow.jsp");
	}
}
