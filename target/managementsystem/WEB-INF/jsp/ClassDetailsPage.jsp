<%-- 
    Document   : ClassDetailsPage
    Created on : Oct 24, 2019, 6:42:20 PM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="card">
    <div class="card-header" align="center">Class Details for ${classname}</div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                    <tr class="blue-grey white-text">


                        <th>Class-Teacher</th>                                        


                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${classteacher}</td>

                    </tr>
                </tbody>
            </table>
        </div>

        
        <hr>
        <div>
        <p>Students In ${classname}</p>
        </div>
           <div class="table-responsive">
            <table class="table table-bordered table-striped" style="font-size: 15px">
                <thead>
                    <tr class="blue-grey white-text">


                        <th>S/N</th>          
                        <th>Firstname</th> 
                        <th>Lastname</th> 
                        <th>Sex</th> 


                    </tr>
                </thead>
                <tbody>
                <div>
                    <p>
                        ${error}
                    </p>
                </div>
                     <c:forEach items="${getClassStudents}" var = "getClassStudents" varStatus="status">
                    <tr>
                       
                        <td>${status.count}</td>
                         <td>${getClassStudents.firstname}</td>
                          <td>${getClassStudents.lastname}</td>
                           <td>${getClassStudents.sex}</td>
                           
                    </tr>
                     </c:forEach>
                </tbody>
            </table>
        </div>

    </div>

</div>
