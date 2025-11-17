<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Book Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
<div class="container card">
    <h1><%= request.getAttribute("book") != null ? "Edit Book" : "New Book" %></h1>
    <form method="post" action="<%=request.getContextPath()%>/books">
        <%
            com.example.model.Book book = (com.example.model.Book) request.getAttribute("book");
            java.util.List authors = (java.util.List) request.getAttribute("authors");
        %>
        <input type="hidden" name="id" value="<%= (book!=null?book.getId():"") %>" />
        <label>Title</label>
        <input type="text" name="title" value="<%= (book!=null?book.getTitle():"") %>" required />

        <label>Author</label>
        <select name="authorId">
            <% for(Object o: authors){ com.example.model.Author a=(com.example.model.Author)o; %>
                <option value="<%=a.getId()%>" <%= (book!=null && book.getAuthorId()==a.getId())?"selected":"" %>><%=a.getName()%></option>
            <% } %>
        </select>

        <label>Description</label>
        <textarea name="description"><%= (book!=null?book.getDescription():"") %></textarea>

        <div style="margin-top:12px">
            <button class="btn" type="submit">Save</button>
            <a class="btn" href="<%=request.getContextPath()%>/books">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
