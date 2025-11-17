package com.example.dao;

import com.example.model.Book;
import java.util.*;

public class BookDao {
    private static final Map<Integer, Book> books = new LinkedHashMap<>();
    private static int nextId = 1;

    static {
        // seed with example
        books.put(nextId, new Book(nextId++, "The First Book", 1, "A seeded book."));
        books.put(nextId, new Book(nextId++, "Another Tale", 1, "Another seeded book."));
    }

    public List<Book> list() {
        return new ArrayList<>(books.values());
    }

    public Book find(int id) {
        return books.get(id);
    }

    public synchronized Book create(Book b) {
        b.setId(nextId);
        books.put(nextId, b);
        nextId++;
        return b;
    }

    public synchronized void update(Book b) {
        books.put(b.getId(), b);
    }

    public synchronized void delete(int id) {
        books.remove(id);
    }
}
