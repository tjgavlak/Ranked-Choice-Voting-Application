package com.techelevator.dao;

import com.techelevator.model.Issue;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcIssueDao implements IssueDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcIssueDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Issue> getAllIssues() {
            List<Issue> results = new ArrayList<>();
            String sql = "SELECT issue_id, issue_name, description FROM issues;";
            SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
            while(rowSet.next()){
                Issue issue = mapRowToIssue(rowSet);
                results.add(issue);
            }
            return results;
    }

    @Override
    public Issue getIssueById(int issueId) {
/*        String sql = "SELECT i.issue_id, issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag, " +
                "choices.choice_1, " +
                "choices.choice_2, " +
                "choices.choice_3, " +
                "choices.choice_4, " +
                "choices.choice_5, " +
                "choices.choice_6, " +
                "choices.choice_7, " +
                "choices.choice_8, " +
                "choices.choice_9, " +
                "choices.choice_10 " +
                "FROM issues AS i JOIN choices ON i.issue_id = choices.issue_id WHERE i.issue_id = ?;";*/
        return null;
    }

    @Override
    public List<Issue> getIssuesByOwnerId(int ownerId) {
        return null;
    }

    @Override
    public List<Issue> getIssuesByGenre(String genreTag) {
        return null;
    }

    private Issue mapRowToIssue(SqlRowSet rowSet) {
        Issue issue = new Issue();
        issue.setIssueName(rowSet.getString("issue_name"));
        issue.setOwnerId(rowSet.getInt("issue_owner_id"));
        issue.setDescription(rowSet.getString("description"));
        issue.setDatePosted(rowSet.getTimestamp("date_posted"));
        issue.setDateExpiration(rowSet.getTimestamp("expiration_date"));
        issue.setStatus(rowSet.getString("status"));
        issue.setGenreTag(rowSet.getString("genre_tag"));
        List<String> choices = new ArrayList<>();
        for (int i = 1; i < 10; i++) {
            String choice = rowSet.getString("choice_" + i);
            if(choice != null) {
                choices.add(choice);
            } else {
                break;
            }
        }
        issue.setChoices(choices);
        return issue;
    }
}
