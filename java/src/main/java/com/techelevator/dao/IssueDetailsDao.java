package com.techelevator.dao;

import com.techelevator.model.IssueDetails;
import java.util.List;

public interface IssueDetailsDao {
    List<IssueDetails> getAllCompletedIssues();

    List<IssueDetails> getAllActiveIssues();
    IssueDetails getIssueById(int issueId);
    boolean postIssue(IssueDetails issue);
    int queryForIssueId();

    boolean updateChoices(String choiceString); //nicole, we shall return to this!
}
