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
     
     
     
     <div>
       <div class="col-md-12">
                <form action="searchstudentforteacherattendance" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Search</label>
                        </div>
                        <input type="text" class="form-control" placeholder="Enter Student Firstname" name="firstname">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id = "searchstudentforteacherattendance" type="submit">Search</button>
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
                       
                          
                          <a> 

                              <button class="btn btn-primary mb-1" 
                                      id="btattendancereportdownload"
                                      name="btattendancereportdownload"
                                      data-toggle="modal" 
                                      data-target="#attendancereportdownload">
                                  <i class="fa fa-download"></i> 
                                  Download Attendance
                              </button>
                              
                      
                          </a>
        </div>
       
        
      
                        <div id="refreshattendance" class="modal" tabindex="-1" role="dialog" aria-labelledby="approvePaymentLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Submit Class Attendance</h5>
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
      
     
     
     
     
     
      
                <div class="modal fade" id="attendancereportdownload" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content ">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Select Date To Download Attendance</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="downloadattendance" method="post" name="downloadattendanceform">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            
                                            <input type="hidden" name="username" value="${name}">
                                          
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
