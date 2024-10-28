
<%-- 
    Document   : occupiedRoom
    Created on : Oct 26, 2024, 5:16:38 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Occupied Room</title>

        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background-color: #121212;
                color: #ffffff;
                font-family: 'Montserrat', sans-serif;
            }
            h1 {
                text-align: center;
                margin-top: 20px;
                font-weight: 600;
            }
            table {
                margin: 20px auto;
                width: 80%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ffffff;
            }
            th {
                background-color: #1e1e1e;
            }
            tr:nth-child(even) {
                background-color: #232323;
            }
            tr:hover {
                background-color: #333333;
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
        <div class="container">
            <h1>OCCUPIED ROOM</h1>
            <div class="text-center">
                <button class="btn btn-danger" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>
                <button class="btn btn-primary" onclick="redirectToJSP('/Read')">READ</button>
                <button class="btn btn-warning" onclick="redirectToJSP('/RoomManageServlet')">ROOM MANAGE</button>
                <button class="btn btn-info" onclick="redirectToJSP('/readService')">SERVICE MANAGE</button>
                <button class="btn btn-light" onclick="redirectToJSP('/readPriceRoom')">ROOM PRICE</button>
                <button class="btn btn-success" onclick="redirectToJSP('/readBookedRoom')">BOOKED</button>
                <button class="btn btn-success" onclick="redirectToJSP('/readAvailableRoom')">AVAILABLE</button>
            </div>
            <table class="table table-dark table-bordered">

                <tr>
                    <th>RESERVATION ID</th>
                    <th>ROOM CODE</th>
                    <th>TOTAL PRICE</th>
                    <th>CHECK IN DATE</th>
                    <th>CHECK OUT DATE</th>
                    <th>CUSTOMER ID</th>
                    <th>CUSTOMER NAME</th>
                    <th>PHONE NUMBER</th>
                </tr>
                <c:set var="amountReservationID" value="1" />
                <c:set var="amountReservationIDCurrent" value="0" />
               
                <c:forEach items="${datare}" var="data">
                    <tr>
                        <td>${data.reservation_ID}</td>
                        <td>${data.room_Code}</td>>
                        <td>${data.totalPrice}</td>
                        <td>${data.check_In_Date}</td>
                        <td>${data.check_Out_Date}</td>
                        <td>${data.customer_ID}</td>
                        <c:forEach items="${datacustomer}" var="customer">
                            <c:if test="${customer.ID == data.customer_ID }">
                                
                                <td>${customer.name}</td>
                                <td>${customer.phoneNumber}</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
