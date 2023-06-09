<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Topic Page</title>
    <!-- Thêm CSS của Bootstrap vào trang -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div clas="card mt-5">
                <div  class="card-header mb-5 mt-5">
                    <h4 class="row justify-content-center">Tạo chủ đề mới</h4>
                </div>
                <form id="new-topic-form">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="content">Content</label>
                        <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                    </div>

                    <button onclick="addTopic()" type="button" class="btn btn-primary">Tạo</button>
                    <a style="color: #fff" href="/forum" type="button" class="btn btn-warning">Hủy</a>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function addTopic() {
        const  title = document.getElementById("title").value;
        const content = document.getElementById("content").value;
        if (!title || !content) {
            alert("Vui lòng nhập đầy đủ thông tin chủ đề");
            return;
        }

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "/topics", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                alert("Tạo chủ đề mới thành công! Sau đó xin reload lai trang chủ forum");
                location.reload();
            } else if (xhr.readyState === 4) {
                alert("Đã có lỗi xảy ra, vui lòng thử lại sau.");
            }
        };
        const  data = JSON.stringify({ title: title, content: content });
        xhr.send(data);
    }
</script>
<!-- Thêm các script của Bootstrap vào trang -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>
</html>
