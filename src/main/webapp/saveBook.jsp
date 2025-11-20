<%@ page import="com.app.DAO.BookDAO, com.app.model.book" %>

<%
    book b = new book();
    b.setTitle(request.getParameter("title"));
    b.setAuthor(request.getParameter("author"));
    b.setPrice(Double.parseDouble(request.getParameter("price")));

    int i = BookDAO.saveBook(b);
%>

<!DOCTYPE html>
<html>
<head><title>Save Book</title></head>
<body>

<div class="glass-box">

<%
    if(i > 0){
%>


<h1 style="background-color: crimson; color: white; text-align: center; padding: 20px; border-radius: 10px;">
<b><i><u> Book Added Successfully!</u></i></b>
</h1>
<center><a  style=align-items: center;
    border: 20px solid aliceblue; href="viewbooks.jsp">View Books</a></center>

<%
    } else {
%>

<h1 style="background-color: crimson; color: white; text-align: center; padding: 20px; border-radius: 10px;">
<b><i><u> Failed to Book Added !</u></i></b>
</h1>

<a style=align-items: center;
    border: 20px solid aliceblue;
     href="addBook.jsp">Try Again</a>

<%
    }
%>

</div>

</body>
</html>



