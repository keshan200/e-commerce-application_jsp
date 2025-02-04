let preventNavigation = false;

$('.product-card').click(() => {
    if (!preventNavigation) {
        $(".page").css("display", "none");
        $(".active").css("display", "block");
        $("#buy-now-page").css("display", "block");

        $(window).off('scroll');
        $('html, body').animate({
            scrollTop: $("#buy-now-page").offset().top
        }, 0.01);
    }
});

$('.add-to-cart-btn').click((event) => {
    event.preventDefault();
    preventNavigation = true;
    console.log('Item added to cart!');
    setTimeout(() => {
        preventNavigation = false;
    }, 1000);
});
