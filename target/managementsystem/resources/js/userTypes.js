

// FORM VALIDATOR ENGINE
var addUserTypeValidate = new Validator('[name=addUserTypeForm]', [{
        name: 'usertypename', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addUserTypeForm]');
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
            if (result == 'UserType successfully created') {
                form.after('<div class="alert alert-success text-center m-3">UserType successfully created</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('manageUserTypes');
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
var editUserTypeValidate = new Validator('[name=editUserTypeForm]', [{
        name: 'usertypename', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editUserTypeForm]');
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
                        goTo('manageUserTypes');
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


var addUserFunctionValidate = new Validator('[name=addUserFunctionForm]', [
    {
        name: 'usertypename', 
        rules: 'required'
    },{
        name: 'function', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addUserFunctionForm]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {
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
            if (result == 'UserFunction successfully created') {
                form.after('<div class="alert alert-success text-center m-3">UserFunction successfully created</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('userFunction');
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
var addUserTypetoUserValidate = new Validator('[name=addUserTypetoUserForm]', [{
        name: 'username', 
        rules: 'required'
    },
    {
        name: 'usertypename', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addUserTypetoUserForm]');
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
            if (result == 'Usertype successfully added to user') {
                form.after('<div class="alert alert-success text-center m-3">Usertype successfully added to user</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('UsertoType');
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
var editUserTypetoUserValidate = new Validator('[name=editUserTypetoUserForm]', [{
        name: 'username', 
        rules: 'required'
    },
    {
        name: 'usertypename', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editUserTypetoUserForm]');
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
                        goTo('usertoType');
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
