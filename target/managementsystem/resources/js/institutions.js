

// FORM VALIDATOR ENGINE
var addFinancialInstitutionValidate = new Validator('[name=addFinancialInstitutionForm]', [{
        name: 'code', 
        rules: 'exactly[6]'
    },
    {
        name: 'name',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addFinancialInstitutionForm]');
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
            if (result == 'Financial Institution successfully added') {
                form.after('<div class="alert alert-success text-center m-3">Financial Institution successfully added</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('managePartnerInstitutions');
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
var editFinancialInstitutionValidate = new Validator('[name=editFinancialInstitutionForm]', [{
        name: 'code', 
        rules: 'exactly[6]'
    },
    {
        name: 'name',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editFinancialInstitutionForm]');
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
            if (result === 'Successful') {
                form.after('<div class="alert alert-success text-center m-3">Successful</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('managePartnerInstitutions');
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



