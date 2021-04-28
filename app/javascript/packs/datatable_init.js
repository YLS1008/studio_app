const dataTables = [];

document.addEventListener("turbolinks:load", () => {
    if (dataTables.length === 0 && $('#searchableB').length !== 0) {
        $('#searchableB').each((_, element) => {
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