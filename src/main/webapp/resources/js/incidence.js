
var logIncidenceValidate = new Validator('[name=new_incidence]', [{
        name: 'title',
        rules: 'required|max[100]'
    },
    {
        name: 'messageBody',
        rules: 'required|max[255]'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=new_incidence]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {
        errors.forEach(function (elem, index) {
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small> ');
            if (index === 0)
                $(errors[0].element)[0].focus();
        });
    } else {
        //Form validation Passed
        form.hide('fast');
        var data = form.serialize();
        console.log(data);
        $.post(form.attr('action'), data, function (result) {
            if (result === 'Successful') {
                form.after('<div class="alert alert-success text-center m-3">Incident Successfully Logged</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                    form.show('fast');
                    $('#incidenceModal').modal('hide');
                    setTimeout(function () {
                        goTo('incidentReport');
                    }, 1000);
                }, 3000);
            } else {
                form.after('<div class="alert alert-danger text-center m-3">' + 'Failed! Try again' + '</div>');
                setTimeout(function () {
                    form.next().remove();
                    form.show('fast');
                }, 3000);
            }

        });
    }
});

$(document).on('click', '#sendresponse', function (e) {
    e.preventDefault();
    if($('[name = message]').val() ===""){
        alert("message cannot be empty");
       return;
    }
    var th = $(this);
    var form = th.closest('form');
    form.hide('fast');
    var dataVal = form.serialize();
    console.log(dataVal);
    var id = $('#id').val();
    console.log('id' + id);
    $.post("sendincidenceresponse", dataVal, function (result) {
        if (result === 'Successful') {
            $('#display_resultRep').html('<p class="alert alert-success text-center">' + 'Message sent' + '</p>');
            setTimeout(function () {
                $('#display_resultRep').html("");
                $('#threadDiv').html("");
                reloadThread(id);
            }, 3000);
//                        $('#incidencereports').trigger('click');
        } else {
            $('#display_resultRep').html('<div class="alert alert-success text-center">' + 'Failed' + '</div>');
        }
    });

});

function reloadThread(id) {
    var url = 'viewIncidence/' + id;
    $.get(url, function (result) {
        $('#threadDiv').html(result);
    });
}

$(document).on('click', '#closeThisIncidence', function (e) {
    e.preventDefault();
//                $('#result1').html(spinner);
    var form = $(this).closest('form');
    console.log(form);
    var dataVal = form.serialize();
    console.log(dataVal);
    var url = 'closeincidence';
    $.post(url, dataVal, function (result) {
        console.log(result);
        $('#footerClose').html("");
        if (result === 'Successful') {
            $('#display_resultInc').html('<p class="alert alert-success text-center">' + 'Successfully closed' + '</p>');
            
            setTimeout(function () {
                $('#display_resultInc').html("");
                form[0].reset();
                $('#closeIncidenceThreadModal').modal('hide');
            }, 3000);

        } else {
            $('#display_resultInc').html('<div class="alert alert-success text-center">' + 'Failed' + '</div>');
        }
    });
});
$(document).on('hidden.bs.modal', '#closeIncidenceThreadModal', function (event) {
    $('#incidencereports').trigger('click');
});

