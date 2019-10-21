<%-- 
    Document   : MeetTeachersPage
    Created on : Oct 13, 2019, 10:57:53 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">Meet Teachers</div>
    <div class="card-body">
        
        
        
<div>
       <div class="col-md-12">
                <form action="searchteacherforparent" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="inputGroupSelect01">Search</label>
                        </div>
                        <input type="text" class="form-control" placeholder="Enter Subject" name="subject">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id = "searchTeacherForParent" type="submit">Search</button>
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
                            <th>Subject Teaching</th>
                             <th>Class Teaching</th>
                             <th>Complain About</th>
                             <th style=" color: greenyellow;">Good Comment</th>
                    
                            
                           
                       </tr>
                    </thead>
                    
                 <c:forEach items="${getTeacherDetails}" var = "getAllTeachers" varStatus="status">
                     
                            
                            <tr class="table">
                                <td>${getAllTeachers.firstname}</td>
                                 <td>${getAllTeachers.lastname}</td>
                                 <td>${getAllTeachers.sex}</td>
                                 <td>${getAllTeachers.subjectname}</td>
                                 <td>${getAllTeachers.classteaching}</td>
                                 
                                 
                                 <td>
       <a href="${pageContext.request.contextPath}/sendTeachermessage/${getAllTeachers.firstname}/${getAllTeachers.lastname}/${getAllTeachers.phonenumber}" class="btn btn-primary link">Complain</a>
                                 </td>
                                 
                                                <td>
       <a href="${pageContext.request.contextPath}/commentmessage/${getAllTeachers.firstname}/${getAllTeachers.lastname}/${getAllTeachers.username}" class="btn btn-primary link">Comment</a>
                                 </td>
                           
                            </tr>
                            
                       
                       
               </c:forEach>
                   
                </table>
                
            </div>
        
        
        
        
        
        
        
    </div>
</div>