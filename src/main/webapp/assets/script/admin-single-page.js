$('#manage-product').click(()=>{

    $('#add-product-page').css("display","block")
    $('#add-product-page').css("display","flex")

    $('#category-manage-page').css("display","none")
    $('#view-customer-details').css("display","none")

})

$('#manage-categories').click(()=>{

    $('#add-product-page').css("display","none")
    $('#view-customer-details').css("display","none")


    $('#category-manage-page').css("display","block")
    $('#category-manage-page').css("display","flex")

})

$('#view-cus-details').click(()=>{

    $('#add-product-page').css("display","none")
    $('#category-manage-page').css("display","none")

    $('#view-customer-details').css("display","block")
    $('#view-customer-details').css("display","flex")

})

$('#').click(()=>{

    $('#add-product-page').css("display","block")
    $('#category-manage-page').css("display","none")

})

