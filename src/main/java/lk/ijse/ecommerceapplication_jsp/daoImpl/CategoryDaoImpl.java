package lk.ijse.ecommerceapplication_jsp.daoImpl;

import lk.ijse.ecommerceapplication_jsp.entity.Category;
import lk.ijse.ecommerceapplication_jsp.entity.user;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CategoryDaoImpl {


    public boolean addCategory(Category category, DataSource dataSource){

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO category (category, categoryImage)values(?,?)");

            pstm.setString(1, category.getCategory());
            pstm.setString(2, category.getCategoryImage());


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
}
