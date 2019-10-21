<%-- 
    Document   : StudentRecordPage
    Created on : Oct 15, 2019, 8:13:34 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<div class="card">
    <div class="card-header" align="center">Student Records</div>
    <div class="card-body">
        
        
        
        
     <div>
       <div class="col-md-12">
                <form action="searchstudentforteacherrecord" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Search</label>
                        </div>
                        <input type="text" class="form-control" placeholder="Enter Student Firstname" name="firstname">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id = "searchstudentforteacherrecord" type="submit">Search</button>
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
                            <th></th>
                            <th></th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${getClassStudents}" var = "getClassStudents" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${getClassStudents.firstname}</td>
                                <td>${getClassStudents.lastname}</td>
                                <td>${getClassStudents.sex}</td>
                                <td>
                                    <a href="updaterecord/${getClassStudents.firstname}/${getClassStudents.lastname}" class="btn btn-primary link">Update Records</a>
       
                                </td>
                                <td>
                                    <a href="seerecords/${getClassStudents.firstname}/${getClassStudents.lastname}/${getClassStudents.sex}" class="btn btn-primary link">Records</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

                      
        
        
        
        
         
        
        
    </div>
</div>

          
      
    
