<%-- 
    Document   : NonTeachingPage
    Created on : Oct 23, 2019, 7:57:30 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">Non-Teaching Staff</div>
    <div class="card-body">
        
        <div class="row"> 
            <div class="col-md-4 mr-auto">
                <button data-target="#addstaff" data-toggle="modal" type="button" class="btn btn-primary link">Add Staff</button>
                 <button class="btn btn-danger" data-target="#ask_before_deletestaff" data-toggle="modal" type="button" >Delete Staff</button>
                
                 
                   <div id="ask_before_deletestaff" class="modal" tabindex="-1" role="dialog" aria-labelledby="approvePaymentLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            
                            <div class="modal-header">
                                <h5 class="modal-title">Warning!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            
                            <div class="modal-body">
                                <p class="mb-0">Do you want to delete this staff permanently?</p>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">No</button>
                                <button class="btn btn-primary deleteStaff"  type="submit">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                
                 
                 
                 
                 
                 
                 
                 
                   <div id="addstaff" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Register New Staff</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addnewstaff" method="post" name="addnewstaffform" id="addnewstaffform">
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
                                    <input type="text" name="department" placeholder="Department" class="form-control">
                                </div>
                                  <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="text" name="position" placeholder="Position" class="form-control">
                                </div>
                                <div class="form-group" style=" color: white;">
                                    <!--<label id="addstudentstyle">Student Number</label>-->
                                    <input type="text" name="age" placeholder="Age" class="form-control">
                                </div>
                                <div class="form-group" style=" color: black;">
                                    <label>Date Joined</label>
                                    <input type="date" name="datejoined" placeholder="Date Joined" class="form-control">
                                </div>
                                  <div class="form-group" style=" color: black;">
                                      <label>Sex</label>
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
                            <th>Staff Department</th>
                            <th>Staff Position</th>
                            <th>Sex</th>
                            <th>Date Joined</th>
                          
                           
                        </tr>
                    </thead>
                    <tbody>
                        
                        <c:forEach  items="${getAllNonTeachingStaff}" var = "getAllNonTeachingStaff" varStatus="status">
                            <tr>
                                <td>
                                  <input type="checkbox" class="staffcollectionBox" value="${getAllNonTeachingStaff.id}">  
                            <input type="hidden" value="${getAllNonTeachingStaff.id}">
                                </td>
                                 <td>${status.count}</td>
                                 
                                 <td>${getAllNonTeachingStaff.firstname}</td>
                                 <td>${getAllNonTeachingStaff.lastname}</td>
                                 <td>${getAllNonTeachingStaff.department}</td>
                                 <td>${getAllNonTeachingStaff.position}</td>
                                 <td>${getAllNonTeachingStaff.sex}</td>
                                 <td>${getAllNonTeachingStaff.datejoined}</td>
                                
                            </tr>
                            
                            </c:forEach>
                     
                    </tbody>
                </table>
            </div>

        
        
        
        
        
        
        
        
        </div>

    </div>


<script>
    
    
     var createteacherLogin = new Validator('[name="addnewstaffform"]', [
        {
            name: 'firstname',
            rules: 'required'
        },
        {
            name: 'lastname',
            rules: 'required'
        },
         {
            name: 'department',
            rules: 'required'
        },
         {
            name: 'position',
            rules: 'required'
        },
         {
            name: 'age',
            rules: 'required'
        },
      
        {
            name: 'datejoined',
            rules: 'required'
        },
        {
            name: 'sex',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="addnewstaffform"]');
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
                    form.after('<div class="alert alert-success text-center m-3">Staff successfully registered</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#addstaff').modal('hide');
                        $('#result1').html(spinner);
                    var url = 'nonteaching';
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