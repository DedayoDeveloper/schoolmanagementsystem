<%-- 
    Document   : ViewChildren
    Created on : Oct 31, 2019, 6:27:16 PM
    Author     : oreoluwa
--%>


<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<div class="card">
    <div class="card-header" align="center">Children Registered to ${firstname} ${lastname}</div>
    <div class="card-body">
        
        
          <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                    <tr class="blue-grey white-text">
                        <th><input type="checkbox" class="masterCheck"></th> 
                        <th>S/N</th>
                        <th>Firstname</th>                                        
                        <th>Lastname</th>
                        <th>Student-Class</th>
                        <th>Age</th>
                        <th>sex</th>
                       
                        

                    </tr>
                </thead>
                <tbody>
              
                                <c:forEach items="${getChildList}" var = "getChildList" varStatus="status">
                        <tr>
                            <td>
                                <input type="checkbox" class="parentstudentcollectionBox" value="${getChildList.id}">  
                                <input type="hidden" value="${getChildList.id}">
                            </td>
                            <td>${status.count}</td>
                            <td>${getChildList.firstname}</td>
                            <td>${getChildList.lastname}</td>
                            <td>${getChildList.studentclass}</td>
                            <td>${getChildList.age}</td>
                            <td>${getChildList.sex}</td>
                          
                         
                        </tr>
                    </c:forEach>
                    
                    
                    
                </tbody>
            </table>
        </div>

        
        
        
    </div>
</div>

