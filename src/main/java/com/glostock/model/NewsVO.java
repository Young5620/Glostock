package com.glostock.model;

public class NewsVO {

    private String publisher_name = "";
    private String publisher_logo_url = "";
    private String publisher_icon_url = "";

    private String article_title = "";
    private String article_author = "";
    private String article_url = "";
    private String article_image_url = "";
    private String article_description = "";

    private String article_timestamp = "";


    public NewsVO() {
    }

    public NewsVO(String publisher_name, String publisher_logo_url, String article_title, String article_author, String article_url, String article_image_url, String article_description) {
        this.publisher_name = publisher_name;
        this.publisher_logo_url = publisher_logo_url;
        this.article_title = article_title;
        this.article_author = article_author;
        this.article_url = article_url;
        this.article_image_url = article_image_url;
        this.article_description = article_description;
    }

    public String getPublisher_name() {
        return publisher_name;
    }

    public void setPublisher_name(String publisher_name) {
        this.publisher_name = publisher_name;
    }

    public String getPublisher_logo_url() {
        return publisher_logo_url;
    }

    public void setPublisher_logo_url(String publisher_logo_url) {
        this.publisher_logo_url = publisher_logo_url;
    }

    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public String getArticle_author() {
        return article_author;
    }

    public void setArticle_author(String article_author) {
        this.article_author = article_author;
    }

    public String getArticle_url() {
        return article_url;
    }

    public void setArticle_url(String article_url) {
        this.article_url = article_url;
    }

    public String getArticle_image_url() {
        return article_image_url;
    }

    public void setArticle_image_url(String article_image_url) {
        this.article_image_url = article_image_url;
    }

    public String getArticle_description() {
        return article_description;
    }

    public void setArticle_description(String article_description) {
        this.article_description = article_description;
    }

    public String getPublisher_icon_url() {
        return publisher_icon_url;
    }

    public void setPublisher_icon_url(String publisher_icon_url) {
        this.publisher_icon_url = publisher_icon_url;
    }

    public String getArticle_timestamp() {
        return article_timestamp;
    }

    public void setArticle_timestamp(String article_timestamp) {
        this.article_timestamp = article_timestamp;
    }
}
