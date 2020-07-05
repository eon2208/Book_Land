package com.eon.bookstore.exceptionHandlers;

import java.util.List;

public class ErrorResponse {

    public ErrorResponse(int message, List<String> details) {
        super();
        this.message = message;
        this.details = details;
    }

    private int message;
    private List<String> details;

    public int getMessage() {
        return message;
    }

    public void setMessage(int message) {
        this.message = message;
    }

    public List<String> getDetails() {
        return details;
    }

    public void setDetails(List<String> details) {
        this.details = details;
    }
}