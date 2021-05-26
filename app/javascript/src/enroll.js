import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'

// initialize select2
$(document).ready(function() {
    $('#select-trainees').select2({
        multiple: true
    });
  });
  



