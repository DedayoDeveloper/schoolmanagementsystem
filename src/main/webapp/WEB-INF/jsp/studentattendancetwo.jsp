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
                    
                    <tbody>
                     
                        <c:forEach items="${StudentAttendanceList}" var = "StudentAttendanceList" varStatus="status">
                            
                            <tr>
                               
                                <td>${status.count}</td>
                                 <div style=" display: none;" id="studentattendanceid">${StudentAttendanceList.id}</div>
                                 <td>${StudentAttendanceList.firstname}</td>
                                 <td>${StudentAttendanceList.lastname}</td>
                                 <td>${StudentAttendanceList.sex}</td>
                      
                                 
                      
                                
                                <td>  
                                 
                                  <a id="presentattendance" class="btn btn-primary link" type="submit" href="markattendance/${StudentAttendanceList.firstname}/${StudentAttendanceList.lastname}/${StudentAttendanceList.sex}">Mark Attendance</a>
                                
                                </td>   
                                
                            
                                  
                              </c:forEach>     
                                
                                
                          
                         
                            </tr>
                            
                       
                          
                    </tbody>
                   
                </table>
                
            </div>
                 
                      
        
       
     
                    <div>
                          <a type="button" class="btn btn-primary"> Submit Attendance</a>
                        <a type="button" class="btn btn-primary"> Download Attendance</a>
        </div>
       
        
      
        
      
        
        
    </div>
</div>
    
   
   