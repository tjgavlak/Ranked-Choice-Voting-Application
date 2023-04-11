package com.techelevator.dao;

import com.techelevator.model.Choice;

import java.util.List;

public interface ChoiceDao {

    List<Choice> getAllChoices(int issueId);

}
