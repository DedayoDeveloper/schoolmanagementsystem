
$(function () {
    $(document).on('click', '#view_file', function (event) {
        event.preventDefault();
    });
    $(document).on('show.bs.modal', '#approvePayment', function (event) {
        var button = $(event.relatedTarget);
        var file_id = button.data('file_id');
        var modal = $(this);
        modal.find('[name=fileid]').val(file_id);
    });
    $(document).on('show.bs.modal', '#rejectPayment', function (event) {
        var button = $(event.relatedTarget);
        var file_id = button.data('file_id');

        var modal = $(this);
        modal.find('[name=fileid]').val(file_id);
    });
});