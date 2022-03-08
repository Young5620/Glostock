package com.glostock.model;

public class CompanyVO {

    private String company_ticker = "";
    private String company_name = "";
    private String company_currency = "";
    private String company_description = "";
    private String company_address = "";
    private String company_logo_url = "";
    private String company_description_ko = "";
    private String company_website_url = "";

    public CompanyVO() {
    }

    public CompanyVO(String company_ticker, String company_name, String company_currency, String company_description, String company_address, String company_logo_url) {
        this.company_ticker = company_ticker;
        this.company_name = company_name;
        this.company_currency = company_currency;
        this.company_description = company_description;
        this.company_address = company_address;
        this.company_logo_url = company_logo_url;
    }

    public String getCompany_ticker() {
        return company_ticker;
    }

    public void setCompany_ticker(String company_ticker) {
        this.company_ticker = company_ticker;
    }

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getCompany_currency() {
        return company_currency;
    }

    public void setCompany_currency(String company_currency) {
        this.company_currency = company_currency;
    }

    public String getCompany_description() {
        return company_description;
    }

    public void setCompany_description(String company_description) {
        this.company_description = company_description;
    }

    public String getCompany_address() {
        return company_address;
    }

    public void setCompany_address(String company_address) {
        this.company_address = company_address;
    }

    public String getCompany_logo_url() {
        return company_logo_url;
    }

    public void setCompany_logo_url(String company_logo_url) {
        this.company_logo_url = company_logo_url;
    }

    public String getCompany_description_ko() {
        return company_description_ko;
    }

    public void setCompany_description_ko(String company_description_ko) {
        this.company_description_ko = company_description_ko;
    }

    public String getCompany_website_url() {
        return company_website_url;
    }

    public void setCompany_website_url(String company_website_url) {
        this.company_website_url = company_website_url;
    }
}
