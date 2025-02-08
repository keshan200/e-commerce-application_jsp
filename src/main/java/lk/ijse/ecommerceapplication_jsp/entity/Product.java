package lk.ijse.ecommerceapplication_jsp.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product {

    private int id;
    private String itemName;
    private String itemDescription;
    private String itemImage;
    private int quantity;
    private Double unitPrice;
    private String material;
    private int categoryID;


    public Product(String itemName, String itemDescription, String itemImage, int quantity, Double unitPrice, String material, int categoryID) {
        this.itemName = itemName;
        this.itemDescription = itemDescription;
        this.itemImage = itemImage;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.material = material;
        this.categoryID = categoryID;
    }

    public Product(int id) {
        this.id = id;
    }
}
