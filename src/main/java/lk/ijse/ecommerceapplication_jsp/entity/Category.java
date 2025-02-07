package lk.ijse.ecommerceapplication_jsp.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Category {
    private int id;
    private String category;
    private String categoryImage;

    public Category(String category, String categoryImage) {
        this.category = category;
        this.categoryImage = categoryImage;
    }

    public Category(int id) {
        this.id = id;
    }

    public Category(int id, String category) {
        this.id = id;
        this.category = category;
    }
}
