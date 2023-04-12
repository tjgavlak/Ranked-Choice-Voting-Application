package com.techelevator.dao;

import com.techelevator.model.Issue;


import java.util.List;

public interface IssueDao {

    List<Issue> getAllIssues();

/*    Issue getIssueById(int issueId);

    List<Issue> getIssuesByOwnerId(int ownerId);

    List<Issue> getIssuesByGenre(String genreTag);*/

    // get issue by expiration date

    // boolean proposeIssue(String issueName, Principal principal, ...)

}
