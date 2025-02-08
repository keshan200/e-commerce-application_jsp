package lk.ijse.ecommerceapplication_jsp.daoImpl;

import lk.ijse.ecommerceapplication_jsp.entity.user;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CustomerDaoImpl {


    public boolean customerRegister(user customer, DataSource dataSource) {
        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO customer (password, firstName, lastName, email) VALUES (?, ?, ?, ?)");

            pstm.setString(1, customer.getPassword());
            pstm.setString(2, customer.getFirstName());
            pstm.setString(3, customer.getLastName());
            pstm.setString(4, customer.getEmail());

            boolean isExecute = pstm.executeUpdate() > 0;

            if (isExecute) {
                return true;
            }else {
                System.out.println("cant register customer");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return false;
    }
}
