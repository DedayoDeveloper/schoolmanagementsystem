<%-- 
    Document   : CreateTeacher
    Created on : Oct 8, 2019, 9:53:01 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="card">
    <div class="card-header" align="center">TEACHER MANAGEMENT</div>
    <div class="card-body">
        <div class="row"> 
            <div class="col-md-4 mr-auto">
                <button data-target="#addteacher" data-toggle="modal" type="button" class="btn btn-primary link">Add Teacher</button>
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
                                <p class="mb-0">Do you want to delete this teacher?</p>
                                <div id="deleteMerchantRequest"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">No</button>
                                <button class="btn btn-primary teacherdeleteButton" type="submit">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <div id="addteacher" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Teacher</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addnewteacher" method="post" name="addnewteacherform" id="addnewteacherform">
                            <div class="modal-body">
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Firstname</label>-->
                                    <input type="text" name="firstname" placeholder="Firstname" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Lastname</label>-->
                                    <input type="text" name="lastname" placeholder="Lastname" class="form-control">
                                </div>


                                <div class="form-group" style=" color: black;">
                                    <label>Assign Class</label>
                                    <select class="form-control" name="classassigned" id="classassigned">
                                        <c:forEach items="${getSchoolClassess}" var = "getSchoolClassess" varStatus="status">

                                            <option value="${getSchoolClassess.classname}">${getSchoolClassess.classname}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="text" name="phonenumber" placeholder="Phonenumber" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="text" name="department" placeholder="Department" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <select class="custom-select" name="sex">
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Create Username</label>
                                    <input type="text" name="username" placeholder="Create Username" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Create Password</label>
                                    <input type="password" name="password" placeholder="Create Password" class="form-control">
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

        </div>

        <hr>


        <div>
            <div class="col-md-12">
                <form action="searchteacherforadmin" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Search</label>
                        </div>
                        <input type="text" class="form-control" placeholder="Enter Username" name="username">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id = "searchteacherforadminuser" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <p class="col-md-8" style="margin-top: 10px;">
            ${pagination} 
        </p> 


        <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                    <tr class="blue-grey white-text">
                        <th><input type="checkbox" class="masterCheck"></th> 
                        <th>S/N</th>
                        <th>Firstname</th>                                        
                        <th>Lastname</th>
                        <th>Class Assigned</th>
                        <th>Phonenumber</th>
                        <th>Department</th>
                        <th>Sex</th>
                        <th>Username</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${getAllTeachers}" var = "getAllTeachers" varStatus="status">
                        <tr>
                            <td>
                                <input type="checkbox" class="teachercollectionBox" value="${getAllTeachers.id}">  
                                <input type="hidden" value="${getAllTeachers.id}">
                            </td>
                            <td>${status.count}</td>
                            <td>${getAllTeachers.firstname}</td>
                            <td>${getAllTeachers.lastname}</td>
                            <td>${getAllTeachers.classassigned}</td>
                            <td>${getAllTeachers.phonenumber}</td>
                            <td>${getAllTeachers.department}</td>
                            <td>${getAllTeachers.sex}</td>
                            <td>${getAllTeachers.username}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>








    </div>
</div>
<script>
    $(document).ready(function () {
        $('#myDataTable').DataTable({
            "destroy": true,
            "scrollY": 300,
            "scrollCollapse": true,
            "paging": true,
            "autoWidth": true,
            "ordering": true,
            "searching": false,
            "order": [[0, 'asc']],
            "pageLength": 20,
            "lengthChange": false,
            "pagingType": "full_numbers",
            "dom": '<"top"ip>rt<"bottom"fl><"clear">'
        });
    });
</script>





<script>



    var createteacherLogin = new Validator('[name="addnewteacherform"]', [
        {
            name: 'firstname',
            rules: 'required'
        },
        {
            name: 'lastname',
            rules: 'required'
        },
        {
            name: 'classassigned',
            rules: 'required'
        },
        {
            name: 'phonenumber',
            rules: 'required'
        },
        {
            name: 'department',
            rules: 'required'
        },
        {
            name: 'sex',
            rules: 'required'
        },
        {
            name: 'username',
            rules: 'required'
        },
        {
            name: 'password',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="addnewteacherform"]');
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
                    form.after('<div class="alert alert-success text-center m-3">Teacher successfully created</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#addteacher').modal('hide');
                        $('#result1').html(spinner);
                        var url = 'teachermanagement';
                        $.get(url, function (result) {
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

