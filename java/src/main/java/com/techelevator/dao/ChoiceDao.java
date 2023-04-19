package com.techelevator.dao;

import com.techelevator.model.Choice;

import java.util.List;

public interface ChoiceDao {

    List<Choice> getAllChoices(int issueId);

    boolean postChoice(Choice choice);

    List<Choice> getRankedChoices(int issueId);

    boolean userBallot(int issueId, int[] choiceArray);

    int pointSum(int issueId);
}
