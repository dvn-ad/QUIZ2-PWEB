package com.example.dao;

import com.example.model.Author;
import java.util.*;

public class AuthorDao {
    private static final Map<Integer, Author> authors = new LinkedHashMap<>();
    private static int nextId = 1;

    static {
        authors.put(nextId, new Author(nextId++, "Jane Doe", "A talented writer."));
    }

    public List<Author> list() { return new ArrayList<>(authors.values()); }
    public Author find(int id) { return authors.get(id); }

    public synchronized Author create(Author a) {
        a.setId(nextId);
        authors.put(nextId, a);
        nextId++;
        return a;
    }

    public synchronized void update(Author a) { authors.put(a.getId(), a); }
    public synchronized void delete(int id) { authors.remove(id); }
}
