<%-- 
    Document   : studentdetails
    Created on : Oct 14, 2019, 8:28:29 AM
    Author     : oreoluwa
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">
    <div class="card-header" align="center">Student Details</div>
    <div class="card-body">
        
         
        
         <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">

                    <thead>
                        <tr class="blue-grey white-text">
                            
                            <th>Date</th>                                        
                            <th>Attendance</th>
                            
                          
                            
                           
                       </tr>
                    </thead>
                    
                 <c:forEach items="${getStudentDetails}" var = "getStudentDetails" varStatus="status">
                     
                            
                            <tr class="table">
                                <td>${getStudentDetails.date}</td>
                                 <td>${getStudentDetails.attendance}</td>
                                
                                 
                        
                           
                            </tr>
                            
                       
                       
               </c:forEach>
                   
                </table>
                
            </div>
        
        
        
    </div>
</div>