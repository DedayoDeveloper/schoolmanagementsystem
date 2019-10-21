<%-- 
    Document   : teacherdetails
    Created on : Oct 13, 2019, 2:01:24 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 <div class="card">
    <div class="card-header" align="center">Send Message to ${firstname} ${lastname}</div>
    <div class="card-body">
      
        <form action="teachermessage" method="post" name="messagetoteacherform" id="messagetoteacherform">
            <input type="hidden" name="firstname" value="${firstname}">
            <input type="hidden" name="lastname" value="${lastname}">
            <textarea class="form-control" name="messagetoteacher" placeholder="Not more than 500 words..."></textarea>
        <div align="right">
        <button class="btn btn-primary" type="submit">Send</button>
        </div>
        </form>
        
    </div>
 </div>

            
            <script>
                
                

    var csendmessagetoteacher = new Validator('[name="messagetoteacherform"]', [
        {
            name: 'firstname',
            rules: 'required'
        },
        {
            name: 'lastname',
            rules: 'required'
        },
        {
            name: 'messagetoteacher',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="messagetoteacherform"]');
        form.find('.is-invalid').removeClass('is-invalid');
        form.find('.errors').remove();
        if (errors.length > 0) {
            errors.forEach(function (elem, index) {
                $(errors[index].element).addClass('is-invalid').after('<small class="errors text-danger">' + errors[index].message + '</small>');
                if (index === 0)
                    $(errors[0].element).focus();
            });
        } else {
            form.hide('fast');
            var data = form.serialize();
            console.log(data);
            $.post(form.attr('action'), data, function (result) {
                if (result === 'success') {
                    form.after('<div class="alert alert-success text-center m-3">Message sent successfully!</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#result1').html(spinner);
                    var url = 'meetteachers';
                    $.get(url,function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                   
                });
                    }, 3000);
                } else {
                    form.after('<div class="alert alert-danger text-center m-3">' + 'Failed update! Try again' + '</div>');
                    setTimeout(function () {
                        form.next().remove();
                        form.show('fast');
                    }, 3000);
                }
            });
        }
    });
                
                
                </script>