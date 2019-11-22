// Validation starts//
var validate = new FormValidator('editPayment', [
    {
        name: 'first_name',
        rules: 'required'
    },
    {
        name: 'last_name',
        rules: 'required'
    },
    {
        name: 'bank_name',
        rules: 'required'
    },
    {
        name: 'account_number',
        rules: 'required|numeric'
    },
    {
        name: 'amount',
        rules: 'required|numeric'
    },
    {
        name: 'narration',
        rules: 'required'
    }

], function (errors, event) {
    event.preventDefault();
    var form = $('[name=editPayment]');
    if (errors.length > 0) {
        //Form validation Failled
        // Do nothing
        form.find('.is-invalid').removeClass('is-invalid');
        form.find('.errors').remove();
        $(errors[0].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[0].message + '</small>');
        $(errors[0].element)[0].focus();
    } else {
        //Form validation Passed
        form.find('.is-invalid').removeClass('is-invalid');
        form.find('.errors').remove();
        var dataVal = form.serialize();
        $.post("updatePayment", dataVal, function (result) {
            // form[0].reset();
            // console.log(mhval);
            if (result === 'Successful') {
                // myDisplay.text('Successful');
                //modalhead.html('<h2 class="text-center">' + result + '</h2>');
                $('#display').html('<div class="alert alert-success mx-auto">' + result + '</div>');
                form[0].reset();
                setTimeout(function () {

                }, 2000);
                window.location.reload(true);
            } else {

                $('#display').html('<div class="alert alert-danger mx-auto">' + result + '</div>');
                form.show();
                setTimeout(function () {
                    $('#display').html("");
                }, 2000);
            }
            // $('#display').remove();
        });
    }
});//Validation ends here

$(document).on('submit', '[name=activatePayment]', function (e) {
    e.preventDefault();
    var form = $(this);
    var dataVal = form.serialize();
    $.post("activatePayment", dataVal, function (result) {
        // form[0].reset();
        // console.log(mhval);
        if (result === 'Successful') {
            // myDisplay.text('Successful');
            //modalhead.html('<h2 class="text-center">' + result + '</h2>');
            $('#act_display').html('<div class="alert alert-success mx-auto">' + 'Activation' + ' ' + result + '</div>');
            form[0].reset();
            setTimeout(function () {

            }, 2000);
            window.location.reload(true);
        } else {

            $('#act_display').html('<div class="alert alert-danger mx-auto">' + 'Activation' + ' ' + result + '</div>');
            form.show();
            setTimeout(function () {
                $('#act_display').html("");
            }, 2000);
        }
        // $('#display').remove();
    });
});
$(document).on('submit', '[name=deletePayment]', function (e) {
    e.preventDefault();
    var form = $(this);
    var dataVal = form.serialize();
    $.post("deletePayment", dataVal, function (result) {
        // form[0].reset();
        // console.log(mhval);
        if (result === 'Successful') {
            // myDisplay.text('Successful');
            //modalhead.html('<h2 class="text-center">' + result + '</h2>');
            $('#del_display').html('<div class="alert alert-success mx-auto">' + result + '</div>');
            form[0].reset();
            setTimeout(function () {

            }, 2000);
            window.location.reload(true);
        } else {

            $('#del_display').html('<div class="alert alert-danger mx-auto">' + result + '</div>');
            form.show();
            setTimeout(function () {
                $('#del_display').html("");
            }, 2000);
        }
        // $('#display').remove();
    });
});
$(document).on('submit', '[name=suspendPayment]', function (e) {
    e.preventDefault();
    var form = $(this);
    var dataVal = form.serialize();
    console.log(dataVal);
    $.post("suspendPayment", dataVal, function (result) {
        console.log(result);
        // form[0].reset();
        // console.log(mhval);
        if (result === 'Successful') {
            // myDisplay.text('Successful');
            //modalhead.html('<h2 class="text-center">' + result + '</h2>');
            $('#sus_display').html('<div class="alert alert-success mx-auto">' + result + '</div>');
            form[0].reset();
            setTimeout(function () {

            }, 2000);
            window.location.reload(true);
        } else {

            $('#sus_display').html('<div class="alert alert-danger mx-auto">' + result + '</div>');
            form.show();
            setTimeout(function () {
                $('#sus_display').html("");
            }, 2000);
        }
        // $('#display').remove();
    });
});


$(document).on('show.bs.modal', '#Editmodal', function (event) {
    button = $(event.relatedTarget);
    var id = button.data('id');
//                    var first_name = button.data('first_name');
    var account_name = button.data('account_name');
    var bank_code = button.data('bank_code');
    var account_numbers = button.data('account_numbers');
    var amount = button.data('amount');
    var narrations = button.data('narrations');

    var modal = $(this);
    // modal.find('[name=rc]').val(rc);
    modal.find('[name=id]').val(id);
//                    modal.find('[name=first_name]').val(first_name);
    modal.find('[name=account_name]').val(account_name);
    modal.find('[name=bank_code]').val(bank_code);
    modal.find('[name=account_numbers]').val(account_numbers);
    modal.find('[name=amount]').val(amount);
    modal.find('[name=narrations]').val(narrations);
});
$(document).on('show.bs.modal','#activateModal', function (event) {
    button = $(event.relatedTarget);
    var id = button.data('id');
    var modal = $(this);
    modal.find('[name=id]').val(id);
});
$(document).on('show.bs.modal', '#suspendModal', function (event) {
    button = $(event.relatedTarget);
    var id = button.data('id');
    var modal = $(this);
    modal.find('[name=id]').val(id);
});
$(document).on('show.bs.modal', '#deleteModal', function (event) {
    button = $(event.relatedTarget);
    var id = button.data('id');
    var modal = $(this);
    modal.find('[name=id]').val(id);
});
