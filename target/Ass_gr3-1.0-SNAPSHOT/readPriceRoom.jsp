<%-- 
    Document   : updatePriceRoom
    Created on : Oct 26, 2024, 9:51:33 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Price</title>
        
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        
        <style>
            body {
                background-color: #343a40; 
                color: white; 
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #ffffff; 
            }
            table {
                background-color: #495057;
            }
            th, td {
                color: white; 
            }
            .thead-dark th {
                background-color: #212529; 
            }
            .btn {
                margin: 5px; 
            }
        </style>
        <script>
            function displayCookies() {
                let displayCookies = document.getElementById("display");
                displayCookies.innerHTML = document.cookie;
            }

            function deleteCookies() {
                sessionStorage.clear();
                let allCookies = document.cookie.split(';');

                for (let i = 0; i < allCookies.length; i++)
                    document.cookie = allCookies[i] + "=;expires="
                            + new Date(0).toUTCString();

                displayCookies.innerHTML = document.cookie;
            }

            function redirectToJSP(nameData) {
                window.location.href = nameData;
            }
        </script>
    </head>
    <body>
        <h1>ROOM PRICE</h1>
           <div class="text-center">
            <button class="btn btn-danger" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>
            <button class="btn btn-primary" onclick="redirectToJSP('/Read')">READ</button>
            <button class="btn btn-warning" onclick="redirectToJSP('/RoomManageServlet')">ROOM MANAGE</button>
            <button class="btn btn-success" onclick="redirectToJSP('/readService')">SERVICE MANAGE</button>
          
        </div>
        <div class="container">
            <table class="table table-bordered table-striped table-dark">
                <thead class="thead-dark">
                    <tr>
                        <th>ROOM ID</th>
                        <th>ROOM TYPE</th>
                        <th>CAPACITY</th>
                        <th>PRICE</th>
                        <th>DESCRIPTION</th>
                        <th>OPTION</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${data}" var="data">
                        <tr>
                            <td>${data.ID}</td>
                            <td>${data.type}</td>
                            <td>${data.capacity}</td>
                            <td>${data.price}</td>
                            <td>${data.description}</td>
                            <td>
                                <button class="btn btn-warning">
                                    <a href="updatePriceRoom?room_id=${data.ID}" style="color: white; text-decoration: none;">UPDATE</a>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
