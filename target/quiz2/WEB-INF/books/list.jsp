<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Books</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
<div class="container">
    <header>
        <h1>Books</h1>
    </header>

    <a class="btn" href="${pageContext.request.contextPath}/books?action=create">New Book</a>
    <a class="btn" href="${pageContext.request.contextPath}/">Home</a>

    <table>
        <tr><th>ID</th><th>Title</th><th>Author</th><th>Actions</th></tr>
        <%
            java.util.List books = (java.util.List) request.getAttribute("books");
            java.util.List authors = (java.util.List) request.getAttribute("authorsMap");
            for (Object o : books) {
                com.example.model.Book b = (com.example.model.Book) o;
                com.example.model.Author a = null;
                for (Object ao : authors) {
                    com.example.model.Author a2 = (com.example.model.Author) ao;
                    if (a2.getId() == b.getAuthorId()) { a = a2; break; }
                }
        %>
        <tr>
            <td><%=b.getId()%></td>
            <td><%=b.getTitle()%></td>
            <td><%= (a!=null? a.getName():"—") %></td>
            <td class="actions">
                <a href="<%=request.getContextPath()%>/books?action=view&id=<%=b.getId()%>">View</a>
                <a href="<%=request.getContextPath()%>/books?action=edit&id=<%=b.getId()%>">Edit</a>
                <a href="<%=request.getContextPath()%>/books?action=delete&id=<%=b.getId()%>" onclick="return confirm('Delete this book?')">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>

    <footer><small>Books CRUD —  Beautiful Library</small></footer>
</div>
</body>
</html>
