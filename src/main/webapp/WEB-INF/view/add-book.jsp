<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Book</title>
</head>
<body>
    <h1>Create New Book</h1>
    <form action="/book/save" method="post">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required><br><br>

            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required><br><br>

            <button type="submit">Save</button>
        </form>
</body>
</html>