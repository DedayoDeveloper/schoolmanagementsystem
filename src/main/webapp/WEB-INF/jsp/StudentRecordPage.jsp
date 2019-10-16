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
        
        
        
       <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">

                    <thead>
                        <tr>
                            <th>S/N</th>
                            <th>Firstname</th>                                        
                            <th>Lastname</th>
                            <th>Sex</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${getClassStudents}" var = "getClassStudents" varStatus="status">
                            <tr>
                                <td>${status.count + (page_num - 1)* 10}</td>
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

          
      
    
