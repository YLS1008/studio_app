(function ($) {

    $(function () {
        var tableA = $('#tableA'),
            tableB = $('#tableB'),
            buttonA = $('#switchA'),
            buttonB = $('#switchB');

        buttonA.click(function () {
            tableA.show();
            tableB.hide();
        });

        buttonB.click(function () {
            tableA.hide();
            tableB.show();
        });
    });

})(jQuery);