$(document).ready(function () {


    /*product update fields value set*/
    $(".edit-product-btn").on("click",function (){

        let itemID = $(this).data("id");
        let name = $(this).data("name");
        let desc = $(this).data("desc");
        let price = $(this).data("price");
        let qty = $(this).data("qty");
        let material = $(this).data("material");
        let category = $(this).data("category");
        let image = $(this).data("image");


        $("#itemIDU").val(itemID);
        $("#ProductNameU").val(name);
        $("#descriptionU").val(desc);
        $("#priceU").val(price);
        $("#qtyU").val(qty);
        $("#materialU").val(material);
        $("#op").val(category);
        $("#imageU").val(image);


    })



    /*Add Alert*/
    $("#addProductForm").on("submit", function (event) {
        event.preventDefault();

        const itemName = $("#ProductName").val().trim();
        const description = $("#description").val().trim();
        const category = $("#categories").val();
        const material = $("#inputCity").val().trim();
        const price = $("#price").val().trim();
        const quantity = $("#qty").val().trim();
        const itemImage = $("#image").val();


        if (itemName === "" || description === "" || category === "" ||
            material === "" || price === "" || quantity === "" || itemImage === "") {
            Swal.fire({
                title: "Error!",
                text: "Please fill in all required fields.",
                icon: "error",
            });
            return;
        }

        if (isNaN(price) || isNaN(quantity) || price <= 0 || quantity <= 0) {
            Swal.fire({
                title: "Error!",
                text: "Please enter valid numeric values for price and quantity.",
                icon: "error",
            });
            return;
        }

        Swal.fire({
            title: "Success!",
            text: "Product added successfully.",
            icon: "success",
        }).then(() => {
            this.submit();
        });
    });

    /*delete alert*/
    $(".delete-btn").on("click", function () {
        const itemID = $(this).data("delete");

        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then((result) => {
            if (result.isConfirmed) {
                $("#itemID").val(itemID);
                $("#deleteForm").submit();
            }
        });
    });

})