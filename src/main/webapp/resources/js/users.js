
// FORM VALIDATOR ENGINE
var changePasswordforFirstTimeLogin = new Validator('[name="changePasswordForm"]', [{
        name: 'oldpassword', 
        rules: 'required'
    },
    {
        name: 'newpassword',
//        rules: 'required|matches(confirmpassword)|strictPassword'

        rules: 'required|matches(confirmpassword)'
    },
    {
        name: 'confirmpassword',
        rules: 'required|matches(newpassword)'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name="changePasswordForm"]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {
        errors.forEach(function(elem, index){
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small>');
            if(index === 0)
                $(errors[0].element).focus();
        });
    } else {
        form.hide('fast');
        var data = form.serialize();
        $.post(form.attr('action'), data, function (result) {
            if (result === 'Password successfully changed') {
                form.after('<div class="alert alert-success text-center m-3">Password successfully changed</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                    form.show('fast');
                    goTo('welcome');
                }, 3000);
            } else {
                form.after('<div class="alert alert-danger text-center m-3">' + 'Failed update! Try again' + '</div>');
                setTimeout(function () {
                    form.next().remove();
                    form.show('fast');
                }, 3000);
            }
        });
    }
});