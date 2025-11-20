<%@ page import="com.app.DAO.BookDAO, com.app.model.book" %>

<%
    book b = new book();
    b.setId(Integer.parseInt(request.getParameter("id")));
    b.setTitle(request.getParameter("title"));
    b.setAuthor(request.getParameter("author"));
    b.setPrice(Double.parseDouble(request.getParameter("price")));

    boolean status = BookDAO.updateBook(b);
%>

<!DOCTYPE html>
<html>
<head><title>Update Book</title></head>
<body>

<%
    if(status){
%>
        <h2>✔ Book Updated Successfully!</h2>
        <a href="viewBooks.jsp">Back</a>
<%
    } else {
%>
        <h2>❌ Failed to Update Book!</h2>
        <a href="editBook.jsp?id=<%= b.getId() %>">Try Again</a>
<%
    }
%>

</body>
</html>
