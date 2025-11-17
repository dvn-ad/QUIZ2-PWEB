package com.example.servlet;

import com.example.dao.AuthorDao;
import com.example.model.Author;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/authors"})
public class AuthorServlet extends HttpServlet {
    private final AuthorDao authorDao = new AuthorDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "create":
                req.getRequestDispatcher("/authors/form.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Author a = authorDao.find(id);
                req.setAttribute("author", a);
                req.getRequestDispatcher("/authors/form.jsp").forward(req, resp);
                break;
            case "view":
                id = Integer.parseInt(req.getParameter("id"));
                a = authorDao.find(id);
                req.setAttribute("author", a);
                req.getRequestDispatcher("/authors/detail.jsp").forward(req, resp);
                break;
            case "delete":
                id = Integer.parseInt(req.getParameter("id"));
                authorDao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/authors");
                break;
            default:
                List<Author> list = authorDao.list();
                req.setAttribute("authors", list);
                req.getRequestDispatcher("/authors/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String bio = req.getParameter("bio");

        if (idStr == null || idStr.isEmpty()) {
            Author a = new Author(0, name, bio);
            authorDao.create(a);
        } else {
            int id = Integer.parseInt(idStr);
            Author a = new Author(id, name, bio);
            authorDao.update(a);
        }
        resp.sendRedirect(req.getContextPath() + "/authors");
    }
}
