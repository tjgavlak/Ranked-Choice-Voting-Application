package com.techelevator.controller;

import com.techelevator.dao.IssueDao;
import com.techelevator.dao.IssueDetailsDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Issue;
import com.techelevator.model.IssueDetails;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class IssueController {

    private IssueDao issueDao;
    private IssueDetailsDao issueDetailsDao;

    public IssueController(IssueDao issueDao, IssueDetailsDao issueDetailsDao) {
        this.issueDao = issueDao;
        this.issueDetailsDao = issueDetailsDao;
    }

    @GetMapping("/issues")
    public List<Issue> getAllIssues() {
        return this.issueDao.getAllIssues();
    }

    @GetMapping("/issues/{issueId}")
    public IssueDetails getIssueById(int issueId) {
        return this.issueDetailsDao.getIssueById(issueId);
    }

/*    @GetMapping("/issues/{ownerId}")
    public List<Issue> getIssuesByOwnerId(int ownerId) {
        return this.issueDao.getIssuesByOwnerId(ownerId);
    }

    @GetMapping("/issues/{genreTag}")
    public List<Issue> getIssuesByGenre(String genreTag) {
        return this.issueDao.getIssuesByGenre(genreTag);
    }*/

// TODO finish this later

//    @ResponseStatus(HttpStatus.CREATED)
//    @PostMapping("/issues/new")
//    public boolean proposeNewIssue(Issue issue, Principal principal) {
//        int ownerId = userDao.findIdByUsername(principal.getName());
//        boolean issueProposed = issueDao.
//    }
}
