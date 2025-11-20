<%@ page import="com.app.DAO.BookDAO, com.app.model.book" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    book b = BookDAO.getBookById(id);
%>

<!DOCTYPE html>
<html>
<head><title>Edit Book</title></head>
<body>

<h2>Edit Book</h2>

<form action="updatebook.jsp" method="post">
    <input type="hidden" name="id" value="<%= b.getId() %>">

    Title: <input type="text" name="title" value="<%= b.getTitle() %>"><br><br>
    Author: <input type="text" name="author" value="<%= b.getAuthor() %>"><br><br>
    Price: <input type="number" step="0.01" name="price" value="<%= b.getPrice() %>"><br><br>

    <input type="submit" value="Update Book">
</form>

</body>
</html>
