<%-- 
    Document   : TeacherAttendancePage
    Created on : Oct 20, 2019, 9:08:35 PM
    Author     : oreoluwa
--%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="card">
    <div class="card-header" align="center">MARK STUDENT ATTENDANCE FOR ${currentdate}</div>
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
                     
                        
                        <c:forEach items="${SearchTeacherAttendance}" var = "SearchTeacherAttendance" varStatus="status">
                            
                            <tr class="table">
                               
                                <td>${status.count}</td>
                                 <div style=" display: none;" id="studentattendanceid">${SearchTeacherAttendance.id}</div>
                                 <td>${SearchTeacherAttendance.firstname}</td>
                                 <td>${SearchTeacherAttendance.lastname}</td>
                                 <td>${SearchTeacherAttendance.sex}</td>
                                 <td>${SearchTeacherAttendance.username}</td>
                                 
                       
                               <c:choose>
                                <c:when test="${SearchTeacherAttendance.attendancemark eq 'unmarked'}">
                      
                                <td>  
                                   
                                        <a id="markteacherattendance" class="btn btn-primary link" type="submit" href="markattendanceforteacher/${SearchTeacherAttendance.firstname}/${SearchTeacherAttendance.lastname}/${SearchTeacherAttendance.sex}/${SearchTeacherAttendance.username}">Mark Attendance</a>
                                
                                </td>   
                                        </c:when>
                                    <c:otherwise>
                                    <td>${SearchTeacherAttendance.attendancemark}</td>
                                </c:otherwise>
                            </c:choose>
                             
                           
                            </tr>
                            
                        </c:forEach>
                       
</tbody>
                   
                </table>
                
            </div>
                 
        
        
        
        
    </div>
</div>