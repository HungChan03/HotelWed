<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Management Admin</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #000000;
                color: white;
            }
            .button-link {
                margin: 5px;
                padding: 10px 15px;
                font-size: 16px;
                color: white;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }

            .button-link.logout {
                background-color: #dc3545;
            }

            .button-link.read {
                background-color: #007bff;
            }

            .button-link.booked {
                background-color: #28a745;
            }

            .button-link.occupied {
                background-color: #ffc107;
            }
            .button-link.availble {
                background-color: #ffd08b;
            }
            .button-link.service {
                background-color: #17a2b8;
            }

            .button-link:hover {
                opacity: 0.8;
            }

            table {
                background-color: #495057;
            }
            th, td {
                text-align: center;
            }

            input[type="radio"] {
                display: none;
            }

            input[type="radio"] + label {
                position: relative;
                padding-left: 30px;
                cursor: pointer;
                color: white;
            }

            input[type="radio"] + label:before {
                content: '';
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                width: 20px;
                height: 20px;
                border: 2px solid #007BFF;
                border-radius: 50%;
                background-color: transparent;
            }

            input[type="radio"]:checked + label:before {
                background-color: #007BFF;
                border-color: #0056b3;
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
    <body class="container">
        <h2 class="text-center mt-4">Information of Room's Status</h2>
        <div class="text-center mb-4">
            <button class="button-link logout" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>
            <button class="button-link read" onclick="redirectToJSP('/Read')">READ</button>
             <button class="button-link service" onclick="redirectToJSP('/readService')">SERVICE MANAGE</button>
                  <button class="btn btn-light" onclick="redirectToJSP('/readPriceRoom')">ROOM PRICE</button>
            <button class="button-link availble " onclick="redirectToJSP('/readAvailableRoom')">AVAILABLE</button>
            <button class="button-link booked" onclick="redirectToJSP('/readBookedRoom')">BOOKED</button>
            <button class="button-link occupied" onclick="redirectToJSP('/readOccupiedRoom')">OCCUPIED</button>
           
        </div>

        <table class="table table-dark table-bordered">
            <thead>
                <tr>
                    <th>Room_Code</th>
                    <th>Room_ID</th>
                    <th>Available</th>
                    <th>Booked</th>
                    <th>Occupied</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${dataRoom}" var="room">
                    <tr>
                        <td>${room.code}</td>
                        <td>${room.ID}</td>
                        <td>
                            <input type="radio" id="avai_${room.code}" name="avai_${room.code}" value="ON" disabled <c:if test="${room.available}">checked="checked" disabled</c:if> />
                            <label for="avai_${room.code}"></label>
                        </td>
                        <td>
                            <input type="radio" id="booked_${room.code}" name="booked_${room.code}" value="ON" disabled <c:if test="${room.booked}">checked="checked" disabled</c:if> />
                            <label for="booked_${room.code}"></label>
                        </td>
                        <td>
                            <input type="radio" id="occup_${room.code}" name="occup_${room.code}" value="ON" disabled <c:if test="${room.occupied}">checked="checked" disabled</c:if> />
                            <label for="occup_${room.code}"></label>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
