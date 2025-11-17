<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Book Detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
<div class="container card">
    <h1>Book Details</h1>
    <%
        com.example.model.Book book = (com.example.model.Book) request.getAttribute("book");
        com.example.model.Author author = (com.example.model.Author) request.getAttribute("author");
    %>
    <p><strong>Title:</strong> <%=book.getTitle()%></p>
    <p><strong>Author:</strong> <%= (author!=null?author.getName():"—") %></p>
    <p><strong>Description:</strong><br/> <%=book.getDescription()%></p>

    <a class="btn" href="<%=request.getContextPath()%>/books">Back to List</a>
    <a class="btn" href="<%=request.getContextPath()%>/books?action=edit&id=<%=book.getId()%>">Edit</a>
</div>
</body>
</html>
