<%-- 
    Document   : UpdateRecordPage
    Created on : Oct 16, 2019, 9:11:20 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>




<div class="card">
    <div class="card-header" align="center">Update Student Records</div>
    <div class="card-body">

                      
                        <form action="updatestudentrecord" method="post" name="updatestudentrecordform" id="updatestudentrecordform">
                       
                                <input type="hidden" name="firstname" value="${firstname}">
                                <input type="hidden" name="lastname" value="${lastname}">
                                <div class="form-group">
                                    <label>Choose Subject</label>
                                    <select class="custom-select" name="subject">
                                        <option value="mathematics">Mathematics</option>
                                        <option value="english">English</option>
                                        <option value="economics">Economics</option>
                                        <option value="finearts">Fine Arts</option>
                                        <option value="agriculturalscience">Agricultural Science</option>
                                        <option value="history">History</option>
                                        <option value="geography">Geography</option>
                                        <option value="civiceducation">Civic Education</option>
                                        <option value=""></option>
                                        <option value=""></option>
                                        <option value=""></option>
                                        <option value=""></option>
                                        <option value=""></option>
                                        <option value=""></option>
                                    </select>
                                </div>
                                <label>Choose Assessment Type</label>
                                <div class="form-group" style=" color: white;">
                              
                                     <select class="custom-select" name="assessment">
                                        <option value="assessmentone">Assessment One</option>
                                        <option value="assessmenttwo">Assessment Two</option>
                                        <option value="assessmentthree">Assessment Three</option>
                                        <option value="finalexam">Final Exam</option>
                                        <option value="total">Total Score</option>
                                        <option value="grade">Grade</option>
                                      
                                    </select>
                            </div>
                                <div class="form-group">
                                    <label>Score</label>
                                    <input type="text" name="result" class="form-control">
                                </div>
                        
                                <button class="btn btn-primary" type="submit" id="updatestudentrecord">Save</button>
                         
                        </form>

           
        
        
        
        
    </div>
</div>
                                
                                
                                
<script>



    var createteacherLogin = new Validator('[name="updatestudentrecordform"]', [
        {
            name: 'subject',
            rules: 'required'
        },
        {
            name: 'assessment',
            rules: 'required'
        },
        {
            name: 'result',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="updatestudentrecordform"]');
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
                    form.after('<div class="alert alert-success text-center m-3">Record successfully updated</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#result1').html(spinner);
                    var url = 'studentrecords';
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