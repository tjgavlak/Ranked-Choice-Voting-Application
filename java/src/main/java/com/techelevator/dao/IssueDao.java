package com.techelevator.dao;

import com.techelevator.model.Issue;

import java.util.List;

public interface IssueDao {

    List<Issue> getAllIssues();

    Issue getIssueById(int issueId);

    Issue getIssueByOwnerId(int ownerId);

    Issue getIssueByGenre(String genreTag);

    // get issue by expiration date
}
