// FORM VALIDATOR ENGINE
    var bPValidate = new Validator('[name=form_bill]', [
        {
            name: 'biller',
            display: 'Biller',
            rules: 'required'
        }, 
//        {
//            name:'srcAccount',
//            display:'Source Account',
//            rules:'required'
//        },
        {
            name: 'amount',
            display: 'Amount',
            rules: 'required'
        }, {
            name: 'billerinfo',
            display: 'Biller info',
            rules: 'required'
        }, {
            name: 'phone',
            display: 'Phone Number',
            rules: 'required|numeric'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        if (errors.length > 0) {
            //Form validation Failled
            // Do nothing
            var form = $('[name=form_bill]');
            form.find('.is-invalid').removeClass('is-invalid');
            form.find('.errors').remove();
            $(errors[0].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[0].message + '</small>');
            $(errors[0].element)[0].focus();
            console.log('error');
        } else {
            //Form validation Passed
//            goTo("continueBillsPayment");
            var form = $('[name=form_bill]');
                    form.find('.errs').remove();
                    var data = form.serialize();
                    console.log(data);
                    var url = form.attr('action');
                    console.log('url'+url);
                    $.get(url, data, function (result) {
                        form[0].reset();
                        $('#result1').html(result);
                    });
        }
    });
    
    
    $(function () {
        $(document).on('click', '.pay_bill', function (event) {
            event.preventDefault();
            //FINDS THE FORM AND SUBMIT IT 
            $(this).closest('form').submit();
            // $(this).closest('form').find('.submit_af').submit();
        });

        $(document).on('click', '.screen-1-billers', function (event) {
            event.preventDefault();
            var biller = $(this).data('loc');
            console.log(biller);
//            $('.biller-name').val(biller).trigger('change');
            goTo("bills/?billername="+biller);
//            $('.screen-1').hide();
//            console.log('buhihuhhoijjio');
//            $('.screen-2').show();
        });
        $(document).on('click','.btn-screen-3', function (event) {
            $('.screen-2').hide();
            // Sending to payBill
            var url = "payBill";
            var data = $('[name=form_bill]').serialize();
            $.post(url, data, function (result) {
                window.location.reload(true);
                console.log(result);
            });
//            $('.screen-3').show();
        });
        $(document).on('click', '.bills_back', function (event) {
            var btnParent = $(this).closest('.col-md-6');
            btnParent.parent().children().hide();
            console.log(btnParent.parent().first());
            btnParent.parent().children().first().show();
        });
    });