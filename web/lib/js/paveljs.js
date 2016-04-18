/**
 * Created by Алексей on 18.04.2016.
 */

$(document).ready(function () {
    (function ($) {
        $(document).ready(function () {
            setTimeout(function () {
                $("a[target='_blank']").removeAttr('href');
            }, 1000);
        });
    })(jQuery);

    var now = new Date();
    switch (now.getHours()) {
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        {
            $(this).text("Добрый день");
            break;
        }
        default :
        {
            $(this).text("Hello");
        }
    }

    //$(this).style.color="blue";
});