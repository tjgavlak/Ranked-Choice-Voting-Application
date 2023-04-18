package com.techelevator.controller;

import com.techelevator.dao.ChoiceDao;
import com.techelevator.dao.IssueDetailsDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Choice;
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


    private IssueDetailsDao issueDetailsDao;
    private ChoiceDao choiceDao;

    public IssueController(IssueDetailsDao issueDetailsDao, ChoiceDao choiceDao) {
        this.issueDetailsDao = issueDetailsDao;
        this.choiceDao = choiceDao;
    }

    @GetMapping("/issues/active")
    public List<IssueDetails> getAllActiveIssues() {
        return this.issueDetailsDao.getAllActiveIssues();
    }

    @GetMapping("/issues/completed")
    public List<IssueDetails> getAllCompletedIssues() {
        return this.issueDetailsDao.getAllCompletedIssues();
    }

    @GetMapping("/issues/{issueId}")
    public IssueDetails getIssueById(@PathVariable int issueId) {
        return this.issueDetailsDao.getIssueById(issueId);
    }

    @GetMapping("/issues/{issueId}/choices")
    public List<Choice> getAllChoicesById(@PathVariable int issueId) {
        return this.choiceDao.getAllChoices(issueId);
    }

    @GetMapping("/issues/recent")
    public IssueDetails getRecentIssue() {
        return this.issueDetailsDao.queryForIssueId();
    }

    @GetMapping("/issues/{issueId}/choices/ranked")
    public List<Choice> getRankedChoices(@PathVariable int issueId) {
        return this.choiceDao.getRankedChoices(issueId);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/issues")
    public boolean proposeNewIssue(@RequestBody IssueDetails issue) {
        return issueDetailsDao.postIssue(issue);
    }

    @ResponseStatus(HttpStatus.OK)
    @PutMapping("/issues/{issueId}")
    public boolean updateAnIssue(@PathVariable int issueId, @RequestBody IssueDetails issue) {
        return issueDetailsDao.updateAnIssue(issue);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/issues/choices")
    public boolean addChoices(@RequestBody Choice choice) {
        return choiceDao.postChoice(choice);
    }

    @ResponseStatus(HttpStatus.I_AM_A_TEAPOT)
    @PutMapping("/issues/ballot/{issueId}")
    public boolean userBallot( @PathVariable int issueId, int choiceId1, int choiceId2, int choiceId3) {
        return (choiceDao.userBallot(issueId, choiceId1, choiceId2, choiceId3));
    }

}
