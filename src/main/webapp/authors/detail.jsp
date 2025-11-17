<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Author Detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
<div class="container card">
    <h1>Author Details</h1>
    <%
        com.example.model.Author a = (com.example.model.Author) request.getAttribute("author");
    %>
    <p><strong>Name:</strong> <%=a.getName()%></p>
    <p><strong>Bio:</strong><br/> <%=a.getBio()%></p>

    <a class="btn" href="<%=request.getContextPath()%>/authors">Back to List</a>
    <a class="btn" href="<%=request.getContextPath()%>/authors?action=edit&id=<%=a.getId()%>">Edit</a>
</div>
</body>
</html>
