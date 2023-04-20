package com.techelevator.dao;

import com.techelevator.model.IssueDetails;
import java.util.List;

public interface IssueDetailsDao {
    boolean postIssue(IssueDetails issue);
    boolean updateAnIssue(IssueDetails issue);
    boolean moveToCompleted(int issueId);
    List<IssueDetails> getAllCompletedIssues();
    List<IssueDetails> getAllActiveIssues();
    IssueDetails getIssueById(int issueId);
    IssueDetails queryForIssueId();
    boolean updateChoices(String choiceString);
    void deleteIssue(int issueId);
}
