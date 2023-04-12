package com.techelevator.model;

import java.sql.Timestamp;
import java.util.List;

public class IssueDetails {
    private int issueId;
    private String issueName;
    private int ownerId;
    private List<String> choices;
    private String description;
    private Timestamp datePosted;
    private Timestamp dateExpiration;
    private String status;
    private String genreTag;

    public IssueDetails() {
    }

    public IssueDetails(int issueId, String issueName, int ownerId, List<String> choices, String description, Timestamp datePosted, Timestamp dateExpiration, String status, String genreTag) {
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

    public Timestamp getDatePosted() {
        return datePosted;
    }

    public void setDatePosted(Timestamp datePosted) {
        this.datePosted = datePosted;
    }

    public Timestamp getDateExpiration() {
        return dateExpiration;
    }

    public void setDateExpiration(Timestamp dateExpiration) {
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
