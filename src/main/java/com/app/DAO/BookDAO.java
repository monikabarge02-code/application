package com.app.DAO;

import java.sql.*;
import java.util.*;
import com.app.model.book;

public class BookDAO {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/librarydb", "root", "root");
        return con;
    }

    // SAVE BOOK
    public static int saveBook(book b) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        PreparedStatement pstmt = con.prepareStatement(
            "INSERT INTO books (title, author, price) VALUES (?, ?, ?)"
        );

        pstmt.setString(1, b.getTitle());
        pstmt.setString(2, b.getAuthor());
        pstmt.setDouble(3, b.getPrice());

        return pstmt.executeUpdate();
    }

    // GET ALL BOOKS
    public static List<book> getAllBooks() throws ClassNotFoundException, SQLException {
        List<book> list = new ArrayList<>();
        Connection con = getConnection();
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM books");
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            book b = new book();
            b.setId(rs.getInt(1));
            b.setTitle(rs.getString(2));
            b.setAuthor(rs.getString(3));
            b.setPrice(rs.getDouble(4));

            list.add(b);
        }
        return list;
    }

    // GET BOOK BY ID
    public static book getBookById(int id) throws ClassNotFoundException, SQLException {
        book b = null;
        Connection con = getConnection();
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM books WHERE id=?");
        pstmt.setInt(1, id);

        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            b = new book();
            b.setId(rs.getInt(1));
            b.setTitle(rs.getString(2));
            b.setAuthor(rs.getString(3));
            b.setPrice(rs.getDouble(4));
        }
        return b;
    }

    // UPDATE BOOK
    public static boolean updateBook(book b) throws ClassNotFoundException, SQLException {
        Connection con = getConnection();
        PreparedStatement pstmt = con.prepareStatement(
            "UPDATE books SET title=?, author=?, price=? WHERE id=?"
        );

        pstmt.setString(1, b.getTitle());
        pstmt.setString(2, b.getAuthor());
        pstmt.setDouble(3, b.getPrice());
        pstmt.setInt(4, b.getId());

        return pstmt.executeUpdate() == 1;
    }

    // DELETE BOOK
    public static int deleteBook(int id) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM books WHERE id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }
}
