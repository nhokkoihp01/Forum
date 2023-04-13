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
    <title>Show Topic Page</title>
    <!-- Thêm CSS của Bootstrap vào trang -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9 row justify-content-center">
            <div class="card mt-5">
                <div class="card-header">
                    <h4>Thông tin chi tiết chủ đề</h4>
                    <a href="/logout" class=" ">Đăng xuất</a>
                </div>

            </div>
        </div>
        <div style="margin-top: 40px" class="col-md-10">
            <div class="card">
                <div class="card-header">
                    <fmt:formatDate
                            value="${topic.createdTime.getTime()}"
                            pattern="HH:mm:ss dd-MM-yyyy"/>
                </div>
                <div class="card-body">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">${topic.creator.getUsername()}</h5>
                        </div>
                    </div>
                    <h5 class="card-title">${topic.title}</h5>
                    <p class="card-text">${topic.content}</p>
                    <div style="display: flex;align-items:center;justify-content: flex-end;width: 100%;float: right">
                        <a href="/reply?id=${topic.id}">trả lời</a>
                    </div>
                </div>
                <c:forEach var="message" items="${topic.messages}">
                    <div class="card-body">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title">${message.creator.getUsername()}</h5>
                                <h5 class="card-title"><fmt:formatDate
                                        value="${message.createdTime.getTime()}"
                                        pattern="HH:mm:ss dd-MM-yyyy"/></h5>
                                <footer class="blockquote-footer"><cite title="Source Title">Hồi âm</cite></footer>

                            </div>
                        </div>
                        <h5 class="card-title">${message.title}</h5>
                        <p class="card-text">${message.content}</p>
                        <div style="display: flex;align-items:center;justify-content: flex-end;width: 100%;float: right">
                            <a href="/reply?id=${topic.id}">trả lời</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <a href="/forum" class=" ">Danh sách chủ đề</a>

        </div>
    </div>
</div>

<!-- Thêm các script của Bootstrap vào trang -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

</body>
</html>
