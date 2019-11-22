<%-- 
    Document   : timetablepage
    Created on : Oct 12, 2019, 7:18:05 PM
    Author     : oreoluwa
--%>


<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">My Time-Table/Schedule</div>
    <div class="card-body">
        <div class="row"> 
            <div class="col-md-4 mr-auto">
                <button data-target="#createtimetable" data-toggle="modal" class="btn btn-primary link">Create Schedule</button>


                <div id="createtimetable" class="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Create TimeTable</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="addtimetable" method="post" name="addnewtimetableform" id="addnewtimetableform">
                                <div class="modal-body">
                                    <div class="form-group" style=" color: white;">
                                        <select class="custom-select" name="day">
                                            <option value="monday">Monday</option>
                                            <option value="tuesday">Tuesday</option>
                                            <option value="wednesday">Wednesday</option>
                                            <option value="thursday">Thursday</option>
                                            <option value="friday">Friday</option>
                                        </select>

                                    </div>
                                    
                                    <div class="form-group" style=" color: white;">
                                        <!--<label id="addstudentstyle">Student Number</label>-->
                                        <textarea name="details" placeholder="Details" class="form-control"></textarea>
                                    </div>
                                    
<!--                                    <div class="form-group" style=" color: white;">
                                        <label id="addstudentstyle">Student Number</label>
                                        <input type="text" name="subject" placeholder="Subject" class="form-control">
                                    </div>
                                    
                                    <div class="form-group" style=" color: white;">
                                        <label id="addstudentstyle">Student Number</label>
                                        <input type="text" name="class" placeholder="Class" class="form-control">
                                    </div>-->


                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger closeModal_approve"  data-dismiss="modal">Cancel</button>
                                    <button class="btn btn-primary" type="submit">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <br/>
        
        
       

        <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">

               
                 
                <tr>
                    <th>Monday</th>
                      <c:forEach items="${gettimetable}" var = "gettimetable" varStatus="status">
                    <td>${gettimetable.monday}</td>
                 
                    </c:forEach>
                </tr>

                <tr>
                    <th>Tuesday</th>
                    
                        <c:forEach items="${gettimetable}" var = "gettimetable" varStatus="status">
                    <td>${gettimetable.tuesday}</td>
                    </c:forEach>

                </tr>

                <tr>
                    <th>Wednesday</th>
                    
                        <c:forEach items="${gettimetable}" var = "gettimetable" varStatus="status">
                    <td>${gettimetable.wednesday}</td>
                    </c:forEach>

                </tr>

                <tr>
                    <th>Thursday</th>
                    
                        <c:forEach items="${gettimetable}" var = "gettimetable" varStatus="status">
                    <td>${gettimetable.thursday}</td>
                    </c:forEach>

                </tr>

                <tr>
                    <th>Friday</th>
                    
                        <c:forEach items="${gettimetable}" var = "gettimetable" varStatus="status">
                    <td>${gettimetable.friday}</td>
                    </c:forEach>

                </tr>

                
            </table>
        </div>



    </div>
</div>



<script>

    var createtimeTable = new Validator('[name="addnewtimetableform"]', [
        {
            name: 'day',
            rules: 'required'
        },
        {
            name: 'details',
            rules: 'required'
        }], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="addnewtimetableform"]');
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
                    form.after('<div class="alert alert-success text-center m-3">TimeTable Details successfully Created</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#createtimetable').modal('hide');
                        $('#result1').html(spinner);
                    var url = 'timetable';
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