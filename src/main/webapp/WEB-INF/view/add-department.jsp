<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Department</title>
</head>
<body>
    <h1>Create New Department</h1>
    <form action="/department/save" method="post">
            <label for="departmentName">Department Name:</label>
            <input type="text" id="departmentName" name="departmentName" required><br><br>

            <button type="submit">Save</button>
        </form>
</body>
</html>