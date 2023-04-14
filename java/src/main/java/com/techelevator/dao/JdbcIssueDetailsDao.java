package com.techelevator.dao;

import com.techelevator.model.IssueDetails;
import org.springframework.dao.DataAccessException;
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
        String sql = "SELECT issue_id, issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag " +
                "FROM issues WHERE issue_id = ?;";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, issueId);
        if (rowSet.next()) {
            results = mapRowToIssueDetails(rowSet);
        }

        return results;
    }

    @Override
    public boolean postIssue(IssueDetails issue) {
        IssueDetails results = new IssueDetails();
        String sql = "INSERT INTO issues " +
                "(issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag) " +
                "VALUES (?, 1, ?, CURRENT_TIMESTAMP(0), CURRENT_TIMESTAMP(0), NULL, 'active', ?);";
        try {
            jdbcTemplate.update(sql, issue.getIssueName(), issue.getDescription(), issue.getGenreTag());
        } catch (DataAccessException e) {
            return false;
        }
        return true;
    };


    @Override
    public List<IssueDetails> getAllPendingIssues() {
        List<IssueDetails> results = new ArrayList<>();
        String sql = "SELECT issue_id, issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag FROM issues WHERE status = 'pending';";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        while(rowSet.next()){
            IssueDetails issue = mapRowToIssueDetails(rowSet);
            results.add(issue);
        }
        return results;
    }

    @Override
    public List<IssueDetails> getAllActiveIssues() {
        List<IssueDetails> results = new ArrayList<>();
        String sql = "SELECT issue_id, issue_name, issue_owner_id, description, date_proposed, date_posted, expiration_date, status, genre_tag FROM issues WHERE status = 'active';";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        while(rowSet.next()){
            IssueDetails issue = mapRowToIssueDetails(rowSet);
            results.add(issue);
        }
        return results;
    }



    @Override
    public int queryForIssueId() {
        int issueId = 0;
        String sql = "SELECT issue_id FROM issues ORDER BY issue_id DESC LIMIT 1;";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        if (rowSet.next()) {
            issueId = mapRowToIssueDetails(rowSet).getIssueId();
        }
        return issueId;
    }



    @Override
    public boolean updateChoices(String choiceString) {
        String[] splitStringArray = choiceString.split(",");

        boolean success = false;
        String sql = "UPDATE choices SET choice_1 = ?";
        return success;
    }



    private IssueDetails mapRowToIssueDetails(SqlRowSet rowSet) {
        IssueDetails issueDetails = new IssueDetails();
        issueDetails.setIssueId(rowSet.getInt("issue_id"));
        issueDetails.setIssueName(rowSet.getString("issue_name"));
        issueDetails.setOwnerId(rowSet.getInt("issue_owner_id"));
        issueDetails.setDescription(rowSet.getString("description"));
        issueDetails.setDateProposed(rowSet.getTimestamp("date_proposed"));
        issueDetails.setDatePosted(rowSet.getTimestamp("date_posted"));
        issueDetails.setDateExpiration(rowSet.getTimestamp("expiration_date"));
        issueDetails.setStatus(rowSet.getString("status"));
        issueDetails.setGenreTag(rowSet.getString("genre_tag"));
//        List<String> choices = new ArrayList<>();
//        for (int i = 1; i < 10; i++) {
//            String choice = rowSet.getString("choice_" + i);
//            if(choice != null) {
//                choices.add(choice);
//            } else {
//                break;
//            }
//        }
       // issueDetails.setChoices(choices);
        return issueDetails;
    }
}
