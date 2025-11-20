<%@ page import="java.util.*, com.app.DAO.BookDAO, com.app.model.book" %>

<!DOCTYPE html>
<html>
<head><title>Book List</title></head>
<body>

<h2> All Books</h2>

<table border="1" cellpadding="10">
<tr>
    <th>ID</th>
    <th>Title</th>
    <th>Author</th>
    <th>Price</th>
    <th>Actions</th>
</tr>

<%
    List<book> list = BookDAO.getAllBooks();
    for(book b : list){
%>

<tr>
    <td><%= b.getId() %></td>
    <td><%= b.getTitle() %></td>
    <td><%= b.getAuthor() %></td>
    <td><%= b.getPrice() %></td>
    <td>
        <a href="edit.jsp?id=<%= b.getId() %>">Edit</a> |
        <a href="deleteBook.jsp?id=<%= b.getId() %>">Delete</a>
    </td>
</tr>

<%
    }
%>

</table>

<br>
<a href="addBook.jsp">Add New Book</a>

</body>
</html>
