package com.techelevator.model;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;

public class IssueDetails {
    private int issueId;
    private String issueName;
    private int ownerId;
    private String description;
    private Timestamp datePosted;
    private String dateExpiration;
    private String timeExpiration;
    private String status;
    private String genreTag;

    public IssueDetails() {
    }

    public IssueDetails(int issueId, String issueName, int ownerId, String description, Timestamp datePosted, String dateExpiration, String timeExpiration, String status, String genreTag) {
        this.issueId = issueId;
        this.issueName = issueName;
        this.ownerId = ownerId;
        this.description = description;
        this.datePosted = datePosted;
        this.dateExpiration = dateExpiration;
        this.timeExpiration = timeExpiration;
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

    public String getDateExpiration() {
        return dateExpiration;
    }

    public void setDateExpiration(String dateExpiration) {
        this.dateExpiration = dateExpiration;
    }

    public String getTimeExpiration() {
        return timeExpiration;
    }

    public void setTimeExpiration(String timeExpiration) {
        this.timeExpiration = timeExpiration;
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
