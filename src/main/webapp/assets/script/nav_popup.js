let lastScrollTop = 0;
const $homeNavigation = $('.navigation');
const $mainHeader = $('.navbar');


$mainHeader.css('top', '-100px');

$(window).on('scroll', function () {
    const currentScroll = $(this).scrollTop();

    if (currentScroll > lastScrollTop && currentScroll > 0) {
        $homeNavigation.hide();
        $mainHeader.css('top', '0');
    } else if (currentScroll === 0) {
        $homeNavigation.css('display', 'flex');
        $mainHeader.css('top', '-100px');
    } else {

        $homeNavigation.css('display', 'flex');
        $mainHeader.css('top', '0');
    }

    lastScrollTop = currentScroll <= 0 ? 0 : currentScroll;
});
