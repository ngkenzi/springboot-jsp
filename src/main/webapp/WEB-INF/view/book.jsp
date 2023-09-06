<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Book table</title>
  </head>
  <body>
    <h1>Book table</h1>
    <table border="1">
      <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Action</th>
      </tr>
      <c:forEach items="${book}" var="book">
        <tr>
          <td>${book.id}</td>
          <td>${book.title}</td>
          <td>${book.author}</td>
          <td>
            <button onclick="editBook(${book.id})">Edit</button>
            <button onclick="deleteBook(${book.id})">Delete</button>
          </td>
        </tr>
      </c:forEach>
    </table>
    <button onclick="addBook()">Add</button>
  </body>
</html>

<script>
  function addBook() {
    window.location.href = "/book/add";
  }

  function editBook(id) {
    console.log(id);
    window.location.href = "/book/edit/" + id;
  }

  function deleteBook(id) {
    if (confirm("Are you sure you want to delete this book?")) {
      fetch("/book/delete/" + id, {
        method: "DELETE",
      })
        .then((response) => {
          if (response.ok) {
            location.reload(); // Refresh the page after successful deletion
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
