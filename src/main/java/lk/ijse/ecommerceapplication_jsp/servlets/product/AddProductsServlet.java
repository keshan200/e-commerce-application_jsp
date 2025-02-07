package lk.ijse.ecommerceapplication_jsp.servlets.product;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import lk.ijse.ecommerceapplication_jsp.daoImpl.ProductDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.Product;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;


@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)

@WebServlet(name = "AddProductsServlet",value = "/product-save")
public class AddProductsServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;
    ProductDaoImpl productDao = new ProductDaoImpl();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Part filePart = req.getPart("itemImage");
        String productName = req.getParameter("productName");
        double productPrice = Double.parseDouble(req.getParameter("productPrice"));
        String productDescription = req.getParameter("description");
        int productCategory = Integer.parseInt(req.getParameter("category"));
        String material = req.getParameter("material");
        int qty = Integer.parseInt(req.getParameter("qty"));



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
            Product product = new Product(productName,productDescription,fileName,qty,productPrice,material,productCategory);

            boolean isAdded = productDao.addProduct(product, dataSource);

            if (isAdded) {
                resp.sendRedirect("product-list");
            }else {
                resp.sendRedirect("product-list");
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }





    }
}
