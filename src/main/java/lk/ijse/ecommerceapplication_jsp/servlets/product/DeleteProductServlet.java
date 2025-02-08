package lk.ijse.ecommerceapplication_jsp.servlets.product;


import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.daoImpl.ProductDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.Product;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet(name = "DeleteProductServlet",value = "/delete-product")
public class DeleteProductServlet extends HttpServlet {


    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    ProductDaoImpl productDao = new ProductDaoImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int itemID = Integer.parseInt(req.getParameter("itmID"));

        Product product = new Product(itemID);
        boolean isDeleted = productDao.deleteProduct(product,dataSource);

        if (isDeleted){
            resp.sendRedirect("manage-products");
        }else {
            resp.sendRedirect("manage-products");
        }
    }
}
