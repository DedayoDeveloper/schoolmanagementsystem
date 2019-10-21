<%-- 
    Document   : SeeRecordsPage
    Created on : Oct 15, 2019, 10:05:56 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div class="card">
    <div class="card-header" align="center">Student Records</div>
    <div class="card-body">
 
       <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">

                    <thead>
                        <tr>
                            <th>Subjects</th>
                            <th>Assessment One</th>
                            <th>Assessment Two</th>
                            <th>Assessment Three</th>
                            <th>Final Exam</th>
                            <th>Total / 100</th>
                            <th>Grade</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                         <c:forEach items="${getStudentRecords}" var = "getStudentRecords" varStatus="status">
                        <tr>
                            <td>${getStudentRecords.subject}</td>
                            <td>${getStudentRecords.assessmentone}</td>
                            <td>${getStudentRecords.assessmenttwo}</td>
                            <td>${getStudentRecords.assessmentthree}</td>
                            <td>${getStudentRecords.finalexam}</td>
                            <td>${getStudentRecords.total}</td>
                            <td>${getStudentRecords.grade}</td>
                        </tr>
                        
                    
                  </c:forEach>
                    </tbody>
                </table>
            </div>

        
        <a>
             <button class="btn btn-primary mb-1" 
                                      id="btresultreportdownload"
                                      name="btresultreportdownload"
                                      data-toggle="modal" 
                                      data-target="#resultreportdownload">
                                  <i class="fa fa-download"></i> 
                                  Download Result
                              </button>
        </a>
        
        
        </div>
</div>




     <div class="modal fade" id="resultreportdownload" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content ">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Download Student Result</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="downloadresult" method="post" name="downloadattendanceform">
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="hidden" name="subject" value="${subject}">
                                            <input type="hidden" name="firstname" value="${firstname}">
                                            <input type="hidden" name="lastname" value="${lastname}">
                                            <input type="hidden" name="sex" value="${sex}">
                                           
                                        </div>
                                        
                                    </div>
                                    <hr class="w-100">
                                    <div class="form-group">
                                        <label>Download Report As</label>
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