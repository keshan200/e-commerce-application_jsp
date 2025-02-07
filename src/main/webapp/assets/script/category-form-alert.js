$(document).ready(function () {


    /*category update filed values set*/
    $(".edit-category-btn").on("click", function () {
        const catIdd = $(this).data("id");
        const catName = $(this).data("name");
        const attribute = $(this).data("image");

        $("#categoryU").val(catName);
        $("#categoryIdU").val(catIdd);
        $("#imageU").val(`uploads/${attribute}`);//file field get value not working yet
    });




    /*update from alert*/
    $("#updateCategoryModal form").on("submit", function (event) {
        event.preventDefault();

        if ($("#categoryU").val().trim() !== "") {

            let imgNull = $("#imageU").val()=== "";//image null check not working yet
            let nameNUll = $("#categoryU").val("");

            if (imgNull || nameNUll ) {
                Swal.fire({
                    title: "Error!",
                    text: "Please fill in all required fields.",
                    icon: "error",
                });
            }
            Swal.fire({
                title: "Updated!",
                icon: "success",
            }).then(() => this.submit());
        } else {
            Swal.fire({
                title: "Error!",
                text: "Please fill in all required fields.",
                icon: "error",
            });

        }
    });


    /*delete form alert*/
    $(".delete-btn").on("click", function () {
        const catId = $(this).data("delete");

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
                $("#cID").val(catId);
                $("#deleteForm").submit();
            }
        });
    });

    /*add from alert*/
    $("#addCategoryForm").on("submit", function (event) {
        event.preventDefault();

        const categoryName = $("#category").val().trim();
        const categoryImage = $("#cat-img").val();

        // Validate inputs
        if (categoryName === "" || categoryImage === "") {
            Swal.fire({
                title: "Error!",
                text: "Please fill in all required fields.",
                icon: "error",
            });
            return;
        }


        Swal.fire({
            title: "Success!",
            text: "Category added successfully.",
            icon: "success",
        }).then(() => {
            this.submit();
        });
    });
});