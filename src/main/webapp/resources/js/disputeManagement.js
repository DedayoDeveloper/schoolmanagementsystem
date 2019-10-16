/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $(document).on('click', '#subDispute', function (e) {
        e.preventDefault();
        var th = $(this);
        var form = th.closest('form');
        form.hide('fast');
        var dataVal = form.serialize();
        $.post("logDispute", dataVal, function (result) {
//            console.log(result);
            if (result === 'Successful') {
                $('#log_result').html('<div class="alert alert-success mx-auto">' + result + '</div>');
                form[0].reset();
                setTimeout(function () {
                }, 2000);
                window.location.reload(true);
            } else {
                $('#log_result').html('<div class="alert alert-danger mx-auto">' + result + '</div>');
                form.show();
                setTimeout(function () {

                }, 2000);
            }
            // $('#display').remove();
        });

    });

    $(document).on('click','#submit_dispute',function (e) {
        e.preventDefault();
        var th = $(this);
        var form = th.closest('form');
        form.hide('fast');
        var dataVal = form.serialize();
        console.log(dataVal);
        $.post("updateDispute", dataVal, function (result) {
            if (result === 'Successful') {
                $('#update_display').html('<div class="alert alert-success mx-auto">' + result + '</div>');
                form[0].reset();
//                setTimeout(function () {
//                }, 2000);
                window.location.reload(true);
            } else {
                $('#update_display').html('<div class="alert alert-danger mx-auto">' + result + '</div>');
                form.show();
//                setTimeout(function () {
//                }, 2000);
            }
            // $('#display').remove();
        });

    });
    $(document).on('show.bs.modal','#updateModal', function (event) {
        button = $(event.relatedTarget);
        var session_id = button.data('session_id');
        var description = button.data('description');
        var modal = $(this);
        modal.find('[name=session_id]').val(session_id);
        modal.find('[name=description]').val(description);
    });
});
