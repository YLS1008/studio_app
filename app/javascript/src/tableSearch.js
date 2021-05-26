import $ from "jquery";

const dataTables = [];

$(document).ready(function() {
    if (dataTables.length === 0 && $('#searchableB').length !== 0) {
        $('#searchableB').each((_, element) => {
            dataTables.push($(element).DataTable({
                pageLength: 10
            }));
        });
    }
});

