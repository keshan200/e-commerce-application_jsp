package lk.ijse.ecommerceapplication_jsp.servlets.admin_controller.customer;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.daoImpl.UserDaoImpl;

import javax.sql.DataSource;
import java.io.IOException;



@WebServlet(name = "AdminRegisterServlet",value = "/admin-register")
public class AdminRegisterServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    UserDaoImpl userdaoimpl = new UserDaoImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String password = req.getParameter("password");
        String firstName = req.getParameter("fname");
        String lastName = req.getParameter("lname");
        String address = req.getParameter("address");
        String email = req.getParameter("email");
        String tele = req.getParameter("tele");

    }
}
