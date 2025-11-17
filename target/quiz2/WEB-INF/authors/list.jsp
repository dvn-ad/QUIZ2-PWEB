<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Authors</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
<div class="container">
    <header>
        <h1>Authors</h1>
    </header>

    <a class="btn" href="${pageContext.request.contextPath}/authors?action=create">New Author</a>
    <a class="btn" href="${pageContext.request.contextPath}/">Home</a>

    <table>
        <tr><th>ID</th><th>Name</th><th>Bio</th><th>Actions</th></tr>
        <% java.util.List authors = (java.util.List) request.getAttribute("authors");
           for(Object o: authors){ com.example.model.Author a=(com.example.model.Author)o; %>
        <tr>
            <td><%=a.getId()%></td>
            <td><%=a.getName()%></td>
            <td><%=a.getBio()%></td>
            <td class="actions">
                <a href="<%=request.getContextPath()%>/authors?action=view&id=<%=a.getId()%>">View</a>
                <a href="<%=request.getContextPath()%>/authors?action=edit&id=<%=a.getId()%>">Edit</a>
                <a href="<%=request.getContextPath()%>/authors?action=delete&id=<%=a.getId()%>" onclick="return confirm('Delete this author?')">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>

    <footer><small>Authors CRUD — Beautiful Library</small></footer>
</div>
</body>
</html>
