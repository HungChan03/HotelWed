<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Service</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #000000; /* Nền màu đen */
                color: white; /* Màu chữ sáng */
            }
            h1 {
                text-align: center;
                margin-top: 20px;
            }
            .form-container {
                max-width: 600px;
                margin: auto;
                background-color: #495057; /* Màu nền của form */
                padding: 20px;
                border-radius: 10px; /* Bo góc */
            }
            .btn-create {
                background-color: #28a745; /* Màu xanh lá cho nút CREATE */
                color: white;
            }
            .btn-create:hover {
                opacity: 0.8; /* Hiệu ứng khi hover */
            }
            label {
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <h1>CREATE SERVICE</h1>
        <div class="form-container">
            <form action="createService" method="POST" >
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" class="form-control" name="id" value="${data}" />
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" required="required" />
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" class="form-control" name="description" required="required" />
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" class="form-control" name="price" required="required" />
                </div>
                <div class="form-group">
                    <label for="images">Images:</label>
                    <input type="file" class="form-control" name="images" required="required" />
                </div >
                <div  class="text-center">
                <button type="submit" class="btn btn-create text-center">CREATE</button>
                </div>
            </form>
        </div>
    </body>
</html>
