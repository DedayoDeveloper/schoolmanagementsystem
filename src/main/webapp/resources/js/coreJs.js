///* 
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
var spinner = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin" aria-hidden="true" style="font-size:100px;"></i></div>`;
//
//
//var validateRegistrationForm = new Validator('[name = registrationForm]',
//        [
//            {name: "username", rules: 'required'},
//            {name: "firstname", rules: 'required'},
//            {name: "lastname", rules: 'required'},
//            {name: "bvn", rules: 'exactly(11)'},
//            {name: "password", rules: 'required'},
//            {name: "password2", rules: 'required|matches(password)'},
//            {name: "token", rules: 'required|exactly(4)'},
//            {name: "tokenconfirm", rules: 'required|matches(token)'},
//            {name: "phonenumber", rules: 'required'}
//
//        ], function (errors, event) {
//    event.preventDefault();
//    var form = $('[name=registrationForm]');
//    form.find('.is-invalid').removeClass('is-invalid');
//    form.find('.errors').remove();
//    if (errors.length > 0) {
//
//        //Form validation Failled
//        console.log(errors);
//        errors.forEach(function (elem, index) {
//            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + ' </small>');
//            if (index === 0)
//                $(errors[0].element)[0].focus();
//        });
//    } else {
//
//        var form = $('[name=registrationForm]');
//        var username = $('#username').val();
//        var password = $('#passwordreg').val();
//        var url = form.attr("action");
//        var dataVal = form.serialize();
//        console.log(url);
//        console.log(dataVal);
//        console.log(username);
//        console.log(password);
//        $('#divForRegisterResult').html(spinner);
//        form.hide('slow');
//        $.ajax({
//            url: url,
//            method: "post",
//            data: dataVal
//        }).done(function (result) {
//            if (result === "00") {
//                firsttimelogin(form, username, password);
//            } else {
//                console.log(result);
//                $('#divForLoginResult').html(`<div class="alert alert-danger text-center font-weight-bold">Error Occured</div>`);
//                setTimeout(function () {
//                    $('#divForLoginResult').html("");
//                }, 6000);
//
//                form.next().remove();
//                form.show('fast');
//
//            }
//        });
//    }
//});
//function firsttimelogin(form, username, password) {
//    $.ajax({
//        url: 'login',
//        method: "post",
//        data: {username: username, password: password}
//    }).done(function (result) {
//        if (result === "00") {
//            window.location = 'services';
//        } else {
//            console.log(result);
//            $('#divForLoginResult').html(`<div class="alert alert-danger text-center font-weight-bold">Error Occured</div>`);
//            setTimeout(function () {
//                $('#divForLoginResult').html("");
//            }, 3000);
//
//            form.next().remove();
//            form.show('fast');
//
//        }
////            $("#servicesDynamicDiv").html(result);
//    });
//}
//
//$(document).ready(function () {
//    $(document).on('click', '.dashboardroute', function (event) {
//        event.preventDefault();
//        var url = $(this).attr("href");
//        console.log(url);
//        $('#servicesDynamicDiv').html(spinner);
//        $.ajax({
//            url: url,
//            method: "post"
//        }).done(function (result) {
//            $("#servicesDynamicDiv").html(result);
//        });
//    });
//
//    $(document).on('click', '#btnLogMeIn', function (event) {
//        event.preventDefault();
//        var form = $('[name=myLoginForm]');
//        var url = form.attr("action");
//        var dataVal = form.serialize();
//        console.log(url);
//        console.log(dataVal);
//        form.hide('slow');
//        $('#divForLoginResult').html(spinner);
//        $.ajax({
//            url: url,
//            method: "post",
//            data: dataVal
//        }).done(function (result) {
//            if (result === "00") {
//                setTimeout(function () {
//                    window.location = 'services';
//
//                }, 3000);
//            } else {
//                $('#divForLoginResult').html(`<div class="alert alert-danger text-center font-weight-bold">Username or password incorrect</div>`);
//                setTimeout(function () {
//                    $('#divForLoginResult').html("");
//                }, 3000);
//
//                form.next().remove();
//                form.show('fast');
////                alert('wrong password');
//            }
////            $("#servicesDynamicDiv").html(result);
//        });
//    });
//});
//

function checkZero(evt, elem) {
    var val = $(elem).val();
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if ((val === "" && charCode === 48) || (parseInt(val) === 0 && charCode === 48)) {
        evt.preventDefault();
    }
    if (parseInt(val) === 0)
        $(elem).val("");
    //        console.warn("Leading Zero: "+val+" & Value: "+val);
}

function isNumberKey(evt, elem) {
    checkZero(evt, elem);
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

$(document).on('click', '#addTenantbtn', function (event) {
    event.preventDefault();
    var form = $('[name=createTenantForm]');
    var url = form.attr("action");
    var dataVal = form.serialize();
    console.log("data Value: " + dataVal);
    console.log(url);
    $('#addTenantDiv').html(spinner);
    form.hide('slow');
    $.ajax({
        url: url,
        method: "post",
        data: dataVal
    }).done(function (result) {
        if (result === "00") {
            $('#addTenantDiv').html(`<div class="alert alert-info text-center font-weight-bold">Tenancy Created</div>`);
            setTimeout(function () {
                $('#addTenant').modal('hide');
                form.show('fast');
            }, 2000);
        } else {
            console.log(result);
            $('#addTenantDiv').html(`<div class="alert alert-danger text-center font-weight-bold">Error Occured</div>`);
            form.show('fast');
            setTimeout(function () {
                $('#addTenantDiv').html("");
                $('#addTenant').modal('hide');
            }, 2000);

            form.show('fast');

        }
    });
    
      
});
           