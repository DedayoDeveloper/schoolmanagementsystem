// FORM VALIDATOR ENGINE
var addNewApproverValidate = new Validator('[name=addNewApproverForm]', [{
        name: 'username', 
        rules: 'required'
    },
    {
        name: 'walletnumber',
        rules: 'required'
    },
    {
        name: 'approvalLevel',
        rules: 'required'
    },
    {
        name: 'approvalLimit',
        rules: 'required'
    },
    {
        name: 'institutioncode',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addNewApproverForm]');
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
        var codeIn = $('[name=institutioncode]').val();
                           console.log(codeIn);

        $.post(form.attr('action'), data, function (result) {
            console.log(result);
            if (result === 'Approver successfully created') {
                form.after('<div class="alert alert-success text-center m-3">Approver successfully created</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('approvalLevel/'+ codeIn);
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
