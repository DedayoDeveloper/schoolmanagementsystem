/*
 author: @tobioye88
 company: supersoft
 */

/*
 Version 1
 **set option first
 var options = [
 {
 name: 'fieldName',
 rules: 'required|numeric|min[9]|max[9]|alphabet|alpanumeric|matches(fieldname)|email|'
 }
 ]
 var v = new Validator('[namer=form]', options, function(errors){
 if(errors.length>0){
 //failed
 }else{
 //passed
 }
 }
 });
 */

var Validator = function (form, options, callback) {
    var v = this;
    this.form = document.querySelector(form);
    this.event;
    this.element;
    this.options = options;
    this.errors = [];
    this.callback = callback || function () {};

    this.reload = function () {
        this.form = document.querySelector(form);
        if (this.form) {
            this.form.addEventListener('submit', function (e) {
                v.event = e;
                v.run();
            });
        }
    };
    this.reload();

    this.getValue = function (name) {
        var value;
        var e = document.querySelector(form +' [name=' + name + ']');
        this.element = e;
        if(!e){
            console.warn('Element "'+ name +'" not found');
            return '';
        }
        if (e.nodeName.toLowerCase() === 'select') {
            //select
            value = e.options[e.selectedIndex].value;
        } else {
            //input, textarea, checkbox, etc
            value = e.value;
        }
        return value;
    };
    this.required = function (name) {
        var value = this.getValue(name);
        if (!(value.toString().length > 0)) {
            this.errors.push({'name': name, 'message': 'Input can not be empty', 'element': this.element});
        }
    };
    this.numeric = function (name) {
        var value = this.getValue(name);
        if (value.match(/\D/g)) {
            this.errors.push({'name': name, 'message': 'Input must be numbers only', 'element': this.element});
        }
    };
    this.alphabet = function (name) {
        var value = this.getValue(name);
        if (value.match(/[^a-zA-Z]/g)) {
            this.errors.push({'name': name, 'message': 'Input must be alfabet only', 'element': this.element});
        }
    };
    this.alpanumeric = function (name) {
        var value = this.getValue(name);
        if (value.match(/[^a-zA-Z0-9]/g)) {
            this.errors.push({'name': name, 'message': 'Input must be numbers or alphabet only', 'element': this.element});
        }
    };
    this.email = function (name) {
        var value = this.getValue(name);
        if (!value.match(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/)) {
            this.errors.push({'name': name, 'message': 'Input must be a valid email', 'element': this.element});
        }
    };

    this.min = function (name, par) {
        var value = this.getValue(name);
        var res = (value.toString().length >= parseInt(par));
        // console.log(value.toString().length + '>'+ parseInt(par));
        if (!res) {
            this.errors.push({'name': name, 'message': 'Input must be greater than ' + par + ' characters', 'element': this.element});
        }
    };
    this.max = function (name, par) {
        var value = this.getValue(name);
        var res = (value.toString().length <= parseInt(par));
        if (!res) {
            this.errors.push({'name': name, 'message': 'Input must be less than ' + par + ' characters', 'element': this.element});
        }
    };
    
    this.exactly = function (name, par) {
        var value = this.getValue(name);
        var res = (value.toString().length !== parseInt(par));
        if (res) {
            this.errors.push({'name': name, 'message': 'Input must be exactly ' + par + ' characters', 'element': this.element});
        }
    };
    this.matches = function (name, par) {
        var value1 = this.getValue(name);
        var value2 = this.getValue(par);
        if (value1 !== value2) {
            this.errors.push({'name': name, 'message': 'Inputs do not match', 'element': this.element});
        }
    };
    this.strictPassword = function(name){
        var value = this.getValue(name);
         var test1 = /[A-Z]+/.test(value);
         var test2 = /[\!\@\#\$\%\^\&\*\(\)\{\}\[\]\"\'\?\/\>\.\<\,\-\_\+\=]+/.test(value);
         var test3 = /[a-z]+/.test(value);
         var test4 = /[0-9]+/.test(value);
        if(!(test1 && test2 && test3 && test4)){
            this.errors.push({'name': name, 'message': 'Input must contain one or more upper case letter, lower case letter, number and any special caracter', 'element': this.element});
        }
    };
    this.run = function () {
        this.errors = [];
        // loop through the options 
        // loop throught the rules
        for (var i = 0; i < this.options.length; i++) {
            var rules = this.options[i].rules.split('|');
            for (var j = 0; j < rules.length; j++) {
                if (rules[j].indexOf('[') > 0) {
                    // console.log('bracket');
                    var inRule = rules[j].split('[');
                    var parm = inRule[inRule.length - 1].replace(']', '');
                    if (v[inRule[0]]) {
                        v[inRule[0]](options[i].name, parm);
                    }else{
                        console.warn('Rule "'+inRule[0]+'" does not exist');
                    }
                } else if (rules[j].indexOf('(') > 0) {
                    // console.log('parentesis');
                    var inRule = rules[j].split('(');
                    var parm = inRule[inRule.length - 1].replace(')', '');
                    if (v[inRule[0]]) {
                        v[inRule[0]](options[i].name, parm);
                    }else{
                        console.warn('Rule "'+inRule[0]+'" does not exist');
                    }
                } else {
                    // console.log('all');
                    if(v[rules[j]]){
                        v[rules[j]](options[i].name);
                    }else{
                        console.warn('Rule "'+rules[j]+'" does not exist');
                    }
                    
                }
            }
        }
        this.callback(this.errors, this.event);
    };
    this.passed = function () {
        return !this.errors.length;
    };
};