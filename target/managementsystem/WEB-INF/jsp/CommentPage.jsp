<%-- 
    Document   : CommentPage
    Created on : Oct 21, 2019, 3:49:05 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">Drop Comment For ${firstname} ${lastname}</div>
    <div class="card-body">
        
        <form action="comments" method="post" name="commentform" id="commentform">
        <textarea class="form-control" name="message"></textarea>
        <input type="hidden" name="username" value="${username}">
        <div align="right">
        <button class="btn btn-primary" type="submit">Send</button>
        </div>
        </form>
        
        
        
        
    </div>
</div>
    
    
    
<script>



    var parentcomplainform = new Validator('[name="commentform"]', [
     
        {
            name: 'message',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="commentform"]');
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
            $.post(form.attr('action'), data, function (result) {
                if (result === 'success') {
                    form.after('<div class="alert alert-success text-center m-3">Your Comment Has Been Noted!!</div>');
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
