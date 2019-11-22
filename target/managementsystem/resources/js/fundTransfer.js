

var fundTransferValidate = new Validator('[name=fund_transfer]', [
    {
        name: 'srcAccount',
        rules: 'required'
    },
     {
        name: 'acctNumber',
        rules: 'required'
    },
     {
        name: 'finInst',
        rules: 'required'
    },
     {
        name: 'purpose',
        rules: 'required'
    }, 
    {
        name: 'amount',
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=fund_transfer]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {
        //Form validation Failled
        // Do nothing
        errors.forEach(function (elem, index) {
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small>');
            if (index === 0)
                $(errors[0].element).focus();
        });
    } else {
        //Form validation Passed
        form.hide('fast');
        var data = form.serialize();
        $.post(form.attr('action'), data, function (result) {
            if (result === 'Successful') {
                form.after('<div class="alert alert-success text-center m-3">Fund Successfully Transfered</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                    form.show('fast');
                    goTo('fundTransfer');
                }, 3000);
            } else {
                form.after('<div class="alert alert-danger text-center m-3">' + 'Failed to fund! Try again' + '</div>');
                setTimeout(function () {
                    form.next().remove();
                    form.show('fast');
                }, 3000);
            }

        });
    }
});



