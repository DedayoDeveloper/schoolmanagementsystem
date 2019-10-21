<%-- 
    Document   : MarkAttendancePage
    Created on : Oct 11, 2019, 8:46:15 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 <div class="card">
    <div class="card-header" align="center">Select Attendance</div>
    <div class="card-body">
        
        <div>
            <form method="post" action="markteacherattendance" name="submitattendanceforteacherform">
                <input type="hidden" name="firstname" value="${firstname}">
                <input type="hidden" name="lastname" value="${lastname}">
                 <input type="hidden" name="sex" value="${sex}">
                 <input type="hidden" name="username" value="${username}">
                 <div>
                Select Attendance For ${firstname} ${lastname}
                 <select class="custom-select" name="attendance">
                     <option value="PRESENT">Present</option>
                     <option value="ABSENT">Absent</option>
                 </select>
                 </div>
                 <br/>
                 <div>
                     <button type="submit" class="btn btn-primary" id="submitattendanceforteacher">Submit</button>
                 </div>
            </form>
            
            
        </div>
        
        
        
        
    </div>
 </div>
                 
                 
                 <script>
                     
    var markteacherattendance = new Validator('[name="submitattendanceforteacherform"]', [
        {
            name: 'firstname',
            rules: 'required'
        },
        {
            name: 'lastname',
            rules: 'required'
        },
      
        {
            name: 'sex',
            rules: 'required'
        },
        {
            name: 'attendance',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="submitattendanceforteacherform"]');
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
            console.log(data)
            $.post(form.attr('action'), data, function (result) {
                if (result === 'success') {
                    form.after('<div class="alert alert-success text-center m-3">Attendance successfully marked</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#result1').html(spinner);
                    var url = 'teacherattendance';
                    $.get(url,function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
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
    
    
    
    
</script>