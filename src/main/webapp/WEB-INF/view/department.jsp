<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Department table</title>
  </head>
  <body>
    <h1>Department table</h1>
    <table border="1">
      <tr>
        <th>ID</th>
        <th>Department Name</th>
        <th>Action</th>
      </tr>
      <c:forEach items="${department}" var="department">
        <tr>
          <td>${department.id}</td>
          <td>${department.departmentName}</td>
          <td>
            <button onclick="editDepartment(${department.id})">Edit</button>
            <button onclick="deleteDepartment(${department.id})">Delete</button>
          </td>
        </tr>
      </c:forEach>
    </table>
    <button onclick="addDepartment()">Add</button>
  </body>
</html>

<script>
  function addDepartment() {
    window.location.href = "/department/add";
  }

  function editDepartment(id) {
    console.log(id);
    window.location.href = "/department/edit/" + id;
  }

  function deleteDepartment(id) {
    if (confirm("Are you sure you want to delete this book?")) {
      fetch("/department/delete/" + id, {
        method: "DELETE",
      })
        .then((response) => {
          if (response.ok) {
            location.reload();
          } else {
            console.error("Delete request failed");
          }
        })
        .catch((error) => {
          console.error("An error occurred:", error);
        });
    }
  }
</script>
