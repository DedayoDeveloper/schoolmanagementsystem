<%-- 
    Document   : TeacherReviews
    Created on : Oct 21, 2019, 10:01:06 AM
    Author     : oreoluwa
--%>


<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<div class="card">
    <div class="card-header" align="center">Teacher Reviews</div>
    <div class="card-body">



        
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
                        <th>Class Assigned</th>
                        <th>Phonenumber</th>
                        <th>Department</th>
                        <th>Sex</th>
                        <th>Username</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
               
                             <c:forEach items="${getAllTeachers}" var = "getAllTeachers" varStatus="status">
                        <tr>
                            <td>
                                <input type="checkbox" class="teachercollectionBox" value="${getAllTeachers.id}">  
                                <input type="hidden" value="${getAllTeachers.id}">
                            </td>
                            <td>${status.count}</td>
                            <td>${getAllTeachers.firstname}</td>
                            <td>${getAllTeachers.lastname}</td>
                            <td>${getAllTeachers.classassigned}</td>
                            <td>${getAllTeachers.phonenumber}</td>
                            <td>${getAllTeachers.department}</td>
                            <td>${getAllTeachers.sex}</td>
                            <td>${getAllTeachers.username}</td>
                            
                            <td><a class="btn btn-primary link" href="teacherreviewpage/${getAllTeachers.username}">Teacher Reviews</a></td>
                        </tr>
                    </c:forEach>
                    
                    
                    
                </tbody>
            </table>
        
        </div>
        
        
        
    </div>
</div>
