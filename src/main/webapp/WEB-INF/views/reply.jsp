<%@ page import="nlu.edu.vn.forum.models.Topic" %>
<%@ page import="nlu.edu.vn.forum.services.ForumService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String topicId = request.getParameter("id");
    Topic topic = ForumService.getInstance().findTopic(Integer.parseInt(topicId));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reply Page</title>
    <!-- Thêm CSS của Bootstrap vào trang -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div  class="card-header mb-5 mt-5">
                    <h4 class="row justify-content-center">Reply</h4>
                </div>
                <form id="post-message-form">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input disabled type="text" value="Re: ${topic.title}" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="content">Content</label>
                        <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                    </div>

                    <button onclick="reply()" type="button" class="btn btn-primary">Tạo</button>
                    <a href="/forum" type="button" class="btn btn-warning">Hủy</a>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function reply() {
        const  title = $('#title').val();
        const content = $('#content').val();

        if (!title || !content) {
            alert("Vui lòng điền đầy đủ thông tin");
            return;
        }
        const data = {
            "title": title,
            "content": content
        };

        $.ajax({
            type: "POST",
            url: "/topics/" + ${topic.id} + "/messages",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function(response) {
                alert("Trả lời thành công")
                window.location.href ="/topic-detail?id=${topic.id}"
            },
            error: function(xhr, status, error) {
                alert("Trả lời không thành công lỗi")
            }
        });
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
