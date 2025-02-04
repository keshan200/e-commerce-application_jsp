package lk.ijse.ecommerceapplication_jsp.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product {

    private String itemName;
    private String itemDescription;
    private String itemImage;
    private int quantity;
    private Double unitPrice;
    private String material;
    private int categoryID;
}
