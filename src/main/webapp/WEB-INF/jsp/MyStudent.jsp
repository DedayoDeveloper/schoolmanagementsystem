<%-- 
    Document   : MyStudent
    Created on : Oct 16, 2019, 10:36:22 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">My Child/Student</div>
    <div class="card-body">



<button data-target="#addChildStudent" data-toggle="modal" type="button" class="btn btn-primary link">Register My Child</button>
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
                                <p class="mb-0">Do you want to delete this student?</p>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">No</button>
                                <button class="btn btn-primary deleteParentStudent"  type="submit">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
  
  
  
  
    <div id="addChildStudent" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Register Child</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addmychild" method="post" name="addnewchildtoparent" id="addnewchildtoparent">
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
                                <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="submit">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>





  <hr>


 <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                     <tr class="blue-grey white-text">
                        <th><input type="checkbox" class="masterCheck"></th> 
                        <th>Firstname</th>                                        
                        <th>Lastname</th>
                        <th>Age</th>
                        <th>Sex</th>
                        <th></th>
                        <th></th>
                   
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${getMyChild}" var = "getMyChild">
                        <tr>
                            <td>
                            <input type="checkbox" class="parentstudentcollectionBox" value="${getMyChild.id}">  
                            <input type="hidden" value="${getMyChild.id}">
                            </td>
                            <td>${getMyChild.firstname}</td>
                            <td>${getMyChild.lastname}</td>
                            <td>${getMyChild.age}</td>
                            <td>${getMyChild.sex}</td>
                            <td><a href="seerecords/${getMyChild.firstname}/${getMyChild.lastname}/${getMyChild.sex}" class="btn btn-primary link"> View Results</a></td>
                            <td><a href="getStudentDetails/${getMyChild.firstname}/${getMyChild.lastname}/${getMyChild.sex}" class="btn btn-primary link"> View Attendance</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>





    </div>
</div>






<!--

 <div id="viewresult" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Supply Username and Password To View Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addmychild" method="post" name="addnewchildtoparent" id="addnewchildtoparent">
                            <div class="modal-body">
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Firstname</label>
                                    <input type="text" name="username" placeholder="Username" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Lastname</label>
                                    <input type="password" name="password" placeholder="Password" class="form-control">
                                </div>
                                   
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="submit">Enter</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>






<div id="viewattendance" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Supply Username and Password To View Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addmychild" method="post" name="addnewchildtoparent" id="addnewchildtoparent">
                            <div class="modal-body">
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Firstname</label>
                                    <input type="text" name="username" placeholder="Username" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <label id="addstudentstyle">Lastname</label>
                                    <input type="password" name="password" placeholder="Password" class="form-control">
                                </div>
                                   
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                                <button class="btn btn-primary" type="submit">Enter</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>-->



<script>
    
    
    var registerchildtoparent = new Validator('[name="addnewchildtoparent"]', [
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
        var form = $('[name="addnewchildtoparent"]');
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
                    form.after('<div class="alert alert-success text-center m-3">Student successfully registered</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#addChildStudent').modal('hide');
                        $('#result1').html(spinner);
                    var url = 'mystudent';
                    $.get(url,function (result) {
                    $('#result1').html(result);
                    console.log(url);
                    console.log(result);
                });
                    }, 3000);
                } else {
                    form.after('<div class="alert alert-danger text-center m-3">' + 'Sorry no student found!' + '</div>');
                    setTimeout(function () {
                        form.next().remove();
                        form.show('fast');
                    }, 3000);
                }
            });
        }
    });
    
    
    
    
    </script>