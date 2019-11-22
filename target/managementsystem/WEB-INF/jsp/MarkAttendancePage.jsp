<%-- 
    Document   : MarkAttendancePage
    Created on : Oct 11, 2019, 8:46:15 AM
    Author     : oreoluwa
--%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 <div class="card">
    <div class="card-header" align="center">Select Attendance</div>
    <div class="card-body">
        
        <div>
            <form method="post" action="submitattendance" name="submitattendanceform">
                <input type="hidden" name="firstname" value="${firstname}">
                <input type="hidden" name="lastname" value="${lastname}">
                 <input type="hidden" name="sex" value="${sex}">
                 <div>
                Select Attendance For ${firstname} ${lastname}
                 <select class="custom-select" name="attendance">
                     <option value="PRESENT">Present</option>
                     <option value="ABSENT">Absent</option>
                 </select>
                 </div>
                 <br/>
                 <div>
                     <button type="submit" class="btn btn-primary" id="submitattendance">Submit</button>
                 </div>
            </form>
            
            
        </div>
        
        
        
        
    </div>
 </div>