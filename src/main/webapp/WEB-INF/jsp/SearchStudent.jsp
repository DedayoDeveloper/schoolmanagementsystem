<%-- 
    Document   : SearchStudent
    Created on : Oct 7, 2019, 10:00:58 PM
    Author     : oreoluwa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="card">
    <div class="card-header" align="center">Search Student</div>
    <div class="card-body">


<div>
       <div class="col-md-12">
                <form action="searchParentStudent" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Search</label>
                        </div>
                        <select class="custom-select" id="search_by" name="search_by">
                            <option selected>Select Search...</option>
                            <option value="firstname">Firstname</option>
                            <option value="lastname">Lastname</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Enter name" name="search_string" id="search_string">
                        <input type="hidden" name="table_name" value="tbl_students">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id = "searchStudent" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </div>
</div>



   <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">

                    <thead>
                        <tr class="blue-grey white-text">
                            
                            <th>Firstname</th>                                        
                            <th>Lastname</th>
                            <th>Sex</th>
                            <th>Age</th>
                            <th>Class</th>
                            <th>Student Details</th>
                          
                            
                           
                       </tr>
                    </thead>
                    
                 <c:forEach items="${SearchStudent}" var = "SearchStudent" varStatus="status">
                     
                            
                            <tr class="table">
                                <td>${SearchStudent.firstname}</td>
                                 <td>${SearchStudent.lastname}</td>
                                 <td>${SearchStudent.sex}</td>
                                 <td>${SearchStudent.age}</td>
                                 <td>${SearchStudent.studentclass}</td>
                                 
                                 <td>
       <a href="${pageContext.request.contextPath}/getStudentDetails/${SearchStudent.firstname}/${SearchStudent.lastname}/${SearchStudent.sex}" class="btn btn-primary link"> Student Details</a>
                                 </td>
                           
                            </tr>
                            
                       
                       
               </c:forEach>
                   
                </table>
                
            </div>
                 
       </div>  
</div>