package com.ElectronicMart.productServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ElectronicMart.Bean.EProduct;
import com.ElectronicMart.dao.ProductDao;

/**
 * Servlet implementation class RegisterProduct
 */
@WebServlet("/RegisterProduct")
public class RegisterProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String pName = request.getParameter("product-name");
		int pPrice = Integer.parseInt(request.getParameter("product-price"));
		String pCategory = request.getParameter("product-category");
		String pDesription = request.getParameter("product-description");
		String pImage = request.getParameter("product-image");
		
		HttpSession session = request.getSession();
		
		EProduct product = new EProduct();
		product.setName(pName);
		product.setPrice(pPrice);
		product.setCategory(pCategory);
		product.setDescription(pDesription);
		product.setImage(pImage);
		
		ProductDao dao1 = new ProductDao();
		boolean p=dao1.addProduct(product);
		if(p) {
			session.setAttribute("product-msg", "Product added successfully..");
			response.sendRedirect("AdminAddProduct.jsp");
			
		}else {
			session.setAttribute("product-failed", "Product failed to add..");
			response.sendRedirect("AdminAddProduct.jsp");
		}
	}

}
