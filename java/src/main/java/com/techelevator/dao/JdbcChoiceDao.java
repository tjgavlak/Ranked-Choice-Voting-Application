package com.techelevator.dao;

import com.techelevator.model.Choice;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcChoiceDao implements ChoiceDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcChoiceDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Choice> getAllChoices(int issueId) {

        List<Choice> results = new ArrayList<>();
        String sql = "SELECT issue_id, choice_id, choice, points FROM choices WHERE issue_id = ? ORDER BY choice_id ASC;";
    SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, issueId);
            while(rowSet.next()){
        Choice choice = mapRowToChoice(rowSet);
        results.add(choice);
    }
            return results;
    }

    @Override
    public boolean postChoice(Choice choice) {
        String sql = "INSERT INTO choices (issue_id, choice, points) VALUES (?, ?, ?);";
        try {
            jdbcTemplate.update(sql, choice.getIssueId(), choice.getChoice(), choice.getPoints());
        } catch (DataAccessException e) {
           return false;
        }
        return true;
    }

    @Override
    public List<Choice> getRankedChoices(int issueId) {
        List<Choice> results = new ArrayList<>();
        String sql = "SELECT issue_id, choice_id, choice, points FROM choices WHERE issue_id = ? ORDER BY points DESC";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql, issueId);
        while(rowSet.next()){
            Choice choice = mapRowToChoice(rowSet);
            results.add(choice);
        }
        return results;
    }

    @Override
    public void userBallot(int choiceId1, int choiceId2, int choiceId3) {
        String sql = "UPDATE choices SET points = points + 3 WHERE choice_id = 14; " +
                "UPDATE choices SET points = points + 2 WHERE choice_id = 15; " +
                "UPDATE choices SET points = points + 1 WHERE choice_id = 16;";
        jdbcTemplate.update(sql, choiceId1, choiceId2, choiceId3);
    }

    private Choice mapRowToChoice(SqlRowSet rowSet) {
        Choice choice = new Choice();
        choice.setIssueId(rowSet.getInt("issue_id"));
        choice.setChoiceId(rowSet.getInt("choice_id"));
        choice.setChoice(rowSet.getString("choice"));
        choice.setPoints(rowSet.getInt("points"));
        return choice;
    }
}
