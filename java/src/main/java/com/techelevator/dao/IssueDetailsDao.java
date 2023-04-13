package com.techelevator.dao;
import com.techelevator.model.IssueDetails;

public interface IssueDetailsDao {
    IssueDetails getIssueById(int issueId);
    boolean postIssue(IssueDetails issue);
}
