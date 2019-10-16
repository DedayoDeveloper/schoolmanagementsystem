var changetimeOutForm = new Validator('[name = activitySummaryForm]',
        [
            {name: "fromDate", rules: 'required'},
            {name: "toDate", rules: 'required'}

        ], function (errors, event) {
    event.preventDefault();
    var form = $('[name=activitySummaryForm]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {

        //Form validation Failled
        console.log(errors);
        errors.forEach(function (elem, index) {
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + ' </small>');
            if (index === 0)
                $(errors[0].element)[0].focus();
        });
    } else {

        var form = $('[name=activitySummaryForm]');
        var transactiontimeout = $('#fromDate').val();
        var callhometime = $('#toDate').val();
        var url = form.attr("action");
        var dataVal = form.serialize();
        console.log(url);
        console.log(transactiontimeout);
        console.log(dataVal);
        form.hide('slow');
        $.ajax({
            url: url,
            method: "post",
            data: dataVal
        }).done(function () {
                    goTo('activities2');

        }); 
    }
});


var transactionreportForm = new Validator('[name = transactionreportForm]',
        [
            {name: "responseCode", rules: 'required'},
            {name: "fromDate", rules: 'required'},
            {name: "toDate", rules: 'required'}

        ], function (errors, event) {
    event.preventDefault();
    var form = $('[name=transactionreportForm]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {

        //Form validation Failled
        console.log(errors);
        errors.forEach(function (elem, index) {
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + ' </small>');
            if (index === 0)
                $(errors[0].element)[0].focus();
        });
    } else {

        var form = $('[name=transactionreportForm]');
        var responsecode = $('#responseCode').val();
        var transactiontimeout = $('#fromDate').val();
        var callhometime = $('#toDate').val();
        var url = form.attr("action");
        var dataVal = form.serialize();
        console.log(url);
        console.log(transactiontimeout);
        console.log(dataVal);
        form.hide('slow');
        $.ajax({
            url: url,
            method: "post",
            data: dataVal
        }).done(function () {
                    goTo('gettransactionreport'); 

        }); 
    }
});



/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


