
// Packages
import "datatables.net"
import 'datatables.net-bs4'
import "datatables.net-bs4/css/dataTables.bootstrap4.min.css"
import "datatables.net-responsive"
import "datatables.net-responsive-bs4"

//initialize datatables
const dataTables = [];

document.addEventListener("turbolinks:load", () => {
    if (dataTables.length === 0 && $('.data-table').length !== 0) {
        $('.data-table').each((_, element) => {
            dataTables.push($(element).DataTable({
                pageLength: 50
            }));
        });
    }
});

document.addEventListener("turbolinks:before-cache", () => {
    while (dataTables.length !== 0) {
        dataTables.pop().destroy();
    }
});
