package com.techelevator.controller;

import com.techelevator.dao.ChoiceDao;
import com.techelevator.dao.IssueDao;
import com.techelevator.dao.IssueDetailsDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Choice;
import com.techelevator.model.Issue;
import com.techelevator.model.IssueDetails;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@PreAuthorize("isAuthenticated()")
@RestController
@CrossOrigin
public class IssueController {

    private IssueDao issueDao;
    private IssueDetailsDao issueDetailsDao;
    private ChoiceDao choiceDao;

    public IssueController(IssueDao issueDao, IssueDetailsDao issueDetailsDao, ChoiceDao choiceDao) {
        this.issueDao = issueDao;
        this.issueDetailsDao = issueDetailsDao;
        this.choiceDao = choiceDao;
    }

    @GetMapping("/issues")
    public List<Issue> getAllIssues() {
        return this.issueDao.getAllIssues();
    }

    @GetMapping("/issues/{issueId}")
    public IssueDetails getIssueById(@PathVariable int issueId) {
        return this.issueDetailsDao.getIssueById(issueId);
    }

    @GetMapping("/issues/{issueId}/choices")
    public List <Choice> getAllChoicesById(@PathVariable int issueId) {
        return this.choiceDao.getAllChoices(issueId);
    }


    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/issues")
    public boolean proposeNewIssue(@RequestBody IssueDetails issue) {
        return issueDetailsDao.postIssue(issue);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/issues/choices")
    public boolean addChoices(@RequestBody Choice choice) {
        return choiceDao.postChoice(choice);
    }
}
