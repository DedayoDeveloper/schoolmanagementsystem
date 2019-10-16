<%-- 
    Document   : myclass
    Created on : Oct 8, 2019, 7:41:59 AM
    Author     : oreoluwa
--%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    #addstudentstyle{
        color: #007bff;
    }
</style>

<div class="card">
    <div class="card-header" align="center">${TeacherClass}</div>
    <div class="card-body">
        <div class="row"> 
            <div class="col-md-4 mr-auto">
                <button data-target="#addstudent" data-toggle="modal" type="button" class="btn btn-primary link">Add Student</button>
                <button class="btn btn-danger" data-target="#ask_before_delete" data-toggle="modal" type="button" >- Delete </button>
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
                                <p class="mb-0">Do you want to delete this student from your class?</p>
                                <div id="deleteMerchantRequest"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">No</button>
                                <button class="btn btn-primary merchantDeleteRequestButton" type="submit">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div id="addstudent" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Student</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addnewstudent" method="post" name="addnewStudent" id="addnewStudent">
                            <div class="modal-body">
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Firstname</label>-->
                                    <input type="text" name="firstname" placeholder="Firstname" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Lastname</label>-->
                                    <input type="text" name="lastname" placeholder="Lastname" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="hidden" name="studentclass" value="${TeacherClass}">
                                </div>
                                  <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="hidden" name="classteacher" value="${username}">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="text" name="age" placeholder="Age" class="form-control">
                                </div>
                                  <div class="form-group" style=" color: white;">
                                    <select class="custom-select" name="sex">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="submit">Yes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
                                
       </div>                          

            <div class="dataTable">
                <table id="myDataTable" class="table table-striped" cellspacing="0" width="100%" align="center">
                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Firstname</th>                                        
                            <th>Lastname</th>
                            <th>Student Class</th>
                            <th>Age</th>
                            <th>Sex</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${getClassStudents}" var = "getClassStudents" varStatus="status">
                            <tr>
                                <td>${status.count + (page_num - 1)* 10}</td>
                                <td>${getClassStudents.firstname}</td>
                                <td>${getClassStudents.lastname}</td>
                                <td>${getClassStudents.studentclass}</td>
                                <td>${getClassStudents.age}</td>
                                <td>${getClassStudents.sex}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>


       

    </div>
</div>

                                
                                

<script>



    var createteacherLogin = new Validator('[name="addnewStudent"]', [
        {
            name: 'firstname',
            rules: 'required'
        },
        {
            name: 'lastname',
            rules: 'required'
        },
      
        {
            name: 'age',
            rules: 'required'
        },
        {
            name: 'sex',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="addnewStudent"]');
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
                    form.after('<div class="alert alert-success text-center m-3">Student successfully created</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#addstudent').modal('hide');
                        $('#result1').html(spinner);
                    var url = 'myclass';
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

