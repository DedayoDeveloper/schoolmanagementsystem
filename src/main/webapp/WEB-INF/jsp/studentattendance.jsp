<%-- 
    Document   : studentattendance
    Created on : Oct 9, 2019, 9:33:43 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">MARK STUDENT ATTENDANCE FOR ${currentdate}</div>
    <div class="card-body">
        
      
     <div id="display_resultRep"> </div>
           <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">

                    <thead>
                        <tr class="blue-grey white-text">
                            <th>S/N</th>
                            <th>Firstname</th>                                        
                            <th>Lastname</th>
                            <th>Sex</th>
                            <th>Attendance</th>
                          
                            
                           
                       </tr>
                    </thead>
                    
                 
                     
                        <c:forEach items="${StudentAttendanceList}" var = "StudentAttendanceList" varStatus="status">
                            
                            <tr class="table">
                               
                                <td>${status.count}</td>
                                 <div style=" display: none;" id="studentattendanceid">${StudentAttendanceList.id}</div>
                                 <td>${StudentAttendanceList.firstname}</td>
                                 <td>${StudentAttendanceList.lastname}</td>
                                 <td>${StudentAttendanceList.sex}</td>
                                 
                                 
                                  <c:choose>
                                <c:when test="${StudentAttendanceList.attendancedate == 'unmarked'}">
                      
                                <td>  
                                   
                                        <a id="presentattendance" class="btn btn-primary link" type="submit" href="markattendance/${StudentAttendanceList.firstname}/${StudentAttendanceList.lastname}/${StudentAttendanceList.sex}">Mark Attendance</a>
                                
                                </td>   
                                
                                       </c:when>
                                    <c:otherwise>
                                    <td>${StudentAttendanceList.attendance}</td>
                                </c:otherwise>
                            </c:choose>
                           
                            </tr>
                            
                        </c:forEach>
                       
             
                   
                </table>
                
            </div>
                 
                      
        
       
     
                    <div>
                          <button type="button" class="btn btn-primary"  data-target="#refreshattendance" data-toggle="modal"> Submit Attendance</button>
                       
                          
                          <a type="button" class="btn btn-primary"> Download Attendance</a>
        </div>
       
        
      
                        <div id="refreshattendance" class="modal" tabindex="-1" role="dialog" aria-labelledby="approvePaymentLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Warning!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="refreshattendance" method="post" name="refreshAttendance">
                            <div class="modal-body">
                                <p class="mb-0">Do you want to submit your class attendance?</p>
                                
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-outline-dark closeModal_approve" data-dismiss="modal">No</button>
                                <button class="btn btn-primary" type="submit" id="refreshbuttonforattendance">Yes</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
      
        
        
    </div>
</div>
    
   
   <script>



    var createteacherLogin = new Validator('[name="refreshAttendance"]', [
        ], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="refreshAttendance"]');
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
                    form.after('<div class="alert alert-success text-center m-3">Attendance Submitted Successfully</div>');
                    setTimeout(function () {
                        form[0].reset();
                        form.next().remove();
                        form.show('fast');
                        $('#refreshattendance').modal('hide');
                        $('#result1').html(spinner);
                    var url = 'studentattendance';
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
