package lk.ijse.ecommerceapplication_jsp.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class user {
    private String image;
    private String firstName;
    private String lastName;
    private String address;
    private String telephone;
    private String email;
    private String password;
    private String accountType;

    public user(String firstName, String lastName, String address, String telephone, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.telephone = telephone;
        this.email = email;
    }
}
