package com.techelevator.dao;


import com.techelevator.model.IssueDetails;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcIssueDetailsDao implements IssueDetailsDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcIssueDetailsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public IssueDetails getIssueById(int issueId) {
        IssueDetails results = new IssueDetails();
        String sql = "SELECT i.issue_id, issue_name, issue_owner_id, description, date_posted, expiration_date, status, genre_tag, " +
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
                "FROM issues AS i JOIN choices ON i.issue_id = choices.issue_id WHERE i.issue_id = ?;";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, issueId);
        if (rowSet.next()) {
            results = mapRowToIssueDetails(rowSet);
        }

        return results;
    }

    private IssueDetails mapRowToIssueDetails(SqlRowSet rowSet) {
        IssueDetails issueDetails = new IssueDetails();
        issueDetails.setIssueId(rowSet.getInt("issue_id"));
        issueDetails.setIssueName(rowSet.getString("issue_name"));
        issueDetails.setOwnerId(rowSet.getInt("issue_owner_id"));
        issueDetails.setDescription(rowSet.getString("description"));
        issueDetails.setDatePosted(rowSet.getTimestamp("date_posted"));
        issueDetails.setDateExpiration(rowSet.getTimestamp("expiration_date"));
        issueDetails.setStatus(rowSet.getString("status"));
        issueDetails.setGenreTag(rowSet.getString("genre_tag"));
        List<String> choices = new ArrayList<>();
        for (int i = 1; i < 10; i++) {
            String choice = rowSet.getString("choice_" + i);
            if(choice != null) {
                choices.add(choice);
            } else {
                break;
            }
        }
        issueDetails.setChoices(choices);
        return issueDetails;
    }
}
