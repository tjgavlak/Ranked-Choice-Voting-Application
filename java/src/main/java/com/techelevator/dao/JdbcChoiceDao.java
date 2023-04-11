package com.techelevator.dao;

import com.techelevator.model.Choice;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcChoiceDao implements ChoiceDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcIssueDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Choice> getAllChoices(int issueId) {
        List<Choice> results = new ArrayList<>();
        String sql =
    }
}
