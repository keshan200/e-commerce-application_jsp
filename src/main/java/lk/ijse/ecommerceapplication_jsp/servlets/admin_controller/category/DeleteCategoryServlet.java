package lk.ijse.ecommerceapplication_jsp.servlets.admin_controller.category;


import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.daoImpl.CategoryDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.Category;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet(name = "DeleteCategoryServlet" , value = "/delete-category")
public class DeleteCategoryServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    CategoryDaoImpl categoryDao = new CategoryDaoImpl();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

           int id = Integer.parseInt(req.getParameter("categoryID"));

           Category categoryID = new Category(id);
           boolean isDeleted = categoryDao.deleteCategory(categoryID, dataSource);
           if (isDeleted){
               resp.sendRedirect("category-list");
           } else {
               resp.getWriter().write("Failed to add category.");
           }

    }
}
