package com.techelevator.dao;

import com.techelevator.model.IssueDetails;
import java.util.List;

public interface IssueDetailsDao {
    List<IssueDetails> getAllActiveIssues();
    List<IssueDetails> getAllPendingIssues();
    IssueDetails getIssueById(int issueId);
    boolean postIssue(IssueDetails issue);
    int queryForIssueId();

    boolean updateChoices(String choiceString); //nicole, we shall return to this!
}
