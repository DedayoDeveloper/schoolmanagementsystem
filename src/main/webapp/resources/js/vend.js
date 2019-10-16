
// FORM VALIDATOR ENGINE
var vendValidate = new Validator('[name=vendForm]', [{
        name: 'srcAccount',
        rules: 'required'
    },
    {
        name: 'network',
        rules: 'required'
    },
    {
        name: 'phone',
        rules: 'required'
    }, {
        name: 'amount',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=form_bill]');
    if (errors.length > 0) {
        //Form validation Failled
        // Do nothing
        form.find('.is-invalid').removeClass('is-invalid');
        form.find('.errors').remove();
        errors.forEach(function(elem, index){
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small>');
            if(index === 0)
                $(errors[0].element)[0].focus();
        });
        
        
        console.log('error');
    } else {
        //Form validation Passed
        form.find('.is-invalid').removeClass('is-invalid');
        form.find('.errors').remove();
//        $('#payBillsModal').modal('toggle');
        var form = $(this).closest('form');
        form.find('.errs').remove();
        var data = form.serialize();
        var url = form.attr('action');
        $.get(url, data, function (result) {
            form[0].reset();
            $('#result1').html(result);
        });
    }
});
//
//$(document).on('click', '#continuevend', function (e) {
//    e.preventDefault();
//    
//});