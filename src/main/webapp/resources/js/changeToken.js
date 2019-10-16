
// FORM VALIDATOR ENGINE
var cTokenValidate = new Validator('[name=changeToken]', [
    {
        name: 'oToken',
        rules: 'required|exactly[4]|numeric'
    },
    {
        name: 'nToken',
        rules: 'required|numeric|ecactly[4]|matches(cToken)'
    },
    {
        name: 'cToken',
        rules: 'required|matches(nToken)'
    }], function (errors, event) {
    event.preventDefault();
    var form = $('[name=changeToken]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {
        //Form validation Failled
        console.log(errors);
        errors.forEach(function (elem, index) {
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + ' </small>');
            if (index === 0)
                $(errors[0].element)[0].focus();
        });;
    } else {
        //Form validation Passed
        var data = form.serialize();
        form.hide('fast');
        $.post(form.attr('action'), data, function (result) {
            if (result === 'Successful') {
                form.after('<div class="alert alert-success text-center">' + result + '</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                }, 3000);
                window.location = "welcome";
            } else {
                form.after('<div class="alert alert-danger text-center">' + result + '</div>');
                setTimeout(function () {
                    form.show('fast');
                    form.next().remove();
                }, 3000);
            }
        });
    }
});
