package com.techelevator.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Issue {

    private int issueId;
    private String issueName;
    private int ownerId;
    private List<String> choices;
    private String description;
    private LocalDateTime datePosted;
    private LocalDateTime dateExpiration;
    private String status;
    private String genreTag;

    public Issue() {
    }

    public Issue(int issueId, String issueName, int ownerId, List<String> choices, String description, LocalDateTime datePosted, LocalDateTime dateExpiration, String status, String genreTag) {
        this.issueId = issueId;
        this.issueName = issueName;
        this.ownerId = ownerId;
        this.choices = choices;
        this.description = description;
        this.datePosted = datePosted;
        this.dateExpiration = dateExpiration;
        this.status = status;
        this.genreTag = genreTag;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    public String getIssueName() {
        return issueName;
    }

    public void setIssueName(String issueName) {
        this.issueName = issueName;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public List<String> getChoices() {
        return choices;
    }

    public void setChoices(List<String> choices) {
        this.choices = choices;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getDatePosted() {
        return datePosted;
    }

    public void setDatePosted(LocalDateTime datePosted) {
        this.datePosted = datePosted;
    }

    public LocalDateTime getDateExpiration() {
        return dateExpiration;
    }

    public void setDateExpiration(LocalDateTime dateExpiration) {
        this.dateExpiration = dateExpiration;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGenreTag() {
        return genreTag;
    }

    public void setGenreTag(String genreTag) {
        this.genreTag = genreTag;
    }
}
