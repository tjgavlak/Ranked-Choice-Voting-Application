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
            String sql = "SELECT issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag FROM issues";
            SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
            while(rowSet.next()){
                Issue issue = mapRowToIssue(rowSet);
                results.add(issue);
            }
            return results;
    }

    @Override
    public Issue getIssueById(int issueId) {
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
        return issue;
    }
}
