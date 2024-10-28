<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Information</title>
        
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
        
        <script type="text/javascript">
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
        <h1>INFORMATION OF CUSTOMER</h1>
        <div class="text-center">
            <button class="btn btn-danger" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>
            <button class="btn btn-primary" onclick="redirectToJSP('/Read')">READ</button>
            <button class="btn btn-warning" onclick="redirectToJSP('/RoomManageServlet')">ROOM MANAGE</button>
            <button class="btn btn-info" onclick="redirectToJSP('/readService')">SERVICE MANAGE</button>
                 <button class="btn btn-light" onclick="redirectToJSP('/RoomManageServlet')">ROOM PRICE</button>
            <button class="btn btn-success" onclick="redirectToJSP('search.jsp')">SEARCH</button>
        </div>
        <br>

        <div class="container">
            <table class="table table-bordered table-striped table-dark">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Date of Birth</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${dataread}" var="cus">
                        <tr>
                            <td>${cus.ID}</td>
                            <td>${cus.name}</td>
                            <td>${cus.address}</td>
                            <td>${cus.phoneNumber}</td>
                            <td>${cus.email}</td>
                            <td>${cus.password}</td>
                            <td>${cus.age}</td>
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
