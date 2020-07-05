package com.eon.bookstore.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class UserInfoForm {

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String firstName;

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String lastName;

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String email;

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String country;

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String city;

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String street;

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String  postalCode;

    @NotNull(message = "is required")
    @Size(min = 1, message = "is required")
    private String phone;

    public UserInfoForm() {
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
