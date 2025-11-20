<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Book</title>
    <link rel="stylesheet" type="text/css" href="Resource/Css/addbook.css">

</head>
<body>

<div class="box">
    <h2>Add New Book</h2>

    <form action="saveBook.jsp" method="post">

        <center><label>ID</label></center>
        <input type="text" name="id" placeholder="Enter Book ID" required>

       <center> <label>Title / Name:</label></center>
        <input type="text" name="title" placeholder="Enter Book Title" required>

       <ceneter> <label>Author:</label></ceneter>
        <input type="text" name="author" placeholder="Enter Author Name" required>

       <center><label>Price:</label></center> 
        <input type="text" name="price" placeholder="Enter Price" required>

        <button type="submit">Add Book</button>
    </form>
</div>

</body>
</html>
