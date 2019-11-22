    var validate = new Validator('[name=editPayment]', [
        {
            name: 'account_name',
            rules: 'required'
        },
        {
            name: 'bank_code',
            rules: 'required'
        },
        {
            name: 'account_numbers',
            rules: 'required|numeric'
        },
        {
            name: 'amount',
            rules: 'required|numeric'
        },
        {
            name: 'narrations',
            rules: 'required'
        }

    ], function (errors, event) {
        event.preventDefault();

//        console.log(errors);
        if (errors.length > 0) {
            //Form validation Failled
            // Do nothing
            var form = $('[name=editPayment]');
            form.find('.is-invalid').removeClass('is-invalid');
            form.find('.errors').remove();
            $(errors[0].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[0].message + '</small>');
            $(errors[0].element)[0].focus();
            console.log('error');
        } else {
            //Form validation Passed
            var form = $('[name=editPayment]');
            var fileid = $('#viewPaymentId').val();
            console.log(fileid);
            form.find('.is-invalid').removeClass('is-invalid');
            form.find('.errors').remove();
            var dataVal = form.serialize();
            form.hide('fast');  
            $.post("updatePayment", dataVal, function (result) {
                console.log(result);
                if (result === 'Successful') {
                    $('#display').html('<div class="alert alert-success mx-auto">' + result + '</div>');
                    //form[0].reset();
                    $('#Editmodal').modal('hide');
                    setTimeout(function () {
                        $('#result1').html(spinner);
                        goTo('viewPayments/'+fileid);
                    }, 2000);
             
                } else {

                    $('#display').html('<div class="alert alert-danger mx-auto">' + result + '</div>');
                    form.show();
                    setTimeout(function () {
                        $('#display').html("");
                        $('#viewPayments').trigger('click');
                    }, 2000);
                }
            });
        }
    });//Validation ends here
$(document).on('submit', '[name=activatePayment]', function (e) {
        e.preventDefault();
        var form = $(this);
        var fileid = $('#viewPaymentId').val();
        var modal = form.closest('.modal');
        var modalFooter = modal.find('.modal-footer');
        modalFooter.hide('fast');
        var dataVal = form.serialize();
        $.post("activatePayment", dataVal, function (result) {
            if (result === 'Successful') {
                $('#act_display').html('<div class="alert alert-success">' + result + '</div>');
                setTimeout(function () {
                    modal.modal('hide');
                    goTo('viewPayments/'+fileid);
                }, 3000);
            } else {
                $('#act_display').html('<div class="alert alert-danger mx-auto">' + result + '</div>');
                form.show();
                setTimeout(function () {
                    goTo('viewPayments/'+fileid);
                }, 3000);
            }
        });
    });
    $(document).on('submit', '[name=suspendPayment]', function (e) {
        e.preventDefault();
        var form = $(this);
        var fileid = $('#viewPaymentId').val();
        var modal = form.closest('.modal');
        var modalFooter = modal.find('.modal-footer');
        modalFooter.hide('fast');
        var dataVal = form.serialize();
        $.post("suspendPayment", dataVal, function (result) {
            if (result === 'Successful') {
                $('#sus_display').html('<div class="alert alert-success">' + result + '</div>');
                setTimeout(function () {
                    modal.modal('hide');
                    goTo('viewPayments/'+fileid);
                }, 3000);
            } else {
                $('#sus_display').html('<div class="alert alert-danger mx-auto">' + result + '</div>');
                form.show();
                setTimeout(function () {
                    goTo('viewPayments/'+fileid);
                }, 3000);
            }
        });
    });
 $(document).ready(function () {
//        $('[data-bind-link]').click(function () {
//            var dataval = $(this).attr('data-bind-link');
//            $(dataval).trigger('click');
//        });
        $(document).on('show.bs.modal','#Editmodal', function (event) {
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
    });

