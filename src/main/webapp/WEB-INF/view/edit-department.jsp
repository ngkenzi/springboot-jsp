<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Edit Department</title>
  </head>
  <body>
    <h1>Edit Department</h1>
    <form method="post" id="editForm">
      <label for="departmentName">Department Name:</label>
      <input
        type="text"
        id="departmentName"
        name="departmentName"
        value="${department.departmentName}"
        required
      /><br /><br />

      <button type="button" onclick="updateDepartment()">Save</button>
    </form>
  </body>
</html>

<script>
  function updateDepartment() {
      var departmentName = document.getElementById("departmentName").value;
      var departmentId = "${department.id}";

      var updatedDepartment = {
          departmentName: departmentName
      };

      fetch("/department/update/" + departmentId, {
          method: "PUT",
          headers: {
              "Content-Type": "application/json"
          },
          body: JSON.stringify(updatedDepartment)
      })
      .then(response => {
          if (response.ok) {
              window.location.href = "/department/departments";
          } else {
              console.error("Error updating department");
          }
      })
      .catch(error => {
          console.error("Error:", error);
      });
  }
</script>
