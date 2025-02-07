package lk.ijse.ecommerceapplication_jsp.servlets.product;


import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.daoImpl.ProductDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.Category;
import lk.ijse.ecommerceapplication_jsp.entity.Product;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductListServlet" ,value = "/products-list")
public class ProductListServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    ProductDaoImpl productDao = new ProductDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> allProduct = productDao.getAllProduct(dataSource);
        req.setAttribute("productList", allProduct);
        RequestDispatcher dispatcher = req.getRequestDispatcher("manage-product.jsp");
        dispatcher.forward(req, resp);
        System.out.println(allProduct);
    }
}
