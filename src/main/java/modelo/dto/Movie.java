package modelo.dto;

public class Movie {
    private String title;
    private String imageUrl;
    private String rating;

    public Movie(String title, String imageUrl, String rating) {
        this.title = title;
        this.imageUrl = imageUrl;
        this.rating = rating;
    }

    // Getters y setters
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getRating() { return rating; }
    public void setRating(String rating) { this.rating = rating; }
}