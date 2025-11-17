<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Library - Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css" />
</head>
<body>
<div class="container">
    <header>
        <h1>Welcome to the Beautiful Library</h1>
        <p>Manage Books and Authors with delightful UI.</p>
    </header>

    <nav>
        <a class="btn" href="${pageContext.request.contextPath}/books">Books</a>
        <a class="btn" href="${pageContext.request.contextPath}/authors">Authors</a>
    </nav>

    <section>
        <h2>Quick Actions</h2>
        <ul>
            <li><a href="${pageContext.request.contextPath}/books?action=create">Add a New Book</a></li>
            <li><a href="${pageContext.request.contextPath}/authors?action=create">Add a New Author</a></li>
        </ul>
    </section>

    <footer>
        <small>Made with care — JSP CRUD demo</small>
    </footer>
</div>
</body>
</html>
