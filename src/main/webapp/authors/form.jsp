<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Author Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
<div class="container card">
    <h1><%= request.getAttribute("author") != null ? "Edit Author" : "New Author" %></h1>
    <form method="post" action="<%=request.getContextPath()%>/authors">
        <%
            com.example.model.Author author = (com.example.model.Author) request.getAttribute("author");
        %>
        <input type="hidden" name="id" value="<%= (author!=null?author.getId():"") %>" />
        <label>Name</label>
        <input type="text" name="name" value="<%= (author!=null?author.getName():"") %>" required />

        <label>Bio</label>
        <textarea name="bio"><%= (author!=null?author.getBio():"") %></textarea>

        <div style="margin-top:12px">
            <button class="btn" type="submit">Save</button>
            <a class="btn" href="<%=request.getContextPath()%>/authors">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
