package com.techelevator.controller;

import com.techelevator.dao.IssueDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Issue;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class IssueController {

    private IssueDao issueDao;
    private UserDao userDao;

    public IssueController(IssueDao issueDao, UserDao userDao) {
        this.issueDao = issueDao;
        this.userDao = userDao;
    }

    @GetMapping("/issues")
    public List<Issue> getAllIssues() {
        return this.issueDao.getAllIssues();
    }

    @GetMapping("/issues/{issueId}")
    public Issue getIssueById(int issueId) {
        return this.issueDao.getIssueById(issueId);
    }

    @GetMapping("/issues/{ownerId}")
    public List<Issue> getIssuesByOwnerId(int ownerId) {
        return this.issueDao.getIssuesByOwnerId(ownerId);
    }

    @GetMapping("/issues/{genreTag}")
    public List<Issue> getIssuesByGenre(String genreTag) {
        return this.issueDao.getIssuesByGenre(genreTag);
    }

// TODO finish this later

//    @ResponseStatus(HttpStatus.CREATED)
//    @PostMapping("/issues/new")
//    public boolean proposeNewIssue(Issue issue, Principal principal) {
//        int ownerId = userDao.findIdByUsername(principal.getName());
//        boolean issueProposed = issueDao.
//    }
}
