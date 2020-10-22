<%-- 
    Document   : testInfo
    Created on : 10 thg 10, 2020, 11:41:35
    Author     : macbookpro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th> Person Go</th>
                <th> Date Buy</th>
                <th> Price </th>
            </tr>
        <c:forEach var="ticket" items="${listTicket}">
            <tr>
                <td> ${ticket.namePersonBuyTicket}</td>
                <td> ${ticket.dateBuyTicket}</td>
                <td> ${ticket.price}</td>
            </tr>
        </c:forEach>
            
        </table>
    </body>
</html>
