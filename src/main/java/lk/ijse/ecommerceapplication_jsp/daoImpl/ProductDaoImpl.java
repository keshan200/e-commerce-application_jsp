package lk.ijse.ecommerceapplication_jsp.daoImpl;

import lk.ijse.ecommerceapplication_jsp.entity.Product;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl {


    public boolean addProduct(Product product, DataSource dataSource) {

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO item (itemName, itemDescription, itemImage, quantity, unitPrice, material, categoryID)VALUES (?, ?, ?, ?, ?, ?, ?)");

            pstm.setString(1, product.getItemName());
            pstm.setString(2, product.getItemDescription());
            pstm.setString(3, product.getItemImage());
            pstm.setInt(4, product.getQuantity());
            pstm.setDouble(5, product.getUnitPrice());
            pstm.setString(6, product.getMaterial());
            pstm.setInt(7, product.getCategoryID());

            boolean isExecute = pstm.executeUpdate()>0;

            if (isExecute) {
                return true;
            }else {
                System.out.println("cant'add");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return false;
    }

    public List<Product> getAllProduct(DataSource dataSource) {

        List<Product> products = new ArrayList<>();

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM item");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                int pID = rs.getInt("itemID");
                String pName = rs.getString("itemName");
                String pDescription = rs.getString("itemDescription");
                String pImage = rs.getString("itemImage");
                int pQuantity = rs.getInt("quantity");
                double pUnit = rs.getDouble("unitPrice");
                String pMaterial = rs.getString("material");
                int pCategoryID = rs.getInt("categoryID");

                Product productList = new Product(pID,pName,pDescription,pImage,pQuantity,pUnit,pMaterial,pCategoryID);
                products.add(productList);

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return products;
    }

    public boolean deleteProduct(Product product, DataSource dataSource) {

        try ( Connection connection = dataSource.getConnection();
              PreparedStatement pstm = connection.prepareStatement("DELETE FROM item WHERE itemID = ?")){


            pstm.setInt(1,product.getId());
            boolean isExecute = pstm.executeUpdate()>0;

            if (isExecute) {
                return true;
            }else {
                System.out.println("cant'delete");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return false;
    }

    public boolean updateProduct(Product product, DataSource dataSource) {

        try {
            Connection connection = dataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("UPDATE item SET itemName = ?, itemDescription = ?, itemImage = ?, quantity = ?, unitPrice = ?, material = ?, categoryID = ? WHERE itemID = ");

            pstm.setString(1, product.getItemName());
            pstm.setString(2, product.getItemDescription());
            pstm.setString(3, product.getItemImage());
            pstm.setInt(4, product.getQuantity());
            pstm.setDouble(5, product.getUnitPrice());
            pstm.setString(6, product.getMaterial());
            pstm.setInt(7, product.getCategoryID());
            pstm.setInt(8, product.getId());

            boolean isExecute = pstm.executeUpdate()>0;
            if (isExecute) {
                return true;
            }else {
                System.out.println("cant'update");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return false;

    }


}
