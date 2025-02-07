package lk.ijse.ecommerceapplication_jsp.daoImpl;

import lk.ijse.ecommerceapplication_jsp.entity.Category;
import lk.ijse.ecommerceapplication_jsp.entity.user;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

    public List<Category> getAllCategory(DataSource dataSource){

        List<Category> categoryList = new ArrayList<>();

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM category");
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()){
                int categoryId = resultSet.getInt("categoryID");
                String name = resultSet.getString("category");
                String image = resultSet.getString("categoryImage");

                Category Category = new Category(categoryId,name,image);
                categoryList.add(Category);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }

    public boolean updateCategory(Category category, DataSource dataSource){

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("UPDATE category SET category = ?, categoryImage = ? WHERE categoryId = ?");

            pstm.setString(1, category.getCategory());
            pstm.setString(2, category.getCategoryImage());
            pstm.setInt(3,category.getId());

            boolean isExecuted = pstm.executeUpdate() > 0;

            if (isExecuted){
                return true;
            }else {
                System.out.println("cant -update customer");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error>>>"+e.getMessage());
            throw new RuntimeException(e);
        }
        return false;

    }


    public boolean deleteCategory(Category category, DataSource dataSource){

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("DELETE FROM category WHERE categoryID = ?");

            pstm.setInt(1,category.getId());

            boolean isExecuted = pstm.executeUpdate() > 0;

            if (isExecuted){
                return true;
            }else {
                System.out.println("cant -Delete customer");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("error>>>"+e.getMessage());
            throw new RuntimeException(e);
        }
        return false;
    }

    public List<Category> getAllCategoryName(DataSource dataSource){

        List<Category> categoryList = new ArrayList<>();

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT categoryID, category FROM category");
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()){
                int categoryId = resultSet.getInt("categoryID");
                String name = resultSet.getString("category");

                Category Category = new Category(categoryId,name);
                categoryList.add(Category);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }


}

