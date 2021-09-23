package com.ElectronicMart.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ElectronicMart.Bean.EProduct;
import com.ElectronicMart.dao.ProductDao;

/**
 * Servlet implementation class CategoryCondition
 */
public class CategoryCondition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryCondition() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		ProductDao dao1 = new ProductDao();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(category.equals("all")) {
			List<EProduct> lists=dao1.getAllProduct();
			for(EProduct p:lists) {
				out.println(p+"<br/>");
			}
		}else{
			List<EProduct> lists=dao1.getProductByCat(category);
			for(EProduct p:lists) {
				out.println(p+"<br/>");
			}
		}
		
	}

}
