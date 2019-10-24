<%-- 
    Document   : ClassManagement
    Created on : Oct 23, 2019, 9:39:19 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">Student Class Management</div>
    <div class="card-body">

        <div class="row"> 
            <div class="col-md-4 mr-auto">
                
                <button data-target="#addclass" data-toggle="modal" type="button" class="btn btn-primary link">Create Class</button>
                <button class="btn btn-danger" data-target="#ask_before_deleteclass" data-toggle="modal" type="button" >Delete</button>
              
                
                
                <div id="addclass" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Add New Class</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="addnewclass" method="post" name="addnewclassform" id="addnewclassform">
                            <div class="modal-body">
                                <div class="form-group" style=" color: black;">
                                    <label>Class-Name</label>
                                    <input type="text" name="classname" placeholder="Class-Name" class="form-control">
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
                
                
                
                
                
                
                   <div id="ask_before_deleteclass" class="modal" tabindex="-1" role="dialog" aria-labelledby="approvePaymentLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            
                            <div class="modal-header">
                                <h5 class="modal-title">Warning!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            
                            <div class="modal-body">
                                <p class="mb-0">Do you want to delete this class from your management system?</p>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">No</button>
                                <button class="btn btn-primary deleteClass"  type="submit">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
            </div>
        </div>
        
        
        
        <hr>
        
         <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                    <thead>
                        <tr class="blue-grey white-text">
                            <th><input type="checkbox" class="masterCheck"></th> 
                            <th>S/N</th>
                            <th>Class-Name</th>                                        
                            <th></th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${getAllClassess}" var = "getAllClassess" varStatus="status">
                            <tr>
                                <td>
                                  <input type="checkbox" class="classcollectionBox" value="${getAllClassess.id}">  
                            <input type="hidden" value="${getAllClassess.id}">
                                </td>
                                <td>${status.count}</td>
                                <td>${getAllClassess.classname}</td>
                                <td><a class="btn btn-primary link" href="getclassdetails/${getAllClassess.classname}">Class Details</a></td>
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        
    </div>
</div>


<script>
    
    
    
      var createstudentclass = new Validator('[name="addnewclassform"]', [
        {
            name: 'classname',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="addnewclassform"]');
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
                    form.after('<div class="alert alert-success text-center m-3">Your class has been successfully created</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#addclass').modal('hide');
                        $('#result1').html(spinner);
                    var url = 'classmanagement';
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