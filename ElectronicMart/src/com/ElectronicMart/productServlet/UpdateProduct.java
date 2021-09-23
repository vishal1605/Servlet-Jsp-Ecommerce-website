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
import com.ElectronicMart.Bean.EUser;
import com.ElectronicMart.dao.ProductDao;

/**
 * Servlet implementation class UpdateProduct
 */
@WebServlet("/UpdateProduct")
public class UpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		EProduct product = new EProduct();
		ProductDao dao1 = new ProductDao();
		
		String pName= request.getParameter("update-name");
		int pPrice= Integer.parseInt(request.getParameter("update-price"));
		String pCategory= request.getParameter("update-category");
		String pDescription= request.getParameter("update-description");
		String pImage= request.getParameter("update-image");
		int pId= Integer.parseInt(request.getParameter("pid"));
		
		
		product.setName(pName);
		product.setPrice(pPrice);
		product.setCategory(pCategory);
		product.setDescription(pDescription);
		product.setImage(pImage);
		product.setId(pId);
		HttpSession session = request.getSession();
		
		
		if(dao1.updateProduct(product)) {
			session.setAttribute("editProduct", "Product Updated Successfully...");
			response.sendRedirect("UpdateProduct.jsp");
			
		}
		
		
		
	}

}
