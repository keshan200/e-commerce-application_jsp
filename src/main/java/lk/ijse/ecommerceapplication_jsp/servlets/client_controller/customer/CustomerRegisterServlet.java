package lk.ijse.ecommerceapplication_jsp.servlets.client_controller.customer;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.ecommerceapplication_jsp.daoImpl.CategoryDaoImpl;
import lk.ijse.ecommerceapplication_jsp.daoImpl.CustomerDaoImpl;
import lk.ijse.ecommerceapplication_jsp.daoImpl.UserDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.user;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerRegisterServlet" , value = "/customer-register")
public class CustomerRegisterServlet extends HttpServlet {


    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    CustomerDaoImpl customerDao = new CustomerDaoImpl();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        user cus = new user(firstname,lastname,email,password);

        boolean isAdded = customerDao.customerRegister(cus, dataSource);
        if (isAdded) {
            resp.sendRedirect("index.jsp");
            HttpSession session = req.getSession();
            session.setAttribute("user", cus);


            System.out.println("added");
        }else {
            resp.sendRedirect("customer-register.jsp");
            System.out.println("not added");
        }
    }
}
