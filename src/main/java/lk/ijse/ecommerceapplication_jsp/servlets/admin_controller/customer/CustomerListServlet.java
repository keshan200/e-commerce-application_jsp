package lk.ijse.ecommerceapplication_jsp.servlets.admin_controller.customer;


import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.daoImpl.UserDaoImpl;
import lk.ijse.ecommerceapplication_jsp.entity.user;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerListServlet",value = "/customer-list")
public class CustomerListServlet extends HttpServlet {

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    UserDaoImpl userdaoimpl = new UserDaoImpl();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<user> customerList = userdaoimpl.customerList(dataSource);
        req.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer-list.jsp");
        dispatcher.forward(req, resp);
        System.out.println(customerList);
    }
}
