<%-- 
    Document   : TeacherAttendancePage
    Created on : Oct 20, 2019, 9:08:35 PM
    Author     : oreoluwa
--%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="card">
    <div class="card-header" align="center">MARK TEACHER'S ATTENDANCE FOR ${currentdate}</div>
    <div class="card-body">
 
     <div>
       <div class="col-md-12">
                <form action="searchteacherforattendance" method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Enter Teacher Username" name="username">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id = "searchmyteacherforattendance" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </div>
</div>
        
        
       
        
        
        
        <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">

                    <thead>
                        <tr class="blue-grey white-text">
                            <th>S/N</th>
                            <th>Firstname</th>                                        
                            <th>Lastname</th>
                            <th>Sex</th>
                            <th>Username</th>
                            <th>Attendance</th>
                          
                            
                           
                       </tr>
                    </thead>
                    <tbody>
                   
                        
                                  
                    <div style="text-align: center;">
                        <h5> ${error}</h5>
                    </div>
                     
                    
                        
                        <c:forEach items="${getAllTeachers}" var = "getAllTeachers" varStatus="status">
                            
                            <tr class="table">
                               
                                <td>${status.count}</td>
                                 <div style=" display: none;" id="studentattendanceid">${SearchTeacherAttendance.id}</div>
                                 <td>${getAllTeachers.firstname}</td>
                                 <td>${getAllTeachers.lastname}</td>
                                 <td>${getAllTeachers.sex}</td>
                                 <td>${getAllTeachers.username}</td>
                                 
                         <c:choose>
                                <c:when test="${getAllTeachers.attendancemark eq 'unmarked'}">
                              
                      
                                <td>  
                                   
                                        <a id="markteacherattendance" class="btn btn-primary link" type="submit" href="markattendanceforteacher/${getAllTeachers.firstname}/${getAllTeachers.lastname}/${getAllTeachers.sex}/${getAllTeachers.username}">Mark Attendance</a>
                                
                                </td>   
                                
                                      </c:when>
                                    <c:otherwise>
                                    <td>${getAllTeachers.attendancemark}</td>
                                </c:otherwise>
                            </c:choose>
                             
                           
                            </tr>
                            
                        </c:forEach>
                       
                            </tbody>
                      
                </table>
                          <div>
                             <button type="button" class="btn btn-primary"  data-target="#refreshteacherattendance" data-toggle="modal"> Submit Attendance</button>
                   
                          
                      
                          <a> 

                              <button class="btn btn-primary mb-1" 
                                      id="teacherattendancedownload"
                                      name="teacherattendancedownload"
                                      data-toggle="modal" 
                                      data-target="#downloadteacherattendance">
                                  <i class="fa fa-download"></i> 
                                  Download Attendance
                              </button>
                              
                      
                          </a>       
                          
                          </div>
                
            </div>
                 
                    
                              <div id="refreshteacherattendance" class="modal" tabindex="-1" role="dialog" aria-labelledby="approvePaymentLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Submit All Teacher's Attendance</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="submitteacherattendance" method="post" name="teacherAttendance">
                            <div class="modal-body">
                                <p class="mb-0">Do you want to submit all teacher's attendance?</p>
                                
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
                    
                    
                    
                      <div class="modal fade" id="downloadteacherattendance" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content ">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Select Date To Download Attendance</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="downloadteacherattendance" method="post" name="downloadteacherattendanceform">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            
                                            
                                          
                                            <i class="fa fa-calendar mr-1"></i><label>From Date</label>
                                            <input type="date" id="fromDate" name="fromDate" style="border-radius: 20px;">
                                        </div>
                                        <div class="col-md-6">
                                            <i class="fa fa-calendar mr-1"></i><label>To Date</label>
                                            <input type="date" id="toDate" name="toDate" style="border-radius: 20px;">
                                        </div>
                                    </div>
                                    <hr class="w-100">
                                    <div class="form-group">
                                        <label>Report type</label>
                                        <div class="col-md-6 p-0">
                                            <div class="form-check">
                                                <label class="form-check-label">
                                                    <input class="form-check-input" type="radio" id="pdf" value="pdf" name="reportType"><b><i class="fa fa-file-pdf-o mr-1"></i>pdf</b>
                                                </label>
                                            </div>
                                        </div> 
                                        <div class="col-md-6 p-0">
                                            <div class="form-check">
                                                <label class="form-check-label">

                                                    <input class="form-check-input" type="radio" id="csv" value="csv" name="reportType"><b><i class="fa fa-file-excel-o mr-1"></i>csv</b>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <span id="display"></span>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-primary" type="submit" name="btnSelectHeadings" id="btnSelectHeadings"><i class="fa fa-download"></i> Download</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
          
    
                    
                    
                       <script>



    var submitteacherattendance = new Validator('[name="teacherAttendance"]', [
        ], function (errors, event) {
        event.preventDefault();
        console.log(errors);
        var form = $('[name="teacherAttendance"]');
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
                        $('#refreshteacherattendance').modal('hide');
                        $('#result1').html(spinner);
                    var url = 'teacherattendance';
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