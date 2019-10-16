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

        
        
        
        
        </div>
</div>