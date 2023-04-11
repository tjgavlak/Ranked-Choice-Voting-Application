package com.techelevator.model;

public class Choice {

    private int issueId;
    private int choiceId;
    private String choiceValue;
    private boolean isWinner;

    public Choice() {
    }

    public Choice(int issueId, int choiceId, String choiceValue, boolean isWinner) {
        this.issueId = issueId;
        this.choiceId = choiceId;
        this.choiceValue = choiceValue;
        this.isWinner = isWinner;
    }

    public int getIssueId() {
        return issueId;
    }

    public void setIssueId(int issueId) {
        this.issueId = issueId;
    }

    public int getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(int choiceId) {
        this.choiceId = choiceId;
    }

    public String getChoiceValue() {
        return choiceValue;
    }

    public void setChoiceValue(String choiceValue) {
        this.choiceValue = choiceValue;
    }

    public boolean isWinner() {
        return isWinner;
    }

    public void setWinner(boolean winner) {
        isWinner = winner;
    }
}
