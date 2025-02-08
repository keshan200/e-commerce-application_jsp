package lk.ijse.ecommerceapplication_jsp.servlets.admin_controller.category;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.ecommerceapplication_jsp.daoImpl.CategoryDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.Category;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
@WebServlet(name = "AddCategoryServlet" , value = "/category-save")
public class AddCategoryServlet extends HttpServlet {


    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    CategoryDaoImpl categoryDao = new CategoryDaoImpl();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("categoryName");
        Part filePart = req.getPart("categoryImage");

        String fileName = (filePart != null) ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() : null;

        if (fileName == null || fileName.trim().isEmpty()) {
            resp.getWriter().write("<script>alert('Please select a file!'); window.history.back();</script>");
            return;
        }

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            boolean isDirCreated = uploadDir.mkdirs();
            if (!isDirCreated) {
                resp.getWriter().write("Failed to create upload directory.");
                return;
            }
        }

        try {
            filePart.write(uploadPath + File.separator + fileName);
            Category category = new Category(name, fileName);
            boolean isAdded = categoryDao.addCategory(category, dataSource);

            if (isAdded) {
                resp.sendRedirect("category-list");
            } else {
                resp.getWriter().write("Failed to add category.");
            }

        } catch (IOException e) {
            resp.getWriter().write("Error uploading file: " + e.getMessage());
            e.printStackTrace();
        } catch (RuntimeException e) {
            resp.getWriter().write("Error occurred: " + e.getMessage());
            e.printStackTrace();
        }
    }


}
