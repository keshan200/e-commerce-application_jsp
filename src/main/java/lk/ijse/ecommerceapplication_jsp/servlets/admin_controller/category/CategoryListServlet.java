package lk.ijse.ecommerceapplication_jsp.servlets.admin_controller.category;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.daoImpl.CategoryDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.Category;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "GetAllCategoryServlet" , value = "/category-list")
public class CategoryListServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    CategoryDaoImpl categoryDao = new CategoryDaoImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Category> allCategory = categoryDao.getAllCategory(dataSource);
        req.setAttribute("categoryList", allCategory);
        RequestDispatcher dispatcher = req.getRequestDispatcher("manage-category.jsp");
        dispatcher.forward(req, resp);
        System.out.println(allCategory);

    }
}
