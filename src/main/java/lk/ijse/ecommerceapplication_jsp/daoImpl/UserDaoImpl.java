package lk.ijse.ecommerceapplication_jsp.daoImpl;

import jakarta.annotation.Resource;
import lk.ijse.ecommerceapplication_jsp.entity.user;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl {



    public boolean registerCustomer(user userEntity,DataSource dataSource){

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO customer (password, firstName, lastName, address, telephone, email)values(?,?,?,?,?,?)");

            pstm.setString(1, userEntity.getPassword());
            pstm.setString(2, userEntity.getFirstName());
            pstm.setString(3, userEntity.getLastName());
            pstm.setString(4, userEntity.getAddress());
            pstm.setString(5, userEntity.getTelephone());
            pstm.setString(6, userEntity.getEmail());

            boolean isExecuted = pstm.executeUpdate() > 0;

            if (isExecuted){
                return true;
            }else {
                System.out.println("cant -add customer");
            }


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error>>>"+e.getMessage());
            throw new RuntimeException(e);
        }
        return false;
    }

    public List<user> customerList(DataSource dataSource){

        List<user> users = new ArrayList<>();

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT firstName, lastName, address, telephone, email FROM customer");
            ResultSet resultSet = pstm.executeQuery();


            while (resultSet.next()){

                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String address = resultSet.getString("address");
                String telephone = resultSet.getString("telephone");
                String email = resultSet.getString("email");


                user userEntity = new user(firstName,lastName,address,telephone,email);
                users.add(userEntity);

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return users;
    }
}
