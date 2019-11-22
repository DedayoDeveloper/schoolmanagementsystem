

// FORM VALIDATOR ENGINE
var createPageValidate = new Validator('[name=addPageForm]', [{
        name: 'label', 
        rules: 'required'
    },
    {
        name: 'urlmappping', 
        rules: 'required'
    },
    {
        name: 'labeltitle', 
        rules: 'required'
    },
    {
        name: 'labelicon', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addPageForm]');
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
            if (result == 'Page successfully added') {
                form.after('<div class="alert alert-success text-center m-3">Page successfully added</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('pages');
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


// FORM VALIDATOR ENGINE
var editPageValidate = new Validator('[name=editPageForm]', [{
        name: 'label', 
        rules: 'required'
    },
    {
        name: 'urlmappping', 
        rules: 'required'
    },
    {
        name: 'labeltitle', 
        rules: 'required'
    },
    {
        name: 'labelicon', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editPageForm]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {
        errors.forEach(function(elem, index){
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small> ');
            if(index === 0)
                $(errors[0].element)[0].focus();
        });
    } else {
        form.hide('fast');
        var data = form.serialize();
        $.post(form.attr('action'), data, function (result) {
            console.log(result);
            if (result === 'Successful') {
                form.after('<div class="alert alert-success text-center m-3">Successful</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('pages');
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

