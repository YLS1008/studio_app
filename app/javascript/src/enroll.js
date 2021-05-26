import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

// destroy old select2 before caching
$(document).on("turbolinks:before-cache", function () {
    if ($('#select-trainees').first().data('select2') != undefined) $('#select-trainees').select2('destroy');
  });
  
  // initialize select2 on turbolinks:load
  $(document).on("turbolinks:load", function () {
    $('#select-trainees').select2({
        multiple: true
    });
  });


