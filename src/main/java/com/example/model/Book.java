package com.example.model;

public class Book {
    private int id;
    private String title;
    private int authorId;
    private String description;

    public Book() {}

    public Book(int id, String title, int authorId, String description) {
        this.id = id;
        this.title = title;
        this.authorId = authorId;
        this.description = description;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public int getAuthorId() { return authorId; }
    public void setAuthorId(int authorId) { this.authorId = authorId; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
