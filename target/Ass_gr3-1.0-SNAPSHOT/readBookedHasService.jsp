<%-- 
    Document   : readBookedHasServie
    Created on : Oct 27, 2024, 1:10:47 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booked Room</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #343a40; 
            color: white; 
            margin: 20px;
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
    <h1>ROOM HAS SERVICE</h1>
    <div class="text-center">
        <button class="btn btn-danger" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>
        <button class="btn btn-primary" onclick="redirectToJSP('/Read')">READ</button>
        <button class="btn btn-warning" onclick="redirectToJSP('/RoomManageServlet')">ROOM MANAGE</button>
        <button class="btn btn-info" onclick="redirectToJSP('/readService')">SERVICE MANAGE</button>
        <button class="btn btn-light" onclick="redirectToJSP('/readPriceRoom')">ROOM PRICE</button>
        <button class="btn btn-success" onclick="redirectToJSP('/readOccupiedRoom')">OCCUPIED</button>
        <button class="btn btn-success" onclick="redirectToJSP('/readAvailableRoom')">AVAILABLE</button>
    </div>
    <div class="container">
        <table class="table table-bordered table-striped table-dark">
            <thead class="thead-dark">
                <tr>
                    <th>Reservation ID</th>
                    <th>Room Code</th>
                    <th>Total Price</th>
                    <th>Check-in Date</th>
                    <th>Check-out Date</th>
                    <th>Customer Name</th>
                    <th>Phone Number</th>
                    <th>Service Name</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${datare}" var="data">
                    <tr>
                        <td>${data.reservation_ID}</td>
                        <td>${data.room_Code}</td>
                        <td>${data.totalPrice}</td>
                        <td>${data.check_In_Date}</td>
                        <td>${data.check_Out_Date}</td>
                        <c:forEach items="${datacus}" var="customer">
                            <c:if test="${customer.ID == data.customer_ID}">
                                <td>${customer.name}</td>
                                <td>${customer.phoneNumber}</td>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${dataRHS}" var="RHS">
                            <c:forEach items="${dataser}" var="ser">
                                <c:if test="${ser.id == RHS.serviceid && data.reservation_ID == RHS.reservationid}">
                                    <td>${ser.name}</td>
                                    
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
