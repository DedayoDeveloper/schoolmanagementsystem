// FORM VALIDATOR ENGINE
var editBillerInfoValidate = new Validator('[name=editBillerInfoForm]', [{
        name: 'code', 
        rules: 'required'
    },
    {
        name: 'account', 
        rules: 'required' 
    },
    {
        name: 'fee',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editBillerInfoForm]');
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
                        goTo('billers');
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
var addBillerInfoValidate = new Validator('[name=addBillerInfoForm]', [{
        name: 'code', 
        rules: 'required'
    },
    {
        name: 'name', 
        rules: 'required'
    },
    {
        name: 'bankCode', 
        rules: 'required|max[3]'
    },
    {
        name: 'account', 
        rules: 'required'
    },
    {
        name: 'fee', 
        rules: 'required'
    },
    {
        name: 'vasId',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addBillerInfoForm]');
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
            if (result === 'Biller successfully created') {
                form.after('<div class="alert alert-success text-center m-3">Biller successfully added</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('billers');
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

var editTerminalValidate = new Validator('[name=editTerminalInforForm]', [{
        name: 'merchant_id', 
        rules: 'required'
    },
    {
        name: 'currency_code', 
        rules: 'required'
    },
    {
        name: 'country_code', 
        rules: 'required'
    },
    {
        name: 'merchant_category', 
        rules: 'required'
    },
    {
        name: 'address',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editTerminalInforForm]');
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
                        goTo('reports/terminalreports');
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
var addTerminalInfoValidate = new Validator('[name=addTerminalForm]', [
    {
        name: 'merchant_id', 
        rules: 'required'
    }
    ,
    {
        name: 'timeout', 
        rules: 'required'
    }
    ,
    { 
        name: 'callhome', 
        rules: 'required'
    }
//    ,
//    {
//        name: 'countrycode', 
//        rules: 'required|max[3]'
//    },
//     {
//        name: 'merchanttoken', 
//        rules: 'required|max[40]'
//    },
//     {
//        name: 'merchantkey', 
//        rules: 'required|max[40]'
//    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addTerminalForm]');
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
            if (result.length > 0) {
                form.after('<div class="alert alert-success text-center m-3">Terminal successfully added<br>'+result+'</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('reports/terminalreports');
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

var editPosClusterInfo = new Validator('[name=editPosClusterInfo]', [{
        name: 'nodename', 
        rules: 'required'
    },
    {
        name: 'kek', 
        rules: 'required'
    },
    {
        name: 'keycheckvalue', 
        rules: 'required'
    },
    {
        name: 'nodetype', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editPosClusterInfo]');
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
                        goTo('poscluster');
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


var addPosClusterInfo = new Validator('[name=addPosClusterInfo]', [{
        name: 'nodename', 
        rules: 'required'
    },
    {
        name: 'kek', 
        rules: 'required'
    },
    {
        name: 'keycheckvalue', 
        rules: 'required'
    },
    {
        name: 'nodetype', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addPosClusterInfo]');
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
            if (result === 'POS Cluster successfully created') {
                form.after('<div class="alert alert-success text-center m-3">Successful</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('poscluster');
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


var editProduct = new Validator('[name=editProductForm]', [{
        name: 'biller_identification_code', 
        rules: 'required'
    },
    {
        name: 'product_name', 
        rules: 'required'
    },
    {
        name: 'product_amount', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editProductForm]');
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
                        goTo('product');
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


var addProduct = new Validator('[name=addProductForm]', [{
        name: 'biller_identification_code', 
        rules: 'required'
    },
    {
        name: 'product_identification_code', 
        rules: 'required'
    },
    {
        name: 'product_name', 
        rules: 'required'
    },
    {
        name: 'product_amount', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addProductForm]');
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
            if (result === 'Product successfully created') {
                form.after('<div class="alert alert-success text-center m-3">Successful</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('product');
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

var editProvider = new Validator('[name=editVasProviderForm]', [
    {
        name: 'providername', 
        rules: 'required'
    },
    {
        name: 'machineip', 
        rules: 'required'
    },
    {
        name: 'machineport', 
        rules: 'required'
    },
    {
        name: 'treatmentflag', 
        rules: 'required'
    },
    {
        name: 'providerkey', 
        rules: 'required'
    },
    {
        name: 'checkvalue', 
        rules: 'required'
    },
    {
        name: 'connectiontype', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editVasProviderForm]');
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
                        goTo('provider');
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

var addVasProvider = new Validator('[name=addVasProviderForm]', [{
        name: 'providerid', 
        rules: 'required'
    },
    {
        name: 'providername', 
        rules: 'required'
    },
    {
        name: 'machineip', 
        rules: 'required'
    },
    {
        name: 'machineport', 
        rules: 'required'
    },
    {
        name: 'treatmentflag', 
        rules: 'required'
    },
    {
        name: 'providerkey', 
        rules: 'required'
    },
    {
        name: 'checkvalue', 
        rules: 'required'
    },
    {
        name: 'connectiontype', 
        rules: 'required'
    }
], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addVasProviderForm]');
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
            if (result === 'VAS provider successfully created') {
                form.after('<div class="alert alert-success text-center m-3">Successful</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('provider');
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
var addUser = new Validator('[name=addUser]', [{
        name: 'username', 
        rules: 'required'
    },
    {
        name: 'password', 
//        rules: 'required|strictPassword'
        rules: 'required'
    },
    {
        name: 'fname', 
        rules: 'required'
    },
    {
        name: 'sname', 
        rules: 'required'
    },
    {
        name: 'pnum', 
        rules: 'required'   
    },
    {
        name: 'role', 
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addUser]');
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
                form.after('<div class="alert alert-success text-center m-3"> User successfully added </div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('users');
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
var editUser = new Validator('[name=editUserForm]', [{
        name: 'username', 
        rules: 'required'
    },
//    {
//        name: 'password', 
//        rules: 'required'
//    },
    {
        name: 'fname', 
        rules: 'required'
    },
    {
        name: 'sname', 
        rules: 'required'
    },
    {
        name: 'phonenumber', 
        rules: 'required'
    },
    {
        name: 'role', 
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editUserForm]');
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
                form.after('<div class="alert alert-success text-center m-3"> User detail successfully updated</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('users');
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
var addMerchantInfo = new Validator('[name=addMerchantForm]', [{
        name: 'merchanttoken', 
        rules: 'required'
    },
    {
        name: 'merchant_category', 
        rules: 'required'
    },
    {
        name: 'merchantkey', 
        rules: 'required'
    },
    {
        name: 'countrycode', 
        rules: 'required'
    },
    {
        name: 'currencycode', 
        rules: 'required'
    },
    {
        name: 'address', 
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addMerchantForm]');
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
            if (result == 'Merchant successfully created') { 
                form.after('<div class="alert alert-success text-center m-3">Merchant successfully added</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('merchant');
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

//var addMerchantInformation = new Validator('[name=addMerchantInformationForm]', [{
//        name: 'merchant_id', 
//        rules: 'required'
//    },
//    {
//        name: 'merchant_category', 
//        rules: 'required'
//    },
//    {
//        name: 'city', 
//        rules: 'required'
//    },
//    {
//        name: 'countrycode', 
//        rules: 'required'
//    },
//    {
//        name: 'currencycode', 
//        rules: 'required'
//    },
//    {
//        name: 'address', 
//        rules: 'required'
//    }], function (errors, event) {
//    event.preventDefault();
//    console.log(errors);
//    var form = $('[name=addMerchantInformationForm]');
//    form.find('.is-invalid').removeClass('is-invalid');
//    form.find('.errors').remove();
//    if (errors.length > 0) {
//        //Form validation Failled
//        // Do nothing
//        errors.forEach(function(elem, index){
//            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small> ');
//            if(index === 0)
//                $(errors[0].element)[0].focus();
//        });
////        console.log('error');
//    } else {
//        //Form validation Passed
//        form.hide('fast');
//        var data = form.serialize();
//        $.post(form.attr('action'), data, function (result) {
//            console.log(result);
//            if (result == 'Merchant successfully created') { 
//                form.after('<div class="alert alert-success text-center m-3">Merchant successfully added</div>');
//                setTimeout(function () {
//                    form[0].reset();
//                    form.next().remove();
//                        goTo('merchant');
//                }, 3000);
//            } else {
//                form.after('<div class="alert alert-danger text-center m-3">' + 'Failed ! Try again' + '</div>');
//                setTimeout(function () {
//                    form.next().remove();
//                    form.show('fast');
//                }, 3000);
//            }
//        });
//    }
//});

var addTerminalInformationValidate = new Validator('[name=addTerminalInformationForm]', [
    {
        name: 'merchant_id',
        rules: 'required'
    }
    ,
    {
        name: 'terminal_id',
        rules: 'required'
    }
//    ,
//    {
//        name: 'timeout',
//        rules: 'required'
//    },
//    {
//        name: 'callhome',
//        rules: 'required'
//    }

], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addTerminalInformationForm]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {
        errors.forEach(function (elem, index) {
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small> ');
            if (index === 0)
                $(errors[0].element)[0].focus();
        });
    } else {
        form.hide('fast');
        var data = form.serialize();
        var url = 'addTerminalInformation';
        $.post(url, data, function (result) {
            console.log("the result from controller is " + result);
            if (result.length > 0) {
                form.after('<div class="alert alert-success text-center m-3">Terminal successfully added<br>' + result + '</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                    goTo('terminalnorandomterminalid');
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

var addMerchantInformation = new Validator('[name=addMerchantInformationForm]', [{
        name: 'merchant_id', 
        rules: 'required'
    },
    {
        name: 'merchant_category', 
        rules: 'required'
    },
    {
        name: 'city', 
        rules: 'required'
    },
    {
        name: 'countrycode', 
        rules: 'required'
    },
    {
        name: 'currencycode', 
        rules: 'required'
    },
    {
        name: 'address', 
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addMerchantInformationForm]');
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
            if (result == 'Merchant successfully created') { 
                form.after('<div class="alert alert-success text-center m-3">Merchant successfully added</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('merchantnorandommerchantid');
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

var addUserbyMerchant = new Validator('[name=addMerchantUser]', [{ 
        name: 'username',
        rules: 'required'
    },
    {
        name: 'password',
        rules: 'required'
    },
    {
        name: 'fname',
        rules: 'required'
    },
    {
        name: 'sname',
        rules: 'required'
    },
    {
        name: 'pnum',
        rules: 'required'
    },
    {
        name: 'role',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=addMerchantUser]');
    form.find('.is-invalid').removeClass('is-invalid');
    form.find('.errors').remove();
    if (errors.length > 0) {

        errors.forEach(function (elem, index) {
            $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small> ');
            if (index === 0)
                $(errors[0].element)[0].focus();
        });
    } else {
        form.hide('fast');
        var data = form.serialize();
        $.post(form.attr('action'), data, function (result) {
            console.log(result);
            if (result === 'Successful') {
                form.after('<div class="alert alert-success text-center m-3"> User successfully added </div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                    goTo('merchantusermanagement');
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
var terminalarray = [];
$(document).on('change', '.terminalsBox', function () {
    var chk = $(this);
console.log('Hello world');
    var id = chk.next().val();
    if (chk.prop("checked")) {
        terminalarray.push(id);
    } else {
        if (terminalarray.indexOf(id) > -1) {
            var i = terminalarray.indexOf(id);
            terminalarray.splice(i, 1);
        }
    }
});

$(document).on('change', '.masterCheck3', function () {
    if ($(this).prop('checked') === true) {
        terminalarray.length = 0;
        $('.terminals').find('input:not(.masterCheck2)').prop('checked', true);
        var checkedValues = $('input:checkbox:checked').map(function () {
            return this.value;
        }).get();
        var itemtoRemove = "on";
        checkedValues.splice($.inArray(itemtoRemove, checkedValues), 1);
        terminalarray = checkedValues;
        console.log(terminalarray);
    } else {
        $('.terminals').find('input:not(.masterCheck3)').prop('checked', false);
    }
});

$(document).on('click', '.terminalButton', function (e) {
    console.log("here");
    e.preventDefault(); 
    var button = $(this);
    var modal = button.closest('.modal');
    var modalFooter = modal.find('.modal-footer');
    modalFooter.hide('fast');
    var url = "deleteTerminalInfo";
    console.log(url);
    var data = terminalarray.join(",");
    console.log(data);
    if (terminalarray.length > 0) {
        $.post(url, {array: data}, function (result) {
            if (result === "Successful") {
                $('#deleteTerminal').html('<div class="alert alert-success text-center">' + 'Successfully removed' + '</div>');
                setTimeout(function () {
                    $.each(terminalarray, function (i, val) {
                        $('[type="checkbox"][value="' + val+ '"]').parent().parent().remove();
                    });
                    $('#ask_before_delete').modal('hide');
                    modalFooter.show('fast');
                    $('#deleteTerminal').html('');
                }, 3000);
            } else {
                $('#deleteTerminal').html('<div class="alert alert-danger text-center">' + 'Failed to remove! Try again' + '</div>');
                setTimeout(function () {
                    modalFooter.show('fast');
                    $('#deleteTerminal').html('');
                }, 3000);
            }
            console.log(result); 
        });
    }
});


var userarray = [];
$(document).on('change', '.userBox', function () {
    var chk = $(this);
console.log('Hello world');
    var id = chk.next().val();
    if (chk.prop("checked")) {
        userarray.push(id);
    } else {
        if (userarray.indexOf(id) > -1) {
            var i = userarray.indexOf(id);
            userarray.splice(i, 1);
        }
    }
});

$(document).on('change', '.masterCheck3', function () {
    if ($(this).prop('checked') === true) {
        userarray.length = 0;
        $('.users').find('input:not(.masterCheck2)').prop('checked', true);
        var checkedValues = $('input:checkbox:checked').map(function () {
            return this.value;
        }).get();
        var itemtoRemove = "on";
        checkedValues.splice($.inArray(itemtoRemove, checkedValues), 1);
        userarray = checkedValues;
        console.log(userarray);
    } else {
        $('.users').find('input:not(.masterCheck3)').prop('checked', false);
    }
});
$(document).on('click', '.userButton', function (e) {
    console.log("here");
    e.preventDefault(); 
    var button = $(this);
    var modal = button.closest('.modal');
    var modalFooter = modal.find('.modal-footer');
    modalFooter.hide('fast');
    var url = "deleteuser";
    console.log(url); 
    var data = userarray.join(",");
    console.log(data);
    if (userarray.length > 0) {
        $.post(url, {array: data}, function (result) {
            if (result === "Successful") {
                $('#deleteUser').html('<div class="alert alert-success text-center">' + 'Successfully removed' + '</div>');
                setTimeout(function () {
                    $.each(userarray, function (i, val) {
                        $('[type="checkbox"][value="' + val+ '"]').parent().parent().remove();
                    });
                    $('#ask_before_delete').modal('hide');
                    modalFooter.show('fast');
                    $('#deleteUser').html('');
                }, 3000);
            } else {
                $('#deleteUser').html('<div class="alert alert-danger text-center">' + 'Failed to remove! Try again' + '</div>');
                setTimeout(function () {
                    modalFooter.show('fast');
                    $('#deleteUser').html('');
                }, 3000);
            }
            console.log(result); 
        });
    }
});

var merchantarray = [];
$(document).on('change', '.merchantBox', function () {
    var chk = $(this);
console.log('Hello world');
    var id = chk.next().val();
    if (chk.prop("checked")) {
        merchantarray.push(id);
    } else {
        if (merchantarray.indexOf(id) > -1) {
            var i = merchantarray.indexOf(id);
            merchantarray.splice(i, 1);
        }
    }
});

$(document).on('change', '.masterCheck3', function () {
    if ($(this).prop('checked') === true) {
        merchantarray.length = 0;
        $('.merchants').find('input:not(.masterCheck2)').prop('checked', true);
        var checkedValues = $('input:checkbox:checked').map(function () {
            return this.value;
        }).get();
        var itemtoRemove = "on";
        checkedValues.splice($.inArray(itemtoRemove, checkedValues), 1);
        merchantarray = checkedValues;
        console.log(merchantarray);
    } else {
        $('.merchants').find('input:not(.masterCheck3)').prop('checked', false);
    }
});
$(document).on('click', '.merchantButton', function (e) {
    console.log("here");
    e.preventDefault(); 
    var button = $(this);
    var modal = button.closest('.modal');
    var modalFooter = modal.find('.modal-footer');
    modalFooter.hide('fast');
    var url = "deletemerchant";
    console.log(url); 
    var data = merchantarray.join(",");
    console.log(data);
    if (merchantarray.length > 0) {
        $.post(url, {array: data}, function (result) {
            if (result === "Successful") {
                $('#deleteMerchant').html('<div class="alert alert-success text-center">' + 'Successfully removed' + '</div>');
                setTimeout(function () {
                    $.each(merchantarray, function (i, val) {
                        $('[type="checkbox"][value="' + val+ '"]').parent().parent().remove();
                    });
                    $('#ask_before_delete').modal('hide');
                    modalFooter.show('fast');
                    $('#deleteMerchant').html('');
                }, 3000);
            } else {
                $('#deleteMerchant').html('<div class="alert alert-danger text-center">' + 'Failed to remove! Try again' + '</div>');
                setTimeout(function () {
                    modalFooter.show('fast');
                    $('#deleteMerchant').html('');
                }, 3000);
            }
            console.log(result); 
        });
    }
});

// FORM VALIDATOR ENGINE
var editMerchantUser = new Validator('[name=editmerchantuserForm]', [{
        name: 'username', 
        rules: 'required'
    },
    {
        name: 'fname', 
        rules: 'required'
    },
    {
        name: 'sname', 
        rules: 'required'
    },
    {
        name: 'phonenumber', 
        rules: 'required'
    },
    {
        name: 'role', 
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editmerchantuserForm]');
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
                form.after('<div class="alert alert-success text-center m-3"> User detail successfully updated</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('merchantusermanagement');
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

var updateTerminalTransactionTimeout = new Validator('[name=updateTerminalTransactionTimeout]', [{
        name: 'timeout', 
        rules: 'required'
    },
    {
        name: 'callhome', 
        rules: 'required'
    },
    {
        name: 'terminal_id',
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=updateTerminalTransactionTimeout]');
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
                        goTo('setglobalvariable'); 
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
var editGlobalVariable = new Validator('[name=editglobalvariable]', [{
        name: 'timeout', 
        rules: 'required'
    },
    {
        name: 'callhome', 
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=editglobalvariable]');
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
                form.after('<div class="alert alert-success text-center m-3"> Global variable successfully updated</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('setglobalvariable');
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
var disableaterminal = new Validator('[name=disableATerminal]', [{
        name: 'terminal_id', 
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=disableATerminal]');
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
                form.after('<div class="alert alert-success text-center m-3"> Terminal successfully disabled</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('disabledterminal');
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
var enableaterminal = new Validator('[name=enableATerminal]', [{ 
        name: 'terminal_id', 
        rules: 'required'
    }], function (errors, event) {
    event.preventDefault();
    console.log(errors);
    var form = $('[name=enableATerminal]');
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
                form.after('<div class="alert alert-success text-center m-3"> Terminal successfully enabled</div>');
                setTimeout(function () {
                    form[0].reset();
                    form.next().remove();
                        goTo('disabledterminal');
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

var merchantdeleterequestarray = [];
$(document).on('change', '.merchantDeleteBox', function () {
    var chk = $(this);
console.log('Hello world');
    var id = chk.next().val();
    if (chk.prop("checked")) {
        merchantdeleterequestarray.push(id);
    } else {
        if (merchantdeleterequestarray.indexOf(id) > -1) {
            var i = merchantdeleterequestarray.indexOf(id);
            merchantdeleterequestarray.splice(i, 1);
        }
    }
});

$(document).on('click', '.merchantDeleteRequestButton', function (e) {
    console.log("here");
    e.preventDefault(); 
    var button = $(this);
    var modal = button.closest('.modal');
    var modalFooter = modal.find('.modal-footer');
    modalFooter.hide('fast');
    var url = "merchantdeleterequest";
    console.log(url);  
    var data = merchantdeleterequestarray.join(",");
    console.log(data);
    if (merchantdeleterequestarray.length > 0) {
        $.post(url, {array: data}, function (result) {
            if (result === "Successful") {
                $('#deleteMerchantRequest').html('<div class="alert alert-success text-center">' + 'Merchant delete successfully sent for approval' + '</div>');
                setTimeout(function () {
                    $.each(merchantdeleterequestarray, function (i, val) {
                        $('[type="checkbox"][value="' + val+ '"]').parent().parent().remove();
                    });
                    $('#ask_before_delete').modal('hide');
                    modalFooter.show('fast');
                    $('#deleteMerchantRequest').html('');
                }, 3000);
            } else {
                $('#deleteMerchantRequest').html('<div class="alert alert-danger text-center">' + 'Failed! Try again' + '</div>');
                setTimeout(function () {
                    modalFooter.show('fast');
                    $('#deleteMerchantRequest').html('');
                }, 3000);
            }
            console.log(result); 
        });
    }
});

var userdeleterequestarray = [];
$(document).on('change', '.userDeleteBox', function () {
    var chk = $(this);
console.log('Hello world');
    var id = chk.next().val();
    if (chk.prop("checked")) {
        userdeleterequestarray.push(id);
    } else {
        if (userdeleterequestarray.indexOf(id) > -1) {
            var i = userdeleterequestarray.indexOf(id);
            userdeleterequestarray.splice(i, 1);
        }
    }
});


$(document).on('click', '.userDeleteRequestButton', function (e) {
    console.log("here");
    e.preventDefault(); 
    var button = $(this);
    var modal = button.closest('.modal');
    var modalFooter = modal.find('.modal-footer');
    modalFooter.hide('fast');
    var url = "userdeleterequest"; 
    console.log(url); 
    var data = userdeleterequestarray.join(","); 
    console.log(data); 
    if (userdeleterequestarray.length > 0) {
        $.post(url, {array: data}, function (result) {
            if (result === "Successful") {
                $('#deleteUserRequest').html('<div class="alert alert-success text-center">' + 'User delete successfully sent for approval' + '</div>');
                setTimeout(function () {
                    $.each(userdeleterequestarray, function (i, val) {
                        $('[type="checkbox"][value="' + val+ '"]').parent().parent().remove();
                    });
                    $('#ask_before_delete').modal('hide');
                    modalFooter.show('fast');
                    $('#deleteUserRequest').html('');
                }, 3000);
            } else {
                $('#deleteUserRequest').html('<div class="alert alert-danger text-center">' + 'Failed to remove! Try again' + '</div>');
                setTimeout(function () {
                    modalFooter.show('fast');
                    $('#deleteUserRequest').html('');
                }, 3000);
            }
            console.log(result); 
        });
    }
});


var terminaldeleterequestarray = [];
$(document).on('change', '.terminalDeleteBox', function () {
    var chk = $(this);
console.log('Hello world');
    var id = chk.next().val();
    if (chk.prop("checked")) {
        terminaldeleterequestarray.push(id);
    } else {
        if (terminaldeleterequestarray.indexOf(id) > -1) {
            var i = terminaldeleterequestarray.indexOf(id);
            terminaldeleterequestarray.splice(i, 1);
        }
    }
});

$(document).on('click', '.terminalDeleteRequestButton', function (e) {
    console.log("here");
    e.preventDefault(); 
    var button = $(this);
    var modal = button.closest('.modal');
    var modalFooter = modal.find('.modal-footer');
    modalFooter.hide('fast');
    var url = "terminaldeleterequest";
    console.log(url);
    var data = terminaldeleterequestarray.join(",");
    console.log(data);
    if (terminaldeleterequestarray.length > 0) {
        $.post(url, {array: data}, function (result) {
            if (result === "Successful") {
                $('#deleteTerminalRequest').html('<div class="alert alert-success text-center">' + 'Terminal delete successfully sent for approval' + '</div>');
                setTimeout(function () {
                    $.each(terminaldeleterequestarray, function (i, val) {
                        $('[type="checkbox"][value="' + val+ '"]').parent().parent().remove();
                    });
                    $('#ask_before_delete').modal('hide');
                    modalFooter.show('fast');
                    $('#deleteTerminalRequest').html('');
                }, 3000);
            } else {
                $('#deleteTerminalRequest').html('<div class="alert alert-danger text-center">' + 'Failed to remove! Try again' + '</div>');
                setTimeout(function () {
                    modalFooter.show('fast');
                    $('#deleteTerminalRequest').html('');
                }, 3000);
            }
            console.log(result);  
        });
    }
});


