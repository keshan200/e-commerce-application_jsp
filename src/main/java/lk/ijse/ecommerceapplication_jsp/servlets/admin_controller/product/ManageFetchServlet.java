package lk.ijse.ecommerceapplication_jsp.servlets.admin_controller.product;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.daoImpl.CategoryDaoImpl;
import lk.ijse.ecommerceapplication_jsp.daoImpl.ProductDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.Category;
import lk.ijse.ecommerceapplication_jsp.entity.Product;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageFetchServlet", value = "/manage-products")

public class ManageFetchServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    private final ProductDaoImpl productDao = new ProductDaoImpl();
    private final CategoryDaoImpl categoryDao = new CategoryDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            List<Category> allCategories = categoryDao.getAllCategoryName(dataSource);
            req.setAttribute("categoryNameList", allCategories);

            List<Product> allProducts = productDao.getAllProduct(dataSource);
            req.setAttribute("productList", allProducts);

            RequestDispatcher dispatcher = req.getRequestDispatcher("manage-product.jsp");
            dispatcher.forward(req, resp);


            System.out.println("Categories: " + allCategories);
            System.out.println("Products: " + allProducts);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load products or categories.");
        }
    }
}
