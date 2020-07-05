package com.eon.bookstore.entity;

import org.springframework.core.Ordered;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "books")
public class Books {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "books_count")
    private int count;

    @Column(name = "authors")
    private String authors;

    @Column(name = "original_publication_year")
    private int originalPublicationYear;

    @Column(name = "title")
    private String title;

    @Column(name = "language_code")
    private String languageCode;

    @Column(name = "average_rating")
    private int avarageRating;

    @Column(name = "ratings_count")
    private int ratingsCount;

    @Column(name = "work_ratings_count")
    private int workRatingsCount;

    @Column(name = "work_text_reviews_count")
    private String workTextReviews;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "small_image_url")
    private String SmallImageUrl;

    @Column(name = "price")
    private double price;

    @OneToMany(fetch = FetchType.LAZY,
            mappedBy = "books",
            cascade = {CascadeType.DETACH, CascadeType.MERGE,
                    CascadeType.PERSIST, CascadeType.REFRESH})
    private List<OrderedBooks> orderedBooks;

    public int getCount() {
        return count;
    }

    public String getAuthors() {
        return authors;
    }

    public int getOriginalPublicationYear() {
        return originalPublicationYear;
    }

    public String getTitle() {
        return title;
    }

    public String getLanguageCode() {
        return languageCode;
    }

    public int getAvarageRating() {
        return avarageRating;
    }

    public int getRatingsCount() {
        return ratingsCount;
    }

    public int getWorkRatingsCount() {
        return workRatingsCount;
    }

    public String getWorkTextReviews() {
        return workTextReviews;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getSmallImageUrl() {
        return SmallImageUrl;
    }

    public List<OrderedBooks> getOrderedBooks() {
        return orderedBooks;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
