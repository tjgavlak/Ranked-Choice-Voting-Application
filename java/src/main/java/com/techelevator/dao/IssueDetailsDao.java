package com.techelevator.dao;

import com.techelevator.model.IssueDetails;

import java.security.Principal;
import java.util.List;

public interface IssueDetailsDao {
    boolean postIssue(IssueDetails issue);

    boolean updateAnIssue(IssueDetails issue);

    List<IssueDetails> getAllCompletedIssues();

    List<IssueDetails> getAllActiveIssues();
    IssueDetails getIssueById(int issueId);
    IssueDetails queryForIssueId();

    boolean updateChoices(String choiceString); //nicole, we shall return to this!
}
