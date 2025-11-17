package com.example.servlet;

import com.example.dao.AuthorDao;
import com.example.dao.BookDao;
import com.example.model.Author;
import com.example.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/books")
public class BookServlet extends HttpServlet {
    private final BookDao bookDao = new BookDao();
    private final AuthorDao authorDao = new AuthorDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "create":
                req.setAttribute("authors", authorDao.list());
                req.getRequestDispatcher("/books/form.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Book b = bookDao.find(id);
                req.setAttribute("book", b);
                req.setAttribute("authors", authorDao.list());
                req.getRequestDispatcher("/books/form.jsp").forward(req, resp);
                break;
            case "view":
                id = Integer.parseInt(req.getParameter("id"));
                b = bookDao.find(id);
                Author a = authorDao.find(b.getAuthorId());
                req.setAttribute("book", b);
                req.setAttribute("author", a);
                req.getRequestDispatcher("/books/detail.jsp").forward(req, resp);
                break;
            case "delete":
                id = Integer.parseInt(req.getParameter("id"));
                bookDao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/books");
                break;
            default:
                List<Book> list = bookDao.list();
                req.setAttribute("books", list);
                req.setAttribute("authorsMap", authorDao.list());
                req.getRequestDispatcher("/books/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String idStr = req.getParameter("id");
        String title = req.getParameter("title");
        int authorId = Integer.parseInt(req.getParameter("authorId"));
        String desc = req.getParameter("description");

        if (idStr == null || idStr.isEmpty()) {
            Book b = new Book(0, title, authorId, desc);
            bookDao.create(b);
        } else {
            int id = Integer.parseInt(idStr);
            Book b = new Book(id, title, authorId, desc);
            bookDao.update(b);
        }
        resp.sendRedirect(req.getContextPath() + "/books");
    }
}
