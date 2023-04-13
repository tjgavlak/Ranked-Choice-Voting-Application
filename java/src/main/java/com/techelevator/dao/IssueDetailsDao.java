package com.techelevator.dao;
import com.techelevator.model.IssueDetails;

public interface IssueDetailsDao {
    IssueDetails getIssueById(int issueId);
    boolean postIssue(IssueDetails issue);
    int queryForIssueId();
    boolean postChoice(int issueId, String choice);
    boolean updateChoices(String choiceString);
}
