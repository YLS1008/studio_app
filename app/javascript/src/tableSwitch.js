$(document).ready(function(){
    $('#edit-profile-button').click(function(){
        $('#profile-information').toggle();
    });
});



$(document).ready(function () {
    (function ($) {

        $(function () {
            var tableA = $('#tableA'),
                tableB = $('#tableB'),
                tableC = $('#tableC'),
                buttonA = $('#switchA'),
                buttonB = $('#switchB'),
                buttonC = $('#switchC');

            buttonA.click(function () {
                tableA.show();
                tableB.hide();
                tableC.hide();
            });

            buttonB.click(function () {
                tableA.hide();
                tableB.show();
                tableC.hide();
            });

            buttonC.click(function () {
                tableA.hide();
                tableB.hide();
                tableC.show();
            });
        });

    })(jQuery);
});
