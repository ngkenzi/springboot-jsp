<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Edit Book</title>
  </head>
  <body>
    <h1>Edit Book</h1>
    <form method="post" id="editForm">
      <label for="title">Title:</label>
      <input
        type="text"
        id="title"
        name="title"
        value="${book.title}"
        required
      /><br /><br />

      <label for="author">Author:</label>
      <input
        type="text"
        id="author"
        name="author"
        value="${book.author}"
        required
      /><br /><br />

      <button type="button" onclick="updateBook()">Save</button>
    </form>
  </body>
</html>

<script>
  function updateBook() {
    var title = document.getElementById("title").value;
    var author = document.getElementById("author").value;
    var bookId = "${book.id}";

    var updatedBook = {
      title: title,
      author: author,
    };

    fetch("/book/update/" + bookId, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(updatedBook),
    })
      .then((response) => {
        if (response.ok) {
          window.location.href = "/book/books";
        } else {
          console.error("Error updating book");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
</script>
