<%-- 
    Document   : mysubject
    Created on : Oct 12, 2019, 5:04:56 PM
    Author     : oreoluwa
--%>


<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

 <div class="card">
    <div class="card-header" align="center">My Subjects</div>
    <div class="card-body">
        <div class="row"> 
            <div class="col-md-4 mr-auto">
                <button data-target="#addSubject" data-toggle="modal" class="btn btn-primary link">Add Subject</button>
                <button class="btn btn-danger" data-target="#ask_before_delete" data-toggle="modal" >- Delete </button>
                
                <div id="ask_before_delete" class="modal" tabindex="-1" role="dialog" aria-labelledby="approvePaymentLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Warning!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p class="mb-0">Do you want to delete this subject?</p>
                                <div id="deleteMerchantRequest"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">No</button>
                                <button class="btn btn-primary subjectDeleteRequestButton" type="submit">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
        
        
        
        
                   <div id="addSubject" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Register Subject</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addnewsubject" method="post" name="addnewsubjectform" id="addnewsubjectform">
                            <div class="modal-body">
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Firstname</label>-->
                                    <input type="text" name="subjectname" placeholder="Subject" class="form-control">
                                </div>
                                <div class="form-group" style=" color: black;">
                                    <label>Class Teaching</label>
                                    <select class="form-control" name="classteaching" id="classteaching">
                                        <c:forEach items="${getSchoolClassess}" var = "getSchoolClassess" varStatus="status">

                                            <option value="${getSchoolClassess.classname}">${getSchoolClassess.classname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="text" name="department" placeholder="Department" class="form-control">
                                </div>
                               
                              
                                
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="submit">Yes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        
        
        <hr>
        <br/>
        
                <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                    <thead>
                        <tr class="blue-grey white-text">
                            <th><input type="checkbox" class="masterCheck"></th> 
                            <th>S/N</th>
                            <th>Subject</th>                                        
                            <th>Class Teaching</th>
                            <th>Department</th>
                            
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${GetSubjectForTeacher}" var = "GetSubjectForTeacher" varStatus="status">
                            <tr>
                                  <td>
                                  <input type="checkbox" class="subjectcollectionBox" value="${GetSubjectForTeacher.id}">  
                                   <input type="hidden" value="${GetSubjectForTeacher.id}">
                                </td>
                                <td>${status.count}</td>
                                <td>${GetSubjectForTeacher.subjectname}</td>
                                <td>${GetSubjectForTeacher.classteaching}</td>
                                <td>${GetSubjectForTeacher.department}</td>
                               
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        
        
        
        
        
        
        
        
        
    </div>
 </div>


<script>

    var createteacherLogin = new Validator('[name="addnewsubjectform"]', [
        {
            name: 'subjectname',
            rules: 'required'
        },
        {
            name: 'classteaching',
            rules: 'required'
        },
     
        {
            name: 'department',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="addnewsubjectform"]');
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
                    form.after('<div class="alert alert-success text-center m-3">Subject successfully Added</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#addSubject').modal('hide');
                        $('#result1').html(spinner);
                    var url = 'mysubjects';
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