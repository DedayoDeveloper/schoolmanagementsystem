// FORM VALIDATOR ENGINE
var resetPasswordValidate = new Validator('[name=resetPasswordForm]', [{
        name: 'username', 
        rules: 'required'
    },
    {
        name: 'nPassword', 
        rules: 'required|matches(cPassword)'
    },
    {
        name: 'cPassword',
        rules: 'required|matches(nPassword)'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=resetPasswordForm]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {
        //Form validation Failled
        // Do nothing
        errors.forEach(function(elem, index){
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small> ');
            if(index === 0)
                $(errors[0].element)[0].focus();
        });
//        console.log('error');
    } else {
        //Form validation Passed
        form.hide('fast');
        var data = form.serialize();
        $.post(form.attr('action'), data, function (result) {
            console.log(result);
            if (result == 'Password Successfully Reset') {
                form.after('<div class="alert alert-success text-center m-3">Password Successfully Reset</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('resetPassword');
                }, 3000);
            } else {
                form.after('<div class="alert alert-danger text-center m-3">' + 'Failed ! Try again' + '</div>');
                setTimeout(function () {
                    form.next().remove();
                    form.show('fast');
                }, 3000);
            }
        });
    }
});


